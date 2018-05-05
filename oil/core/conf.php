<?php

define('DB_SERVER', 'localhost');
define('DB_USER', 'yii2advanced');
define('DB_PASS', 'yii2advanced');
define('DB_NAME', 'oildb');
define('DB_PREFIX', 'site_');
define('DEBAG', '1');

/// режим отладки 1 -да 0 - нет
define(DEBAG, 1);

$site_url='http://'.$_SERVER['HTTP_HOST'];

$arr = pathinfo(__FILE__);
$arr = pathinfo($arr['dirname']);
define('SITE_PATH', $arr['dirname'].'/');

//параметры кеширование
// тип кеширования 0 - нет, 1 - файл , 2 - мемкеш
define('CASH', 1);
// подключения файла обработки ошибок
//require_once('ErrorCatcher.php');
//error_reporting(E_ALL | E_STRICT);
//ini_set('display_errors', 'On');
//$ClassErrorCatcher = new ClassErrorCatcher;