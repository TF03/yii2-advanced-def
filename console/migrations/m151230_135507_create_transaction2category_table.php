<?php

use yii\db\Schema;
use yii\db\Migration;

class m151230_135507_create_transaction2category_table extends Migration
{
    const TABLE = '{{%transaction2category}}';

    public function up()
    {
        $this->createTable(self::TABLE,[
            'category_id' => Schema::TYPE_INTEGER . ' NOT NULL',
            'transaction_id' => Schema::TYPE_INTEGER . ' NOT NULL',
        ], 'CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE=InnoDB');

        $this->createIndex('transaction2category_categoryId_transactionId', self::TABLE, [ 'category_id', 'transaction_id' ], true);
    }

    public function down()
    {
        $this->dropTable(self::TABLE);
    }
}
