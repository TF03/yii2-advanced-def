<?php
// админ меню + доступы

$arrayData = array(
	'id'			=>array('tip'=>'id','name'=>'id'),
	'title'			=>array('tip'=>'text','name'=>'Заголовок','r'=>1,'w'=>1,'ob'=>1),
	'short_text'		=>array('tip'=>'ftext','name'=>'Текст под заголовком','r'=>0,'w'=>1,'ob'=>1),
	'present'		=>array('tip'=>'text','name'=>'Подарок','r'=>1,'w'=>1,'ob'=>1),
	'price'			=> array('tip'=>'float','name'=>'Цена','r'=>1,'w'=>1),
	
	'item_1_title'		=>array('tip'=>'text','name'=>'Заголовок','r'=>0,'w'=>1,'ob'=>1,'group'=>'Товар 1'),
	'item_1_short_text'	=>array('tip'=>'ftext','name'=>'Текст под заголовком','r'=>0,'w'=>1,'ob'=>1,'group'=>'Товар 1'),
	'item_1_img'		=> array('tip'=>'img','name'=>'Картинка','r'=>1,'w'=>1,'path'=>'/complect/','group'=>'Товар 1'),
	
	'item_2_title'		=>array('tip'=>'text','name'=>'Заголовок','r'=>0,'w'=>1,'ob'=>1,'group'=>'Товар 2'),
	'item_2_short_text'	=>array('tip'=>'ftext','name'=>'Текст под заголовком','r'=>0,'w'=>1,'ob'=>1,'group'=>'Товар 2'),
	'item_2_img'		=> array('tip'=>'img','name'=>'Картинка','r'=>1,'w'=>1,'path'=>'/complect/','group'=>'Товар 2'),
	
	'item_3_title'		=>array('tip'=>'text','name'=>'Заголовок','r'=>0,'w'=>1,'ob'=>1,'group'=>'Товар 3'),
	'item_3_short_text'	=>array('tip'=>'ftext','name'=>'Текст под заголовком','r'=>0,'w'=>1,'ob'=>1,'group'=>'Товар 3'),
	'item_3_img'		=> array('tip'=>'img','name'=>'Картинка','r'=>1,'w'=>1,'path'=>'/complect/','group'=>'Товар 3'),
	
	'en'		=>array('tip'=>'bool','name'=>'Выводить','r'=>1,'w'=>1),
	'sort'		=>array('tip'=>'sort','sort'=>'desc','r'=>0)
);
$arraySettings = array(
    'table' 	=> 'complect',
    'title' 	=> 'Комплекты',
    'button' => array(
					'add'	 => true,
					'edit'	 => true,
					'delete' => true),
    'where' 	=> ''
);

$admin_center_area .= tab_admin_tables($arraySettings,$arrayData);