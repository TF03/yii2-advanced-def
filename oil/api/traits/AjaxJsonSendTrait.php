<?php

namespace api\traits;

use Yii;
use yii\web\Response;

/**
 * Class AjaxJsonSendTrait
 *
 * @package api\traits
 */
trait AjaxJsonSendTrait
{
    /**
     * Performs ajax validation.
     *
     * @param array $options
     *
     * @throws \yii\base\ExitException
     */
    protected function performAjaxValidation($options, $isAjax = true)
    {
        if (Yii::$app->request->isAjax || $isAjax == false) {
            Yii::$app->response->format = Response::FORMAT_JSON;

            return $options;
        }
    }
}
