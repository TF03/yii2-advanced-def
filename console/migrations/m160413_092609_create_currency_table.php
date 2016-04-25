<?php

use yii\db\Schema;
use yii\db\Migration;

class m160413_092609_create_currency_table extends Migration
{
    const TABLE_CURRENCY_BASE = '{{%currency_base}}';
    const TABLE_CURRENCY = '{{%currency}}';

    public function safeUp()
    {
        $this->createTable(self::TABLE_CURRENCY_BASE, [
            'id' => $this->primaryKey(),
            'name' => Schema::TYPE_STRING . ' NOT NULL',
            'class' => Schema::TYPE_STRING . ' NOT NULL',
            'special_char' => Schema::TYPE_STRING . ' NOT NULL',
        ], 'CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE=InnoDB');

        $this->insert(self::TABLE_CURRENCY_BASE, [
            'name' => 'USD',
            'class' => 'glyphicon glyphicon-usd',
        ]);
        $this->insert(self::TABLE_CURRENCY_BASE, [
            'name' => 'EUR',
            'class' => 'glyphicon glyphicon-euro',
        ]);
        $this->insert(self::TABLE_CURRENCY_BASE, [
            'name' => 'грн',
            'special_char' => '&#8372;',
        ]);
        $this->insert(self::TABLE_CURRENCY_BASE, [
            'name' => 'руб',
            'class' => 'glyphicon glyphicon-rub',
        ]);

        $this->createTable(self::TABLE_CURRENCY, [
            'id' => $this->primaryKey(),
            'title' => Schema::TYPE_STRING . ' NOT NULL',
            'user_id' => Schema::TYPE_INTEGER . ' NOT NULL',
            'base_currency_id' => Schema::TYPE_INTEGER . '(2) NULL',
            'status' => Schema::TYPE_SMALLINT . '(1) NULL DEFAULT 1',
        ], 'CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE=InnoDB');

        $this->createIndex('user_title_currency', self::TABLE_CURRENCY, [ 'title', 'user_id' ], true);
    }

    public function safeDown()
    {
        $this->dropTable(self::TABLE_CURRENCY_BASE);
        $this->dropTable(self::TABLE_CURRENCY);
    }
}
