<?php

namespace common\behaviors;

use yii;
use yii\base\Behavior;
use yii\db\BaseActiveRecord;

class SetPropertyBehavior extends Behavior
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
        /** @var \common\models\Transaction $model */
        $model = $this->owner;
        $model->user_id = Yii::$app->getUser()->id;
        $model->amount = (string) $model->amount;
    }

    /**
     *
     */
    public function formatterDate()
    {
        /** @var \common\models\Transaction $model */
        $model = $this->owner;
        $model->date = Yii::$app->getFormatter()->asDate($model->date, "php:Y-m-d");
    }

    /**
     *
     */
    public function formatterDateComeBack()
    {
        /** @var \common\models\Transaction $model */
        $model = $this->owner;
        $model->date = Yii::$app->getFormatter()->asDate($model->date, "php:d-m-Y");
    }
}