<?php
// админ пользователи

$arrayData = array(
	'id'	=>array('tip'=>'id','name'=>'id','r'=>0),
	'name'	=>array('tip'=>'onlytext','name'=>'Название','r'=>1,'w'=>1,'ob'=>1),
	'url'	=>array('tip'=>'text','name'=>'Ссылка (например: contact)','r'=>0,'w'=>1),
	'sort'	=>array('tip'=>'sort','name'=>'Сортировка','sort'=>'desc','r'=>1,'w'=>1),
	'en'	=>array('tip'=>'bool','name'=>'Выводить','r'=>1,'w'=>1)
);

$arraySettings = array(
	'table' 	=> 'menu_head',
	'title' 	=> 'Меню в шапке',
	'button' => array(
		'add'	 => true,
		'edit'	 => true,
		'delete' => true),
	'where' 	=> ' '
);

$admin_center_area .= tree_admin_red($arraySettings,$arrayData);