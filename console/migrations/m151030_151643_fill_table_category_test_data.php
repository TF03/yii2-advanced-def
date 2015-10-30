<?php

use yii\db\Schema;
use yii\db\Migration;

class m151030_151643_fill_table_category_test_data extends Migration
{
    const TABLE = '{{%category}}';

    public function up()
    {

        $this->insert(self::TABLE, [
            'name' => 'Автомобиль',
            'basic' => 1,
        ]);

        $this->insert(self::TABLE, [
            'name' => 'Заработная плата',
            'basic' => 1,
        ]);

        $this->insert(self::TABLE, [
            'name' => 'Еда',
            'basic' => 1,
        ]);
    }

    public function down()
    {
        $this->truncateTable(self::TABLE);
        return true;
    }
}
