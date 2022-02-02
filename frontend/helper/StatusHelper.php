<?php

namespace frontend\helper;

class StatusHelper extends BaseHelper
{
    const STATUS_AVAILABLE = 1;
    const STATUS_HIDDEN = 2;
    const STATUS_DELETE = 3;

    protected static $listNames = [
        self::STATUS_AVAILABLE => 'Отображается',
        self::STATUS_HIDDEN => 'Скрытый',
        self::STATUS_DELETE => 'Удаленный'
    ];

    public static function getValueForHtml($key)
    {
        return (int) (self::STATUS_AVAILABLE == $key);
    }

    public static function swapStatus($key)
    {
        switch ($key) {
            case self::STATUS_AVAILABLE:
                return self::STATUS_HIDDEN;
            case self::STATUS_HIDDEN:
                return self::STATUS_AVAILABLE;
        }
    }
}
