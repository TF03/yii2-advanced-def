<?php

// защита от запростов с дургих сайтов
    if (strpos($_SERVER['HTTP_REFERER'], 'http://' . $_SERVER['HTTP_HOST']) === false)
        exit();
// проверка на сесию админа
    session_start();
    if ($_SESSION['admin'] != 'admin')
        exit();

//подключение БД
    require_once '../../conf.php';
    require_once '../../db.php';
    require_once '../../core.php';
    require_once '../core.php';
    require_once '../../admin/upload.php';

    $id 			= (int)$_POST['idItem'];
    $tabl 			= $_POST['dbTable'];
    $data 			= unserialize($_POST['arrayData']);
    $arraySettings 	= unserialize($_POST['arraySettings']);
	// массив типов, которые не должны сохранятся
	$tipNotSave 	= array(
						'2select_with_link');

    require_once 'function_validation_data.php';
    require_once $_POST['MethodSave'] . '_save_db.php';
	
	if($_POST['listRefList'] == 'list') 
		echo tree_db_edit( $arraySettings, $data);
	else {
		if(!empty($_SESSION['savePageAdmin']))
			echo $_SESSION['savePageAdmin'];
		else
			echo "ok";
	}