<?php

$arrayData = array(
	array(
		'id'=>array('tip'=>'id','name'=>'id','r'=>0),
		
		/*Фото*/
		'img'=>array('tip'=>'img','name'=>'Картинка','r'=>1,'w'=>1,'path'=>'/news/','width'=>300,'group'=>'Фото'),		
		'data'=>array('tip'=>'data','name'=>'Дата','r'=>1,'w'=>1,'ob'=>1,'def'=>date('Y-m-d')),
		'zag'=>array('tip'=>'text','name'=>'Название','r'=>1,'w'=>1,'ob'=>1),		
		'short_text'=>array('tip'=>'ftext','name'=>'Короткое описание','r'=>1,'w'=>1),		
		'text'=>array('tip'=>'btext','name'=>'Новость','r'=>0,'w'=>1),		
		'url'=>array('tip'=>'text','name'=>'URL: формат ( test-link )','r'=>1,'w'=>1,'ob'=>1, 'unique'=>true),
		'data_for_sitemap'=>array('tip'=>'text','name'=>'Дата для карты сайта','r'=>0,'w'=>1,'def'=>date('c')),
		'en'=>array('tip'=>'bool','name'=>'Выводить','r'=>1,'w'=>1,'def'=>1),
	
		/* СЕО */
		'title_meta'=>array('tip'=>'text','name'=>'Title','r'=>0,'w'=>1,'group'=>'SEO'),
		'keyw_meta'=>array('tip'=>'ftext','name'=>'Description','r'=>0,'w'=>1,'group'=>'SEO'),
		'descr_meta'=>array('tip'=>'ftext','name'=>'Keywords','r'=>0,'w'=>1,'group'=>'SEO'),
	),
	array(
		'id'=>array('tip'=>'id','name'=>'id','r'=>0),
		'title_meta'=>array('tip'=>'text','name'=>'Title','r'=>1,'w'=>1),
		'descr_meta'=>array('tip'=>'ftext','name'=>'Description','r'=>1,'w'=>1),
		'keyw_meta'=>array('tip'=>'ftext','name'=>'Keywords','r'=>1,'w'=>1),
		'seo_text'=>array('tip'=>'btext','name'=>'Seo текст','r'=>0,'w'=>1),
	)
);

$arraySettings = array(
    'table'		  => array('news','seo_for_url'),
    'countTable'  => count($arrayData),
    'button' => array(
					array(
						'add'	 => true,
						'edit'	 => true,
						'delete' => true),
					array(
						'add'	 => false,
						'edit'	 => true,
						'delete' => false)),
    'title' 	  => 'Видео',
    'titleTables' => array('Новости','SEO на каталожной странице "Новости"'),
    'where'		  => array('',' AND `id` = 1')
);
$admin_center_area .= tab_admin_tables( $arraySettings, $arrayData);