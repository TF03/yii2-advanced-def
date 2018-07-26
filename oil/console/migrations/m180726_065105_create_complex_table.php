<?php

use yii\db\Migration;
use yii\db\Schema;

/**
 * Handles the creation of table `complex`.
 */
class m180726_065105_create_complex_table extends Migration
{
    const TABLE = '{{%complex}}';

    /**
     * {@inheritdoc}
     */
    public function up()
    {
        $this->createTable(self::TABLE, [
            'id'        => Schema::TYPE_PK,
            'name'      => Schema::TYPE_STRING . '(128) NOT NULL',
            'status'    => Schema::TYPE_STRING . '(16) NOT NULL',
        ], 'CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE=InnoDB');
    }

    /**
     * {@inheritdoc}
     */
    public function down()
    {
        $this->dropTable(self::TABLE);
    }
}
