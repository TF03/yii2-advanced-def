<?php

use yii\db\Schema;
use yii\db\Migration;

class m151127_150256_add_position_to extends Migration
{
    const TABLE = '{{%category}}';

    public function up()
    {
        $this->addColumn(self::TABLE, 'position', Schema::TYPE_SMALLINT . ' NOT NULL DEFAULT 0');
    }

    public function down()
    {
        $this->dropColumn(self::TABLE, 'position');

        return false;
    }
}
