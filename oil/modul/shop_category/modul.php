<?php

$cash_mod = 'menu_main_cat';
$cash = cash_read($cash_mod);

if ($cash && CASH != 0) {
    $mainCategoryMenuBlock = $cash;
    unset($cash_mod, $cash);
} else {
    $menu_info = $db->select_id("
				SELECT `id`, `name`, `pid`, `url`
				FROM " . DB_PREFIX . "shop_cat
				WHERE `en` = 1
				ORDER BY `pid`, `sort` ASC");

    foreach ($menu_info as $k => $v) {
        $menu_info[$v['pid']]['cild'][] = $v['id'];
        $menu_info[$v['pid']]['tree_num'] = 0;
    }

    $menuAll = shop_vievtree_mmenu(0);
    $mainCategoryMenuBlock = showtempl(dirname(__FILE__) . '/templ/tpl-category_menu.php');

    cash_add($cash_mod, 7200, $mainCategoryMenuBlock);

    unset($menu_info, $cash_mod, $cash, $menuAll);
}

///////////функция для вывода дерева /////////////////////////////////////
function shop_vievtree_mmenu($a)
{
    global $menu_info, $site_url;
    $ret = '';

    foreach ($menu_info[$a]['cild'] as $v) {

        if (empty($menu_info[$v]['url'])) {
            $menu_info[$v]['url'] = 'javascript:void(0);';
        }
        $ret .= '
                <li class="table-nav__item" data-global-doubletap="">
                    <a class="table-nav__link" href="' . $menu_info[$v]['url'] . '">
                        <span class="table-nav__link-helper">' . $menu_info[$v]['name'] . '</span>
                    </a>';
        if (!empty($menu_info[$v]['cild'])) {

            $ret .= '<nav class="table-nav__drop">
                        <ul class="tree-nav">';
            foreach ($menu_info[$v]['cild'] as $val) {

                $ret .= '
                        <li class="tree-nav__item">
                            <a class="tree-nav__link" href="' . $site_url . '/' . work_url($menu_info[$val]['url']) . '">' . $menu_info[$val]['name'] . '</a>
                        </li>';
            }
            $ret .= '</ul>
				</nav>';
        }
        $ret .= '</li>';
    }

    return $ret;
}


///////////функция для обработки url /////////////////////////////////////
function work_url($url)
{

    if (!strstr($url, '.html'))
        $url = rtrim($url, '/') . '/';
    return $url;
}

