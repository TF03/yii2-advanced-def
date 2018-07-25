<?php
include '../core/conf.php';
include '../core/core.php';
include '../core/db.php';
	
	$links = '
		<url>
			<loc>' . $site_url . '</loc>
			<changefreq>Daily</changefreq>
			<priority>1.0</priority>
		</url>
	';
	$url_cat = array();

	////////////////////////////////// ФИЛЬТРЫ
	$product = $db -> select('
					SELECT replace_url, data_for_sitemap  
					FROM ' . DB_PREFIX . 'shop_filter_replace  
					WHERE replace_url != "" 
					ORDER BY pid');
	foreach ($product as $k => $v) {
	$url_cat[] = $v['replace_url'];
		if (!$v['data_for_sitemap'])
			$v['data_for_sitemap'] = '2013-06-12T13:21:40+04:00';
		$v['replace_url'] = trim($v['replace_url'], '/');	
		
			$links .= '
				<url>
					<loc>' . $site_url . '/' . $v['replace_url'] . '/</loc>
					<lastmod>' . create_lastmod($v['data_for_sitemap']) . '</lastmod>
					<changefreq>Daily</changefreq>    
					<priority>0.8</priority>
				</url>
		';
	}
	
	////////////////////////////////// КАТЕГОРИИ
	$product = $db -> select('	
					SELECT url, data_for_sitemap
					FROM ' . DB_PREFIX . "shop_cat 
					WHERE en = 1 and url != '' and url != 'printer-all-in-one' 
					ORDER BY pid");
	foreach ($product as $k => $v) {
	
		
		
		$find_cat = strpos($v['url'],'.html');
		
		if($find_cat === false){
			$url = $site_url.'/'.$v['url'].'/';
		}
		else{
			$url = $site_url.'/'.$v['url'];
		}
		if (!in_array($v['url'], $url_cat))
		$links .= '
				<url>
					<loc>' . $url . '</loc>
					<lastmod>' . create_lastmod($v['data_for_sitemap']) . '</lastmod>
					<changefreq>Daily</changefreq>    
					<priority>0.8</priority>
				</url>
		';
	}
	unset($url_cat);

	////////////////////////////////// ТОВАРЫ
	$product = $db -> select("
					SELECT id_overview, url, data_for_sitemap
					FROM ".DB_PREFIX."shop_product 
					WHERE en=1 AND url NOT LIKE '%printer-all-in-one%'
					ORDER by sort DESC");

	foreach ($product as $k => $v) {

		$links .= '
				<url>
					<loc>' . $site_url . '/' . $v['url'] . '.html</loc>
					<lastmod>' . create_lastmod($v['data_for_sitemap']) . '</lastmod>
					<changefreq>Daily</changefreq>
					<priority>0.6</priority>    
				</url>
		';
		
		
	}

	//////////////////////////////////СТАТЬИ
	$product = $db -> select('
					SELECT url, data_for_sitemap
					FROM ' . DB_PREFIX . "article
					WHERE en=1 
					ORDER BY sort DESC");
	foreach ($product as $k => $v) {
	
		$links .= '
				<url>
					<loc>' . $site_url . '/articles/'.$v['url'].'</loc>
					<lastmod>'.create_lastmod($v['data_for_sitemap']).'</lastmod>
					<changefreq>Daily</changefreq>    
					<priority>0.4</priority>
				</url>
		';
	}

	//////////////////////////////////НОВОСТИ
	$product = $db -> select('
					SELECT url, data_for_sitemap
					FROM ' . DB_PREFIX . "news
					WHERE en=1 
					ORDER BY sort DESC");
	foreach ($product as $k => $v) {
	
		$links .= '
				<url>
					<loc>' . $site_url . '/news/'.$v['url'].'</loc>
					<lastmod>'.create_lastmod($v['data_for_sitemap']).'</lastmod>
					<changefreq>Daily</changefreq>    
					<priority>0.4</priority>
				</url>
		';
	}
	
	//////////////////////////////////Инструкции
	$product = $db -> select('
					SELECT url, data_for_sitemap
					FROM ' . DB_PREFIX . "instruction
					WHERE en=1 
					ORDER BY sort DESC");
	foreach ($product as $k => $v) {
	
		$links .= '
				<url>
					<loc>' . $site_url . '/instruction/'.$v['url'].'.html</loc>
					<lastmod>'.create_lastmod($v['data_for_sitemap']).'</lastmod>
					<changefreq>Daily</changefreq>    
					<priority>0.4</priority>
				</url>
		';
	}

	$links .= '<url>
				<loc>' . $site_url . '/sitemap.html</loc>
				</url>';
	  
	$content = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
	<urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\">
	".$links."
	</urlset>";



	$fp = fopen(SITE_PATH . 'sitemap.xml','w');
	if (fwrite($fp, $content)) {
	
		fclose($fp);
		JSRedirect('/admin/');
	}
	
	function create_lastmod ($lastMod) {
	
		$data = date('c');
		
		if(empty($lastMod))
			return $data;
		elseif(strstr($lastMod, ' '))
			return str_replace(' ', 'T', $lastMod) . '+04:00';
		else
			return $lastMod;
	}