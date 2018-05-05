<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Jugene
 * Date: 17.03.14
 * Time: 12:16
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

    $pid    = $_POST['pid'];
    $table  = $_POST['table'];

    // удаление записи
    if(!empty($pid)) {
		$selectPidValue = $db->select_id('
				SELECT `id`, `value`
				FROM ' . DB_PREFIX . $table . '
				WHERE `pid`="' . $pid . '"');
		foreach($selectPidValue as $sPV_k => $sPV_v) {
			$selectPidValueHtml .= '<option value="' . $sPV_k . '">' . $sPV_v['value'] . '</option>';
		}
		echo '<option value="0">Сделайте выбор!</option>' . $selectPidValueHtml;
    }
    else
        echo 'false';