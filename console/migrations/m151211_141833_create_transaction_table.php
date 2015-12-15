<?php

use yii\db\Schema;
use yii\db\Migration;

class m151211_141833_create_transaction_table extends Migration
{
    const TABLE = '{{%transaction}}';

    public function up()
    {
        $this->createTable(self::TABLE,[
            'id' => Schema::TYPE_PK,
            'comment' => Schema::TYPE_STRING . ' NOT NULL',
            'amount' => Schema::TYPE_DECIMAL . '(10, 2) NOT NULL DEFAULT 0.00',
            'accounts' => Schema::TYPE_INTEGER . ' NOT NULL',
            'user_id' => Schema::TYPE_INTEGER . ' NOT NULL',
            'type_id' => Schema::TYPE_INTEGER . ' NOT NULL',
            'category_id' => Schema::TYPE_INTEGER . ' NOT NULL',
            'status' => Schema::TYPE_SMALLINT . '(1) NULL DEFAULT 1',
            'created_at' => Schema::TYPE_INTEGER . ' NOT NULL',
        ], 'CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE=InnoDB');
    }

    public function down()
    {
        $this->dropTable(self::TABLE);
    }
}
