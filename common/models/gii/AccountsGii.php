<?php

namespace common\models\gii;

use Yii;

/**
 * This is the model class for table "accounts".
 *
 * @property integer $id
 * @property string $name
 * @property integer $user_id
 * @property string $valuta
 * @property string $color
 * @property integer $sort
 * @property string $amount
 * @property integer $status
 */
class AccountsGii extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'accounts';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'user_id', 'valuta', 'color'], 'required'],
            [['user_id', 'sort', 'status'], 'integer'],
            [['amount'], 'number'],
            [['name'], 'string', 'max' => 255],
            [['valuta', 'color'], 'string', 'max' => 64],
            [['name', 'user_id'], 'unique', 'targetAttribute' => ['name', 'user_id'], 'message' => 'The combination of Name and User ID has already been taken.']
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
            'user_id' => 'User ID',
            'valuta' => 'Валюта',
            'color' => 'Цвет',
            'sort' => 'Сортировка',
            'amount' => 'Баланс',
            'status' => 'Статус',
        ];
    }
}
