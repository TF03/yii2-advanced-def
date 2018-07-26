<?php

namespace common\models;

use common\enums\StatusEnum;
use Yii;

/**
 * This is the model class for table "house".
 *
 * @property int $id
 * @property string $name
 * @property int $complexId
 * @property string $status
 */
class House extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'house';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name', 'complexId'], 'unique', 'targetAttribute' => ['name', 'complexId']],
            [['name', 'status', 'complexId'], 'required'],
            [['complexId'], 'integer'],
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
            'complexId' => 'Complex',
            'status' => 'Status',
        ];
    }
}
