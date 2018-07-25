<?php
    /**
     * Created by JetBrains PhpStorm.
     * User: Jugene
     * Date: 10.12.13
     * Time: 12:08
     * To change this template use File | Settings | File Templates.
     */

    $testProstoTestNoDelete = $db->one_data('SELECT `id` FROM ' . DB_PREFIX . $tabl . ' WHERE `id` = "1"');
    // перебераем поля состовляем запрос
    foreach ($data as $k => $v) {
        $val = '';
        // проверяем есле поле для записи  добовляем
        if ($v['w'] == 1) {

            $val = $_POST[$k];

            //если картинка
            if ($v['tip'] == 'img') {
                if ($_FILES[$k]['tmp_name']) {
                    $path = SITE_PATH . '/uploaded/img' . $v['path'] . $id . '/';
                    $iwidth = $v['width'];
                    $iheight = $v['height'];

                    if (!empty($id)) {
                        //проверка на наличие старой картинки
                        $old_img = $db->one_data('
                                    SELECT `' . $k . '`
                                    FROM ' . DB_PREFIX . $tabl . '
                                    WHERE `id` = "' . $id . '"');
                        // удаление старой картинки
                        if (!empty($old_img))
                            unlink($path . $old_img);
                    }

                    if (empty($iwidth)) {
                        $size = getimagesize($_FILES[$k]['tmp_name']);
                        $iwidth = $size[0];
                        $iheight = $size[1];
                    }
                    $val = uploadimage($iwidth, $iheight, $path, $k);
                }
                else
                    unset ($val);
            }
			
			/*multi img*/
            elseif ($v['tip'] == 'img_m'){
                /* settings */
                $iw=$v['imgw'];
                $ih=$v['imgh']; 
                $path = SITE_PATH . 'uploaded/img' . $v['path'] . $id . '/';
                
                /* mas img */
                $mas_img = $db->select_id('
                    SELECT `id`,`sort`,`' . $v['value_option'] . '`
                    FROM ' . DB_PREFIX . $v['other_table'] . ' 
                    WHERE `pid`="'.$id.'" 
                    ORDER BY `sort` DESC     
                ');

                /* get mas img */
                $get_mas_img = array();
                $flag_ds = 0;
                if(!empty($_POST['img_list_sort_'.$k])){
                    $flag_ds = 1;
                    $get_mas_img = explode(",",  trim($_POST['img_list_sort_'.$k],","));
                }
                    
                if($mas_img){
                    
                    /* mas for del img */
                    $del_img_bd = array();

                    /* create mas sort img if img_list_sort_... true */
                    if($get_mas_img){
                        $mas_sort_img = array_flip(array_reverse($get_mas_img));
                    }
                    
                
                    foreach ($mas_img as $ki => $vi) {

                        if(!in_array($vi['id'], $get_mas_img) && $flag_ds == 1){
                            /*del on server*/                            
                            if(unlink( $path . $vi[$v['value_option']])){
                                $del_img_bd[] = $vi['id'];
                            }
                            
                        }
                        else{
                            if($flag_ds == 1){
                                $vi['sort'] = $mas_sort_img[$ki];
                            }
                            
                            $upd_img_bd[] = '("'.$ki.'","'.$_POST['alt_image_'.$k][$ki].'","'.$_POST['title_image_'.$k][$ki].'","'.$vi['sort'].'")';
                        }
                        
                    }                                      
                    
                    /* del on bd */
                    if($del_img_bd){                       
                        $db->execute('
                            DELETE FROM 
                            ' . DB_PREFIX . $v['other_table'] . ' 
                            WHERE `id` in ('.implode(",",$del_img_bd).') 
                        ');
                    }

                    /* update on bd */
                    if($upd_img_bd){  
                        
                        $db->execute('
                            INSERT INTO 
                                ' . DB_PREFIX . $v['other_table'] . ' 
                                (`id`,`alt_image`,`title_image`,`sort`) 
                            VALUES
                                '.implode(",",$upd_img_bd).'
                            ON DUPLICATE KEY UPDATE 
                                `alt_image` = VALUES(`alt_image`),
                                `title_image` = VALUES(`title_image`),
                                `sort` = VALUES(`sort`)
                        ');
                    }
                    
                    /* clear mas */
                    unset($mas_img,$del_img_bd);
                }
                    
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
                        $db->execute('INSERT '.DB_PREFIX.$v['other_table'].' SET pid='.$id.', `'.$v['value_option'].'`="'.$t_val.'"');
                        $t_id=mysql_insert_id();

                    }
                    
                    
               }
               
               $upd_img=$db->select_id ('SELECT `id` FROM '.DB_PREFIX.$v['other_table'].'  WHERE `pid`='.$id);

                /* new list img */
                $val=implode(",",array_keys($upd_img));
			}
			// bool (checkbox)
			elseif ($v['tip'] == 'textcode')
				$val = mysql_real_escape_string($_POST[$k]);
			
			// bool (checkbox)
			elseif ($v['tip'] == 'bool') {
				if($_POST[$k] == 'on')
					$val = 1;
				else
					$val = 0;
			}
			
			// sort
			elseif ($v['tip'] == 'sort' && $v['editTip'] == 1) {
				$val = $_POST[$k];
			}
			
			// мультиселект связь с другой таблицей
			elseif ($v['tip'] == 'multiselect_other_table' || $v['tip'] == 'multiselect_other_table_with_select')
				$val = implode(',', $_POST[$k]);

            //если файл
            elseif ($v['tip'] == 'file'
                    && $_FILES[$k]['name'] != ''
                    && in_array(end(explode('.', $_FILES[$k]['name'])), explode(',', $v['type_file']))) {

                if ($_FILES[$k]['tmp_name']) {

                    //путь у файлу
                    $path = SITE_PATH . '/uploaded/file' . $v['path'] . $id . '/';

                    //проверка на наличие старого файл
                    $old_file = $db->one_data('
                                SELECT `' . $k . '`
                                FROM ' . DB_PREFIX . $tabl . '
                                WHERE `id` = "' . $id . '"');
                    // удаление старого  файла
                    if ($old_file)
                        unlink($path . $old_file);

                    //сохранение нового файла
                    $val = uploadfile($path, $k);
                }
                else
                    unset ($val);
            }		
			
            //TODO: Jugene: для комбинаций товаров создан тип и вот описан
            elseif ($v['tip'] == 'special_for_set') {

                $id_del_set = $_POST[$k . '_del'];
                $id_del_set = str_replace(',,', ',', trim($id_del_set, ','));

                $all_price_ua = 0;
                $all_price_ru = 0;
                $all_price_tenge = 0;
                $all_price_bel = 0;

                $id_element_set = $_POST[$k];
                if ($id_element_set) {

                    $temp_id = $db->select('SELECT `pid`, `pid_product` FROM ' . DB_PREFIX . $v['tabl'] . '_product
											WHERE `pid` in (' . $id_element_set . ') AND `pid_product`=' . $id);

                    foreach ($temp_id as $key_el => $value_el) {

                        $db->execute("UPDATE " . DB_PREFIX . $v['tabl'] . "_product
								  SET `price_ua`='" . $_POST['price_ua_' . $value_el['pid']] . "',
										`price_ru`='" . $_POST['price_ru_' . $value_el['pid']] . "',
										`price_tenge`='" . $_POST['price_kz_' . $value_el['pid']] . "',
										`price_bel`='" . $_POST['price_bel_' . $value_el['pid']] . "'
								  WHERE `pid`=" . $value_el['pid'] . "
									AND `pid_product`='" . $value_el['pid_product'] . "'");
                        $id_element_set = str_replace($value_el['pid'], '', $id_element_set);

                        $all_price_ua += $_POST['price_ua_' . $value_el['pid']];
                        $all_price_ru += $_POST['price_ru_' . $value_el['pid']];
                        $all_price_tenge += $_POST['price_kz_' . $value_el['pid']];
                        $all_price_bel += $_POST['price_bel_' . $value_el['pid']];
                    }

                    $id_element_set = preg_replace('#([,]+)#i', ',', $id_element_set);
                    $id_element_set = trim($id_element_set, ',');
                    $id_element_set = explode(',', $id_element_set);
                    $sql_insert = '';

                    foreach ($id_element_set as $value_el) {
                        if ($value_el) {
                            $sql_insert .= '(' . $value_el . ',
											' . $id . ',
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
                    if ($sql_insert) {
                        $db->execute("INSERT INTO " . DB_PREFIX . $v['tabl'] . "_product
									(`pid`, `pid_product`, `price_ua`, `price_ru`, `price_tenge`, `price_bel`)
							   VALUES " . trim($sql_insert, ','));
                    }
                    unset($sql_insert);
                }

                if ($id_del_set) {
                    $db->execute("DELETE FROM " . DB_PREFIX . $v['tabl'] . "_product
							WHERE `pid_product`=" . $id . " AND `pid` in (" . $id_del_set . ")");
                    unset ($id_del_set);
                }
				unset($val);
                $sql .= ' `price_ua`=' . $all_price_ua . ', `price_ru`=' . $all_price_ru . ', `price_tenge`=' . $all_price_tenge . ', `price_bel`=' . $all_price_bel . ',';
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
					if(strstr($postK, 'twoSelectch_' . $k . $v['linkTable'] . '___')) {
						$idPidProperty 	= str_replace( 'twoSelectch_' . $k . $v['linkTable'] . '___', '', $postK);
						$idPidProperty 	= explode('_', $idPidProperty);
						if(empty($idPidProperty[1])) {
							$idValueChe 	= $db->one_data('
												SELECT `id`
												FROM ' . DB_PREFIX . $v['valueTable'] . '
												WHERE `value` = "' . trim($postV) . '"
												LIMIT 1');
							if(!empty($idValueChe))
								$idPidProperty[1] = $idValueChe;
						}
						if( !in_array($idPidProperty[1], $defaultData)) {
							if(!empty($idPidProperty[1]))
								$sqlInsertLink .= ' ( ' . $id . ', "' . $idPidProperty[1] . '"),';
							else {
								$sqlInsertProperty .= ' ( ' . $idPidProperty[0] . ', "' . $postV . '"),';
								$sqlInsertPropertyWhere[] = ' (`pid` = "' . $idPidProperty[0] . '" AND `value` = "' . $postV . '") ';
							}
						}
					}
				}
				// перебираем данные, которые надо удалить
				$chDel = explode(',', $_POST['ch_' . $k . $v['linkTable'] . '_del']);
				foreach($chDel as $chDelK => $chDelV) {
					$chDelV = explode('_', $chDelV);
					if(!empty($chDelV[1]))
						$db->execute('  DELETE FROM ' . DB_PREFIX . $v['linkTable'] . '
										WHERE `pidItem` = "' . $id . '" AND `pidValue` = "' . $chDelV[1] . '"');
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
						$newSqlInsertLink .= ' ( ' . $id . ', "' . $nIk . '"),';
					}
					if(!empty($newSqlInsertLink))
						$db->execute('INSERT INTO ' . DB_PREFIX . $v['linkTable'] . ' (`pidItem`, `pidValue`) VALUES ' . trim($newSqlInsertLink, ','));
				}
			}

            //добовляем кавычки где нужно
            if (  (isset($val)|| $v['tip'] == 'multiselect_other_table' || $v['tip'] == 'multiselect_other_table_with_select')
		  && $k != 'id' && $v['disabled'] != true && !in_array($v['tip'], $tipNotSave)) {
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
    if (!empty($sql))
        $db->execute('
            UPDATE ' . DB_PREFIX . $tabl . '
            SET ' . $sql . '
            WHERE `id` = "' . $id . '"');