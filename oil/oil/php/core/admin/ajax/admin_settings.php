<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Jugene
 * Date: 12.12.13
 * Time: 11:00
 * To change this template use File | Settings | File Templates.
 */

// защита от запростов с дургих сайтов
    if (strpos($_SERVER['HTTP_REFERER'], 'http://' . $_SERVER['HTTP_HOST']) === false)
        exit();
// проверка на сессию админа
    session_start();
    if ($_SESSION['admin'] != 'admin')
        exit();

//подключение БД
    require_once '../../conf.php';
    require_once '../../db.php';
    require_once '../core.php';

    $id     	= $_POST['id'];
    $logo   	= $_POST['logo'];
    $login   	= $_POST['login'];
    $password 	= $_POST['password'];
	
	$_SESSION['adminInfo']['login'] = $login;
    
    if (!empty($id)) {
        if($db->execute('
            UPDATE ' . DB_PREFIX . 'admin_user
            SET `logo` = "' . $logo . '", `login` = "' . $login . '", `pas` = "' . $password . '"
            WHERE `id` = "' . $id . '"'))
			echo 'true';
	}
	else
		echo 'false';