<?php

namespace common\behaviors;

use console\helper\CategoryCreateForUserHelper;
use yii;
use yii\base\Behavior;
use yii\db\AfterSaveEvent;
use yii\db\BaseActiveRecord;

/**
 * Class CreateBaseCategoryBehavior
 *
 * @package common\behaviors
 *
 * @property \common\models\User $owner
 */
class CreateBaseCategoryBehavior extends Behavior
{
    /**
     * @return array
     */
    public function events()
    {
        return [
            BaseActiveRecord::EVENT_AFTER_INSERT => 'createBaseCategoryAfterInsert',
        ];
    }

    /**
     * @param AfterSaveEvent $event
     *
     * @return bool
     */
    public function createBaseCategoryAfterInsert(AfterSaveEvent $event)
    {
        $userId = $this->owner->id;

        return CategoryCreateForUserHelper::createBaseCategoryForUser($userId);
    }
}
