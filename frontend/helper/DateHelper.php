<?php

namespace frontend\helper;

use yii;

class DateHelper
{
    public static function getDateByPeriod($period, $startPeriod = false)
    {
        $date = Yii::$app->getFormatter()->asDate('now', "php:d-m-Y");

        if (isset($period)) {
            switch($period) {
                case 'today':
                    $date = Yii::$app->getFormatter()->asDate('now', "php:d-m-Y");
                    break;
                case 'yesterday':
                    $date = date('d-m-Y', strtotime(date('d-m-Y') . " - 1 day"));
                    break;
                case 'current_month':
                    if ($startPeriod) {
                        $date = Yii::$app->getFormatter()->asDate('now', "php:01-m-Y");
                    } else {
                        $date = Yii::$app->getFormatter()->asDate('now', "php:t-m-Y");
                    }
                    break;
                case 'all':
                    break;
                default:
                    break;
            }
        }

        return $date;
    }
}