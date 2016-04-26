<?php

use yii\db\Schema;
use yii\db\Migration;

class m160426_062038_add_field_to_transaction extends Migration
{
    const TABLE = '{{%transaction}}';

    public function up()
    {
        $this->addColumn(self::TABLE, 'accountTransfer', Schema::TYPE_INTEGER . '(1) NOT NULL DEFAULT 0');
        $this->addColumn(self::TABLE, 'totalTransfer', Schema::TYPE_DECIMAL . '(10, 2) NOT NULL DEFAULT 0.00');
    }

    public function down()
    {
        $this->dropColumn(self::TABLE, 'accountTransfer');
        $this->dropColumn(self::TABLE, 'totalTransfer');

        return false;
    }
}
