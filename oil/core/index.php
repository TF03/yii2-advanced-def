<?php
session_start();

require 'conf.php';
require 'db.php';

if (DEBAG==1){
	// клас замера времени работы скрипта
	require 'timer.php';
	$timer = new timer();
	$timer->start_timer();
}
else 
	error_reporting(0);

require 'router.php';

require 'core.php';

if(!is_array($_SESSION['valuta']))
	unset($_SESSION['valuta']);
//чистка GET и POST
if($_GET)
	$_GET = ekranirovanie($_GET, 0);

if($_POST)	
	$_POST =  ekranirovanie($_POST, 0);

//разбор роутера (r=модуль/файл)
//$file="";$modul="";
if (!empty($_GET['r'])){
	$temp = explode ('/', $_GET['r']);
	$modul = $temp[0];
	if (isset($temp[1])) 
		$file = $temp[1];
	else 
		$file = $temp[0];
}

//подключения модуля поумолчанию
$d_modul = array('menu', 'social', 'shop_category', 'code_template');//'social', 'feedback', 'order');

foreach ($d_modul as $v){
	if (file_exists("./modul/$v/modul.php"))
		include "./modul/$v/modul.php";
}

//подключение модуля по запросу
if (!$file && $modul)
	$file=$modul;
if( !empty ($modul) && !empty ($file)){
	if (file_exists("./modul/$modul/$file.php")) {
		include "./modul/$modul/$file.php";
		include "./modul/breadcrumbs/modul.php";
	}
	else 
		$_GET['error'] = 404;
}
else 
	$_GET['error'] = 404;

//обработка 404
if ($_GET['error'] == 404){
  $title = "Ошибка 404 - Такой страницы не существует!";
  $body_cvet='class="blue"';
  include "./modul/404/modul.php";
  $templ = './templ/404_tpl.php';
  header("HTTP/1.0 404 Not Found");
  $all = showtempl($templ); 
  echo $all;
  exit;
}

//разруливаем шаблоны
$templ='./templ/' . $template . '.php';    

/// есле нет мето тегов добовляем
if (!$meta_title)$meta_title='';
if (!$meta_descr)$meta_descr='';
if (!$meta_keyw)$meta_keyw='';

///вывод всего сайта
header("HTTP/1.0 200 Ok");
$all=showtempl($templ);
echo $all;

if (DEBAG==1){

	$bd_con='нет';
	if ($db->con==1)
		$bd_con='да';
		
	$block_debag = '
		<div style="position: fixed;z-index: 99999;padding: 6px; bottom:10px;left: 10px;  opacity: 0.7;color: #0066FF; background: #fff;border: #ccc 1px solid;" >
			Режим разработки<br>
			'.round($timer->end_timer(),6).' сек <br>
			'.memory_get_usage().' байт <br>
			БД подключение - '.$bd_con.'<br>
			БД запросов - '.$db->i.'<br>
		</div>';
		
	echo $block_debag;	
}