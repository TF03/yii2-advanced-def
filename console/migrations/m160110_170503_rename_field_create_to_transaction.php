<?php

use yii\db\Schema;
use yii\db\Migration;

class m160110_170503_rename_field_create_to_transaction extends Migration
{
    const TABLE = '{{%transaction}}';

    public function up()
    {
        $this->dropColumn(self::TABLE, 'created_at');
        $this->addColumn(self::TABLE, 'created_at', Schema::TYPE_TIMESTAMP);
    }

    public function down()
    {
        echo "m160110_170503_rename_field_create_to_transaction cannot be reverted.\n";

        return false;
    }
}
