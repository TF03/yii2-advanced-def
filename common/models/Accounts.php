<?php

namespace common\models;

use common\models\gii\AccountsGii;
use Yii;

/**
 * @inheritdoc
 *
 * @property User $owner
 */
class Accounts extends AccountsGii
{
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getOwner()
    {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }
}
