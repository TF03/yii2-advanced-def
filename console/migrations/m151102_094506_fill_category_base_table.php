<?php

use yii\db\Schema;
use yii\db\Migration;

class m151102_094506_fill_category_base_table extends Migration
{
    const TABLE = '{{%category_base}}';

    public function up()
    {

        $this->insert(self::TABLE, [
            'name' => 'Автомобиль',
        ]);

        $this->insert(self::TABLE, [
            'name' => 'Домашнее хозяйство',
        ]);

        $this->insert(self::TABLE, [
            'name' => 'Досуг',
        ]);

        $this->insert(self::TABLE, [
            'name' => 'Еда',
        ]);

        $this->insert(self::TABLE, [
            'name' => 'Заработная плата',
        ]);

        $this->insert(self::TABLE, [
            'name' => 'Инвестиции',
        ]);

        $this->insert(self::TABLE, [
            'name' => 'Коммунальные услуги',
        ]);

        $this->insert(self::TABLE, [
            'name' => 'Красота и здоровье',
        ]);

        $this->insert(self::TABLE, [
            'name' => 'Кредиты и долги',
        ]);

        $this->insert(self::TABLE, [
            'name' => 'Налоги',
        ]);

        $this->insert(self::TABLE, [
            'name' => 'Образование',
        ]);

        $this->insert(self::TABLE, [
            'name' => 'Одежда',
        ]);

        $this->insert(self::TABLE, [
            'name' => 'Отпуск',
        ]);

        $this->insert(self::TABLE, [
            'name' => 'Пенсионный доход',
        ]);

        $this->insert(self::TABLE, [
            'name' => 'Подарки',
        ]);

        $this->insert(self::TABLE, [
            'name' => 'Рабочие расходы',
        ]);

        $this->insert(self::TABLE, [
            'name' => 'Разное',
        ]);

        $this->insert(self::TABLE, [
            'name' => 'Страхование',
        ]);

        $this->insert(self::TABLE, [
            'name' => 'Уход за питомцами',
        ]);

        $this->insert(self::TABLE, [
            'name' => 'Электроника',
        ]);
    }

    public function down()
    {
        $this->truncateTable(self::TABLE);
        return true;
    }
}
