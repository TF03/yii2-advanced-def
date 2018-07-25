<?php
// админ меню + доступы

$arrayData = array(
	'id'		=>array('tip'=>'id','name'=>'id'),
	'name'		=>array('tip'=>'text','name'=>'Имя','r'=>1,'w'=>1,'ob'=>1),
	'phone'		=>array('tip'=>'text','name'=>'Телефон','r'=>1,'w'=>1,'ob'=>1),
	'email'		=>array('tip'=>'text','name'=>'Почта','r'=>1,'w'=>1,'ob'=>1),
	'products'	=>array('tip'=>'multiselect_other_table','name'=>'Товары','r'=>1,'w'=>1,'other_table'=>'complect',
					'value_option'=>'title','value_save'=>'id'), 
	
);
$arraySettings = array(
    'table' 	=> 'order',
    'title' 	=> 'Заказы',
    'button' => array(
					'add'	 => false,
					'edit'	 => true,
					'delete' => false),
    'where' 	=> ''
);

$admin_center_area .= tab_admin_tables($arraySettings,$arrayData);