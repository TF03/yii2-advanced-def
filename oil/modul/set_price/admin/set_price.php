<?php
$arrayData = array(
    'id'				=>	array('tip'=>'id','name'=>'№','r'=>1),    
	'name'				=>	array('tip'=>'text','name'=>'Имя','r'=>1,'w'=>1,'ob'=>1),
	'en'				=> 	array('tip'=>'bool','name'=>'Выводить?','r'=>1,'w'=>1),	
	'sort'				=>	array('tip'=>'sort','sort'=>'desc','r'=>0)
    );

$arraySettings = array(
    'table' => 'shop_set_price',
    'title' => 'Список наборов',
    'button' => array(
					'add'	 => true,
					'edit'	 => true,
					'delete' => true),
    'where' => ''
);

$admin_center_area .= tab_admin_tables( $arraySettings, $arrayData);