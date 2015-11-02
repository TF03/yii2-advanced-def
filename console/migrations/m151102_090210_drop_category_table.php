<?php

use yii\db\Schema;
use yii\db\Migration;

class m151102_090210_drop_category_table extends Migration
{
    const TABLE = '{{%category}}';

    public function up()
    {
        $this->dropTable(self::TABLE);
    }

    public function down()
    {
        echo "m151102_090210_drop_category_table cannot be reverted.\n";

        return false;
    }
}
