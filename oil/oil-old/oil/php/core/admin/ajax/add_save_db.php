<?php
    /**
     * Created by JetBrains PhpStorm.
     * User: Jugene
     * Date: 10.12.13
     * Time: 12:08
     * To change this template use File | Settings | File Templates.
     */

    $next_auto_increment = $db->one_array('SHOW TABLE STATUS FROM ' . DB_NAME . ' LIKE "' . DB_PREFIX . $tabl . '"');
    $next_auto_increment = $next_auto_increment['Auto_increment'];

    // перебераем поля состовляем запрос
    foreach ($data as $k => $v) {
        $val = '';
        // проверяем есле поле для записи  добовляем
        if ($v['w'] == 1) {

            $val = $_POST[$k];

            //если картинка
            if ($v['tip'] == 'img') {
                if ($_FILES[$k]['tmp_name']) {
                    $path = SITE_PATH . 'uploaded/img' . $v['path'] . $next_auto_increment . '/';
                    $iwidth = $v['width'];
                    $iheight = $v['height'];
					echo $path;
                    if (empty($iwidth)) {
                        $size = getimagesize($_FILES[$k]['tmp_name']);
                        $iwidth = $size[0];
                        $iheight = $size[1];
                    }
                    //сохранение новой картинки
                    $val = uploadimage($iwidth, $iheight, $path, $k);
					
					echo $val;
                }
                else
                    unset ($val);
            }
			/*multi img*/
            elseif ($v['tip'] == 'img_m'){
                /* settings */
                $iw=$v['imgw'];
                $ih=$v['imgh']; 
                $path = SITE_PATH . 'uploaded/img' . $v['path'] . $next_auto_increment . '/';
                
                /* add new img */
                if($_FILES[$k]['name']){
                    foreach ($_FILES[$k]['name'] as $kk=>$vv){
                        
                        $_FILES[('t_'.$k.$kk)]['name']      =   $_FILES[$k]['name'][$kk];    
                        $_FILES[('t_'.$k.$kk)]['type']      =   $_FILES[$k]['type'][$kk]; 
                        $_FILES[('t_'.$k.$kk)]['tmp_name']  =   $_FILES[$k]['tmp_name'][$kk];
                        $_FILES[('t_'.$k.$kk)]['error']     =   $_FILES[$k]['error'][$kk];
                        $_FILES[('t_'.$k.$kk)]['size']      =   $_FILES[$k]['size'][$kk];

                        if (empty($iw)){    
                            $size = getimagesize ($_FILES[$k]['tmp_name']); 
                            $iw=$size[0];
                            $ih=$size[1];
                        }

                        // save img
                        $t_val=uploadimage($iw,$ih,$path,('t_'.$k.$kk));

                        // create data for img in bd
                        $db->execute('INSERT '.DB_PREFIX.$v['other_table'].' SET pid='.$next_auto_increment.', `'.$v['value_option'].'`="'.$t_val.'"');
                        $t_id=mysql_insert_id();

                    }
                    
                    
               }
               
               $upd_img=$db->select_id ('SELECT `id` FROM '.DB_PREFIX.$v['other_table'].'  WHERE `pid`='.$next_auto_increment);

                /* new list img */
                $val=implode(",",array_keys($upd_img));
           }
		   
			// bool (checkbox)
			elseif ($v['tip'] == 'bool') {
				if($_POST[$k] == 'on')
					$val = 1;
				else
					$val = 0;
			}
			
			// bool (checkbox)
			elseif ($v['tip'] == 'textcode') 
				$val = mysql_real_escape_string($_POST[$k]);
			
			// мультиселект связь с другой таблицей
			elseif ($v['tip'] == 'multiselect_other_table' || $v['tip'] == 'multiselect_other_table_with_select')
				$val = implode(',', $_POST[$k]);

            //если файл
            elseif ($v['tip'] == 'file'
                && $_FILES[$k]['name'] != ''
                && in_array(end(explode('.', $_FILES[$k]['name'])), explode(',', $v['type_file']))) {

                if ($_FILES[$k]['tmp_name']) {

                    //путь у файлу
                    $path = SITE_PATH . '/uploaded/file' . $v['path'] . $next_auto_increment . '/';

                    //сохранение нового файла
                    $val = uploadfile($path, $k);
                }
                else
                    unset ($val);
            }
			
            //TODO: Jugene: для комбинаций товаров создан тип и вот описан
            elseif ($v['tip'] == 'special_for_set') {

                $all_price_ua = 0;
                $all_price_ru = 0;
                $all_price_tenge = 0;
                $all_price_bel = 0;

                $sql_insert_set = '';

                $id_element_set = $_POST[$k];
                if ($id_element_set) {

                    $id_element_set = explode(',', $id_element_set);
                    foreach ($id_element_set as $value_el) {
                        if ($value_el) {
                            $sql_insert_set .= '(' . $value_el . ',
                                        !!?#?!!,
                                        "' . $_POST['price_ua_' . $value_el] . '",
                                        "' . $_POST['price_ru_' . $value_el] . '",
                                        "' . $_POST['price_kz_' . $value_el] . '",
                                        "' . $_POST['price_bel_' . $value_el] . '"),';

                            $all_price_ua += $_POST['price_ua_' . $value_el];
                            $all_price_ru += $_POST['price_ru_' . $value_el];
                            $all_price_tenge += $_POST['price_kz_' . $value_el];
                            $all_price_bel += $_POST['price_bel_' . $value_el];
                        }
                    }
                    if ($sql_insert_set) {
                        $sql_insert_set = "INSERT INTO " . DB_PREFIX . $v['tabl'] . "_product
								(`pid`, `pid_product`, `price_ua`, `price_ru`, `price_tenge`, `price_bel`)
						   VALUES " . trim($sql_insert_set, ',');
                    }
                }
				unset($val);
                $sql .= ' `price_ua`=' . $all_price_ua . ', `price_ru`=' . $all_price_ru . ', `price_tenge`=' . $all_price_tenge . ', `price_bel`=' . $all_price_bel . ',';
            }
			
			//sort
			elseif ($v['tip'] == 'sort') {
				if($_POST[$k] == 0 || empty($_POST[$k])) {
					$val = '';
					$sort = ' `' . $k . '` = ';
				}
				else {
					$sort = '';
					$val = $_POST[$k];
				}
			}
			
			// тип для 2 списков со связью
            elseif ($v['tip'] == '2select_with_link') {
				$sqlInsertLink 			= '';
				$sqlInsertProperty 		= '';
				$newSqlInsertLink 		= '';
				$sqlInsertPropertyWhere = array();
				$defaultData 			= explode(',', $_POST['select_input_ch_' . $k . $v['linkTable']]);
				
				// перебираем данные, которые надо сохранить
				foreach($_POST as $postK => $postV) {
					if(strstr($postK, 'twoSelectch_' . $k . $v['linkTable'] . '___') && !in_array($postV, $defaultData)) {
						$idPidProperty = str_replace( 'twoSelectch_' . $k . $v['linkTable'] . '___', '', $postK);
						$idPidProperty = explode('_', $idPidProperty);
						if(empty($idPidProperty[1])) {
							$idValueChe 	= $db->one_data('
												SELECT `id`
												FROM ' . DB_PREFIX . $v['valueTable'] . '
												WHERE `value` = "' . trim($postV) . '"
												LIMIT 1');
							if(!empty($idValueChe))
								$idPidProperty[1] = $idValueChe;
						}
						if(!empty($idPidProperty[1]))
							$sqlInsertLink .= ' ( ' . $next_auto_increment . ', "' . $idPidProperty[1] . '"),';
						else {
							$sqlInsertProperty .= ' ( ' . $idPidProperty[0] . ', "' . $postV . '"),';
							$sqlInsertPropertyWhere[] = ' (`pid` = "' . $idPidProperty[0] . '" AND `value` = "' . $postV . '") ';
						}
					}
				}
				// перебираем данные, которые надо удалить
				$chDel = explode(',', $_POST['ch_' . $k . $v['linkTable'] . '_del']);
				foreach($chDel as $chDelK => $chDelV) {
					$chDelV = explode('_', $chDelV);
					if(!empty($chDelV[1]))
						$db->execute('  DELETE FROM ' . DB_PREFIX . $v['linkTable'] . '
										WHERE `pidItem` = "' . $next_auto_increment . '" AND `pidValue` = "' . $chDelV[1] . '"');
				}
				// делаем вставки соединений между товарами и свойствами
				if(!empty($sqlInsertLink))
					$db->execute('INSERT INTO ' . DB_PREFIX . $v['linkTable'] . ' (`pidItem`, `pidValue`) VALUES ' . trim($sqlInsertLink, ','));

				// делаем вставки свойств, которых нет в списках
				if(!empty($sqlInsertProperty)) {
					$db->execute('INSERT INTO ' . DB_PREFIX . $v['valueTable'] . ' (`pid`, `value`) VALUES ' . trim($sqlInsertProperty, ','));
					$newInsert = $db->select_id('
										SELECT `id`
										FROM ' . DB_PREFIX . $v['valueTable'] . '
										WHERE ' . implode(' OR ', $sqlInsertPropertyWhere));
					foreach($newInsert as $nIk => $nIv) {
						$newSqlInsertLink .= ' ( ' . $next_auto_increment . ', "' . $nIk . '"),';
					}
					if(!empty($newSqlInsertLink))
						$db->execute('INSERT INTO ' . DB_PREFIX . $v['linkTable'] . ' (`pidItem`, `pidValue`) VALUES ' . trim($newSqlInsertLink, ','));
				}
			}

            //добовляем кавычки где нужно
            if (isset($val) && $k != 'id' && $v['disabled'] != true && !in_array($v['tip'], $tipNotSave)) {
                if (!strstr($val, 'undefined')) {

                    if ($v['tip'] == 'file' && $_FILES[$k]['name'] == '')
                        $sql .= '';
                    else {
						if((!empty($v['def']) && empty($val)) || $v['tip'] == 'alwaysdef')
							$val = $v['def'];							
						$sql .= ' `' . $k . "`='" . trim($val) . "',";
					}
                }
            }
        }
    }

    $sql = trim($sql, ',');
    if (!empty($sql)) {
        $db->execute('  INSERT ' . DB_PREFIX . $tabl . '
                        SET ' . $sql);
        $ins_id = mysql_insert_id();
		if(!empty($sort)) {
			$db->execute('
				UPDATE ' . DB_PREFIX . $tabl . '
				SET ' . $sort . $ins_id . '
				WHERE `id` = "' . $ins_id . '"');
		}
        if(!empty($sql_insert_set)) {
            $db->execute(str_replace('!!?#?!!', $ins_id, $sql_insert_set));
        }
    }