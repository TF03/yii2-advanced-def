<?php

use yii\db\Schema;
use yii\db\Migration;

class m151102_094452_create_category_base_table extends Migration
{
    const TABLE = '{{%category_base}}';

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
