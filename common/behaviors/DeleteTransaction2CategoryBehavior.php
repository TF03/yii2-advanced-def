<?php

namespace common\behaviors;

use common\models\Transaction2Category;
use yii;
use yii\base\Behavior;
use yii\db\BaseActiveRecord;

class DeleteTransaction2CategoryBehavior extends Behavior
{
    /**
     * @return array
     */
    public function events()
    {
        return [
            BaseActiveRecord::EVENT_AFTER_DELETE => 'deleteTransaction2Category',
        ];
    }

    /**
     *
     */
    public function deleteTransaction2Category()
    {
        /** @var \common\models\Category $model */
        $model = $this->owner;
        Transaction2Category::deleteAll(['category_id' => $model->id]);
    }
}