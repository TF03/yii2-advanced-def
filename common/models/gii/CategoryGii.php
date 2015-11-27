<?php

namespace common\models\gii;

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
 * @property integer $position
 */
class CategoryGii extends ActiveRecord
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
            [['user_id', 'base_category_id', 'status', 'position'], 'integer'],
            ['status', 'in', 'range' => [1, 2, 3]],
            [['title'], 'string', 'max' => 255],
            [['title', 'user_id'], 'unique', 'targetAttribute' => ['title', 'user_id'], 'message' => 'Категория с таким название уже есть.']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'title' => 'Название',
            'user_id' => 'User ID',
            'base_category_id' => 'Base Category ID',
            'status' => 'Status',
            'position' => 'Position',
        ];
    }
}
