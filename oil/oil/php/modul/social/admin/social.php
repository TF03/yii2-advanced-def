<?php
// админ меню + доступы

$arrayData = array(
	'id'			=>array('tip'=>'id','name'=>'id'),
	'name'			=>array('tip'=>'text','name'=>'Название','r'=>1,'w'=>1,'ob'=>1),
	'link'			=>array('tip'=>'text','name'=>'Ссылка','r'=>0,'w'=>1,'ob'=>1),
	'iconClass'		=>array('tip'=>'text','name'=>'Классы для иконки','r'=>1,'w'=>1,'ob'=>1),
	
	'en'		=>array('tip'=>'bool','name'=>'Выводить','r'=>1,'w'=>1),
	'sort'		=>array('tip'=>'sort','sort'=>'desc','r'=>0)
);
$arraySettings = array(
    'table' 	=> 'social',
    'title' 	=> 'Соц кнопки',
    'button' => array(
					'add'	 => true,
					'edit'	 => true,
					'delete' => true),
    'where' 	=> ''
);

$admin_center_area .= tab_admin_tables($arraySettings,$arrayData);