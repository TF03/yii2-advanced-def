<?php

use yii\db\Schema;
use yii\db\Migration;

class m160330_104058_add_total_to_transaction extends Migration
{
    const TABLE = '{{%transaction}}';

    public function up()
    {
        $this->addColumn(self::TABLE, 'total', Schema::TYPE_DECIMAL . '(10, 2) NOT NULL DEFAULT 0.00');
    }

    public function down()
    {
        $this->dropColumn(self::TABLE, 'total');

        return false;
    }
}
