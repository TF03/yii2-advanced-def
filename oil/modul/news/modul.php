<?php

$cash_mod = 'newsMainBlock';
$cash = cash_read($cash_mod);

if ($cash && CASH != 0) {

    $newsMainBlock = $cash;

    unset($cash_mod, $cash);
} else {
    $sql = $db->select('
				SELECT `id`,`img`,`data`, `url`, `zag`, `short_text`
				FROM ' . DB_PREFIX . 'news
				WHERE `en`=1
				ORDER BY `data` desc
				LIMIT 3');

    if (!empty($sql)) {
        foreach ($sql as $key => $value) {
            if ($value['img'] && is_file(SITE_PATH . 'uploaded/img/news/' . $value['id'] . '/' . $value['img'])) {
                $img = '<img src="' . $site_url . '/uploaded/img/news/' . $value['id'] . '/' . $value['img'] . '" alt="' . $value['zag'] . '" title="' . $value['zag'] . '"/>';
            } else {
                $img = '<img src="./images/nophoto/image-article.jpg" alt="фото ожидается"/>';
            }
            $value['data'] = explode('-', $value['data']);
            $newsMainBlock .= '
					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
						<article class="post post--small">
							<a class="post__image" href="./news/' . $value['url'] . '.html">
								' . $img . '
							</a>
							<div class="post__inner">
								<time class="post__date" datetime="2015-04-01">01 Апреля 2015</time>
								<h3 class="post__title">
									<a class="post__title-link" href="/news/' . $value['url'] . '.html">' . $value['zag'] . '</a>
								</h3>
								<div class="post__desc">
									<div class="typo typo--sub-color">' . $value['short_text'] . '</div>
								</div>
								<a class="post__readmore" href="/news/' . $value['url'] . '.html">Подробнее</a>
							</div>
						</article>
					</div>';
        }
    } else
        $newsMainBlock = '';

    cash_add($cash_mod, 1800, $newsMainBlock);

    unset($sql, $cash_mod, $cash);
}