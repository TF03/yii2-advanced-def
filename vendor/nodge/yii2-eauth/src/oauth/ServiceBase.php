<?php
/**
 * OAuthService class file.
 *
 * @author Maxim Zemskov <nodge@yandex.ru>
 * @link http://github.com/Nodge/yii2-eauth/
 * @license http://www.opensource.org/licenses/bsd-license.php
 */

namespace nodge\eauth\oauth;

use Yii;
use OAuth\Common\Storage\TokenStorageInterface;
use nodge\eauth\EAuth;
use nodge\eauth\IAuthService;
use nodge\eauth\ErrorException;
use yii\helpers\ArrayHelper;
use yii\helpers\Url;

/**
 * EOAuthService is a base class for all OAuth providers.
 *
 * @package application.extensions.eauth
 */
abstract class ServiceBase extends \nodge\eauth\ServiceBase implements IAuthService
{

	/**
	 * @var string Base url for API calls.
	 */
	protected $baseApiUrl;

	/**
	 * @var int Default token lifetime. Used when service wont provide expires_in param.
	 */
	protected $tokenDefaultLifetime = null;

	/**
	 * @var array TokenStorage class. Null means default value from EAuth component config.
	 */
	protected $tokenStorage;

	/**
	 * @var TokenStorageInterface
	 */
	private $_tokenStorage;

	/**
	 * Initialize the component.
	 *
	 * @param EAuth $component the component instance.
	 * @param array $options properties initialization.
	 */
//	public function init($component, $options = []) {
//		parent::init($component, $options);
//	}

	/**
	 * For OAuth we can check existing access token.
	 * Useful for API calls.
	 *
	 * @return bool
	 * @throws ErrorException
	 */
	public function getIsAuthenticated()
	{
		if (!$this->authenticated) {
			try {
				$proxy = $this->getProxy();
				$this->authenticated = $proxy->hasValidAccessToken();
			} catch (\OAuth\Common\Exception\Exception $e) {
				throw new ErrorException($e->getMessage(), $e->getCode(), 1, $e->getFile(), $e->getLine(), $e);
			}
		}
		return parent::getIsAuthenticated();
	}

	/**
	 * @return \nodge\eauth\oauth1\ServiceProxy|\nodge\eauth\oauth2\ServiceProxy
	 */
	abstract protected function getProxy();

	/**
	 * @return string the current url
	 */
	protected function getCallbackUrl()
	{
		return Url::to('', true);
	}

	/**
	 * @param array $config
	 */
	public function setTokenStorage(array $config)
	{
		$this->tokenStorage = ArrayHelper::merge($this->tokenStorage, $config);
	}

	/**
	 * @return TokenStorageInterface
	 */
	protected function getTokenStorage()
	{
		if (!isset($this->_tokenStorage)) {
			$config = $this->tokenStorage;
			if (!isset($config)) {
				$config = $this->getComponent()->getTokenStorage();
			}
			$this->_tokenStorage = Yii::createObject($config);
		}
		return $this->_tokenStorage;
	}

	/**
	 * @return int
	 */
	public function getTokenDefaultLifetime()
	{
		return $this->tokenDefaultLifetime;
	}

    /**
     * Returns the protected resource.
     *
     * @param string $url url to request.
     * @param array $options HTTP request options. Keys: query, data, headers.
     * @param boolean $parseResponse Whether to parse response.
     * @return mixed the response.
     * @throws ErrorException
     */
    public function makeSignedRequest($url, $options = [], $parseResponse = true)
    {
        if (!$this->getIsAuthenticated()) {
            throw new ErrorException(Yii::t('eauth', 'Unable to complete the signed request because the user was not authenticated.'), 401);
        }

        return $this->request($url, $options, $parseResponse, function ($url, $method, $headers, $data) {
            return $this->getProxy()->request($url, $method, $data, $headers);
        });
    }

    /**
     * Returns the public resource.
     *
     * @param string $url url to request.
     * @param array $options HTTP request options. Keys: query, data, headers.
     * @param boolean $parseResponse Whether to parse response.
     * @return mixed the response.
     * @throws ErrorException
     */
    public function makeRequest($url, $options = [], $parseResponse = true)
    {
        $headers = isset($options['headers']) ? $options['headers'] : [];
        $options['headers'] = array_merge($this->getExtraApiHeaders(), $headers);

        return $this->request($url, $options, $parseResponse, function ($url, $method, $headers, $data) {
            return $this->getHttpClient()->retrieveResponse($url, $data, $headers, $method);
        });
    }

    /**
     * @param string $url
     * @param array $options
     * @param boolean $parseResponse
     * @param callable $fn
     * @return mixed
     * @throws ErrorException
     */
    protected function request($url, $options, $parseResponse, $fn)
    {
        $response = parent::request($url, $options, $fn);

        if ($parseResponse) {
            $response = $this->parseResponseInternal($response);
        }

        return $response;
    }

	/**
	 * Parse response and check for errors.
	 *
	 * @param string $response
	 * @return mixed
	 * @throws ErrorException
	 */
	protected function parseResponseInternal($response)
	{
		try {
			$result = $this->parseResponse($response);
			if (!isset($result)) {
				throw new ErrorException(Yii::t('eauth', 'Invalid response format.'), 500);
			}

			$error = $this->fetchResponseError($result);
			if (isset($error) && !empty($error['message'])) {
				throw new ErrorException($error['message'], $error['code']);
			}

			return $result;
		} catch (\Exception $e) {
			throw new ErrorException($e->getMessage(), $e->getCode());
		}
	}

	/**
	 * @param string $response
	 * @return mixed
	 */
	protected function parseResponse($response)
	{
		return json_decode($response, true);
	}

	/**
	 * Returns the error array.
	 *
	 * @param array $response
	 * @return array the error array with 2 keys: code and message. Should be null if no errors.
	 */
	protected function fetchResponseError($response)
	{
		if (isset($response['error'])) {
			return [
				'code' => 500,
				'message' => 'Unknown error occurred.',
			];
		}
		return null;
	}

	/**
	 * @return array|null An array with valid access_token information.
	 */
	protected function getAccessTokenData()
	{
		if (!$this->getIsAuthenticated()) {
			return null;
		}

		$token = $this->getProxy()->getAccessToken();
		if (!isset($token)) {
			return null;
		}

		return [
			'access_token' => $token->getAccessToken(),
			'refresh_token' => $token->getRefreshToken(),
			'expires' => $token->getEndOfLife(),
			'params' => $token->getExtraParams(),
		];
	}

	/**
	 * @param array $data
	 * @return string|null
	 */
	public function getAccessTokenResponseError($data)
	{
		return isset($data['error']) ? $data['error'] : null;
	}

    /**
     * Return any additional headers always needed for this service implementation's API calls.
     *
     * @return array
     */
    public function getExtraApiHeaders()
    {
        return [];
    }
}