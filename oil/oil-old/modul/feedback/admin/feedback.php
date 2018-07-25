<?php
// админ меню + доступы

$arrayData = array(
	'id'		=>array('tip'=>'id','name'=>'id'),
	'name'		=>array('tip'=>'text','name'=>'Имя','r'=>1,'w'=>1,'ob'=>1),
	'feedback'	=>array('tip'=>'ftext','name'=>'Отзыв','r'=>1,'w'=>1,'ob'=>1),
	'img'		=> array('tip'=>'img','name'=>'Картинка','r'=>1,'w'=>1,'path'=>'/feedback/','group'=>'Фото'),
	'sort'		=>array('tip'=>'sort','sort'=>'desc','r'=>0)
);
$arraySettings = array(
    'table' 	=> 'feedback',
    'title' 	=> 'Отзывы',
    'button' => array(
					'add'	 => true,
					'edit'	 => true,
					'delete' => true),
    'where' 	=> ''
);

$admin_center_area .= tab_admin_tables($arraySettings,$arrayData);