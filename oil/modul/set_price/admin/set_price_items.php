<?php
$arrayData = array(
	array (
        'id'   		=> array ('tip' => 'id','name' => 'id', 'r' => 1),
        'name'		=> array ('tip' => 'text', 'name' => 'Название', 'r' => 1, 'w' => 1, 'ob' => 1, 'un' => 1),
        'en'   		=> array ('tip' => 'bool', 'name' => 'Выводить', 'r' => 1, 'w' => 1, 'def' => 1),
        'sort' 		=> array ('tip' => 'sort', 'sort' => 'desc', 'r' => 0),
    ),
	array (
        'id'   		=> array ('tip' => 'id','name' => 'id', 'r' => 1),
		'pid'		=> array ('tip'=>'select_other_table','name'=>'Родитель','r'=>1,'w'=>1,'other_table'=>'shop_characteristics',
							 'value_option'=>'name','value_save'=>'id'),
        'value'		=> array ('tip' => 'text', 'name' => 'Значение', 'r' => 1, 'w' => 1, 'ob' => 1)),
    );

$arraySettings = array(
    'table' 	=> array(
					'shop_characteristics',
					'shop_characteristics_value'),
    'title' 	  => 'Характеристики и её значения',
    'titleTables' => array(
					'Характеристики',
					'Значения'),
    'button'	=> array(
					array(
						'add'	 => true,
						'edit'	 => true,
						'delete' => true),
					array(
						'add'	 => true,
						'edit'	 => true,
						'delete' => true)),
    'where' 	=> '');

$admin_center_area .= tree_table_admin($arraySettings,$arrayData);