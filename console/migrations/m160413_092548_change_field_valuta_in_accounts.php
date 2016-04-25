<?php

use yii\db\Schema;
use yii\db\Migration;

class m160413_092548_change_field_valuta_in_accounts extends Migration
{
    const TABLE = '{{%accounts}}';

    public function up()
    {
        $this->dropColumn(self::TABLE, 'valuta');
        $this->addColumn(self::TABLE, 'currencyId', Schema::TYPE_INTEGER);
    }

    public function down()
    {
        echo "m160413_092548_change_field_valuta_in_accounts cannot be reverted.\n";

        return false;
    }
}
