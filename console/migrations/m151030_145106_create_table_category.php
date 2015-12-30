<?php

use yii\db\Schema;
use yii\db\Migration;

class m151030_145106_create_table_category extends Migration
{
    const TABLE = '{{%category}}';

    public function up()
    {
        $this->createTable(self::TABLE,[
            'id' => Schema::TYPE_PK,
            'name' => Schema::TYPE_STRING . ' NOT NULL',
        ], 'CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE=InnoDB');
    }

    public function down()
    {
        $this->dropTable(self::TABLE);
    }

}
