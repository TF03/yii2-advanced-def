<?php

use yii\db\Migration;
use yii\db\Schema;

/**
 * Handles the creation of table `house`.
 */
class m180726_065643_create_house_table extends Migration
{
    const TABLE = '{{%house}}';

    /**
     * {@inheritdoc}
     */
    public function up()
    {
        $this->createTable(self::TABLE, [
            'id'        => Schema::TYPE_PK,
            'name'      => Schema::TYPE_STRING . '(128) NOT NULL',
            'complexId' => Schema::TYPE_INTEGER,
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
