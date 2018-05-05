<?php

$url_cat = $router_str;

//отрезаем page от url
if(preg_match('#(.*)page-(.*)#i', $router_str,$temp_url)){
	$url_cat=$temp_url[1];
	$number_page=trim($temp_url[2], '/');
	$flag_first_page=1;
}
else{
	$url_cat=$router_str;
	$flag_first_page=0;
}

//отрезаем сортировку от url и формируем ее для запроса
$sort='popular';//тип сортировки по умолчанию
$sql_sort=' sort DESC ';//сортировка по умолчанию
if(preg_match('#(.*)sortby-(.*)#i', $url_cat,$temp_url)){
	$url_cat=$temp_url[1];
	
	$sort=trim($temp_url[2], '/');
	if($sort=='price'){
		$sql_sort='Field(`availability`,\'1\',\'5\',\'4\',\'2\',\'3\'), case when  `price_' . $_SESSION['valuta']['prefix'] . '`= 0 then 0 else 1 end DESC,  `price_' . $_SESSION['valuta']['prefix'] . '`';
	}
	if($sort=='pricedesc'){
		$sql_sort='Field(`availability`,\'1\',\'5\',\'4\',\'2\',\'3\'), price_' . $_SESSION['valuta']['prefix'] .' DESC ';
	}
}

//создаем блок сортировки
$type_sort=Array(
	'popular'	=>  'Популярные',
	'price'		=>  'От дешевых к дорогим',
	'pricedesc'	=>  'От дорогих к дешевым',
);

$block_sort='';
foreach($type_sort as $k=>$v){
	if($k==$sort){
		$block_sort .= '
		<option selected value="javascript:void(0);">'.$v.'</option>';
	}else{
		$temp_url = trim($url_cat,'/').( $k!='popular' ? '/sortby-'.$k .'/': '').( !empty($number_page) ? 'page-'.$number_page.'/' : '').(isset($_GET['filtr']) ? '?filtr='.$_GET['filtr'] : '');
		$block_sort .= '
			<option value="'.$temp_url.'">'.$v.'</option>';
	}
}
$block_sort ='	
	<div class="col-box">
        <span class="name-filter">Сортировка</span>
        <div class="row">
			<select name="sort" id="sort" onchange="location = this.options[this.selectedIndex].value;">
            ' . $block_sort . '
			</select>
		</div>
    </div>';

unset($type_sort,$temp_url);

