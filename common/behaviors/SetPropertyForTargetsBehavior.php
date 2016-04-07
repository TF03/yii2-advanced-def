<?php

namespace common\behaviors;

use yii;
use yii\base\Behavior;
use yii\db\BaseActiveRecord;

class SetPropertyForTargetsBehavior extends Behavior
{
    /**
     * @return array
     */
    public function events()
    {
        return [
            BaseActiveRecord::EVENT_BEFORE_VALIDATE => 'setProperty',
            BaseActiveRecord::EVENT_BEFORE_INSERT => 'formatterDate',
            BaseActiveRecord::EVENT_BEFORE_UPDATE => 'formatterDate',
            BaseActiveRecord::EVENT_AFTER_FIND => 'formatterDateComeBack',
        ];
    }

    /**
     *
     */
    public function setProperty()
    {
        /** @var \common\models\Targets $model */
        $model = $this->owner;
        $model->user_id = Yii::$app->getUser()->id;
        $model->value = str_replace(' ', '', $model->value);
        $model->balance = str_replace(' ', '', $model->balance);
    }

    /**
     *
     */
    public function formatterDate()
    {
        /** @var \common\models\Targets $model */
        $model = $this->owner;
        $model->date = Yii::$app->getFormatter()->asDate($model->date, "php:Y-m-d");
    }

    /**
     *
     */
    public function formatterDateComeBack()
    {
        /** @var \common\models\Targets $model */
        $model = $this->owner;
        $model->date = Yii::$app->getFormatter()->asDate($model->date, "php:d-m-Y");
        $model->value = number_format($model->value, 0, '.', ' ');
        $model->balance = number_format($model->balance, 0, '.', ' ');
    }
}