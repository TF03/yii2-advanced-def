<?php
$test_page = preg_match('#^page-([\d]+)$#i', $router[1]);
if (!$router[1] or $test_page) {
    //подключения модуля для страницы отзывов
    /*$array_modul = array (	'menu_left/menu_left.php', // левое меню
                            'banner_left/banner_left.php' ////Левый банер
                            );*/
    foreach ($array_modul as $v)
        if (file_exists("./modul/$v"))
            include "./modul/$v";

    $breadNames = 'Новости';

    // пажинация
    $sqll = $db->one_array("	SELECT title_meta, descr_meta, keyw_meta, seo_text, (
									SELECT COUNT(id) 
									FROM " . DB_PREFIX . "news
									WHERE en=1) as count_id
								FROM " . DB_PREFIX . "seo_for_url
								WHERE id=1");

    // проверка на добавление сео текста
    if ($test_page)
        $sqll['seo_text'] = '';

    $pagin = paging($sqll['count_id'], 9, 5);

    // meta.....
    $meta_title = $sqll['title_meta'];
    $meta_keyw = $sqll['keyw_meta'];
    $meta_descr = $sqll['descr_meta'];

    $sql = $db->select('	SELECT `id`, `data`, `zag`, `url`, `img`, `short_text`
							FROM ' . DB_PREFIX . 'news 
							WHERE en = 1 
							ORDER BY `data` DESC  
							LIMIT ' . $pagin['1']);
    $news_main = '';

    foreach ($sql as $key => $value) {

        if ($value['img'] && is_file(SITE_PATH . 'uploaded/img/news/' . $value['id'] . '/' . $value['img'])) {
            $img = '<img title="' . $value['zag'] . '" src="./uploaded/img/news/' . $value['id'] . '/' . $value['img'] . '">';
        } else {
            $img = '<img alt="" src="./images/nophoto/image-news.jpg" />';
        }

        $news_main .= '
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<!-- Post -->
					<article class="post">
						<div class="post__inner">
							<time class="post__date" datetime="2015-04-20">' . edit_date($value['data']) . '</time>
							<h2 class="post__title">
								<a class="post__title-link" href="./news/' . $value['url'] . '.html">' . $value['zag'] . '</a>
							</h2>

							<div class="post__desc">
								<div class="typo"><p><span>' . $value['short_text'] . '</span></p></div>
							</div>
							<a class="post__readmore hidden-xs" href="./news/' . $value['url'] . '.html">Подробнее</a>
						</div>
					</article>
				</div>';
    }

    $mainBlockContainer = showtempl(dirname(__FILE__) . '/templ/tpl_news.php');
} else {

    $_GET['error'] = 404;
}