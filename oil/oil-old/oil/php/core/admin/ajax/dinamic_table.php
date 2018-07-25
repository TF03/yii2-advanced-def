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
	//подключение библиотек
	require_once '../../core.php';

    $dbColumns = unserialize($_POST['dopColums']);
	
    /* массив данных*/
    $arrayData = unserialize($_POST['arrayData']);

    /* если используется список таблица */
    $whereViewMe = (int)$_POST['whereViewMe'];
	if(!empty($whereViewMe))
		$whereViewMe = list_cat_id($whereViewMe, $_SESSION['settingsModul']['table'][0]);

    /* db таблица используется */
    $dbTable = $_POST['dopTable'];

    /* дополнительные условия для db WHERE */
    $addDBWhere = $_POST['dbWhere'];

    /* сортировка поля по умолчанию */
    $sortDefault = $_POST['sortDefault'];

    /* сортировка поля по умолчанию */
    $buttonMain = unserialize($_POST['buttonMain']);
    
    /* сохраняем страницу пажинации */
    $_SESSION['savePageAdmin'] = (int) $_POST['iDisplayStart'];
	
    /*
     * Пажинация
     */
    $dbLimit = '';
    if ( isset($_POST['iDisplayStart']) && $_POST['iDisplayLength'] != '-1' ) {
        $dbLimit = ' LIMIT ' . intval($_POST['iDisplayStart']) . ', ' 
					. intval($_POST['iDisplayLength']);
    }
	
    /*
     * Сортировка
     */
    $dbOrder = '';
    if ( isset($_POST['iSortCol_0'])) {
        $dbOrder = ' ORDER BY ';
        for ( $i = 0; $i < intval($_POST['iSortingCols']); $i++) {
            if ( $_POST[ 'bSortable_' . intval($_POST['iSortCol_' . $i]) ] == 'true' ) {
                $dbOrder .= $dbColumns[ intval( $_POST['iSortCol_'.$i] ) ];
				if($_POST['sSortDir_' . $i] === 'asc')
					$dbOrder .= ' ASC, ';
				else
					$dbOrder .= ' DESC, ';
            }
        }
        $dbOrder = substr_replace( $dbOrder, '', -2 );
        if ( $dbOrder == 'ORDER BY' )
            $dbOrder = '';
    }
     
    /*
     * Фильтр
     */
    $dbWhere = "";
    if(isset($_POST['sSearch']) && $_POST['sSearch'] != '') {
        $dbWhere = ' WHERE (';
		$sSearch = $_POST['sSearch'];
        for ( $i = 0; $i < count($dbColumns); $i++ ) {
            if ( isset($_POST['bSearchable_' . $i]) && $_POST['bSearchable_' . $i] == 'true' )
                $dbWhere .= $dbColumns[$i] . ' LIKE "%' . $sSearch . '%" OR ';
        }
        $dbWhere = substr_replace( $dbWhere, '', -3 );
        $dbWhere .= ')';
    }
     
    /*
     * Фильтр по индивидуальной колонке
     */
    for( $i = 0; $i < count($dbColumns); $i++) {
        if( isset($_POST['bSearchable_' . $i]) && $_POST['bSearchable_' . $i] == 'true' && $_POST['sSearch_' . $i] != '' ) {
            if( $dbWhere == '' ) 
                $dbWhere = ' WHERE ';
            else
                $dbWhere .= ' AND ';
				
			if($arrayData[$dbColumns[$i]]['tip'] == 'multiselect_other_table' || $arrayData[$dbColumns[$i]]['tip'] == 'select_other_table') {
			
				$dataSearchOther = $db->select('
								SELECT `' . $arrayData[$dbColumns[$i]]['value_save'] . '`
								FROM ' . DB_PREFIX . $arrayData[$dbColumns[$i]]['other_table'] . '
								WHERE `' . $arrayData[$dbColumns[$i]]['value_option'] . '` LIKE "%' . $_POST['sSearch_' . $i] . '%"');
				$IDS = '';
				if(!empty($dataSearchOther)) {
					foreach($dataSearchOther as $kSO => $vSO) {
						$IDS .= $vSO[$arrayData[$dbColumns[$i]]['value_save']] . ',';
						$orWhere .= ' ' . $dbColumns[$i] . ' LIKE "%' . $vSO[$arrayData[$dbColumns[$i]]['value_save']] . '%" OR';
					}
					if($arrayData[$dbColumns[$i]]['tip'] == 'select_other_table')
						$dbWhere .= $dbColumns[$i] . ' in (' . trim($IDS, ',') . ') ';
					elseif($arrayData[$dbColumns[$i]]['tip'] == 'multiselect_other_table')
						$dbWhere .= '( ' . trim($orWhere, 'OR') . ' )';
				}
				else {
					$dbWhere = ' WHERE `id` < 1';
					break;
				}
			}
			else
				//$dbWhere .= $dbColumns[$i] . ' LIKE "%' . mysql_real_escape_string($_POST['sSearch_' . $i]) . '%" ';
				$dbWhere .= $dbColumns[$i] . ' LIKE "%' . $_POST['sSearch_' . $i] . '%" ';
        }
    }
	if(!empty($whereViewMe))
		$whereView = ' AND `pid` in (' . $whereViewMe . ')';
	
	if(!empty($dbWhere))
		$dbWhere .= ' ' . $addDBWhere . $whereView;
	else
		$dbWhere = ' WHERE 1 ' . $addDBWhere . $whereView;
	$rResult  = $db->select_id('SELECT SQL_CALC_FOUND_ROWS ' . str_replace(" , ", " ", '`' . implode("`, `", $dbColumns) . '`') . '  
								FROM ' . DB_PREFIX . $dbTable
								. $dbWhere
								. $dbOrder
								. $dbLimit);
	$_SESSION['dinamicTableWhere'] = $dbWhere;
   
	$aResultFilterTotal  = $db->select("SELECT FOUND_ROWS()");
    $iFilteredTotal = $aResultFilterTotal[0]['FOUND_ROWS()'];
     
	$aResultTotal  = $db->select('	SELECT COUNT(`id`)
									FROM ' . DB_PREFIX . $dbTable);
    $iTotal = $aResultTotal[0]['COUNT(`id`)'];
	
    $output = array(
        "sEcho" => intval($_POST['sEcho']),
        "iTotalRecords" => $iTotal,
        "iTotalDisplayRecords" => $iFilteredTotal,
        "aaData" => array()
    );
    foreach($rResult as $k => $aRow) {
        $row = array();
		$buttonTable = '';
        for ( $i = 0; $i < count($dbColumns); $i++) {
			// если мультиселект, то подставляем вместо цифер данные
			if(($arrayData[$dbColumns[$i]]['tip'] == 'multiselect_other_table' 
				|| $arrayData[$dbColumns[$i]]['tip'] == 'select_other_table' 
				|| $arrayData[$dbColumns[$i]]['tip'] == 'multiselect_other_table_with_select') 
				&& !empty($aRow[$dbColumns[$i]])) {
				
				if(!empty($arrayData[$dbColumns[$i]]['other_table'])) {
					// проверяется какое поле сохраняется
					if (empty($arrayData[$dbColumns[$i]]['value_save']) || $arrayData[$dbColumns[$i]]['value_save'] == 'id')
						$arrayData[$dbColumns[$i]]['value_save'] = '`id`';
					else
						$arrayData[$dbColumns[$i]]['value_save'] = $arrayData[$dbColumns[$i]]['value_save'] . ' as `id`';
						
					$tempDataMulti = 'tempDataMulti' . $arrayData[$dbColumns[$i]]['other_table'];
					if(empty($$tempDataMulti))
						$$tempDataMulti = $db->select_id('
										SELECT ' . $arrayData[$dbColumns[$i]]['value_save'] . ', 
												`' . $arrayData[$dbColumns[$i]]['value_option'] . '`
										FROM ' . DB_PREFIX . $arrayData[$dbColumns[$i]]['other_table']);
					$valueMultiData = explode(',', $aRow[$dbColumns[$i]]);
					foreach($valueMultiData as $vM) {
						$rowDataMulti .= ${$tempDataMulti}[$vM][$arrayData[$dbColumns[$i]]['value_option']] . ',';
					}	
					$row[] = trim($rowDataMulti, ',');
					unset($rowDataMulti);
				}
			}
            elseif($arrayData[$dbColumns[$i]]['tip'] == 'bool') {
				if($aRow[$dbColumns[$i]] == '1')
					$ch = 'checked="checked"';
				else
					$ch = '';
                $row[] = '<input type="checkbox" ' . $ch . ' disabled="disabled">';
			}
            elseif($arrayData[$dbColumns[$i]]['tip'] == 'img') {
				if($aRow[$dbColumns[$i]] == '')
					$row[] = '-';
				else {
					$row[] = '<img src="../uploaded/img' . $arrayData[$dbColumns[$i]]['path'] . $aRow['id'] . '/' . $aRow[$dbColumns[$i]] . '" width="70px"/>';
				}
			}
            elseif($arrayData[$dbColumns[$i]]['tip'] == 'sort')
                $row[] = '	<img class="sortUpOrDown" onclick="sortdbUpDown' . $dbTable . '(\'up:' . $aRow[$dbColumns[$i]] . '\');" alt="вверх" src="/admin/images/icons/small/grey/bended_arrow_up.png" />
							<img class="sortUpOrDown" onclick="sortdbUpDown' . $dbTable . '(\'down:' . $aRow[$dbColumns[$i]] . '\');" alt="вниз" src="/admin/images/icons/small/grey/bended_arrow_down.png" />';
            elseif(!empty($aRow[$dbColumns[$i]]))
                $row[] = $aRow[$dbColumns[$i]];
			else
                $row[] = '-';
        }
		if($buttonMain['edit'] == true)
			$buttonTable = '<img src="/admin/images/icons/small/grey/create_write.png" width="24" height="24" title="редактировать"  class="style_edit_del" data-dialog="dialog_edit_form' . $dbTable . '">';
		if($buttonMain['delete'] == true)
			$buttonTable .= '<img src="/admin/images/other/fileclose.png" width="24" height="24" title="удалить" class="style_del_single" data-dialog="dialog_delete_form">';
		$row[] = $buttonTable;
        $output['aaData'][] = $row;
    }
     
    echo json_encode( $output );