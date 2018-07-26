<?php

namespace common\models;

use common\enums\StatusEnum;
use Yii;

/**
 * This is the model class for table "complex".
 *
 * @property int $id
 * @property string $name
 * @property string $status
 */
class Complex extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'complex';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name'], 'unique'],
            [['name', 'status'], 'required'],
            [['name'], 'string', 'max' => 128],
            [['status'], 'string', 'max' => 16],
            ['status', 'in', 'range' => StatusEnum::getStatuses()],
            ['status', 'default', 'value' => StatusEnum::OPEN],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Name',
            'status' => 'Status',
        ];
    }
}
