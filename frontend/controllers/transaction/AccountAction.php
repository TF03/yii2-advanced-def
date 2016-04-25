<?php

namespace frontend\controllers\transaction;

use frontend\models\Accounts;
use Yii;
use yii\base\Action;
use yii\web\NotFoundHttpException;

/**
 * Class AccountAction
 * @package frontend\controllers\transaction
 */
class AccountAction extends Action
{
    /**
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function run($id)
    {
        $account = Accounts::findOne(['id' => $id]);

        if (!empty($account)) {
            $param = [
                'TransactionSearch' => [
                    'accounts' => $id
                ]
            ];
            $extraOptions = [
                'filterEnable' => true
            ];

            return $this->controller->renderIndex($param, $extraOptions);
        } else {
            $this->controller->redirect(['/transaction']);
        }
    }
}