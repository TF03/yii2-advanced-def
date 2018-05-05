<?php

namespace common\enums;

/**
 * Class TargetStatusEnum
 *
 * @package common\enums
 */
class TargetStatusEnum
{
    const PLANNING = 0;
    const IN_PROGRESS = 1;
    const DONE = 2;
    const DREAM = 3;

    /**
     * @return array
     */
    public static function getStatuses()
    {
        return [
            self::PLANNING,
            self::IN_PROGRESS,
            self::DONE,
            self::DREAM,
        ];
    }

    /**
     * @return array
     */
    public static function getStatusList()
    {
        return [
            self::PLANNING      => 'Планируется',
            self::IN_PROGRESS   => 'В процессе',
            self::DONE          => 'Выполнено',
            self::DREAM         => 'Мечта',
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