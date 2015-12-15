<?php

namespace common\models\gii;

use Yii;

/**
 * This is the model class for table "transaction".
 *
 * @property integer $id
 * @property string $comment
 * @property string $amount
 * @property integer $accounts
 * @property integer $user_id
 * @property integer $type_id
 * @property integer $category_id
 * @property integer $status
 * @property integer $created_at
 */
class TransactionGii extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'transaction';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['comment', 'accounts', 'user_id', 'type_id', 'category_id', 'created_at'], 'required'],
            [['amount'], 'number'],
            [['accounts', 'user_id', 'type_id', 'category_id', 'status', 'created_at'], 'integer'],
            [['comment'], 'string', 'max' => 255]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'comment' => 'Comment',
            'amount' => 'Amount',
            'accounts' => 'Accounts',
            'user_id' => 'User ID',
            'type_id' => 'Type ID',
            'category_id' => 'Category ID',
            'status' => 'Status',
            'created_at' => 'Created At',
        ];
    }
}
