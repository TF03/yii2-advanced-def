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

    $tabl   	= $_POST['dbTable'];
    $nameField 	= $_POST['nameField'];
    $valueField = $_POST['valueField'];
    $idField 	= (int)$_POST['idField'];

    // проверка уникальности
    if(!empty($tabl) && !empty($nameField) && !empty($valueField)) {

        $result = $db->one_data('	SELECT `' . $nameField . '` 
									FROM ' . DB_PREFIX . $tabl . ' 
									WHERE `' . $nameField . '` = "' . $valueField . '" AND `id` != "' . $idField . '"
									LIMIT 1');
		if(empty($result))
			echo 'true';
		else
			echo 'false';
    }
    else
        echo 'false';