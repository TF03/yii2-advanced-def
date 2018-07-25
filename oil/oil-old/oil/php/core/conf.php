<?php

define('DB_SERVER', '46.254.21.136');
define('DB_USER', 'p137356_oil');
define('DB_PASS', 'bzhgOqDH');
define('DB_NAME', 'p137356_oil');
/*define('DB_USER', 'p137356_test');
define('DB_PASS', '0lrjKxOe');
define('DB_NAME', 'p137356_test');*/
define('DB_PREFIX', 'site_');

/// режим отладки 1 -да 0 - нет
define(DEBAG, 0);

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