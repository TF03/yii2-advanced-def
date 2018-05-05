<?php
////////////////////////////////////////////////////////////////////////////
// вывод таблицы
//$ta_array_settings - масив с настройками
//$ta_array_data - масив с типами полей

    function tab_admin_tables($ta_array_settings, $ta_array_data) {
	
		$_SESSION['settingsModul'] = $ta_array_settings;
		if(!empty($ta_array_settings['countTable']) && $ta_array_settings['countTable'] > 1)
			return tab_admin_more_tables( $ta_array_settings, $ta_array_data);
		else
			return tab_admin_one_table( $ta_array_settings, $ta_array_data);
	}
	
    function tab_admin_one_table($ta_array_settings, $ta_array_data) {
	
		global 	$aoColumns, $columsTable, $aoTable, $jsData, $buttonMain, 
				$selectorBody, $aoFilters, $tableFooter, $sortDefault, $countColum,$dbWhere;
		$aoTable          = $ta_array_settings['table'];
		$dbWhere          = $ta_array_settings['where'];
		$buttonMain       = $ta_array_settings['button'];
		$aoColumns        = '';
		$sortDefault      = '';
        $ret              = '';
		$countColum		  = '';
		$i 				  = 0;
		// собираем нужное количество фильтров
		$aoFilters        = '';
		// теги пустые в таблицу для фильтров
		$tableFooter        = '';
		$columsTable      = array();
		// масив с типами полей для ajax 
		$jsData           = serialize($ta_array_data);
		// селектор к какому обращаться при событиях кнопок
		$selectorBody     = '.datatable' . $aoTable . ' tr.dtSelect';
		
        foreach ($ta_array_data as $k => $v) {
		 
			///обработка типов
			if ($v['tip'] == 'sort') {
                
				// собираем названия столбцов
				$aoColumns .= '{ "sTitle": "Сортировка"},';
				$columsTable[] = $k;
				$aoFilters .= 'null,';
				$tableFooter .= '<th></th>';
				$sortDefault = $k;
				if(empty($v['sort']))
					$v['sort'] = 'desc';
				$countColum	= $i . ', "' . $v['sort'] . '"';
			}
            elseif ($v['r'] == 1 || $v['tip'] == 'id') {
                
				$v['name'] = addslashes($v['name']);
					
				// собираем названия столбцов
				$aoColumns .= '{ "sTitle": "' . $v['name'] . '"},';
				$columsTable[] = $k;
				$aoFilters .= '{ type: "text" },';
				$tableFooter .= '<th>Поиск по ' . $v['name'] . '</th>';
				$i++;
            }
        }
		if(empty($countColum))
			$countColum	= '0, "desc"';
				
		if($buttonMain['edit'] == true || $buttonMain['delete'] == true) {
			$aoColumns .= '{ "sTitle": "Управление"}';//,{ "sTitle": "delete"}';
			$tableFooter .= '<th></th>';//<th></th>';
			$aoFilters .= ' null';//, null,';
		}
        $columsTable = serialize($columsTable);
        $ret .= showtempl(dirname(__FILE__) . '/templ/c_two_tabl.php');
		// подключение js, html, которые должны подключится один раз
		$ret .= showtempl(dirname(__FILE__) . '/templ/js_html_more.php');
		if(empty($ta_array_settings['catTabl']))
			$TITLE = '<div class = "flat_area grid_16">
					<h2>
						Tortoise <small> - ' . $ta_array_settings['title'] . '</small>       
					</h2>
				</div>';
        return $TITLE . $ret;
    }

    function tab_admin_more_tables($ta_array_settings, $ta_array_data) {
	
		global 	$iTables, $aoColumns, $columsTable, $aoTable, $treeTitle, $jsData, $buttonMain,
				$selectorBody, $aoFilters, $tableFooter, $sortDefault, $countColum,$dbWhere;
		$treeTitle 		  =	$ta_array_settings['title'];
		$ret              = '';
		$tabTable         = '';
		$iTables	 	  = 0;
		
        foreach ($ta_array_data as $kArrayTable => $arrayTable) {
			$aoColumns        = '';
			$sortDefault      = '';
			$countColum		  = '';
			$i			 	  = 0;
			$aoTable          = $ta_array_settings['table'][$iTables];
			$dbWhere          = $ta_array_settings['where'][$iTables];
			$buttonMain       = $ta_array_settings['button'][$iTables];
			// собираем нужное количество фильтров
			$aoFilters        = '';
			// теги пустые в таблицу для фильтров
			$tableFooter        = '';
			$columsTable      = array();
			// масив с типами полей для ajax 
			$jsData           = serialize($ta_array_data[$iTables]);
			// селектор к какому обращаться при событиях кнопок
			$selectorBody     = '.datatable' . $aoTable . ' tr.dtSelect';
			
			foreach($arrayTable as $k => $v) {
			 
				///обработка типов
				if ($v['tip'] == 'sort') {
					
					// собираем названия столбцов
					$aoColumns .= '{ "sTitle": "Сортировка"},';
					$columsTable[] = $k;
					$aoFilters .= 'null,';
					$tableFooter .= '<th></th>';
					$sortDefault = $k;
					if(empty($v['sort']))
						$v['sort'] = 'desc';
					$countColum	= $i . ', "' . $v['sort'] . '"';
				}
				elseif ($v['r'] == 1 || $v['tip'] == 'id') {
					
					$v['name'] = addslashes($v['name']);
					
					// собираем названия столбцов
					$aoColumns .= '{ "sTitle": "' . $v['name'] . '"},';
					$columsTable[] = $k;
					$aoFilters .= '{ type: "text" },';
					$tableFooter .= '<th>Поиск по ' . $v['name'] . '</th>';
					$i++;
				}
			}
			if(empty($countColum))
				$countColum	= '0, "desc"';
				
			if($buttonMain['edit'] == true || $buttonMain['delete'] == true) {
				$aoColumns .= '{ "sTitle": "Управление"}';//,{ "sTitle": "delete"}';
				$tableFooter .= '<th></th>';//<th></th>';
				$aoFilters .= ' null';//, null,';
			}
			$columsTable = serialize($columsTable);
			$tabTable .= '<li><a href="#tabs-' . $iTables . '">' . $ta_array_settings['titleTables'][$iTables] . '</a></li>';
			$ret .= '<div id="tabs-' . $iTables . '" >' . showtempl(dirname(__FILE__) . '/templ/c_two_tabl.php') . '</div>';
			$iTables++;
        }
		// подключение js, html, которые должны подключится один раз
		$ret .= showtempl(dirname(__FILE__) . '/templ/js_html_more.php');
		$ret = '<div class="flat_area grid_16">
					<h2>Tortoise <small> - ' . $treeTitle . '</small></h2>
				</div>
					
				<div class="box grid_16 tabs">
					<ul id="touch_sort" class="tab_header clearfix">
						' . $tabTable . '
					</ul>
					<div class="controls">
						<a href="#" class="toggle"></a>
					</div>
					<div class="toggle_container">' . $ret . '</div></div>';
        return $ret;
    }
	
	
