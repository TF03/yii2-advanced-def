<?php

namespace frontend\helper;

/**
 * Class BaseHelper
 *
 * @package frontend\helper
 */
class BaseHelper
{
    protected static $listNames = [];

    /**
     * @param array|null $listNames
     *
     * @return mixed
     */
    public static function getValues($listNames = null)
    {
        if (!empty($listNames)) {
            return $listNames;
        } else {
            return static::$listNames;
        }
    }

    /**
     * @param $key
     * @return mixed
     */
    public static function getValue($key)
    {
        $aStatus = static::getValues();

        return isset($aStatus[$key]) ? $aStatus[$key] : $key;
    }
}