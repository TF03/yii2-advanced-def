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
	
    $tabl   = $_POST['dbTable'];
    $data   = json_decode($_POST['arrayData'],true);
	
	$mas 	= creat_mas_tree($data);
	

	$db->execute('INSERT INTO ' . DB_PREFIX . $tabl .'
					(`id`,`pid`,`sort`)
				VALUES ' . implode(",",$mas) . ' 
				ON DUPLICATE KEY UPDATE 
					`pid` = VALUES(`pid`),
					`sort` = VALUES(`sort`)');
				
	echo true;
	
	function creat_mas_tree($data, $pid = 0) {
		global $temp_mas;
		
		foreach ($data as $k => $v) {
			$temp_mas[] = '(' . $v['id'] . ',' . $pid . ',' . ($k+1) . ')';
			
			if(!empty($v['children'])){
				creat_mas_tree($v['children'],$v['id']);
			}
		}
		return $temp_mas;
	}