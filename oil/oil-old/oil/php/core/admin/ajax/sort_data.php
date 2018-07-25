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

	$data 		 = explode(':', $_POST['info']);
    $method 	 = $data[0];
    $id     	 = $data[1];
    $tabl   	 = $_POST['dbTable'];
    $sortDefault = $_POST['sortDefault'];

    // сортировка записи
    if(!empty($id) && !empty($sortDefault)) {

        if ($method == 'down') {
            $znak = '<';
			$methodSort = ' DESC';
		}
        else {
			$znak = '>';
			$methodSort = ' ASC';
		}
		if(empty($_SESSION['dinamicTableWhere'])) {
			$where  = " WHERE $sortDefault $znak $id ";
			$where2 = " WHERE $sortDefault = $id ";
		}
		else {
			$where  = $_SESSION['dinamicTableWhere'] . " AND $sortDefault $znak $id ";
			$where2 = $_SESSION['dinamicTableWhere'] . " AND $sortDefault = $id ";
		}

        $result = $db->select("
						SELECT * 
						FROM " . DB_PREFIX . "$tabl 
						$where 
						ORDER BY $sortDefault $methodSort 
						LIMIT 1");

        if ($result) {

            $da = $db->select("
						SELECT * 
						FROM " . DB_PREFIX . "$tabl 
						$where2
						LIMIT 1");
            $db->execute("UPDATE  " . DB_PREFIX . "$tabl SET $sortDefault=" . $da[0][$sortDefault] . "  WHERE id = " . $result[0]['id']);
            $db->execute("UPDATE  " . DB_PREFIX . "$tabl SET $sortDefault=" . $result[0][$sortDefault] . "  WHERE id = " . $da[0]['id']);
	
	    if(!empty($_SESSION['savePageAdmin']))
		    echo $_SESSION['savePageAdmin'];
	    else
			echo "ok";
        }
		else
			echo "none";
    }
    else
        echo 'false';