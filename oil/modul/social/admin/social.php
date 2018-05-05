<?php
// админ меню + доступы

$arrayData = array(
	'id'			=>array('tip'=>'id','name'=>'id'),
	'vk'			=>array('tip'=>'text','name'=>'vkontakte','r'=>1,'w'=>1),
	'facebook'		=>array('tip'=>'text','name'=>'facebook','r'=>1,'w'=>1),
	'twitter'		=>array('tip'=>'text','name'=>'twitter','r'=>1,'w'=>1),
	'instagram'		=>array('tip'=>'text','name'=>'instagram','r'=>1,'w'=>1)
);
$arraySettings = array(
    'table' 	=> 'social',
    'title' 	=> 'Соц кнопки',
    'button' => array(
					'add'	 => false,
					'edit'	 => true,
					'delete' => false),
    'where' 	=> ' AND `id` = 1'
);

$admin_center_area .= tab_admin_tables($arraySettings,$arrayData);