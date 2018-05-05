<?php

$arrayData = array(
	array(
		'id'			=>array('tip'=>'id','name'=>'№','r'=>1),
		'data_cr'		=>array('tip'=>'data','name'=>'Дата','r'=>0,'w'=>1),
		'summa'			=>array('tip'=>'color','name'=>'color','r'=>1,'w'=>1),
		'status'		=>array('tip'=>'select_other_table','name'=>'Статус заказа','r'=>1,'w'=>1,'other_table'=>'shop_order_status',
						'value_option'=>'name','value_save'=>'id','disabled'=>true),
		'prosto_test'	=>array('tip'=>'multiselect_other_table','name'=>'prosto_test','r'=>1,'w'=>1,'other_table'=>'prosto_test',
						'value_option'=>'name','value_save'=>'id','disabled'=>true),
		'order_id'		=>array('tip'=>'file','name'=>'Драйвер','r'=>0,'w'=>1,'type_file'=>'zip','path'=>'/order/'),
		'email'			=>array('tip'=>'img','name'=>'Фото товара','r'=>1,'w'=>1,'path'=>'/order/','width'=>600 ,'height'=>428),
		
		'name'			=>array('tip'=>'onlytext','name'=>'Имя','r'=>1,'w'=>1,'ob'=>1,'group'=>'Информация по заказчику'),	
		'phone'			=>array('tip'=>'phone','name'=>'phone','r'=>0,'w'=>1,'ob'=>1,'group'=>'Информация по заказчику'),
		
		'promokod'		=>array('tip'=>'int','name'=>'int','r'=>0,'w'=>1,'ob'=>1,'group'=>'По заказу'),
		'pay'			=>array('tip'=>'float','name'=>'float','r'=>0,'w'=>1,'ob'=>1,'group'=>'По заказу'),
		'delivery'		=>array('tip'=>'onlytext','name'=>'onlytext','r'=>0,'w'=>1,'ob'=>1,'group'=>'По заказу'),
		'order_country'	=>array('tip'=>'text','name'=>'text','r'=>0,'w'=>1,'ob'=>1,'group'=>'По заказу'),
		'order_region'	=>array('tip'=>'text','name'=>'url','r'=>0,'w'=>1,'ob'=>1,'group'=>'По заказу','unique'=>true),
		'order_city'	=>array('tip'=>'email','name'=>'email','r'=>0,'w'=>1,'ob'=>1,'group'=>'По заказу'),
		'adress'		=>array('tip'=>'text','name'=>'Адресс','r'=>0,'w'=>1,'group'=>'По заказу','disabled'=>true),
		'com'			=>array('tip'=>'btext','name'=>'Комментарии','r'=>0,'w'=>1,'group'=>'По заказу'),
		'zak'			=>array('tip'=>'ftext','name'=>'заказ','r'=>0,'w'=>1,'group'=>'По заказу'),
		'sort_o'		=>array('tip'=>'sort','name'=>'Сортировка','sort'=>'desc','r'=>1,'w'=>0),
		'en'			=>array('tip'=>'bool','name'=>'Выводить','r'=>1,'w'=>1)),
	array(
		'id'	=>array('tip'=>'id','name'=>'id','r'=>0),
		'name'	=>array('tip'=>'text','name'=>'Название типа','r'=>1,'w'=>1,'ob'=>1))
    );

$arraySettings = array(
    'table'		  => array('shop_order','tip_admin'),
    'countTable'  => count($arrayData),
    'button' => array(
					array(
						'add'	 => false,
						'edit'	 => true,
						'delete' => true),
					array(
						'add'	 => true,
						'edit'	 => false,
						'delete' => true)),
    'title' 	  => 'Тест 2 таблицы',
    'titleTables' => array('Заказы','Типы админов'),
    'where'		  => '' 
);
$admin_center_area .= tab_admin_tables( $arraySettings, $arrayData);