<?php

namespace frontend\models;

use Yii;

/**
 * @inheritdoc
 *
 * @property Accounts $account
 * @property Accounts $accountTransferModel
 */
class Transaction extends \common\models\Transaction
{
    public static function find()
    {
        return parent::find()
            ->andWhere([
                           'transaction.user_id' => Yii::$app->getUser()->id
                       ]);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAccount()
    {
        return $this->hasOne(Accounts::className(), ['id' => 'accounts']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAccountTransferModel()
    {
        return $this->hasOne(Accounts::className(), ['id' => 'accountTransfer']);
    }
}
