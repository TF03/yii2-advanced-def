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
}