////////////////////////////////////////////////////////////////////////////
//$ta_array_settings - масив с настройками
//$ta_array_data - масив с типами полей

    function tree_table_admin($ta_array_settings, $ta_array_data) {
	
		global $tableProd;
		$htmlCenterTable = '';
		$htmlCenterTree = '';
	
		$_SESSION['settingsModul'] = array_merge($ta_array_settings, array('catTabl' => 1));
		foreach($ta_array_data as $k=>$v) {
			$s = array(
					'table' 	=> $ta_array_settings['table'][$k],
					'title' 	=> $ta_array_settings['titleTables'][$k],
					'button'	=> $ta_array_settings['button'][$k],
					'where' 	=> $ta_array_settings['where'][$k],
					'catTabl'	=> 1); 
			if($k == 1) {
				$htmlCenterTable = tab_admin_one_table($s, $v);
				$tableProd = $ta_array_settings['table'][$k]; 
			}
			else
				$htmlCenterTree = createCatalogTree($s, $v);
		}
		return '<div class="flat_area grid_16">
					<h2>Tortoise <small> - ' . $ta_array_settings['title'] . '</small></h2>
				</div>
				<div class="box grid_3 jug-accordion" style="min-height: 100px;max-height:800px; overflow:auto;">
					<ul class="firstListJug">
						<li class="viewMe activeTree" info="">
							<h3 class="bar catalogTree">Показать все</h3>
						</li>
						' . $htmlCenterTree . '
					</ul>
				</div>
				<div class="box grid_13">
					' . $htmlCenterTable . showtempl(dirname(__FILE__) . '/templ/js_for_tee_tab.php') . '
				</div>';
	}
