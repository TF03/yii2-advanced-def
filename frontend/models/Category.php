<?php

namespace frontend\models;

use frontend\helper\StatusHelper;
use Yii;

class Category extends \common\models\Category
{
    public static function find()
    {
        return parent::find()->andWhere([
            'user_id' => Yii::$app->getUser()->id,
            'status' => [StatusHelper::STATUS_AVAILABLE, StatusHelper::STATUS_HIDDEN]
        ]);
    }

    public function isShowItem()
    {
        if ($this->status == StatusHelper::STATUS_AVAILABLE) {
            return true;
        }
        else {
            return false;
        }
    }

    public function getValueSaveStatus($checkboxValue)
    {
        if ($checkboxValue == 1) {
            return StatusHelper::STATUS_AVAILABLE;
        }
        else {
            return StatusHelper::STATUS_HIDDEN;
        }
    }
}