<?php

$arrayData = array(
        'id'=>array('tip'=>'id','name'=>'id','r'=>0),
        'phone1'=>array('tip'=>'text','name'=>'Номер телефона 1','r'=>1,'w'=>1),
        'phone2'=>array('tip'=>'text','name'=>'Номер телефона 2','r'=>1,'w'=>1),
        'email'=>array('tip'=>'text','name'=>'Email','r'=>1,'w'=>1),
        'time_work'=>array('tip'=>'ftext','name'=>'Время работы','r'=>1,'w'=>1),
        'title_meta'=>array('tip'=>'text','name'=>'Title главной страницы','r'=>0,'w'=>1,'group'=>'SEO'),
        'descr_meta'=>array('tip'=>'ftext','name'=>'Description главной страницы','r'=>0,'w'=>1,'group'=>'SEO'),
        'keyw_meta'=>array('tip'=>'ftext','name'=>'Keywords главной страницы','r'=>1,'w'=>1,'group'=>'SEO'),
        'seo_text'=>array('tip'=>'btext','name'=>'Seo текст главной страницы','r'=>0,'w'=>1,'group'=>'SEO'),
    );

$arraySettings = array(
    'table'		  => 'settings_site',
    'button' => array(
            'add'	 => false,
            'edit'	 => true,
            'delete' => false),
    'title' 	  => 'Настройки сайта',
    'where'		  => ' AND `id` = 1'
);
$admin_center_area .= tab_admin_tables( $arraySettings, $arrayData);