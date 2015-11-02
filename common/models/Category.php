<?php

namespace common\models;

use Yii;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "category".
 *
 * @property integer $id
 * @property string $title
 * @property integer $user_id
 * @property integer $base_category_id
 * @property integer $status
 */
class Category extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'category';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['title', 'user_id'], 'required'],
            [['user_id', 'base_category_id', 'status'], 'integer'],
            [['title'], 'string', 'max' => 255],
            [['title', 'user_id'], 'unique', 'targetAttribute' => ['title', 'user_id'], 'message' => 'The combination of Title and User ID has already been taken.']
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
            'base_category_id' => 'Base Category ID',
            'status' => 'Status',
        ];
    }
}
