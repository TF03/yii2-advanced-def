<?php

namespace common\models;

use common\behaviors\SetPropertyBehavior;
use common\models\gii\TransactionGii;
use Yii;
use yii\behaviors\TimestampBehavior;
use yii\db\Expression;
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
     * @inheritdoc
     */
    public function behaviors()
    {
        return ArrayHelper::merge(parent::behaviors(),[
            [
                'class' => TimestampBehavior::className(),
                'createdAtAttribute' => 'created_at',
                'updatedAtAttribute' => false,
                'value' => new Expression('NOW()'),
            ],
            SetPropertyBehavior::className(),
        ]);
    }

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
