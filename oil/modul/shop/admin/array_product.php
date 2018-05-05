<?php
return array(
	'id'				=> array('tip'=>'id','name'=>'№','r'=>1),
	'pid'				=> array('tip'=>'select_other_table','name'=>'Каталог','r'=>1,'w'=>1,'other_table'=>'shop_cat','value_option'=>'name','value_save'=>'id'),
	'name'				=> array('tip'=>'text','name'=>'Название','r'=>1,'w'=>1,'ob'=>1),
	'url'				=> array('tip'=>'text','name'=>'URL (например aromatizator-test)','r'=>1,'w'=>1),
	'data_for_sitemap'	=> array('tip'=>'datetime','name'=>'Дата для карты сайта','r'=>0,'w'=>0,'def'=>date('Y-m-d H:i:s')),
	'availability'		=> array('tip'=>'select_other_table','name'=>'Наличие','r'=>1,'w'=>1,'other_table'=>'shop_availability',
									'value_option'=>'comment','value_save'=>'id','def'=>1),
    'price'			    => array('tip'=>'float','name'=>'Цена','r'=>0,'w'=>1),
	'en'				=> array('tip'=>'bool','name'=>'Выводить?','r'=>1,'w'=>1),

	/****Предложения****/
//	'new'				=> array('tip'=>'bool','name'=>'Новинка?','r'=>0,'w'=>1,'def'=>0,'group'=>'Предложения'),
//	'hit'				=> array('tip'=>'bool','name'=>'Хит продаж?','r'=>0,'w'=>1,'def'=>0,'group'=>'Предложения'),
//	'spec'				=> array('tip'=>'bool','name'=>'Спецпредложение?','r'=>0,'w'=>1,'def'=>0,'group'=>'Предложения'),

	/****Описание/обзор****/
	'descr'				=> array('tip'=>'btext','name'=>'Описание','r'=>0,'w'=>1,'group'=>'Описание'),

	/****Фото/3D/Видео****/
	'img'				=> array('tip'=>'img_m','name'=>'Фото товара ','r'=>0,'w'=>1,'path'=>'/shop/','other_table'=>'shop_produkt_img','value_option'=>'img','imgw'=>750 /*,'imgh'=>428 */,'group'=>'Фото'),

	/****СЕО****/
	'title_meta'		=> array('tip'=>'text','name'=>'Title','r'=>0,'w'=>1,'group'=>'SEO'),
	'descr_meta'		=> array('tip'=>'ftext','name'=>'Description','r'=>0,'w'=>1,'group'=>'SEO'),
	'keyw_meta'			=> array('tip'=>'ftext','name'=>'Keywords','r'=>0,'w'=>1,'group'=>'SEO'),

	/****set****/
    'set_price'	=> array('tip'=>'2select_with_link','name'=>'Наборы','r'=>0,'w'=>1,'linkTable'=>'shop_set_product',
							'valueTable'=>'shop_set_value','mainTable'=>'shop_set_price','group'=>'Наборы'),

	/****characteristic****/
    'characteristic'	=> array('tip'=>'2select_with_link','name'=>'Характеристики','r'=>0,'w'=>1,'linkTable'=>'shop_characteristics_product',
							'valueTable'=>'shop_characteristics_value','mainTable'=>'shop_characteristics','group'=>'Характеристики'));