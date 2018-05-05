<?php
// админ пользователи

$arrayData = array(
    'id'	=>array('tip'=>'id','name'=>'id','r'=>0),
    'name'	=>array('tip'=>'text','name'=>'Название типа','r'=>1,'w'=>1,'ob'=>1)
);

$arraySettings = array(
    'table' 	=> 'tip_admin',
    'title' 	=> 'Типы пользователей',
    'button' => array(
					'add'	 => true,
					'edit'	 => true,
					'delete' => true),
    'where' 	=> '' 
);

$admin_center_area .= tab_admin_tables($arraySettings,$arrayData);