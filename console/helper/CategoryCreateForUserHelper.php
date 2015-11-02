<?php

namespace console\helper;

use common\models\User;

class CategoryCreateForUserHelper
{
    public static function createNewCategory()
    {


        foreach (User::find()->batch() as $users) {
            foreach ($users as $user) {
                ///
            }
        }
    }
}