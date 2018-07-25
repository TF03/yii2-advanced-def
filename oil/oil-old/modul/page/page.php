<?php

//$sel = $db -> one_array("SELECT `name`, `url`, `text`, `descr`, `keyw`, `title`, `meta_robots`
//						FROM " . DB_PREFIX . "page
//						WHERE `en` = 1 and `url` = '" . $route_file . "'");
//if ($sel) {
//	//подключения модуля для страницы отзывов
//	/*$array_modul = array (	'menu_left/menu_left.php', // левое меню
//							'banner_left/banner_left.php' ////Левый банер
//							);*/
//	$breadName = $sel['name'];
//	foreach ($array_modul as $v)
//		if (file_exists("./modul/$v"))
//			include "./modul/$v";
//
//	// Метатег robots="noindex"
//	if ($sel['meta_robots'] == 1)
//		$noindex_for_page .= '<meta name="robots" content="noindex">';
//
//	//meta ...
//	$meta_title 	= $sel['title'];
//	$meta_keyw 		= $sel['keyw'];
//	$meta_descr 	= $sel['descr'];
//	$content 		= $sel['text'];
//	$name_content 	= $sel['name'];
//
//	$center_area .= showtempl(dirname(__FILE__) . '/templ/tpl_page.php');
//}
//else
//	$_GET['error']=404;