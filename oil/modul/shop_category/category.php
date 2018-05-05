<?php

$url_cat = $router_str;
$parentCategories = '';

//отрезаем page от url
if (preg_match('#(.*)page-(.*)#i', $router_str, $temp_url)) {
    $url_cat = $temp_url[1];
    $number_page = trim($temp_url[2], '/');
    $flag_first_page = 1;
} else {
    $url_cat = $router_str;
    $flag_first_page = 0;
}

//выбираем категорию на которой находимся и вложенные в неё
$category_info_all = $db->select('
									SELECT `id`,`pid`,`name`,`url`,`title`,`keyw`,`descr`,`seo_text`
									FROM ' . DB_PREFIX . 'shop_cat
									WHERE url = "' . trim($url_cat, '/') . '" OR pid =  (
												SELECT id
												FROM ' . DB_PREFIX . 'shop_cat
												WHERE url = "' . trim($url_cat, '/') . '"
												LIMIT 0,1) ORDER BY Field(`url`, "' . trim($url_cat, '/') . '") DESC, sort DESC');

//получаем родительскую категорию
$category_info = $category_info_all[0];
unset($category_info_all[0]);

if (!empty($category_info_all)) {
	foreach ($category_info_all as $parentCategory) {
		$parentCategories .= '
				<li class="sidebar-nav__item">
					<a class="sidebar-nav__link"
					   href="./' . $category_info['url'] . '/' . $parentCategory['url'] . '">' . $parentCategory['name'] . '</a>
				</li>';
	}
}

$breadNames = $category_info['name'];

$mainBlockContainer = showtempl(dirname(__FILE__) . '/templ/tpl_category.php');