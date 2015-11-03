<?php

use yii\db\Schema;
use yii\db\Migration;

class m151103_134719_create_table_accounts extends Migration
{
    const TABLE = '{{%accounts}}';

    public function up()
    {
        $this->createTable(self::TABLE,[
            'id' => Schema::TYPE_PK,
            'name' => Schema::TYPE_STRING . ' NOT NULL',
            'user_id' => Schema::TYPE_INTEGER . ' NOT NULL',
            'valuta' => Schema::TYPE_STRING . '(64) NOT NULL',
            'color' => Schema::TYPE_STRING . '(64) NOT NULL',
            'sort' => Schema::TYPE_INTEGER . ' NULL',
            'amount' => Schema::TYPE_DECIMAL . '(10, 2) NOT NULL DEFAULT 0.00',
            'status' => Schema::TYPE_SMALLINT . '(1) NULL DEFAULT 1',
        ], 'CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE=InnoDB');

        $this->createIndex('user_valuta_accounts', self::TABLE, [ 'name', 'user_id' ], true);
    }

    public function down()
    {
        $this->dropTable(self::TABLE);
    }
}
