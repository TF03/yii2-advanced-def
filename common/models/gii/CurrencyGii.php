<?php

namespace common\models\gii;

use Yii;

/**
 * This is the model class for table "currency".
 *
 * @property integer $id
 * @property string $title
 * @property integer $user_id
 * @property integer $base_currency_id
 * @property integer $status
 */
class CurrencyGii extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'currency';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['title', 'user_id'], 'required'],
            [['user_id', 'base_currency_id', 'status'], 'integer'],
            [['title'], 'string', 'max' => 255],
            [['title', 'user_id'], 'unique', 'targetAttribute' => ['title', 'user_id'], 'message' => 'The combination of Title and User ID has already been taken.'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'title' => 'Title',
            'user_id' => 'User ID',
            'base_currency_id' => 'Base Currency ID',
            'status' => 'Status',
        ];
    }
}
