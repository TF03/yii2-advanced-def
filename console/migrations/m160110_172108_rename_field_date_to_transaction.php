<?php

use yii\db\Schema;
use yii\db\Migration;

class m160110_172108_rename_field_date_to_transaction extends Migration
{
    const TABLE = '{{%transaction}}';

    public function up()
    {
        $this->dropColumn(self::TABLE, 'date');
        $this->addColumn(self::TABLE, 'date', Schema::TYPE_STRING . '(16) NOT NULL');
    }

    public function down()
    {
        echo "m160110_172108_rename_field_date_to_transaction cannot be reverted.\n";

        return false;
    }
}
