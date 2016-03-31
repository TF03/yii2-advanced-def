<?php

namespace common\models;

use common\behaviors\ChangeTransactionBehavior;
use common\behaviors\SetPropertyBehavior;
use common\extensions\calculator\CalcValidator;
use common\models\gii\TransactionGii;
use Yii;
use yii\behaviors\TimestampBehavior;
use yii\db\Expression;
use yii\helpers\ArrayHelper;

/**
 * @inheritdoc
 *
 * @property User $owner
 * @property array $categoryIds
 * @property Transaction2Category $transaction2Category
 */
class Transaction extends TransactionGii
{
    public $categoryIds = [];

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return ArrayHelper::merge(parent::rules(), [
            ['amount', CalcValidator::className(), 'resultAttribute' => 'total'],
        ]);
    }

    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return ArrayHelper::merge(parent::behaviors(), [
            [
                'class' => TimestampBehavior::className(),
                'createdAtAttribute' => 'created_at',
                'updatedAtAttribute' => false,
                'value' => new Expression('NOW()'),
            ],
            SetPropertyBehavior::className(),
            ChangeTransactionBehavior::className(),
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
     * @return array
     */
    public function getTransaction2CategoryList()
    {
        $result = [];
        $transaction2Categories = $this->transaction2Category;

        if (!empty($transaction2Categories)) {
            /** @var Transaction2Category $transaction2Category */
            foreach ($transaction2Categories as $transaction2Category) {
                $result[] = $transaction2Category->category_id;
            }
        }

        return $result;
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return ArrayHelper::merge(parent::attributeLabels(), [
            'categoryIds' => 'Категории',
        ]);
    }
}
