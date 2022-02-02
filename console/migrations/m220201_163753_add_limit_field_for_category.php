<?php

use yii\db\Schema;
use yii\db\Migration;

/**
 * Class m220201_163753_add_limit_field_for_category
 */
class m220201_163753_add_limit_field_for_category extends Migration
{
    const TABLE = '{{%category}}';

    public function up()
    {
        $this->addColumn(self::TABLE, 'month_limit', Schema::TYPE_INTEGER . ' NOT NULL DEFAULT 0');
    }

    public function down()
    {
        $this->dropColumn(self::TABLE, 'month_limit');

        return false;
    }
}
