<?php

namespace common\models;

use common\enums\StatusEnum;
use Yii;

/**
 * This is the model class for table "apartment".
 *
 * @property int $id
 * @property string $name
 * @property int $floorId
 * @property string $status
 */
class Apartment extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'apartment';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name', 'floorId'], 'unique', 'targetAttribute' => ['name', 'floorId']],
            [['name', 'status', 'floorId'], 'required'],
            [['floorId'], 'integer'],
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
            'floorId' => 'Floor',
            'status' => 'Status',
        ];
    }
}
