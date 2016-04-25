<?php

use yii\db\Migration;
use console\helper\CurrencyCreateForUsersHelper;

class m160425_072742_fill_currency_base_table extends Migration
{
    public function safeUp()
    {
        CurrencyCreateForUsersHelper::createNewCurrency();
    }

    public function safeDown()
    {
        echo "m160425_072742_fill_currency_base_table cannot be reverted.\n";

        return false;
    }
}
