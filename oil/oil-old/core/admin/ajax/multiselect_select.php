<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Jugene
 * Date: 06.03.14
 * Time: 16:22
 * To change this template use File | Settings | File Templates.
 */

// проверка на сессию админа
    session_start();
// защита от запростов с дургих сайтов
    if (strpos($_SERVER['HTTP_REFERER'], 'http://' . $_SERVER['HTTP_HOST']) === false || $_SESSION['admin'] != 'admin')
        exit();

//подключение БД
    require_once '../../conf.php';
    require_once '../../db.php';
    require_once '../../core.php';
    require_once '../core.php';
	
	$data 	= unserialize($_POST['data']);
	$pid  	= (int)$_POST['pid'];
	$dataDB = implode(',', $_POST['dataDB']);
	$k		= $_POST['key'];

	if(!empty($data) && !empty($data['other_table'])) {
	
		// проверка какое поле сохранять (ключ)
		if (empty($data['value_save']))
			$data['value_save'] = 'id';
		
		$mst_html = '';
		// получаем select главный (категории)
		if (!empty($data['main_select_table'])) {
			// проверка на наличие дополнительного where к главному select
			if(!empty($data['where_main_select_table']))
				$where_main_select_table = ' WHERE ' . $data['where_main_select_table'];
			else
				$where_main_select_table = '';
			$main_select_table = $db->select_id('
								SELECT `id`, `name`
								FROM ' . DB_PREFIX . $data['main_select_table']
								. $where_main_select_table . '
								ORDER BY `name` ASC');
			foreach($main_select_table as $k_mst => $v_mst) {
				if($pid == $v_mst['id']) {
					$firstID = list_cat_id($v_mst['id'], $data['main_select_table']);
					$mst_html .= '<option selected="selected" value="' . $v_mst['id'] . '">' . $v_mst['name'] . '</option>';
				}
				else
					$mst_html .= '<option value="' . $v_mst['id'] . '">' . $v_mst['name'] . '</option>';
			}
			$mst_html = '<select class="MultiSelelectTable_' . $k . '" id="MultiSelelectTable___' . $k . '">' . $mst_html . '</select>';
		}
		// доволнение к where выбранные эжлементы выбираем
		if (!empty($dataDB))
			$selectedIDs = ' OR `id` in (' . $dataDB . ')';
		else
			$selectedIDs = '';
		// проверка на наличие дополнительного where к select
		if(!empty($data['whereSelect']))
			$whereSelect = ' WHERE (' . $data['whereSelect'] . ' AND `pid` in (' . $firstID . ')) ' . $selectedIDs;
		else
			$whereSelect = ' WHERE (`pid` in (' . $firstID . ')) ' . $selectedIDs;
		$other_table = $db->select('
							SELECT `' . $data['value_save'] . '`, `' . $data['value_option'] . '`
							FROM ' . DB_PREFIX . $data['other_table']
							. $whereSelect);
		$array_dataDB_k = explode(',', $dataDB);
			
		if (!empty($other_table)) {
			foreach ($other_table as $ot_k => $ot_v) {
				$select = '';
				if (in_array($ot_v[$data['value_save']], $array_dataDB_k))
					$select = 'selected="selected"';
				$val .= '<option ' . $select . ' value="' . $ot_v[$data['value_save']] . '">' . $ot_v[$data['value_option']] . '</option>';
			}
		}
		$val = '<select class="multisorter indent" id="multi' . $k . '" multiple="multiple" name="' . $k . '[]">' . $val . '</select>';
		
		$elen_del 	= array("\t", "\n");
		$mst_html 	= str_replace($elen_del, '', $mst_html);
		$val 		= str_replace($elen_del, '', $val);
		
		$answer = json_encode(array($val,$mst_html));
		echo $answer;
    }
    else
        echo 'false';