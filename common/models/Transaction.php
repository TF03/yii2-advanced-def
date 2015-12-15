<?php

namespace common\models;

use common\models\gii\TransactionGii;
use Yii;

/**
 * @inheritdoc
 *
 * @property User $owner
 */
class Transaction extends TransactionGii
{
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getOwner()
    {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }
}
