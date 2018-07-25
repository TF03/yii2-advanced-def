<?php

$arrayData=array(
    'id'		=> array('tip'=>'id','name'=>'№','r'=>1),
    'name'		=> array('tip'=>'text','name'=>'Название','r'=>1,'w'=>1),
    'code'		=> array('tip'=>'textcode','name'=>'Код','r'=>0,'w'=>1),
    'method'	=> array('tip'=>'select_other_table','name'=>'Где использовать','r'=>1,'w'=>1,
							'other_table'=>'code_template_method','value_option'=>'name'),
    'en'        => array('tip'=>'bool','name'=>'Использовать?','r'=>1,'w'=>1)
    );

$arraySettings = array(
    'table' => 'code_template',
    'title' => 'Коды на страницах',
    'button' => array(
					'add'	 => true,
					'edit'	 => true,
					'delete' => true),
    'where' => ''
);

$admin_center_area .= tab_admin_tables( $arraySettings, $arrayData);