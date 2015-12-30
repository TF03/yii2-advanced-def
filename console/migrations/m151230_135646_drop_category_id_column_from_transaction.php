<?php

use yii\db\Schema;
use yii\db\Migration;

class m151230_135646_drop_category_id_column_from_transaction extends Migration
{
    const TABLE = '{{%transaction}}';

    public function up()
    {
        $this->dropColumn(self::TABLE, 'category_id');
    }

    public function down()
    {
        echo "m151230_135646_drop_category_id_column_from_transaction cannot be reverted.\n";

        return false;
    }
}
