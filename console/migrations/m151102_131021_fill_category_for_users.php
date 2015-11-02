<?php

use yii\db\Schema;
use yii\db\Migration;

class m151102_131021_fill_category_for_users extends Migration
{
    public function safeUp()
    {
        $this->createCategoryForUsers();
    }

    public function safeDown()
    {
        echo "m151102_131021_fill_category_for_users cannot be reverted.\n";

        return false;
    }

    public function createCategoryForUsers()
    {
        \console\helper\CategoryCreateForUserHelper::createNewCategory();
    }
}
