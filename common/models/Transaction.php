<?php

namespace common\models;

use common\models\gii\TransactionGii;
use Yii;
use yii\helpers\ArrayHelper;

/**
 * @inheritdoc
 *
 * @property User $owner
 * @property Transaction2Category $transaction2Category
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

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTransaction2Category()
    {
        return $this->hasMany(Transaction2Category::className(), ['transaction_id' => 'id']);
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return ArrayHelper::merge(parent::attributeLabels(),[
            'transaction2Category' => 'Категории',
        ]);
    }
}
