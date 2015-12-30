<?php

namespace frontend\helper;

use frontend\models\Category;

class TransactionHelper
{

    /**
     * @return array
     */
    public static function getListTransaction()
    {
        $result = [];

        $categories = Category::find()->all();
        if (isset($categories)) {
            foreach ($categories as $category) {
                /** @var $category Category */
                $result[$category->id] = $category->title;
            }
        }

        return $result;
    }
}