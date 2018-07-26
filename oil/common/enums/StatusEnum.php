<?php

namespace common\enums;

/**
 * Class StatusEnum
 *
 * @package common\enums
 */
class StatusEnum
{
    const OPEN = 'open';
    const CLOSE = 'close';

    /**
     * @return array
     */
    public static function getStatuses()
    {
        return [
            self::OPEN,
            self::CLOSE,
        ];
    }

    /**
     * @return array
     */
    public static function getStatusList()
    {
        return [
            self::OPEN  => self::OPEN,
            self::CLOSE => self::CLOSE,
        ];
    }

    /**
     * @param $key
     * @return mixed
     */
    public static function getStatusValue($key)
    {
        $aStatuses = self::getStatusList();

        return isset($aStatuses[$key]) ? $aStatuses[$key] : 'undefined';
    }
}