////////////////////////////////////////////////////////////////////////////
// вывод дерева
//$tree_array_settings 	- масив с настройками
//$tree_array_data 		- масив с типами полей
	
	function tree_admin_red($tree_array_settings, $tree_array_data) {
	
        global $treeTitle,$aoTable,$treeData,$jsData,$selectorBody,$buttonMain,$tr_array_settings;

		$aoTable        	= $tree_array_settings['table'];										//таблица
		$buttonMain     	= $tree_array_settings['button'];											//кнопки
		$tr_array_settings  = serialize($tree_array_settings);												//кнопки
		$jsData         	= serialize($tree_array_data);							// масив с типами полей для ajax
		
		$treeData 		= tree_db_edit($tree_array_settings, $tree_array_data);	// сформированные данные			
		
		// селектор к какому обращаться при событиях кнопок
		$selectorBody     = 'div#nest_1 input[type="checkbox"]:checked';
		
        $tree_body = showtempl(dirname(__FILE__) . '/templ/c_tree_edit.php');
        
		if(empty($tree_array_settings['catTabl']))
			$TITLE = '<div class = "flat_area grid_16">
					<h2>
						Tortoise <small> - ' . $tree_array_settings['title'] . '</small>       
					</h2>
				</div>';
        return $TITLE . $tree_body; 
    } 
	
    function tree_db_edit($tableSettings, $tree_array_data)
    {
        global $dantree, $db;
		
        $dantree = $where = "";
		if(!empty($tableSettings['where']))
			$where = ' WHERE 1 ' . $tableSettings['where'];
		if(!empty($tree_array_data['sort']['tip']))
			$orderSQL = ' ORDER BY `' . $tree_array_data['sort']['tip'] . '` ASC ';
        $dantree = $db->select_id('	SELECT * 
									FROM ' . DB_PREFIX . $tableSettings['table'] 
									. $where 
									. $orderSQL);	

        // Указываем главные родительские разделы в массив под индексом 0
        foreach ($dantree as $k => $v) {
			if($v['pid'] != '')
				$dantree[$v['pid']]['cild'][] = $v['id'];
        }
	
        $tree = vievtree_edit(0, $tree_array_data);
        return $tree;
    }
	
	function vievtree_edit($a, $tree_array_data) {
        global $dantree, $db;
        $fol = '';
		$ret = '';
		
        $ret .= '<ol class="dd-list">';
        if ($dantree[$a]['cild'])
            foreach ($dantree[$a]['cild'] as $v) {
					
                // выводим сопутствующие поля к дереву  
                $sop = '<strong  style="float: right;width:50px;">'; 
             
				// формируем сопутствующую инфу
                $ddd = $dantree[$v];
                foreach ($ddd as $k => $v1) {
                    if ($tree_array_data[$k]['r'] == 1) {
					
                        $alt = ' title="' . $tree_array_data[$k]['name'] . '"';
                        $ss = '';
						
						// для логического переменных
                        if ($tree_array_data[$k]['tip'] == 'bool') {
                            if ($v1 == 1)
                                $ss = '<img src="images/icons/small/grey/preview.png" ' . $alt . ' style="float:left;" />';
                            else 
								$ss = '<img src="images/icons/small/grey/acces_denied_sign.png" ' . $alt . ' style="float:left;" />';
                        }

                        $sop .= $ss;
                    }
                }

                $sop .= '</strong>';
				
				// строим дерево
                if ($dantree[$v]['cild']) {
                    $fol = ' dd-collapsed';
						
                    $ret .= '<li class="dd-item dd3-item '.$fol.'" data-id="'.$v.'">
								<div class="dd-handle dd3-handle">Drag</div>
								<div class="dd3-content">
									<div class="uniform inline clearfix">
										<label for="id_field_' . $dantree[$v]['id'] . '"><input type="checkbox" name="answer4b" id="id_field_' . $dantree[$v]['id'] . '" />' . $dantree[$v]['name'] . '</label>
										'.$sop.'
									</div>
								</div>
								' . vievtree_edit($dantree[$v]['id'], $tree_array_data) . '
							</li>';
                }
                else{
					$ret .= '<li class="dd-item dd3-item" data-id="'.$v.'">
								<div class="dd-handle dd3-handle">Drag</div>
								<div class="dd3-content">
									<div class="uniform inline clearfix">
										<label for="id_field_' . $dantree[$v]['id'] . '"><input type="checkbox" name="answer4b" id="id_field_' . $dantree[$v]['id'] . '"/>' . $dantree[$v]['name'] . '</label>
										'.$sop.'
									</div>
								</div>
								
							</li>';
				}
            }

        $ret .= '</ol>';
        return $ret;
    }

