<?php
// админ меню + доступы

$arrayData = array(
	'id'		=>array('tip'=>'id','name'=>'id'),
	'name'		=>array('tip'=>'text','name'=>'Название','r'=>0,'w'=>1,'ob'=>1),
	'logo'		=>array('tip'=>'logoImages','name'=>'Логотип','w'=>1,'dir'=>'images/icons/small/grey'),
	'url'		=>array('tip'=>'text','name'=>'URL','w'=>1),
	'access'	=>array('tip'=>'multiselect_other_table','name'=>'Доступ','r'=>1,'w'=>1,'other_table'=>'tip_admin',
					    'value_option'=>'name','value_save'=>'id'), 
	'en'		=>array('tip'=>'bool','name'=>'Выводить','r'=>1,'w'=>1),
	'sort'		=>array('tip'=>'sort','sort'=>'desc','r'=>0)
);
$arraySettings = array(
    'table' 	=> 'amodules',
    'title' 	=> 'Доступы',
    'button' => array(
					'add'	 => true,
					'edit'	 => true,
					'delete' => true),
    'where' 	=> ''
);

$admin_center_area .= tree_admin_red($arraySettings,$arrayData);