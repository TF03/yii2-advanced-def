<?php

use yii\db\Schema;
use yii\db\Migration;

class m151230_190053_add_date_field_to_transaction extends Migration
{
    const TABLE = '{{%transaction}}';

    public function up()
    {
        $this->addColumn(self::TABLE, 'date', Schema::TYPE_TIMESTAMP);
    }

    public function down()
    {
        $this->dropColumn(self::TABLE, 'date');

        return false;
    }
}
