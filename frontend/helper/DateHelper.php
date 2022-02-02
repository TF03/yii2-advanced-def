<?php

namespace frontend\helper;

use yii;

class DateHelper
{
    public static function getDateByPeriod($period, $startPeriod = false)
    {
        $date = self::getNowDate("php:d-m-Y");
        if (isset($period)) {
            switch($period) {
                case 'yesterday':
                    $date = date('d-m-Y', strtotime(date('d-m-Y') . " - 1 day"));
                    break;
                case 'current_month':
                    if ($startPeriod) {
                        $date = self::getNowDate("php:01-m-Y");
                    } else {
                        $date = self::getNowDate("php:t-m-Y");
                    }
                    break;
                case 'today':
                case 'all':
                default:
                    break;
            }
        }

        return $date;
    }

    public static function getNowDate(string $format = "php:Y-m-d"): string
    {
        return Yii::$app->getFormatter()->asDate('now', $format);
    }
}