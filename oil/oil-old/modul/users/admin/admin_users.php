<?php
$arrayData = array(
    'id'				=>	array('tip'=>'id','name'=>'№','r'=>1),
    'logo'				=>	array('tip'=>'logoImages','name'=>'Логотип','w'=>1,'dir'=>'images/content/profiles'),
	'name'				=>	array('tip'=>'text','name'=>'Имя','r'=>1,'w'=>1,'ob'=>1),
	'login'				=>	array('tip'=>'text','name'=>'Логин','r'=>1,'w'=>1,'ob'=>1,'unique'=>true),
	'pas'				=>	array('tip'=>'text','name'=>'Пароль','r'=>0,'w'=>1,'ob'=>1,'password'=>true),
	'tip'				=> 	array('tip'=>'select_other_table','name'=>'Тип пользователя','r'=>1,'w'=>1,'other_table'=>'tip_admin','value_option'=>'name'),
	'sort'				=>	array('tip'=>'sort','sort'=>'desc','r'=>0)
    );

$arraySettings = array(
    'table' => 'admin_user',
    'title' => 'Админы',
    'button' => array(
					'add'	 => true,
					'edit'	 => true,
					'delete' => true),
    'where' => ''
);

$admin_center_area .= tab_admin_tables( $arraySettings, $arrayData);