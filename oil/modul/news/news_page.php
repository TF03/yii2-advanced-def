<?php

//подключения модуля для страницы новости
//$array_modul = array (	);
//foreach ($array_modul as $v)
//	if (file_exists("./modul/$v"))
//		include "./modul/$v";
$last_route = str_replace('.html', '', $last_route);
$sql = $db->one_array('	SELECT id, url, zag, data, img, text, en, title_meta, keyw_meta, descr_meta
							FROM ' . DB_PREFIX . 'news 
							WHERE url = "' . $last_route . '"');

if ($sql) {
    $breadNames = array(
        array(
            'url' => 'news',
            'name' => 'Новости'),
        array(
            'name' => $sql['zag']));

    if ($sql['en'] == 0)
        JSRedirect('', '301');

    $img = '';
    if ($sql['img'] && is_file(SITE_PATH . 'uploaded/img/news/' . $sql['id'] . '/' . $sql['img'])) {
        $img = '<img title="' . $sql['zag'] . '" src="./uploaded/img/news/' . $sql['id'] . '/' . $sql['img'] . '">';
    }

    $meta_title = $sql['title_meta'];
    $meta_keyw = $sql['keyw_meta'];
    $meta_descr = $sql['descr_meta'];

    $mainBlockContainer = showtempl(dirname(__FILE__) . '/templ/tpl_news_page.php');

    unset($sql);
} else {

    $_GET['error'] = 404;
}