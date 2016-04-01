<?php

namespace frontend\controllers\transaction;

use frontend\helper\TransactionHelper;
use frontend\models\forms\TransferForm;
use frontend\models\Transaction;
use Yii;
use yii\base\Action;
use yii\web\NotFoundHttpException;

/**
 * Class TransferAction
 * @package frontend\controllers\transaction
 */
class TransferAction extends Action
{
    /**
     * Transfer transaction from account to account.
     *
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function run()
    {
        $modelTransfer = new TransferForm();

        if ($modelTransfer->load(Yii::$app->request->post()) && $modelTransfer->validate()) {
            if ($modelTransfer->fromAccountId != $modelTransfer->toAccountId
                && $this->saveTransfer($modelTransfer)
            ) {

                Yii::$app->getSession()->setFlash('success', 'Перевод был произведен.');
                return $this->controller->redirect(['/transaction']);
            }
        }

        return $this->controller->render('transaction', [
            'model' => new Transaction(),
            'modelTransfer' => $modelTransfer,
            'tabTransfer' => true
        ]);
    }

    protected function saveTransfer($modelTransfer)
    {
        $transaction = Yii::$app->getDb()->beginTransaction();
        try {
            $saveTransfer = $this->saveFromTransaction($modelTransfer) && $this->saveToTransaction($modelTransfer);
            if ($saveTransfer) {
                $transaction->commit();
            } else {
                $transaction->rollback();
            }
        } catch (\Exception $e) {
            $transaction->rollback();
            return false;
        }

        return $saveTransfer;
    }

    protected function saveFromTransaction($model)
    {
        $model->commission = (float)$model->commission;
        $fromTransaction = new Transaction();
        $fromTransaction->setAttributes($model->attributes);
        $fromTransaction->accounts = $model->fromAccountId;
        $fromTransaction->amount = "$model->fromAmount + $model->commission";
        $fromTransaction->total = $model->fromTotal + $model->commission;
        $fromTransaction->type_id = TransactionHelper::TYPE_EXPENSE;

        if ($fromTransaction->save()) {
            return true;
        } else {
            return false;
        }
    }

    protected function saveToTransaction($model)
    {
        $toTransaction = new Transaction();
        $toTransaction->setAttributes($model->attributes);
        $toTransaction->accounts = $model->toAccountId;
        $toTransaction->amount = $model->toAmount;
        $toTransaction->total = $model->toTotal;
        $toTransaction->type_id = TransactionHelper::TYPE_INCOME;

        if ($toTransaction->save()) {
            return true;
        } else {
            return false;
        }
    }
}