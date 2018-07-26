<?php

namespace common\models;

use common\enums\StatusEnum;
use Yii;

/**
 * This is the model class for table "floor".
 *
 * @property int $id
 * @property string $name
 * @property int $houseId
 * @property string $status
 */
class Floor extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'floor';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name', 'houseId'], 'unique', 'targetAttribute' => ['name', 'houseId']],
            [['name', 'status', 'houseId'], 'required'],
            [['houseId'], 'integer'],
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
            'houseId' => 'House',
            'status' => 'Status',
        ];
    }
}
