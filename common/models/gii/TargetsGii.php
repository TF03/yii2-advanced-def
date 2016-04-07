<?php

namespace common\models\gii;

use Yii;

/**
 * This is the model class for table "targets".
 *
 * @property integer $id
 * @property string $name
 * @property string $value
 * @property string $balance
 * @property integer $accounts
 * @property integer $user_id
 * @property string $date
 * @property integer $order
 * @property integer $status
 * @property integer $created_at
 * @property integer $updated_at
 */
class TargetsGii extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'targets';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'value', 'user_id'], 'required'],
            [['accounts', 'user_id', 'order', 'status'], 'integer'],
            [['name', 'date', 'value', 'balance'], 'string', 'max' => 128],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Название',
            'value' => 'Нужно накопить',
            'balance' => 'Уже отложено',
            'accounts' => 'Откладывать со счета',
            'user_id' => 'User',
            'date' => 'К дате',
            'order' => 'Приоритет',
            'status' => 'Status',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
        ];
    }
}
