<?php

use yii\db\Schema;
use yii\db\Migration;
use console\helper\CategoryCreateForUserHelper;

class m151102_094640_create_category_table extends Migration
{
    const TABLE = '{{%category}}';

    public function up()
    {
        $this->createTable(self::TABLE,[
            'id' => Schema::TYPE_PK,
            'title' => Schema::TYPE_STRING . ' NOT NULL',
            'user_id' => Schema::TYPE_INTEGER . ' NOT NULL',
            'base_category_id' => Schema::TYPE_INTEGER . '(2) NULL',
            'status' => Schema::TYPE_SMALLINT . '(1) NOT NULL',
        ], 'CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE=InnoDB');

        $this->createIndex('user_title_category', self::TABLE, [ 'title', 'user_id' ], true);
        $this->createCategoryForUsers();
    }

    public function down()
    {
        $this->dropTable(self::TABLE);
    }

    public function createCategoryForUsers()
    {
        CategoryCreateForUserHelper::createNewCategory();
    }
}
