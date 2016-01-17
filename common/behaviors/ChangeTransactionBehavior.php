<?php

namespace common\behaviors;

use frontend\helper\TransactionHelper;
use frontend\models\Accounts;
use yii;
use yii\base\Behavior;
use yii\db\AfterSaveEvent;
use yii\db\BaseActiveRecord;
use stdClass;

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
            $params = new stdClass();
            $params->type_id = $model->type_id;
            $params->accountAmount = $account->amount;
            $params->transactionAmount = $model->amount;

            $account->amount = $this->_getAccountAmount($params);
            $account->save();
        }
    }

    /**
     * @param AfterSaveEvent $event
     */
    public function recalculateAmountForAccountAfterUpdate(AfterSaveEvent $event)
    {
        /** @var \common\models\Transaction $model */
        $model = $this->owner;

        $oldTransactionAmount = isset($event->changedAttributes['amount']) ? $event->changedAttributes['amount'] : $model->amount;
        $newTransactionAmount = $model->amount;
        /** @var Accounts $account */
        $account = Accounts::find()->andWhere(['id' => $model->accounts])->one();

        if ($account) {
            if (isset($event->changedAttributes['type_id'])) {
                $params = new stdClass();

                $params->type_id = $event->changedAttributes['type_id'];
                $params->accountAmount = $account->amount;
                $params->transactionAmount = $oldTransactionAmount;
                $account->amount = $this->_getAccountAmount($params, true);

                $params->type_id = $model->type_id;
                $params->accountAmount = $account->amount;
                $params->transactionAmount = $newTransactionAmount;
                $account->amount = $this->_getAccountAmount($params);
            } else {
                switch ($model->type_id) {
                    case TransactionHelper::TYPE_EXPENSE:
                        $account->amount = bcadd($account->amount, $oldTransactionAmount, 2);
                        $account->amount = bcsub($account->amount, $newTransactionAmount, 2);
                        break;
                    case TransactionHelper::TYPE_INCOME:
                        $account->amount = bcsub($account->amount, $oldTransactionAmount, 2);
                        $account->amount = bcadd($account->amount, $newTransactionAmount, 2);
                        break;
                }
            }
            $account->save();
        }
    }

    /**
     * @param $model \common\models\Transaction
     */
    private function _calculateAccountAmount($model)
    {
        /** @var Accounts $account */
        $account = Accounts::find()->andWhere(['id' => $model->accounts])->one();

        if ($account) {
            $params = new stdClass();
            $params->type_id = $model->type_id;
            $params->accountAmount = $account->amount;
            $params->transactionAmount = $model->amount;

            $account->amount = $this->_getAccountAmount($params, true);
            $account->save();
        }
    }

    /**
     * Calculate account amount
     *
     * @param $params stdClass
     * @param $reverse boolean
     *
     * @return float
     */
    private function _getAccountAmount($params, $reverse = false)
    {
        if ($reverse) {
            return $this->_reverseCalculate($params);
        } else {
            return $this->_normalCalculate($params);
        }
    }

    /**
     * Reverse calculate
     *
     * @param $params stdClass
     *
     * @return float
     */
    private function _reverseCalculate($params)
    {
        switch ($params->type_id) {
            case TransactionHelper::TYPE_EXPENSE:
                return bcadd($params->accountAmount, $params->transactionAmount, 2);
            case TransactionHelper::TYPE_INCOME:
                return bcsub($params->accountAmount, $params->transactionAmount, 2);
            default:
                return $params->accountAmount;
        }
    }

    /**
     * Reverse calculate
     *
     * @param $params stdClass
     *
     * @return float
     */
    private function _normalCalculate($params)
    {
        switch ($params->type_id) {
            case TransactionHelper::TYPE_EXPENSE:
                return bcsub($params->accountAmount, $params->transactionAmount, 2);
            case TransactionHelper::TYPE_INCOME:
                return bcadd($params->accountAmount, $params->transactionAmount, 2);
            default:
                return $params->accountAmount;
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