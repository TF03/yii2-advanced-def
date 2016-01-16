<?php

namespace common\behaviors;

use frontend\helper\TransactionHelper;
use frontend\models\Accounts;
use yii;
use yii\base\Behavior;
use yii\db\AfterSaveEvent;
use yii\db\BaseActiveRecord;

/**
 * Class ChangeTransactionBehavior
 *
 * @package common\behaviors
 *
 * @property \common\models\Transaction $owner
 */
class ChangeTransactionBehavior extends Behavior
{
    /**
     * @return array
     */
    public function events()
    {
        return [
            BaseActiveRecord::EVENT_AFTER_DELETE => 'calculateAccountAndDeleteTransaction2CategoryAmount',
            BaseActiveRecord::EVENT_AFTER_INSERT => 'recalculateAmountForAccountAfterInsert',
            BaseActiveRecord::EVENT_AFTER_UPDATE => 'recalculateAmountForAccountAfterUpdate',
        ];
    }

    /**
     *
     */
    public function calculateAccountAndDeleteTransaction2CategoryAmount()
    {
        /** @var \common\models\Transaction $model */
        $model = $this->owner;
        $this->_deleteTransaction2Category($model);
        $this->_calculateAccountAmount($model);
    }

    /**
     * @param AfterSaveEvent $event
     */
    public function recalculateAmountForAccountAfterInsert(AfterSaveEvent $event)
    {
        /** @var \common\models\Transaction $model */
        $model = $this->owner;

        /** @var Accounts $account */
        $account = Accounts::find()->andWhere(['id' => $model->accounts])->one();

        if ($account) {
            switch ($model->type_id) {
                case TransactionHelper::TYPE_EXPENSE:
                    $account->amount = bcsub($account->amount, $model->amount, 2);
                    break;
                case TransactionHelper::TYPE_INCOME:
                    $account->amount = bcadd($account->amount, $model->amount, 2);
                    break;
            }
            $account->save();
        }
    }

    /**
     *
     */
    public function recalculateAmountForAccountAfterUpdate()
    {}

    /**
     * @param $model \common\models\Transaction
     */
    private function _calculateAccountAmount($model)
    {
        /** @var Accounts $account */
        $account = Accounts::find()->andWhere(['id' => $model->accounts])->one();

        if ($account) {
            switch ($model->type_id) {
                case TransactionHelper::TYPE_EXPENSE:
                    $account->amount = bcadd($account->amount, $model->amount, 2);
                    break;
                case TransactionHelper::TYPE_INCOME:
                    $account->amount = bcsub($account->amount, $model->amount, 2);
                    break;
            }
            $account->save();
        }
    }

    /**
     * @param $model \common\models\Transaction
     */
    private function _deleteTransaction2Category($model)
    {
        TransactionHelper::deleteTransaction2CategoryByTransactionId($model->id);
    }
}