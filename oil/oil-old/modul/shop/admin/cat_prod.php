<?php
$arrayData = array(
	include('array_category.php'),
	include('array_product.php')
);

$arraySettings = array(
    'table' 	=> array(
					'shop_cat',
					'shop_product'),
    'title' 	  => 'Каталоги и товары',
    'titleTables' => array(
					'Категории',
					'Товары'),
    'button'	=> array(
					array(
						'add'	 => false,
						'edit'	 => true,
						'delete' => false),
					array(
						'add'	 => true,
						'edit'	 => true,
						'delete' => true)),
    'where' 	=> '');

$admin_center_area .= tree_table_admin($arraySettings,$arrayData);