<?php

namespace console\helper;

use common\models\Category;
use common\models\CategoryBase;
use common\models\User;

class CategoryCreateForUserHelper
{
    public static function createNewCategory()
    {
        $categoryBases = CategoryBase::find()->all();

        foreach (User::find()->batch() as $users) {
            /** @var User $user */
            foreach ($users as $user) {
                /** @var CategoryBase $categoryBase */
                foreach ($categoryBases as $categoryBase) {
                    $category = new Category();

                    $category->title = $categoryBase->name;
                    $category->user_id = $user->id;
                    $category->base_category_id = $categoryBase->id;

                    $category->save();
                }
            }
        }
    }
}