<?php

namespace frontend\controllers\transaction;

use frontend\helper\TransactionHelper;
use Yii;
use yii\base\Action;
use yii\web\NotFoundHttpException;

/**
 * Class FilterAction
 * @package frontend\controllers\transaction
 */
class FilterAction extends Action
{
    /**
     * @param string $name
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function run($name)
    {
        switch ($name) {
            case 'income':
                $param = [
                    'TransactionSearch' => [
                        'type_id' => TransactionHelper::TYPE_INCOME
                    ]
                ];
                $dataProvider = $this->controller->getDataProviderForIndex($param);

                return $this->controller->render('index', [
                    'dataProvider' => $dataProvider,
                    'activeIncome' => true,
                ]);
            case 'expense':
                $param = [
                    'TransactionSearch' => [
                        'type_id' => TransactionHelper::TYPE_EXPENSE
                    ]
                ];
                $dataProvider = $this->controller->getDataProviderForIndex($param);

                return $this->controller->render('index', [
                    'dataProvider' => $dataProvider,
                    'activeExpense' => true,
                ]);
            default:
                $this->controller->redirect(['/transaction']);
        }
    }
}