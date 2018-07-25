<?php

// редактор каталога товаров

$arrayData = array(
    'id'		=>	array('tip'=>'id','name'=>'id'),
    'name'		=>	array('tip'=>'text','name'=>'Название','r'=>0,'w'=>1,'ob'=>1),
    'url'		=>	array('tip'=>'text','name'=>'URL','w'=>1),
    'data_for_sitemap'	=> 	array('tip'=>'alwaysdef','name'=>'Дата для карты сайта','r'=>0,'w'=>0,'def'=>date('Y-m-d\TH:i:s' . '+04:00')),

    'title'		=>	array('tip'=>'text','name'=>'meta_title','r'=>0,'w'=>1,'group'=>'SEO'),	
    'descr'		=>	array('tip'=>'ftext','name'=>'meta_descr','r'=>0,'w'=>1,'group'=>'SEO'),
    'keyw'		=>	array('tip'=>'ftext','name'=>'meta_keyw','r'=>0,'w'=>1,'group'=>'SEO'),    
    'seo_text'		=>	array('tip'=>'btext','name'=>'Seo текс','r'=>0,'w'=>1,'group'=>'SEO'),
	
    'en'		=>	array('tip'=>'bool','name'=>'Выводить','r'=>1,'w'=>1),
    'sort'		=>	array('tip'=>'sort','sort'=>'desc','r'=>0)
);
$arraySettings = array(
    'table' 	=> 'shop_cat',
    'title' 	=> 'Редактор каталога товаров',
    'button' => array(
					'add'	 => true,
					'edit'	 => true,
					'delete' => true),
    'where' 	=> ''
);

$admin_center_area .= tree_admin_red($arraySettings,$arrayData);