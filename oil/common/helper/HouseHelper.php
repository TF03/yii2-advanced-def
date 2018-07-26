<?php

namespace common\helper;

use common\models\House;

class HouseHelper
{
    /**
     * @return array
     */
    public static function getListHouses()
    {
        $result = [];

        $houses = House::find()->all();
        if (isset($houses)) {
            foreach ($houses as $house) {
                /** @var $house House */
                $result[$house->id] = $house->name;
            }
        }

        return $result;
    }
}