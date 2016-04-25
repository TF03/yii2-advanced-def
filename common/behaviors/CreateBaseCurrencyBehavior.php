<?php

namespace common\behaviors;

use console\helper\CurrencyCreateForUsersHelper;
use yii;
use yii\base\Behavior;
use yii\db\AfterSaveEvent;
use yii\db\BaseActiveRecord;

/**
 * Class CreateBaseCurrencyBehavior
 *
 * @package common\behaviors
 *
 * @property \common\models\User $owner
 */
class CreateBaseCurrencyBehavior extends Behavior
{
    /**
     * @return array
     */
    public function events()
    {
        return [
            BaseActiveRecord::EVENT_AFTER_INSERT => 'createBaseCurrencyAfterInsert',
        ];
    }

    /**
     * @param AfterSaveEvent $event
     *
     * @return bool
     */
    public function createBaseCurrencyAfterInsert(AfterSaveEvent $event)
    {
        $userId = $this->owner->id;

        return CurrencyCreateForUsersHelper::createBaseCurrencyForUser($userId);
    }
}