$replace_url = $db -> one_array('SELECT r.`pid`,r.`combination`,r.`title`,r.`keyw`,r.`descr`,r.`seo_text`,r.`h1`,r.`name`, 
									r.`link1`,r.`link2`,r.`link3`,r.`link4`,
									(SELECT c.`url` FROM ' . DB_PREFIX . 'shop_cat as c WHERE c.`id`=r.`pid`) as url_cat
								FROM ' . DB_PREFIX . 'shop_filter_replace as r 
								WHERE r.`replace_url`="' . trim($url_cat, '/') .'" AND r.`en`=1');	
					
$block_link='';
$breadcrumb_parent='';								
//проверка существует или нет url с заменой								
if($replace_url){
	
	$block_link = '';
	for($i = 1; $i < 5; $i++){
		if(!empty($replace_url['link'.$i])){
			$block_link .= '<li> ' . $replace_url['link'.$i] . ' </li>';
		}
	}
	if(!empty($block_link)){
		$block_link = '
			<div class="also-need">
				<strong class="also-title">Также Вам могут быть полезны такие разделы:</strong>
				<ul>
					' . $block_link . '
				</ul>
			</div>	';
	}

	$category_info_all = $db -> select('	
									SELECT `id`,`pid`,`name`,`url`,`title`,`keyw`,`descr`,`seo_text`,`h1`
									FROM ' . DB_PREFIX . 'shop_cat 
									WHERE id = "' . $replace_url['pid'] . '" OR pid =  "' .$replace_url['pid'] . '" 
									ORDER BY Field(`id`, "' . $replace_url['pid'] . '") DESC, sort DESC');							
									
	$temp_get=$replace_url['combination'];			
}	
else{
	
	//выбираем категорию на которой находимся и вложенные в неё	
	$category_info_all = $db -> select('	
									SELECT `id`,`pid`,`name`,`url`,`title`,`keyw`,`descr`,`seo_text`,`h1`
									FROM ' . DB_PREFIX . 'shop_cat 
									WHERE url = "' . trim($url_cat, '/') . '" OR pid =  (
												SELECT id 
												FROM ' . DB_PREFIX . 'shop_cat 
												WHERE url = "' . trim($url_cat, '/') . '"
												LIMIT 0,1) ORDER BY Field(`url`, "' . trim($url_cat, '/') . '") DESC, sort DESC');		
}

if($_GET['filtr']){
	$search_new_url = $db -> one_data('	SELECT replace_url
										FROM ' . DB_PREFIX . 'shop_filter_replace
										WHERE pid="'.$category_info_all[0]['id'].'" AND combination="' . $_GET['filtr'] .'" AND `en`=1');
	if($search_new_url)	
		JSRedirect($search_new_url,'301');
	
	if($replace_url['url_cat'])
		JSRedirect($replace_url['url_cat'].'/?filtr='.$_GET['filtr'],'301');
		
}

//ставим параметры get для фильтра т.к. это подмена	
if(!$_GET['filtr'] && $temp_get){
	$_GET['filtr']=$temp_get;
}

//получаем родительскую категорию		
$category_info = $category_info_all[0];							 
unset($category_info_all[0]);

//собираем все id вложенных категорий в переменную
$cat_id = array_map( function($cat) { return $cat['id']; },$category_info_all);									
$cat_id = implode(',', $cat_id);

$id_all = array();

if (!empty($cat_id))
	$id_all[] = $cat_id;
if (!empty($category_info['id']))
	$id_all[] = $category_info['id'];


// meta.....						
$meta_title = $category_info['title'];		
$meta_keyw = $category_info['keyw'];		
$meta_descr = $category_info['descr'];
$seo_text=$category_info['seo_text'];
$h1=$category_info['h1'];
//проверка на существ h1 и если его нет то подменить на имя	
if(empty($category_info['h1'])){
	$h1=$category_info['name'];
}
$name=$category_info['name'];

$btn_add_9 = '
			<a class="btn-more-prod ajax" href="javascript:void(0);" rel="nofollow" rout="shop:add_9_prod">
				Показать еще 9 товаров
			</a>
		';
	
if($replace_url){
	$meta_title = $replace_url['title'];		
	$meta_keyw = $replace_url['keyw'];		
	$meta_descr = $replace_url['descr'];
	$seo_text=$replace_url['seo_text'];
	$h1=$replace_url['h1'];
	//проверка на существ h1 и если его нет то подменить на имя	
	if(empty($replace_url['h1'])){
		$h1=$replace_url['name'];
	}
	$name=$replace_url['name'];
	$breadname_cat=$replace_url['name'];
}

// проверка на добавление сео текста

if ($flag_first_page || $sort=='price' || $sort=='pricedesc'){
	$seo_text= '';
	$btn_add_9 = '';
	$block_link = '';
}


unset($replace_url,$category_info_all);

//подключаем модуль фильтров
include(SITE_PATH.'modul/filtry/filtry.php');
//подключаем модуль сравнения
include(SITE_PATH.'modul/comparison/comparison.php');

//чистим параметры get для фильтра т.к. это подмена	
if($_GET['filtr'] && $temp_get){
	unset($_GET['filtr']);
}

//достаем товары
if ($id_all) {

	$count_prod_on_page=9;

	// условия для присутствия выбранных фильров на станицы
	if($count_filter != 0){	
		$count_prod_in_cat = $db -> select('	
			SELECT p.`id`,COUNT( f.`pidItem` ) AS filtr
			FROM ' . DB_PREFIX . 'shop_product as p 
			LEFT JOIN ' . DB_PREFIX . 'shop_filter_product as f ON f.`pidItem` = p.`id` 
			WHERE p.`pid` in (' . implode(',', $id_all) . ') AND p.`en`=1 AND `moder` != 2 '.$where_filtr);	
		$count_prod_in_cat = count($count_prod_in_cat);
	}
	else{
		$count_prod_in_cat = $db -> one_data('	
			SELECT COUNT(p.`id`)
			FROM ' . DB_PREFIX . 'shop_product as p   
			WHERE p.`pid` in (' . implode(',', $id_all) . ') AND p.`en`=1 AND `moder` != 2 '.$where_filtr);		
	}

	//проверка на наличие товаров для данной комбинации фильтров, в противном случае выдаем мегаакцию

	if($count_prod_in_cat>1){
		$pagin = paging($count_prod_in_cat,$count_prod_on_page,5);
		
		// условия для присутствия выбранных фильров на станицы
		if($count_filter != 0){	
			$_SESSION['for_add_9_prod'] = '
			SELECT p.`id`,p.`pid`,p.`name`,p.`url`,p.`price_' . $_SESSION['valuta']['prefix'] .'`,
					p.`descr_single_goods`,p.`product_kod`,p.`availability`,p.`spec`,p.`hit`,p.`new`,(SELECT ss.`name` FROM ' . DB_PREFIX .'shop_sale as ss WHERE ss.`id`=p.`sale`) as sale,
					COUNT( f.`pidItem` ) AS filtr
				FROM ' . DB_PREFIX . 'shop_product as p 
				LEFT JOIN ' . DB_PREFIX . 'shop_filter_product as f ON f.`pidItem` = p.`id` 
				WHERE pid in (' . implode(',', $id_all) . ')  AND `en`=1 AND p.`moder` = 1 '.$where_filtr.'    
				ORDER BY '.$sql_sort.'
				LIMIT ';
		
			//выбираем информацию о товарах которые выводим на каталоге
			$product_info = $db -> select( $_SESSION['for_add_9_prod'] . $pagin['1']);
		}
		else{
			$_SESSION['for_add_9_prod'] = '
				SELECT p.`id`,p.`pid`,p.`name`,p.`url`,p.`price_' . $_SESSION['valuta']['prefix'] .'`,p.`descr_single_goods`,
					p.`product_kod`,p.`availability`,p.`spec`,p.`hit`,p.`new`,(SELECT ss.`name` FROM ' . DB_PREFIX .'shop_sale as ss WHERE ss.`id`=p.`sale`) as sale 
				FROM ' . DB_PREFIX . 'shop_product as p 
				WHERE p.`pid` in (' . implode(',', $id_all) . ')  AND p.`en`=1 AND p.`moder` = 1 '.$where_filtr.'    
				ORDER BY '.$sql_sort.'
				LIMIT ';
			//выбираем информацию о товарах которые выводим на каталоге
			$product_info = $db -> select($_SESSION['for_add_9_prod'] . $pagin['1']);		
		}
		
	}
	else{
		$ma  = $db->one_data("	SELECT item
								FROM ".DB_PREFIX."megaaction 
								WHERE name = 'for_" . $_SESSION['valuta']['prefix'] . "'
								LIMIT 0,1");
		$megaction = explode(',', $ma);
		$count_prod_in_cat = count($megaction);
		
		$pagin = paging($count_prod_in_cat,$count_prod_on_page,5);
		
		$product_info = $db -> select_id('	SELECT `id`,`pid`,`name`,`url`,`price_' . $_SESSION['valuta']['prefix'] .'`,`descr_single_goods`,`product_kod`,`availability`,`spec`,`hit`,`new`, 
											(SELECT ss.`name` FROM ' . DB_PREFIX .'shop_sale as ss WHERE ss.`id`=p.`sale`) as sale
											FROM ' . DB_PREFIX . 'shop_product as p 
											WHERE en=1 AND `moder` = 1 AND id in (' . $ma . ') 
											LIMIT ' . $pagin['1']);	
											
		$seo_text='';
		$h1='Данной комбинации нет';									
		$name='';
	}
	
	if($product_info){

		//получение id товаров на каталоге
		$prod_id = array_map( function($prod) { return $prod['id']; },$product_info);
		$count_prod_on_page=count($prod_id); // получаем реальное колличество отображаемых товаров
		$prod_id = implode(',',$prod_id);
		
		
		if($count_prod_on_page < 9){
			$btn_add_9 = '';
		}
		//выбираем массив всех картинки для данной страницы каталога
		$img_info = $db -> select('	SELECT pid,img
									FROM ' . DB_PREFIX . 'shop_produkt_img 
									WHERE pid in ('.$prod_id.')
									ORDER BY pid,sort DESC');
		
		//выбираем массив комплекта цен для товара
		$set_info = $db -> select('	SELECT p.pid_product as pid, p.price_' . $_SESSION['valuta']['prefix'] . '  as price_for, s.name as set_prod
									FROM ' . DB_PREFIX . 'shop_set_product as p
									LEFT JOIN ' . DB_PREFIX . 'shop_set as s 
									ON p.pid=s.id 
									WHERE pid_product in ('.$prod_id.')
									ORDER BY p.pid_product,s.sort');
		
		//выбираем массив характеристик для товара на каталоге
		$char_info = $db -> select('
			SELECT c_p.`pidItem`,c_v.`pid`,c_v.`value`,
				(SELECT c.`name` FROM ' . DB_PREFIX . 'shop_characteristics as c WHERE c.`id`=c_v.`pid`) as name
			FROM ' . DB_PREFIX . 'shop_characteristics_product as c_p 
			LEFT JOIN ' . DB_PREFIX . 'shop_characteristics_value as c_v 
			ON c_p.`pidValue`=c_v.`id`
			WHERE c_p.`pidItem` in ('.$prod_id.') AND c_v.`pid` in (49,64,61,63)
			ORDER BY c_p.`pidItem`, FIELD (c_v.`pid`,49,64,61,63)');
		
		
		//выбираем массив скидок на товар
		$reviews_prod = $db -> select_id('	
			SELECT DISTINCT  `pid` as id, (
				SELECT COUNT( rc.`id` ) 
				FROM ' . DB_PREFIX . 'reviews_products AS rc
				WHERE rc.`pid` = r.`pid` 
				AND rc.`en` =1
				) AS count_r, (
				SELECT AVG( rr.`rate` ) 
				FROM ' . DB_PREFIX . 'reviews_products AS rr
				WHERE rr.`pid` = r.`pid` 
				AND rr.`en` =1
				) AS avg_r
				FROM ' . DB_PREFIX . 'reviews_products AS r
				WHERE pid IN ('.$prod_id.')'
		);
		//print_r ($reviews_prod);
		$discount = $new = $discount_span = '';
		foreach ($product_info as $k => $v) {
			//вывод полосы с надписью "новинки"
				if($v['new']==1){
					$new = 'new';
				}else{$new = '';}
			//вывод полосы с надписью "скидка"
				if($v['sale']!=0 && !empty($v['sale'])){
					$discount = 'discount';
					$discount_span = '<span class="skidka">Скидка ' . $v['sale'] . '%</span>';
				}else{
				$discount = '';
					$discount_span = '';
				}
					
			//формирование картинок на каталоге
			$f_img=0;
			$img_big ='';
			$img='';
			
			foreach($img_info as $k_i => $v_i){
				if($v_i['pid']==$v['id']){
					//главная картинка
					if(empty($img_big)){
						$img_big = '<img src="./uploaded/img/shop/' . $v['id'] . '/' . $v_i['img'] . '" alt="'.$v['name'].'" title="'.$v['name'].'" />';
					}
					//для маленьких превьюшек
					$img .= '	
						<li>
							<a href="javascript:void(0);">
								<img src="./uploaded/img/shop/' . $v['id'] . '/' . $v_i['img'] . '" alt="" />
							</a>
						</li>';
					
					$f_img++;
					
					if($f_img == 4)
						break;
				}
			}
			//если картинок нет то ложим рыбу
			if(empty($img_big)){
				$img = '	
					<li>
						<a href="javascript:void(0);">
							<img src="./images/nophoto/image-product.jpg" alt="" />
						</a>
					</li>';
				$img_big = '<img src="./images/nophoto/image-product.jpg"  />';
			}
			
			//проверяем на комплект
			$block_set_rew = '';
			$flag_set=0;//флаг коплекта
			if(!empty($v['price_' . $_SESSION['valuta']['prefix']]) && $v['price_' . $_SESSION['valuta']['prefix']]!='0.00'){
				//выводим общую стоимость
				$block_price = 'Итого: ' . number_format($v['price_' . $_SESSION['valuta']['prefix']], 0, '.', ' ') . ' ' . $_SESSION['valuta']['site'];
				
				//выводим цену по комплектно
				foreach($set_info as $k_s=>$v_s){
					if($v_s['pid']==$v['id']){
						if(empty($block_set_rew)){
							$block_set_rew .= '	
							<div class="item">
										<span class="prod-name">'.$v_s['set_prod'].'</span>
										<span class="prod-price"> '.number_format($v_s['price_for'], 0, '.', ' ').' '.$_SESSION['valuta']['site'].'</span>
							</div>';
						}
						else{
							$block_set_rew .= '	
							<div class="item">
										<span class="prod-name">'.$v_s['set_prod'].'</span>
										<span class="prod-price"> '.number_format($v_s['price_for'], 0, '.', ' ').' '.$_SESSION['valuta']['site'].'</span>
							</div>';
						}
						
						$flag_set++;
					}
				}
				
				// проверка на одиночный товар/комплект или лазерки(4,6)
				if($flag_set>1 || $v['pid'] == 4 || $v['pid'] == 66){
					$block_characteristic='';
					$flag_char=0;
					
					foreach($char_info as $k_c=>$v_c){
						if($v_c['pidItem']==$v['id']){
							$block_characteristic.='
							<div class="item">
								<span class="prod-name">'.$v_c['name'].'</span>
								<span class="prod-desc">'.$v_c['value'].'</span>
							</div>';
						}
					}									
					if(!empty($block_characteristic)){
						$block_characteristic = '<div class="description">
													'.$block_characteristic.'
												</div>';
					}	
					$hide_block = '
					<div class="hovered-box">
									<a class="product_title" href="' . $v['url'] . '.html">' . $v['name'] . '</a>
									'.$block_characteristic.'
									<div class="complection">
										<div class="info-holder">
										<strong class="title">В комплект входят:</strong>
										' . $block_set_rew . ' 
										</div>
										<div class="item">
											<strong class="final">Итого: <span>'.$block_price.'</span></strong>
										</div>
									</div>
								</div>';	
				}
				else{
					$block_set_rew = $v['descr_single_goods'];
					$hide_block = '';
				}
			}
			else{
				$block_price='<span style="font-style: italic;">Цену уточняйте менеджера</span>';
			}
			
			$product_kod = '';
			if ($v['product_kod'])
				$product_kod = ' (' . $v['product_kod'] . ')';
			//наличие товара 
				if($v['availability']=='1'){
					$availability = '<span class="stock">Есть на складе</span>';
				}elseif($v['availability']=='2'){
					$availability = '<span class="stock discontinued">Снят с производства</span>';
				}elseif($v['availability']=='5'){
					$availability = '<span class="stock under-order">Под заказ</span>';
				}
			
			$compared_array = explode(',',$_SESSION['comparison']);
			// сравнения				
				if (in_array($v['pid'], $array_pid_comparison)){
					if (in_array($v['id'], $compared_array)){
						$in_compare= "in-compare";
						$compare_text = "В сравнении";
					}
					else{
						$in_compare= "";
						$compare_text = "Сравнить";
					}
					$comparison = '
					<div class="product_compare_div">
						<a href="#popup2" class="lightbox btn-compare '.$in_compare.' ajax" rout="comparison:comparison" info="add:' . $v['id'] . '">
							'.$compare_text.'
						</a>
					</div>';			
				}
			
			// reviews product
				$count_r = 0;
				if(!empty($reviews_prod[$v['id']]['count_r'])){
					$count_r = $reviews_prod[$v['id']]['count_r'];
				}
				$avg_r = round($reviews_prod[$v['id']]['avg_r']);
				$rateON_0 = $rateON_1 = $rateON_2 = $rateON_3 = $rateON_4 = '';
				
				for($i = 0; $i < $avg_r; $i++) {
					$rateON = 'rateON_' . $i;
					$$rateON .= ' class="all"';
				}
			// end reviews product
			
			$product .= '
			<li class="more_li">
								<a class="product_title" href="' . $v['url'] . '.html">' . $v['name'] . '</a>
								<div class="product_img ' . $new . ' ' . $discount . ' clearfix">
									<a href="' . $v['url'] . '.html" class="img_main">
									' . $img_big . $discount_span . '
									</a>
									<ul class="small_product_img">
										' . $img . '
									</ul>
								</div>
								<div class="complection">
									<strong class="title">В комплект входят:</strong>
									' . $block_set_rew . '
									<div class="item">
										<strong class="final">Итого: <span>'.$block_price.'</span></strong>
									</div>
								<div class="item">
										'.$comparison.'
										<div class="rating">
											<p class="full unmove" >
											<label' . $rateON_0 . '><input type="radio" name="star1" value="1" />1</label>
											<label' . $rateON_1 . '><input type="radio" value="2" />2</label>
											<label' . $rateON_2 . '><input type="radio" value="3" />3</label>
											<label' . $rateON_3 . '><input type="radio" value="4" />4</label>
											<label' . $rateON_4 . '><input type="radio" value="5" />5</label>
											 </p>
										</div>
										<a href="'. $v['url'] . '.html#review" class="amount-reviews">' . $count_r . ' отзыв(ов)</a> 
									</div>
									<div class="item other">' . $availability . '</div>
								</div>
								' . $hide_block . '
								<noindex>
									<div class="bottom-block">
										<a rel="nofollow" href="'. $v['url'] . '.html" class="btn-buy">Подробнее</a>
									</div>	
								</noindex>	
							</li>';
		}	
	}
	
		if(!empty($breadname_cat)){
			$breadName = array(
					array(
							'url'  => $category_info['url'],
							'name' => $category_info['name']),
						array(
							'name' => $name));
		}else{
			$breadName = $name;
		}
		
	$center_area = showtempl(dirname(__FILE__).'/templ/tpl_category.php');			
	
	unset($product_info,$img_info,$set_info,$char_info,$availability_info);		
}
else 
	$_GET['error'] = 404;