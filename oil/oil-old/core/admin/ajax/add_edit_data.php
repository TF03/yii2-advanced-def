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

// id - редактируемой записи
$id = (int)$_POST['idItem'];
// название таблицы
$tabl = $_POST['dbTable'];
// массив данных
$data = unserialize($_POST['arrayData']);
$group = array();
$ulHtml = $inputHtml = '';
$ulI = 0;

// типы для вида поля
$arrayTip = array(
    'input_text' => array(
        'int' => 'validate[required,custom[integer]$unique] text-input',
        'float' => 'validate[required,custom[number]$unique] text-input',
        'onlytext' => 'validate[required,custom[onlyLetterSp]$unique] text-input',
        'text' => 'validate[required$unique] text-input',
        'url' => 'validate[required,custom[url]$unique] text-input',
        'phone' => 'validate[required,custom[phone]$unique] text-input',
        'email' => 'validate[required,custom[email]$unique] text-input'
    ),
    'datetime' => 'validate[required] text-input'
);

$inputChecked = array(
    '1' => 'checked="checked"',
    '0' => ''
);
// получаем с бд все данные
$dataDB = $db->one_array('	SELECT *
								FROM ' . DB_PREFIX . $tabl . ' 
								WHERE id = "' . $id . '"
								LIMIT 1');

/// собираем группы
// если не выбрана группа создается группа Основные;
foreach ($data as $k => $v) {
    if (!isset($v['group']))
        $group['Основные'] = 1;
    else
        $group[$v['group']] = 1;
}

if (!empty($group)) {
    foreach ($group as $key => $value) {

        $ulHtml .= '<li><a href="#tabs-' . ++$ulI . '">' . $key . '</a></li>';
        $inputHtml .= '<div id="tabs-' . $ulI . '">
								<div class="section">';

        foreach ($data as $k => $v) {
            if (!empty($v['name']))
                $name = $v['name'];
            else
                $name = $k;

            $val = '';
            $required = '';
            $valid = '';
            $unique = '';
            $disabled = '';

            if (empty($v['group']))
                $v['group'] = 'Основные';

            if ($key == $v['group']) {

                // для вывода спец символов
                $dataDB[$k] = htmlspecialchars($dataDB[$k]);
                if (!empty($v['tip']) && $v['w'] == 1) {

                    // проверка доступно ли поле для редактирования
                    if ($v['disabled'] == true || $_SESSION['settingsModul']['disabled'][$tabl] == true)
                        $disabled = ' disabled="disabled"';

                    if (array_key_exists($v['tip'], $arrayTip['input_text'])) {
                        // проверка на обязательное поле
                        if ($v['ob'] == 1)
                            $valid = $arrayTip['input_text'][$v['tip']];

                        // проверка на уникальное поле
                        if ($v['unique'] == true) {
                            if (empty($valid))
                                $unique = 'validate[required,funcCall[ajaxUniqueField]] text-input';
                            else
                                $unique = ',funcCall[ajaxUniqueField]';
                        }
                        eval("\$valid = \"$valid\";");

                        $val = '<input type="text" ' . $disabled . ' class="' . $valid . ' text" name="' . $k . '" value="' . $dataDB[$k] . '" />';
                    } elseif ($v['tip'] == 'bool')
                        $val = '<input type="checkbox" ' . $disabled . ' name="' . $k . '" ' . $inputChecked[$dataDB[$k]] . ' >';

                    elseif ($v['tip'] == 'data') {
                        $val = '<input type="text" ' . $disabled . ' name="' . $k . '" class="datepicker validate[required,custom[date]] text-input" value="' . $dataDB[$k] . '">';
                        $val .= '<script type="text/javascript">
										$( ".datepicker" ).datepicker({
											"setDate": "' . $dataDB[$k] . '",
											"dateFormat": "yy-mm-dd",
											"showOn":"focus"
										});
									</script>';
                    } elseif ($v['tip'] == 'datetime') {
                        if ($v['ob'] == 1)
                            $valid = $arrayTip[$v['tip']];

                        $val = '<input type="text" ' . $disabled . ' name="' . $k . '" class="datepicker_time ' . $valid . ' text" value="' . $dataDB[$k] . '">';
                        $val .= '
                                <script type="text/javascript">
                                    $( ".datepicker_time" ).datetimepicker({
                                        "setDate": "' . $dataDB[$k] . '",
                                        "dateFormat": "yy-mm-dd",
                                        "timeFormat": "H:mm:ss",
                                        "showOn":"focus"
                                    });
                                </script>';
                    } elseif ($v['tip'] == 'date_xml') {
                        $val = '<input ' . $disabled . ' type="text" name="' . $k . '" value="' . date('Y-m-d\TH:i:s' . '+04:00') . '" />';
                    } elseif ($v['tip'] == 'ftext' || $v['tip'] == 'textcode')
                        $val = '<textarea class="textarea" ' . $disabled . ' name="' . $k . '" >' . $dataDB[$k] . '</textarea>';

                    elseif ($v['tip'] == 'btext')
                        $val = '<textarea class="tiny" ' . $disabled . ' name="' . $k . '" >' . $dataDB[$k] . '</textarea>';

                    elseif ($v['tip'] == 'listDir') {
                        $arrayTemp = preg_split('/[$\d]/', $v['path'], 0, PREG_SPLIT_NO_EMPTY);
                        //$arrayTemp = preg_split('/[$\d]/', $v['path']);
                        $arrayList = array();
                        $arrayList1 = array();
                        $iAL = 0;

                        function listDir($df = 'dir')
                        {
                            global $dieGlob, $arrayTemp, $iAL, $arrayList, $arrayList1;

                            $skip = array('.', '..');

                            if (count($dieGlob) == 0) {
                                foreach ($arrayTemp as $aTk => $aTv) {
                                    if (!empty($arrayTemp[$aTk + 1]))
                                        $tempT = 'dir';
                                    else
                                        $tempT = 'file';
                                    $dieGlob[] = $aTv;
                                    listDir($tempT);
                                    $iAL++;
                                }
                            } else {
                                if (count($dieGlob) == 1) {
                                    $dirList = scandir(SITE_PATH . $dieGlob[0]);
                                    foreach ($dirList as $dLk => $dLv) {
                                        if (!in_array($dLv, $skip)) {
                                            if ($df == 'file') {
                                                if (preg_match('/\.(php)/', $dLv)) {
                                                    $dLv = str_replace('.php', '', $dLv);
                                                    $arrayList[$dLv]['$' . $iAL][] = $dLv;
                                                    $arrayList1['$' . $iAL][] = $dLv;
                                                }
                                            } elseif ($df == 'dir') {
                                                if (!preg_match('/\.(php)/', $dLv)) {
                                                    $arrayList[$dLv]['$' . $iAL][] = $dLv;
                                                    $arrayList1['$' . $iAL][] = $dLv;
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    foreach ($arrayList1['$' . ($iAL - 1)] as $dV) {
                                        $dirList = scandir(SITE_PATH . $dieGlob[0] . $dV . $arrayTemp[$iAL]);
                                        foreach ($dirList as $dLk => $dLv) {
                                            if (!in_array($dLv, $skip)) {
                                                if ($df == 'file') {
                                                    if (preg_match('/\.(php)/', $dLv)) {
                                                        $dLv = str_replace('.php', '', $dLv);
                                                        $arrayList[$dV]['$' . $iAL][] = $dLv;
                                                        $arrayList1['$' . $iAL][] = $dLv;
                                                    }
                                                } elseif ($df == 'dir') {
                                                    if (!preg_match('/\.(php)/', $dLv)) {
                                                        $arrayList[$dV]['$' . $iAL][] = $dLv;
                                                        $arrayList1['$' . $iAL][] = $dLv;
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }

                        listDir();
                        unset($arrayList1);
                        $option = array();
                        foreach ($arrayList as $aLk => $aLv) {
                            $countList = count($aLv);
                            $select = $v['template'];
                            for ($i = 0; $i < $countList; $i++) {
                                if (($countList - 1) == $i) {
                                    if (count($aLv['$' . $i][0]) > 1) {
                                        for ($j = 0; $j < count($aLv['$' . $i][0]); $j++) {
                                            $selectj = str_replace('$' . $i, $aLv['$' . $i][0], $select);
                                            if (!empty($selectj)) {
                                                if ($selectj == $dataDB[$k])
                                                    $selected = ' selected="selected" ';
                                                else
                                                    $selected = '';
                                                $option[] = '<option ' . $selected . ' value="' . $selectj . '">' . $selectj . '</option>';
                                            }
                                        }
                                    } else {
                                        $select = str_replace('$' . $i, $aLv['$' . $i][0], $select);
                                        if (!empty($select)) {
                                            if ($select == $dataDB[$k])
                                                $selected = ' selected="selected" ';
                                            else
                                                $selected = '';
                                            $option[] = '<option ' . $selected . ' value="' . $select . '">' . $select . '</option>';
                                        }
                                    }
                                } else
                                    $select = str_replace('$' . $i, $aLv['$' . $i][0], $select);
                            }
                        }
                        $val = '<select ' . $disabled . ' class="full_width" name="' . $k . '">' . implode('', $option) . '</select>';
                    } elseif ($v['tip'] == 'lookHTML')
                        $val = '<span>
										<table cellpadding="2" cellspacing="0" border="0" class="t" width="100%">
											<tr align="center">
												<td>Товары</td>
												<td>Количество</td>
												<td>Цена</td>
												<td>Всего</td>
											</tr>'
                            . htmlspecialchars_decode($dataDB[$k]) . '
									</span>';

                    elseif ($v['tip'] == 'logoImages') {

                        if (!empty($v['dir'])) {
                            $dir = SITE_PATH . 'admin/' . $v['dir'];
                            if (is_dir($dir)) {
                                if ($dh = opendir($dir)) {
                                    while (($file = readdir($dh)) !== false) {
                                        $select = '';
                                        if ($file != '.' && $file != '..' && $file != '.DS_Store') {
                                            if ($file == $dataDB[$k]) {
                                                $select = 'selected="selected" data-skip="1"';
                                                $selected = 'selected="selected"';
                                            }
                                            $f = explode('.', $file);
                                            $val .= '<option ' . $select . 'value="' . $file . '" data-icon="' . $v['dir'] . '/' . $file . '" data-html-text="' . $f[0] . '">' . $f[0] . '</option>';
                                        }
                                    }
                                    closedir($dh);
                                }
                            }
                        }
                        if (empty($selected))
                            $selected = '<option value="0" selected="selected" data-skip="1" data-html-text="Выбери картинку">Выбери картинку</option>';
                        else
                            $selected = '';
                        $val = '<select ' . $disabled . ' class="full_width ' . $v['tip'] . '" name="' . $k . '">
									' . $selected . $val . '</select>';
                        $val .= '<script type="text/javascript">
										// The select element to be replaced:
										var select = $(\'select.' . $v['tip'] . '\');

										var selectBoxContainer = $(\'<div>\',{
											width		: select.outerWidth(),
											class	: \'tzSelect\',
											html		: \'<div class="selectBox"></div>\'
										});

										var dropDown = $(\'<ul>\',{class:\'dropDown\'});
										var selectBox = selectBoxContainer.find(\'.selectBox\');
										
										// Looping though the options of the original select element
										
										select.find(\'option\').each(function(i){
											var option = $(this);
											if(option.val()==select.val()){
												if(option.data(\'icon\'))
													selectBox.html(\'<img src="\'+option.data(\'icon\')+\'" width="30" /><span>\'+
															option.data(\'html-text\')+\'</span>\');
												else
													selectBox.html(\'<span>\'+
															option.data(\'html-text\')+\'</span>\');
											}
											
											// As of jQuery 1.4.3 we can access HTML5 
											// data attributes with the data() method.
											
											if(option.data(\'skip\')){
												return true;
											}
											
											// Creating a dropdown item according to the
											// data-icon and data-html-text HTML5 attributes:
											
											var li = $(\'<li>\',{
												html:	\'<img src="\'+option.data(\'icon\')+\'"  width="36" /><span>\'+
														option.data(\'html-text\')+\'</span>\'
											});
											li.click(function(){
												
												selectBox.html(\'<img src="\'+option.data(\'icon\')+\'"  width="30" /><span>\'+
														option.data(\'html-text\')+\'</span>\');
												dropDown.trigger(\'hide\');
												
												// When a click occurs, we are also reflecting
												// the change on the original select element:
												select.val(option.val());
												
												return false;
											});
											
											dropDown.append(li);
										});
										
										selectBoxContainer.append(dropDown.hide());
										select.hide().after(selectBoxContainer);
										
										// Binding custom show and hide events on the dropDown:
										
										dropDown.bind(\'show\',function(){
											
											if(dropDown.is(\':animated\')){
												return false;
											}
											
											selectBox.addClass(\'expanded\');
											dropDown.slideDown();
											
										}).bind(\'hide\',function(){
											
											if(dropDown.is(\':animated\')){
												return false;
											}
											
											selectBox.removeClass(\'expanded\');
											dropDown.slideUp();
											
										}).bind(\'toggle\',function(){
											if(selectBox.hasClass(\'expanded\')){
												dropDown.trigger(\'hide\');
											}
											else dropDown.trigger(\'show\');
										});
										
										selectBox.click(function(){
											dropDown.trigger(\'toggle\');
											return false;
										});

										// If we click anywhere on the page, while the
										// dropdown is shown, it is going to be hidden:
										
										$(document).click(function(){
											dropDown.trigger(\'hide\');
										});
									</script>';
                    } elseif ($v['tip'] == 'select_other_table') {
                        if (!empty($v['other_table'])) {
                            // проверка какое поле сохранять (ключ)
                            if (empty($v['value_save']))
                                $v['value_save'] = 'id';
                            // проверка на наличие дополнительного where к select
                            if (!empty($v['whereSelect']))
                                $whereSelect = ' WHERE ' . $v['whereSelect'];
                            else
                                $whereSelect = '';

                            $other_table = $db->select('
													SELECT *
													FROM ' . DB_PREFIX . $v['other_table']
                                . ' ' . $whereSelect);
                            if ($k == 'pid' && !empty($_POST['whereViewMe']))
                                $selecId = $_POST['whereViewMe'];
                            else
                                $selecId = '!!?#?!!';

                            if (!empty($other_table)) {
                                $j = 0;
                                foreach ($other_table as $ot_k => $ot_v) {
                                    $select = '';
                                    if (!empty($ot_v[$v['value_save']]) &&
                                        ($ot_v[$v['value_save']] == $dataDB[$k] || $ot_v[$v['value_save']] == $selecId)
                                    ) {
                                        $select = 'selected="selected"';
                                        $j = 1;
                                    }
                                    $val .= '<option ' . $select . ' value="' . $ot_v[$v['value_save']] . '">' . $ot_v[$v['value_option']] . '</option>';
                                }
                                if ($j == 0)
                                    $val = '<option selected="selected" value="0" disabled="disabled">Сделайте выбор!</option>' . $val;
                            }
                            $val = '<select ' . $disabled . ' class="full_width" name="' . $k . '">' . $val . '</select>';
                        }
                    } elseif ($v['tip'] == 'multiselect_other_table') {
                        if (!empty($v['other_table'])) {
                            // проверка какое поле сохранять (ключ)
                            if (empty($v['value_save']))
                                $v['value_save'] = 'id';
                            // проверка на наличие дополнительного where к select
                            if (!empty($v['whereSelect']))
                                $whereSelect = ' WHERE ' . $v['whereSelect'];
                            else
                                $whereSelect = '';

                            $other_table = $db->select('
													SELECT *
													FROM ' . DB_PREFIX . $v['other_table']
                                . $whereSelect);

                            $array_dataDB_k = explode(',', $dataDB[$k]);

                            if (!empty($other_table)) {
                                foreach ($other_table as $ot_k => $ot_v) {
                                    $select = '';
                                    if (in_array($ot_v[$v['value_save']], $array_dataDB_k))
                                        $select = 'selected="selected"';
                                    $val .= '<option ' . $select . ' value="' . $ot_v[$v['value_save']] . '">' . $ot_v[$v['value_option']] . '</option>';
                                }
                            }
                            $val = '<select class="multisorter indent" id="multi' . $k . '" multiple="multiple" name="' . $k . '[]">' . $val . '</select>';
                            $val .= '<script type="text/javascript">
											$(".multisorter#multi' . $k . '").multiselect({height: "175",multiple: true});
										</script>';
                        }
                    } elseif ($v['tip'] == 'multiselect_other_table_with_select') {
                        if (!empty($v['other_table'])) {
                            // проверка какое поле сохранять (ключ)
                            if (empty($v['value_save']))
                                $v['value_save'] = 'id';

                            $mst_html = '';
                            // получаем select главный (категории)
                            if (!empty($v['main_select_table'])) {
                                // проверка на наличие дополнительного where к главному select
                                if (!empty($v['where_main_select_table']))
                                    $where_main_select_table = ' WHERE ' . $v['where_main_select_table'];
                                else
                                    $where_main_select_table = '';
                                $main_select_table = $db->select_id('
														SELECT `id`, `name`
														FROM ' . DB_PREFIX . $v['main_select_table']
                                    . $where_main_select_table . '
														ORDER BY `name` ASC');
                                $j = 0;
                                foreach ($main_select_table as $k_mst => $v_mst) {
                                    if ($j == 0) {
                                        $firstID = list_cat_id($v_mst['id'], $v['main_select_table']);
                                        $mst_html .= '<option selected="selected" value="' . $v_mst['id'] . '">' . $v_mst['name'] . '</option>';
                                        $j++;
                                    } else
                                        $mst_html .= '<option value="' . $v_mst['id'] . '">' . $v_mst['name'] . '</option>';
                                }
                                $mst_html = ',selectTable: "<select class=\"MultiSelelectTable\" id=\"MultiSelelectTable___' . $k . '\">' . addslashes($mst_html) . '</select>"';
                            }
                            // доволнение к where выбранные эжлементы выбираем
                            if (!empty($dataDB[$k]))
                                $selectedIDs = ' OR `id` in (' . $dataDB[$k] . ')';
                            else
                                $selectedIDs = '';
                            // проверка на наличие дополнительного where к select
                            if (!empty($v['whereSelect']))
                                $whereSelect = ' WHERE (' . $v['whereSelect'] . ' AND `pid` in (' . $firstID . ')) ' . $selectedIDs;
                            else
                                $whereSelect = ' WHERE (`pid` in (' . $firstID . ')) ' . $selectedIDs;
                            $other_table = $db->select('
													SELECT `' . $v['value_save'] . '`, `' . $v['value_option'] . '`
													FROM ' . DB_PREFIX . $v['other_table']
                                . $whereSelect);
                            $array_dataDB_k = explode(',', $dataDB[$k]);

                            if (!empty($other_table)) {
                                foreach ($other_table as $ot_k => $ot_v) {
                                    $select = '';
                                    if (in_array($ot_v[$v['value_save']], $array_dataDB_k))
                                        $select = 'selected="selected"';
                                    $val .= '<option ' . $select . ' value="' . $ot_v[$v['value_save']] . '">' . $ot_v[$v['value_option']] . '</option>';
                                }
                            }
                            $val = '<input type="text" name="search_field_catalog_multi" style="float: left;">
					  <button class="light text_only has_text search_sel_cat" info="' . $k . '" style="height: 24px;padding: 0;width: 60px;margin-left: 10px;">
						<span>Поиск</span>
					</button><br><br><br><br>
					<div class="multi' . $k . '">
						<select class="multisorter indent" id="multi' . $k . '" multiple="multiple" name="' . $k . '[]">' . $val . '</select>
					</div>';
                            $val .= '<script type="text/javascript">
						$(".multisorter#multi' . $k . '").multiselect({height: "175",multiple: true' . $mst_html . '});
					</script>';
                            $arrayMulSel .= $k . ' : {
							dataMultiselSelTable:"' . addslashes(serialize($v)) . '",
							multiselSelTable:"' . $k . '"},';
                        }
                    } elseif ($v['tip'] == 'color') {
                        $val = '<div id="colorpicker_inline_' . $k . '"></div>';
                        $val .= '<script type="text/javascript">
										$("#colorpicker_inline_' . $k . '").ColorPicker({
									        color: "#' . $dataDB[$k] . '",
                                            flat: true
                                        });
									    $("form[name=form_' . $tabl . '] .colorpicker_hex input").attr("name", "' . $k . '");
									</script>';
                    } elseif ($v['tip'] == 'file') {
                        $val = '<div class="clearfix">
										<input type="file" id="fileupload" class="uniform" name="' . $k . '">
									</div>
									<script>$("input#fileupload").uniform();</script>';
                        if (!empty($v['type_file']))
                            $name .= ' (' . $v['type_file'] . ')';
                        if (!empty($dataDB[$k]))
                            $val = '<br><img src="./images/icons/small/white/file_cabinet.png" style="background-color: green;" width="30px"/>' .
                                $dataDB[$k] . '<br> ' . $val;
                    } elseif ($v['tip'] == 'img') {
                        $val = '<input type="file" name="' . $k . '" />';
                        if (!empty($v['width']))
                            $name .= ' W=' . $v['width'];
                        if (!empty($v['height']))
                            $name .= ' H=' . $v['height'];
                        if (!empty($dataDB[$k]))
                            $val = '<br><img src="../uploaded/img' . $v['path'] . $id . '/' . $dataDB[$k] . '" style="background-color: green;" width="30px"/>' .
                                $dataDB[$k] . '<br> ' . $val;
                        else
                            $val = '<br><img src="./images/icons/small/white/image_2.png" style="background-color: green;" width="30px"/>' .
                                $dataDB[$k] . '<br> ' . $val;
                    } //TODO: KAA multi images
                    elseif ($v['tip'] == 'img_m') {
                        $temp_list = '';

                        // form for download images
                        $val = '<input multiple="true" type="file" name="' . $k . '[]" />';

                        if (!empty($v['width']))
                            $name .= ' W=' . $v['width'];
                        if (!empty($v['height']))
                            $name .= ' H=' . $v['height'];

                        if (!empty($dataDB[$k])) {

                            $mas_img = $db->select('
                                    SELECT `id`,`' . $v['value_option'] . '`,`alt_image`,`title_image`
                                    FROM ' . DB_PREFIX . $v['other_table'] . '
                                    WHERE `id` in (' . $dataDB[$k] . ') 
                                    ORDER BY `sort` DESC
                                ');

                            foreach ($mas_img as $otk => $otv) {
                                if ($otv['img'] && is_file(SITE_PATH . 'uploaded/img/' . $v['path'] . $id . '/' . $otv[$v['value_option']])) {
                                    $temp_img = '<img alt="" src="../uploaded/img/' . $v['path'] . $id . '/' . $otv[$v['value_option']] . '" />';
                                } else {
                                    $temp_img = '';
                                }

                                $temp_list[] = '
										<li id="item-' . $otv['id'] . '">
                                            <a href="#" class="handle" title="Переместить"></a>
                                            <a href="javascript:void(0);" class="i_del" title="Удалить" id="img_del_' . $otv['id'] . '"></a>
                                            <h3 class="bar">
                                                ' . $temp_img . '
                                                <div> ' . $otv[$v['value_option']] . '</div>
                                            </h3>
                                            <div class="content">
                                                <div class="img_m">
                                                    alt для картинки:&nbsp;&nbsp;&nbsp;<input type="text" name="alt_image_' . $k . '[' . $otv['id'] . ']" value="' . $otv['alt_image'] . '" class="text" />
                                                </div>
                                                <div class="img_m">
                                                    title для картинки:&nbsp;<input type="text" name="title_image_' . $k . '[' . $otv['id'] . ']" value="' . $otv['title_image'] . '" class="text" />
                                                </div>
                                            </div>
										</li>';
                            }

                            $val = '<ul id="img_list_' . $k . '" class="accordion_img block content_accordion">
                                             ' . implode("", $temp_list) . '
                                        </ul>
                                        <input type="hidden" name="img_list_sort_' . $k . '" value="">
                                        ' . $val;
                        }

                    } //TODO: Jugene new type special for set here (смотреть тут!)
                    elseif ($v['tip'] == 'special_for_set') {
                        $all_price_ru = 0;
                        $all_price_ua = 0;
                        $all_price_tenge = 0;
                        $all_price_bel = 0;
                        $pvp = array();

                        $val = '<div><fieldset class="fieldsetSetPrice"><table id="tab_' . $k . $v['tabl'] . $v['td'] . '">';

                        if (isset($v['tabl'])) {
                            $pvp = $db->select_id("
												SELECT `id`, `name`
												FROM " . DB_PREFIX . $v['tabl'] . ' 
												ORDER by `sort`');

                            $pv = $db->select("
												SELECT `pid`, `price_ua`, `price_ru`, `price_tenge`, `price_bel`
												FROM " . DB_PREFIX . $v['tabl'] . '_product 
												WHERE `pid_product`="' . $id . '"');
                        }
                        $selt = '';
                        if (isset($pv)) {
                            foreach ($pv as $kt => $vt) {
                                if (!empty($vt))
                                    $val .= "<tr id='tr_" . $k . $v['tabl'] . $v['td'] . $kt . "' num=" . $vt['pid'] . ">
                                        <td>" . $pvp[$vt['pid']]['name'] . "</td>
                                        <td>price_ua <input name='price_ua_" . $vt['pid'] . "' value='" . $vt['price_ua'] . "'></td>
                                        <td>price_ru <input name='price_ru_" . $vt['pid'] . "' value='" . $vt['price_ru'] . "'></td>
                                        <td>price_kz <input name='price_kz_" . $vt['pid'] . "' value='" . $vt['price_tenge'] . "'></td>
                                        <td>price_bel <input name='price_bel_" . $vt['pid'] . "' value='" . $vt['price_bel'] . "'></td>
                                        <td onclick=\"del_price_set(" . $kt . ",'" . $k . $v['tabl'] . $v['td'] . "')\">
                                            <a href='javascript:void(0);'> удалить <a/></td>
                                    </tr>";

                                $all_price_ru = $all_price_ru + $vt['price_ru'];
                                $all_price_ua = $all_price_ua + $vt['price_ua'];
                                $all_price_tenge = $all_price_tenge + $vt['price_tenge'];
                                $all_price_bel = $all_price_bel + $vt['price_bel'];

                                $selk .= $vt['pid'] . ',';
                            }
                        }

                        $val .= '</table></fieldset></div>
									<input id="in_' . $k . $v['tabl'] . $v['td'] . '_del" type="hidden" name="' . $k . '_del" value="" />
									<input id="in_' . $k . $v['tabl'] . $v['td'] . '" type="hidden" name="' . $k . '" value="' . rtrim($selk, ',') . '"><br>
									<select id="' . $k . $v['tabl'] . $v['td'] . '">
										<option disabled selected value="0">Выберите элемент комплекта</option>';

                        $sets = $db->select('
											SELECT `id`,`name` 
											FROM ' . DB_PREFIX . $v['tabl'] . ' 
											ORDER by `sort`');
                        if (isset($sets)) {
                            foreach ($sets as $set) {
                                $val .= '<option value="' . $set['id'] . '">' . $set['name'] . '</option>';
                            }
                        }

                        $val .= '</select>
										<button onclick="add_price_set(\'' . $k . $v['tabl'] . $v['td'] . '\')" class="grey dark img_icon has_text WithButton">
											<span>добавить</span>
										</button>
										<br><br>
										<fieldset class="fieldsetSetPrice">
											<legend>Просмотр цен</legend>
											<table>
												<tr>
													<td>Итоговая цена:</td>
													<td width="200">ua: <label class="all_price_ua"> ' . $all_price_ua . '</label><input type="hidden" value="' . $all_price_ua . '"/></td>
													<td width="200">ru: <label class="all_price_ru"> ' . $all_price_ru . '</label><input type="hidden" value="' . $all_price_ru . '"/></td>
													<td width="200">kz: <label class="all_price_kz"> ' . $all_price_tenge . '</label><input type="hidden" value="' . $all_price_tenge . '"/></td>
													<td width="200">bel: <label class="all_price_bel"> ' . $all_price_bel . '</label><input type="hidden" value="' . $all_price_bel . '"/></td>
												</tr>
												<tr>
													<td>
														<button onclick="refresh_price()" class="grey dark img_icon has_text">
															<span>Обновить</span>
														</button>
													</td>
												</tr>
											</table>
										</fieldset>';
                    } //TODO: Jugene new type for characteristic
                    elseif ($v['tip'] == '2select_with_link') {

                        $dataLink = $db->select_id('
												SELECT `pidItem`, `pidValue` as `id`
												FROM ' . DB_PREFIX . $v['linkTable'] . '
												WHERE `pidItem`="' . $id . '"');
                        $infoMain = $db->select_id('
												SELECT `id`, `pid`, `name`
												FROM ' . DB_PREFIX . $v['mainTable'] . '
												WHERE `en`=1
												ORDER BY `sort`');

                        $val = '<div><fieldset class="fieldsetSetPrice"><table id="tab_ch_' . $k . $v['linkTable'] . '">';
                        if (!empty($dataLink)) {
                            $pidValue = $db->select_id('
													SELECT `id`, `pid`, `value`
													FROM ' . DB_PREFIX . $v['valueTable'] . '
													WHERE `id` in (' . implode(',', array_keys($dataLink)) . ')');

                            foreach ($dataLink as $dL_k => $dL_v) {
                                $val .= "<tr id='tr_ch_" . $k . $v['linkTable'] . $pidValue[$dL_k]['pid'] . "' num_ch='" . $pidValue[$dL_k]['pid'] . "_" . $dL_k . "'>
												<td>" . $infoMain[$pidValue[$dL_k]['pid']]['name'] . "</td>
												<td><input type='hidden' name='twoSelectch_" . $k . $v['linkTable'] . "___" . $pidValue[$dL_k]['pid'] . "_" . $dL_k . "' value='" . $pidValue[$dL_k]['value'] . "'>
													<input type='text' value='" . $pidValue[$dL_k]['value'] . "' disabled='disabled'/></td>
												<td onclick=\"del_tab_with_input('ch_" . $k . $v['linkTable'] . "', " . $pidValue[$dL_k]['pid'] . ")\"><a href='javascript:void(0);'> удалить <a/></td>
											</tr>";
                                $selectedSelect .= $dL_k . ',';
                            }
                        }

                        $val .= '</table></fieldset></div><br>
										<select onchange="checked_first_select(\'ch_' . $k . $v['linkTable'] . '\',\'' . $v['valueTable'] . '\')" 
												id="main_ch_' . $k . $v['linkTable'] . '">';
                        $i = 0;
                        $selectPidValueHtml = '';
                        foreach ($infoMain as $iM_k => $iM_v) {
                            if ($i == 0) {
                                $selectPidValue = $db->select_id('
											SELECT `id`, `value`
											FROM ' . DB_PREFIX . $v['valueTable'] . '
											WHERE `pid`="' . $iM_k . '"');
                                foreach ($selectPidValue as $sPV_k => $sPV_v) {
                                    $selectPidValueHtml .= '<option value="' . $sPV_k . '">' . $sPV_v['value'] . '</option>';
                                }
                                $selectPidValueHtml = '<select id="value_ch_' . $k . $v['linkTable'] . '">
														<option value="0">Сделайте выбор!</option>'
                                    . $selectPidValueHtml
                                    . '</select>';
                                $selectedThis = ' selected="selected" ';
                                $i++;
                            } else
                                $selectedThis = '';
                            $val .= '<option ' . $selectedThis . 'value="' . $iM_k . '">' . $iM_v['name'] . '</option>';
                        }

                        $val .= '</select>' . $selectPidValueHtml . '
									<input type="hidden" name="select_input_ch_' . $k . $v['linkTable'] . '" id="select_input_ch_' . $k . $v['linkTable'] . '" value="' . substr($selectedSelect, 0, -1) . '">
									<input type="hidden" name="ch_' . $k . $v['linkTable'] . '_del" id="ch_' . $k . $v['linkTable'] . '_del" value="">
									<input type="text" id="input_ch_' . $k . $v['linkTable'] . '" placeholder="Ввести если нет в списке" style="width: 145px;">
									<button onclick="add_tab_with_input(\'ch_' . $k . $v['linkTable'] . '\')" class="grey dark img_icon has_text WithButton">
										<span>Добавить</span>
									</button>';
                    } //sort
                    elseif ($v['tip'] == 'sort' && $v['editTip'] == 1) {
                        $val = '<input type="text" ' . $disabled . ' class="' . $valid . ' text" name="' . $k . '" value="' . $dataDB[$k] . '" />';
                    }

                    if ($v['password'] == true)
                        $val .= '<button class="light text_only has_text generatePassword" info="' . $k . '">
										<span>Сгенерировать</span>
									</button>';

                    if ($v['ob'] == 1)
                        $required = '<div class="required_tag"></div>';

                    if (!empty($val))
                        $inputHtml .= '	<fieldset class="label_side label_small">
												<label for="text_field_inline">' . $name . '</label>
												<div class="clearfix">
													' . $val . $required . '
												</div>
											</fieldset>';
                }
            }
        }

        $inputHtml .= '</div></div>
					<script type="text/javascript">
						function ajaxUniqueField(field, rules, i, options) {
							var error = true;
							dataPost = {
								dbTable 	: $("[name=dbTable]").val(),
								nameField 	: $(field).attr("name"),
								valueField	: $(field).val(),
								idField		: "' . $id . '"};
							content =  ajaxRequest("unique_field", dataPost).done(function(msg) {
								if(msg == \'false\')
									error = false;
							});
							if(error == false)
								return "* Данное имя уже занято!";
						}
									
						$("button.search_sel_cat").on("click", function(){
							var text = $("input[name=search_field_catalog_multi]").val();
							var temp = $(this).attr("info");
							var reg  = new RegExp(text, \'ig\');
							
							if(temp != "") {
								$("div.multi" + temp + " ul.selected li").each(function (index, Element) {
									var titleSel = $(Element).attr("title");
									if(titleSel != undefined) {
										if(reg.test(titleSel) === false)
											$(Element).hide();
										else
											$(Element).show();
									}
								});
							}
							else {
								$("div.multi" + temp + " ul.selected li").show();
							}
						});
					</script>';
    }
}

echo $editHtml = showtempl(dirname(__FILE__) . '/templ/tpl_edit.php');