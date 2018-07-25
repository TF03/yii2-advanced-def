<?php
    $router = trim($_SERVER['REQUEST_URI'], '/');

    //----------------- разбиваем полученный урл ----------------- 
    $router = explode('?', $router); //отделяем динамику
    $router = $router[0];

    $router = explode('/', $router); //разбиваем по слешам

    $last_route = count($router) - 1;

    if (stripos($router[$last_route], '.')) { // если в конце пути указан файл
        $last_route = array_pop($router);
        $route_file = explode('.', $last_route);
        $route_file_ext = $route_file[1]; //расширение файла
        $route_file = $route_file[0]; //имя файла
    }
    // патчик
    if ($router[(count($router) - 1)] == '')
        unset ($router[(count($router) - 1)]);
    $router_str = implode('/', $router); //строка пути
    //----------------- конец ----------------- 

    ////////////////ниже правила для сайта ////////////////////////////////////////////////////////////////

	$template = 'main_tpl';
	//модуль поиска
	if (!empty($_GET['s'])){
		$_GET['s']=trim($_GET['s']);
		if ($_GET['s']!='Поиск'){
			$modul = 'search'; 
			$file = 'search';
			$template = 'other_page_tpl';
		}
	}

	// для стартовой страниц
	else if ($router_str == '' && empty($route_file)) {
		$modul = 'home';
		$file = 'home';
	}

	// для модуля новостей сайта
	else if ($router[0] == 'news') {
		$modul = 'news';
		$file = 'news';
		if ($route_file_ext == 'html')
			$file = 'news_page';
	}

	// для статических страниц
	else if($route_file_ext == 'html' && empty($router_str)){
		$modul = 'page';
		$file = 'page';
		//$template = 'other_page_tpl';
	}

	// для каталога и стр товара
	else if (isset($router[0]) || (isset($router[0]) && isset($router[1]))) {
		if ($route_file_ext == 'html') {
			$modul = 'shop';
			$file = 'product';
			//$template = 'other_page_tpl';
		}
		else if (!substr_count($_SERVER['REQUEST_URI'],'.html')){
			$modul = 'shop_category';
			$file = 'category';
			//$template = 'other_page_tpl';
		}
	}
	

	
