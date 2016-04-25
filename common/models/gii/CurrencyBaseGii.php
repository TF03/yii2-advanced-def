<?php

namespace common\models\gii;

use Yii;

/**
 * This is the model class for table "currency_base".
 *
 * @property integer $id
 * @property string $name
 * @property string $class
 * @property string $special_char
 */
class CurrencyBaseGii extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'currency_base';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'class', 'special_char'], 'required'],
            [['name', 'class', 'special_char'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Name',
            'class' => 'Class',
            'special_char' => 'Special Char',
        ];
    }
}
