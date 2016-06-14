<?php

namespace frontend\helper;

use frontend\models\Targets;

class TargetHelper
{
    /**
     * @return array
     */
    public static function getListTargets()
    {
        $result = [];

        $targets = Targets::find()->all();
        if (isset($targets)) {
            foreach ($targets as $target) {
                /** @var $target Targets */
                $result[$target->id] = $target->name;
            }
        }

        return $result;
    }
}