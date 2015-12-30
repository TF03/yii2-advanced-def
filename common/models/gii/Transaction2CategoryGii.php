<?php

namespace common\models\gii;

use Yii;

/**
 * This is the model class for table "transaction2category".
 *
 * @property integer $category_id
 * @property integer $transaction_id
 */
class Transaction2CategoryGii extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'transaction2category';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['category_id', 'transaction_id'], 'required'],
            [['category_id', 'transaction_id'], 'integer'],
            [['category_id', 'transaction_id'], 'unique', 'targetAttribute' => ['category_id', 'transaction_id'], 'message' => 'The combination of Category ID and Transaction ID has already been taken.']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'category_id' => 'Category ID',
            'transaction_id' => 'Transaction ID',
        ];
    }
}
