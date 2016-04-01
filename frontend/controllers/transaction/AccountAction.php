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
            $dataProvider = $this->controller->getDataProviderForIndex($param);

            return $this->controller->render('index', [
                'dataProvider' => $dataProvider,
                'filterEnable' => true,
            ]);
        } else {
            $this->controller->redirect(['/transaction']);
        }
    }
}