////////////////////////////////////////////////////////////////////////////
// рекурсивная функция для вывода дерева для меню админки
//$a			- уровень вложенности

    function vievtree_top($a)
    {
        $ret = '';
        $active = '';
        global $dantree;
        $fol = '';
        if ($a != 0)
            $fol = 'class="drawer"';

		if(isset($dantree[$a]['cild'])) {
			foreach ($dantree[$a]['cild'] as $v) {
				$dost_in = explode(',', $dantree[$v]['access']);
				if (in_array($_SESSION['adminInfo']['tip'], $dost_in))
					if (isset($dantree[$v]['cild'])) {
						if ($_SERVER['REQUEST_URI'] == $dantree[$v]['url'])
							$active = 'class="current"';
						else
							$active = '';
						if(!empty($dantree[$v]['logo']))
							$logo = '<img src = "images/icons/small/grey/' . $dantree[$v]['logo'] . '" />';
						else
							$logo = '';
						$ret .= '<li ' . $active . '><a href="javascript:void(0);">' . $logo . '
								<span>' . $dantree[$v]['name'] . '<span></a><ul ' . $fol . '>' . vievtree_top($dantree[$v]['id']) . '</ul></li>';
					}
					else {
						if(!empty($dantree[$v]['logo']))
							$logo = '<img src = "images/icons/small/grey/' . $dantree[$v]['logo'] . '" />';
						else
							$logo = '';
						$ret .= '<li ' . $active . '><a class = "pjax" href = "' . $dantree[$v]['url'] . '">' . $logo . '<span>' . $dantree[$v]['name'] . '</span></a></li>';
					}
			}
		}
        return $ret;
    }
	// создание дерева для каталога
    function createCatalogTree($tableSettings, $tree_array_data) {
        global $createCatalogTree, $db, $countCatalogTree;
		
        $createCatalogTree 	= '';
		$where 				= '';
		if(!empty($tableSettings['where']))
			$where = ' WHERE 1 ' . $tableSettings['where'];
        $createCatalogTree = $db->select_id('
									SELECT  `id`, `pid`, `name`
									FROM ' . DB_PREFIX . $tableSettings['table'] 
									. $where . ' 
									ORDER BY `' . $tree_array_data['sort']['tip'] . '` ASC');	

        // Указываем главные родительские разделы в массив под индексом 0
        foreach ($createCatalogTree as $k => $v) {
			if($v['pid'] != '')
				$createCatalogTree[$v['pid']]['cild'][] = $v['id'];
        }
        $tree = catalogTreeEdit(); 
		unset($createCatalogTree);
        return $tree;
    }
	
    function catalogTreeEdit($a = 0) {
	
        global $createCatalogTree;
        $ret  = '';
	if(isset($createCatalogTree[$a]['cild'])) {
		foreach ($createCatalogTree[$a]['cild'] as $v) {
			if (isset($createCatalogTree[$v]['cild'])) {
				$ret .= '<li class="viewMe" info="' . $createCatalogTree[$v]['id'] . '">
						<h3 class="bar catalogTree">' . $createCatalogTree[$v]['name'] . '</h3>
					</li>
					<div class="box grid_3  jug-accordion" style="width: 90%;padding: 5px 10px;">
						<ul>
							' . catalogTreeEdit($createCatalogTree[$v]['id']) . '
						</ul>
					</div>';
			}
			else
				$ret .= '<li class="viewMe" info="' . $createCatalogTree[$v]['id'] . '">
							<h3 class="bar catalogTree">' . $createCatalogTree[$v]['name'] . '</h3>
						</li>';
		}
	}
        return $ret;
    }
	////////////////////////////////////////////////////////////

    /**
     * function для выбора значения из синонимов
     * @param $word - макрос с подставленными значениями
     * @return string
     */
    function pars_macros($word)
    {
        $hooks = $j = 0;
        $wo = $old = $double = '';
        for ($i = 0; $i < 1000; $i++) {
            if ($word[$i] == '{') {
                $hooks++;
                if ($old == '_') {
                    $j++;
                }
            }
            if ($word[$i] == '}') {
                $hooks--;
                $q = 1;
                if ($old == '_') {
                    $j++;
                }
            }
            if ($hooks == 0 && $q == 0) {
                if ($old == '{}') {
                    $j++;
                }
                $wo[$j] .= $word[$i];
                $old = '_';
            }
            if ($hooks > 0 || $q == 1) {
                $wo[$j] .= $word[$i];
                $old = '{}';
                $q = 0;
            }
            if ($hooks == 2) {
                $double[] = $j;
            }
        }
        $word = rand_macros($wo, $j, $double);
        return $word;
    }

    /**
     * function служит только для pars_macros
     * @param $wo - текст
     * @param $j - кол-во скобок
     * @param $doub - кол-во двойных скобок
     * @return string
     */
    function rand_macros($wo, $j, $doub)
    {
        for ($h = 0; $h < $j; $h++) {
            foreach ($doub as $d => $v) {
                if ($v == $h) {
                    $d = explode("|", $wo[$h]);
                    foreach ($d as $kk => $vv) {
                        $counto = substr_count($vv, '{');
                        $countc = substr_count($vv, '}');
                        if ($counto > 0 && $countc > 0) {
                            $ili = substr_count($vv, '|') + 1;
                            $vv = rand_macros($vv, $ili, '');
                        }
                    }
                }
            }
            $wo[$h] = str_replace("{", "", $wo[$h]);
            $wo[$h] = str_replace("}", "", $wo[$h]);
            $w = explode("|", $wo[$h]);
            if ($w[1])
                $wo[$h] = $w[rand(0, count($w) - 1)];
        }
        $word = implode("", $wo);
        return $word;
    }