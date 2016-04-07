<?php

use yii\db\Migration;
use yii\db\Schema;

class m160407_071817_create_targets_table extends Migration
{
    const TABLE = '{{%targets}}';

    public function up()
    {
        $this->createTable(self::TABLE, [
            'id' => Schema::TYPE_PK,
            'name' => Schema::TYPE_STRING . '(128) NOT NULL',
            'value' => Schema::TYPE_DECIMAL . '(10, 2) NOT NULL DEFAULT 0.00',
            'balance' => Schema::TYPE_DECIMAL . '(10, 2) NOT NULL DEFAULT 0.00',
            'accounts' => Schema::TYPE_INTEGER . ' NOT NULL',
            'user_id' => Schema::TYPE_INTEGER . ' NOT NULL',
            'date' => Schema::TYPE_STRING . '(16) NOT NULL',
            'order' => Schema::TYPE_INTEGER . ' NOT NULL DEFAULT 0',
            'status' => Schema::TYPE_SMALLINT . '(1) NULL',
            'created_at' => Schema::TYPE_TIMESTAMP,
            'updated_at' => Schema::TYPE_TIMESTAMP,
        ], 'CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE=InnoDB');
    }

    public function down()
    {
        $this->dropTable(self::TABLE);
    }
}
