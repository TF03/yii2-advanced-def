<?php

namespace common\helper;

use common\models\Complex;

class ComplexHelper
{
    /**
     * @return array
     */
    public static function getListComplexes()
    {
        $result = [];

        $complexes = Complex::find()->all();
        if (isset($complexes)) {
            foreach ($complexes as $complex) {
                /** @var $complex Complex */
                $result[$complex->id] = $complex->name;
            }
        }

        return $result;
    }
}