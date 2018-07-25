<?php
//echo 'проводятся технические работы в течение 10 мин все заработает';
//exit();
    session_start();
    if (!$_SESSION['admin'])
        header('Location: login.php');

    require '../core/conf.php';
    require '../core/db.php';
    require '../core/core.php';
	require '../core/admin/upload.php';
    require '../core/admin/core.php';
	
	clearPostGet();

	// инфо о пользователе
    $infoUser = $db->one_array('
					SELECT `logo`, `name`, `pas`
					FROM ' . DB_PREFIX . 'admin_user 
					WHERE `id` = "' . $_SESSION['adminInfo']['id'] . '"
					LIMIT 1');

	// тип пользователя
    $adminTip = $db->one_array('
					SELECT `id`, `name` 
					FROM ' . DB_PREFIX . 'tip_admin 
					WHERE `id` = "' . $_SESSION['adminInfo']['tip'] . '"');

    // вывод верхнего меню
    $dantree = "";
    $dantree = $db->select_id('
						SELECT `id`, `pid`, `name`, `logo`, `url`,`access`
						FROM ' . DB_PREFIX . 'amodules
						WHERE `en` = 1 and CONCAT(",", access, ",") LIKE "%,' . $adminTip['id'] . ',%"
						ORDER BY `sort` ASC');
    //1 я итерация указываем каждому родителю ребенка
    foreach ($dantree as $k => $v) {
        $dantree[$v['pid']]['cild'][] = $v['id'];
        $dantree[$v['pid']]['tree_num'] = 0;
    }
    $admin_topmenu = vievtree_top(0);
    ////////////////////////////////////////////

    // проверка доступа
    function dostup($a)
    {
        $dos = false;
        global $dantree;
        foreach ($dantree as $v) {

            if (isset($v['url']) && $v['url'] == '/admin/?r=' . $a) {
                $dost_in = explode(',', $v['access']);
                if (in_array($_SESSION['adminInfo']['tip'], $dost_in))
                    $dos = true;
            }
        }
        return $dos;
    }

    //////////////////////////////////////////

//// подключение модулей админки    
    if (isset($_GET['r'])) {
        if (dostup($_GET['r'])) {
            $explode_module = explode('/', $_GET['r']);
            $_GET['modul'] = $explode_module[0];
			if(isset($explode_module[1]))
				$_GET['file'] = $explode_module[1];
        }
        if (!isset($_GET['file']))
            $_GET['file'] = $_GET['modul'];
			
        if (is_file(SITE_PATH . 'modul/' . $_GET['modul'] . '/admin/' . $_GET['file'] . '.php'))
            include SITE_PATH . 'modul/' . $_GET['modul'] . '/admin/' . $_GET['file'] . '.php';

        $all_admin = showtempl('./templ/admin.php');
        echo $all_admin;
    }
    else {

        $all_admin = showtempl('./templ/admin.php');
        echo $all_admin;
    }