<?php

namespace common\helper;

use common\models\Floor;

class FloorHelper
{
    /**
     * @return array
     */
    public static function getListFloors()
    {
        $result = [];

        $floors = Floor::find()->all();
        if (isset($floors)) {
            foreach ($floors as $floor) {
                /** @var $floor Floor */
                $result[$floor->id] = $floor->name;
            }
        }

        return $result;
    }
}