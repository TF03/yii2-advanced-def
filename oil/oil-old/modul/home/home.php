<?php

//подключения модулей для данной страницы
$array_modul = array(
    'news/modul.php'        // блок с 3 новостями
//		'home_banner/modul.php',  	// банер на главной
//		'home_tab/modul.php',  		// табы на главной
//		'video/modul.php',  		// блок с 3 видео
//		'reviews_site/modul.php',  	// блок с 3 отзывами
);
foreach ($array_modul as $v)
    if (file_exists("./modul/$v"))
        include "./modul/$v";


$settingsSite = $db->one_array("	SELECT phone1, phone2, email, time_work, title_meta, descr_meta, keyw_meta, seo_text
									FROM " . DB_PREFIX . "settings_site
									WHERE id=1");

// meta.....
$meta_title = $settingsSite['title_meta'];
$meta_keyw = $settingsSite['keyw_meta'];
$meta_descr = $settingsSite['descr_meta'];
$seo_text = $settingsSite['seo_text'];

$mainBlockContainer = showtempl(dirname(__FILE__) . '/templ/tpl_main.php');
$mainBannerBlock = showtempl(dirname(__FILE__) . '/templ/tpl_mainBannerBlock.php');