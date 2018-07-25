<?php
$arrayData = array(
	'id'				=>array('tip'=>'id','name'=>'id','r'=>0),
	'name'				=>array('tip'=>'text','name'=>'Название','r'=>1,'w'=>1,'ob'=>1),
	'data_for_sitemap'	=>array('tip'=>'datetime','name'=>'Дата','r'=>0,'w'=>1,'def'=>date('Y-m-d H:i:s')),
	'url'				=>array('tip'=>'text','name'=>'URL формат(example-page)','r'=>1,'w'=>1,'ob'=>1,'un'=>1),
	'en'				=>array('tip'=>'bool','name'=>'Выводить','r'=>1,'w'=>1),
	'text'				=>array('tip'=>'btext','name'=>'Контент','r'=>0,'w'=>1),

	/*** SEO ***/
	'descr'				=>array('tip'=>'ftext','name'=>'meta_descr','r'=>0,'w'=>1,'group'=>'SEO'),
	'keyw'				=>array('tip'=>'ftext','name'=>'meta_keyw','r'=>0,'w'=>1,'group'=>'SEO'),
	'title'				=>array('tip'=>'ftext','name'=>'meta_title','r'=>0,'w'=>1,'group'=>'SEO')
);

$arraySettings = array(
    'table' => 'page',
    'title' => 'Статические страницы',
    'button' => array(
					'add'	 => true,
					'edit'	 => true,
					'delete' => true),
    'where' => ''
);

$admin_center_area .= tab_admin_tables( $arraySettings, $arrayData);