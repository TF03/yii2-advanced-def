<?php

//чистка GET и POST
    function clearPostGet() {
		$_pattern = array('&', "'", '"', '<', '>', '\\');
		$_replacement = array('&amp;', '&#039;', '&quot;', '&lt;', '&gt;', '\\\\');
		$_GET = str_replace($_pattern, $_replacement, $_GET);
		$_POST = str_replace($_pattern, $_replacement, $_POST);
    }
	
// вывод шаблона
    function showtempl($t)
    {
        global $site_language;
        ob_start();
        include $t;
        return ob_get_clean();
    }

//////////// кеширование ///////////////////////

// читаем кешь есле есть возврашаем запись есле нет false
// параметры $k - ключь

    function cash_read($k)
    {

        $ret = false;
        //файл
        if (CASH == 1) {
            $file_cash = SITE_PATH . '/cash/' . $k . '.cash';
            $time_sec = time();
            $time_file = filemtime($file_cash);

            if ($time_file) {
                if ($time_file > $time_sec) {
                    $rHandle = fopen($file_cash, 'r');
                    $ret = fread($rHandle, filesize($file_cash));
                    fclose($rHandle);
                }
                else unlink($file_cash);
            }

        }
        if (CASH == 2) {
            global $memcache;
            $ret = $memcache->get($k);
        }

        return $ret;
    }

// пишем кешь 
// параметры $k - ключь, $t - время в секундах харанения $d - данные
    function cash_add($k, $t, $d)
    {
        if (CASH == 1) {
            $file_cash = SITE_PATH . '/cash/' . $k . '.cash';
            $time_sec = time() + $t;
            $rHandle = fopen($file_cash, 'w');
            fwrite($rHandle, $d);
            fclose($rHandle);
            chmod($file_cash, 0777);
            touch($file_cash, $time_sec);

        }
        if (CASH == 2) {
            global $memcache;
            $memcache->set($k, $d, false, $t);
        }
    }

// редирект
    function JSRedirect($url = '', $method = '')
    {

        if (empty($method)) {
            if (headers_sent())
                print "<script>location='$url';</script>";
            else header('location: ' . $url);
        }
        else {
            header('HTTP/1.1 ' . $method . ' Moved Permanently');
            header('Location: /' . $url);
            exit();
        }
    }


    function generate_password($number)
    {
        $arr = array ('a', 'b', 'c', 'd', 'e', 'f',
            'g', 'h', 'i', 'j', 'k', 'l',
            'm', 'n', 'o', 'p', 'r', 's',
            't', 'u', 'v', 'x', 'y', 'z',
            'A', 'B', 'C', 'D', 'E', 'F',
            'G', 'H', 'I', 'J', 'K', 'L',
            'M', 'N', 'O', 'P', 'R', 'S',
            'T', 'U', 'V', 'X', 'Y', 'Z',
            '1', '2', '3', '4', '5', '6',
            '7', '8', '9', '0',
            '!', '?', '&', '$',
            '+', '-');
        $pass = "";
        for ($i = 0; $i < $number; $i++) {
            $index = rand(0, count($arr) - 1);
            $pass .= $arr[$index];
        }
        return $pass;
    }


//изменяет размер картинки 
// src  - путь к файлу к-рый меняем
// dest - путь где будет новый файл       
    function img_resize($src, $dest, $width, $height, $rgb = 0xFFFFFF, $quality = 100)
    {
        if (!file_exists($src)) {
            return false;
        }

        $size = getimagesize($src);

        if ($size === false) {
            return false;
        }

        $format = strtolower(substr($size['mime'], strpos($size['mime'], '/') + 1));
        $icfunc = 'imagecreatefrom' . $format;

        if (!function_exists($icfunc)) {
            return false;
        }

        $x_ratio = $width / $size[0];
        $y_ratio = $height / $size[1];

        if ($height == 0) {

            $y_ratio = $x_ratio;
            $height = $y_ratio * $size[1];

        }
        elseif ($width == 0) {

            $x_ratio = $y_ratio;
            $width = $x_ratio * $size[0];

        }

        $ratio = min($x_ratio, $y_ratio);
        $use_x_ratio = ($x_ratio == $ratio);

        $new_width = $use_x_ratio ? $width : floor($size[0] * $ratio);
        $new_height = !$use_x_ratio ? $height : floor($size[1] * $ratio);
        $new_left = $use_x_ratio ? 0 : floor(($width - $new_width) / 2);
        $new_top = !$use_x_ratio ? 0 : floor(($height - $new_height) / 2);

        $isrc = $icfunc($src);
        $idest = imagecreatetruecolor($width, $height);

        imagefill($idest, 0, 0, $rgb);
        imagecopyresampled($idest, $isrc, $new_left, $new_top, 0, 0, $new_width, $new_height, $size[0], $size[1]);

        imagejpeg($idest, $dest, $quality);

        imagedestroy($isrc);
        imagedestroy($idest);

        return true;

    }

// обрезает строку по пробелу посл еуказаного символа и вырезает теги 
    function str_smoll($a, $b)
    {

        $search = array ("'<script[^>]*?>.*?</script>'si", // Вырезается javascript
            "'<[\/\!]*?[^<>]*?>'si", // Вырезаются html-тэги
            "'([\r\n])[\s]+'", // Вырезается пустое пространство
            "'&(quot|#34);'i", // Замещаются html-элементы
            "'&(amp|#38);'i",
            "'&(lt|#60);'i",
            "'&(gt|#62);'i",
            "'&(nbsp|#160);'i",
            "'&(iexcl|#161);'i",
            "'&(cent|#162);'i",
            "'&(pound|#163);'i",
            "'&(copy|#169);'i",
            "'&#(\d+);'e"); // вычисляется как php

        $replace = array ("",
            "",
            "\\1",
            "\"",
            "&",
            "<",
            ">",
            " ",
            chr(161),
            chr(162),
            chr(163),
            chr(169),
            "chr(\\1)");

        $text = preg_replace($search, $replace, $a);
        $text = trim($text);

        $aa = mb_strpos($text, " ", $b, "utf8");
        $zz = ' ...';
        if (!$aa) {
            $aa = $b;
        }

        if ($aa >= mb_strlen($text, "utf8") and $aa)
            $zz = '';


        $text = mb_substr($text, 0, $aa, "utf8") . $zz;


        return $text;
    }

//TODO: Jugene функция для получения всех id категории входящие в $i_cat - передается id категории
    function list_cat_id($i_cat, $t, $method = 'down')
    {
        if ($method == 'up')
            $i_cat = $i_cat . ',' . get_id_up($i_cat, $t);
        else
            $i_cat = $i_cat . ',' . get_id_down($i_cat, $t);
        $i_cat = preg_replace('#([,]+)#i', ',', $i_cat);
        $i_cat = trim($i_cat, ',');

        return $i_cat;

    }

    /**
     * @param $i_cat - id категории
     * @return string - список id категорий в глубь
     */
    function get_id_down($i_cat, $t)
    {

        global $db;
        $i_c = '';

        $i_pid = $db->select_id('SELECT `id` FROM ' . DB_PREFIX . $t . ' WHERE `pid`=' . $i_cat);
        if (!empty($i_pid)) {
            foreach ($i_pid as $key => $value) {

                $i_c .= $key . ',';
                $i_c .= get_id_down($key, $t) . ',';
            }
        }
        return $i_c;
    }

    /**
     * @param $i_cat - pid товара
     * @return string - список id категорий из глубины
     */
    function get_id_up($i_cat, $t)
    {

        global $db;
        $i_c = '';

        $i_pid = $db->one_data('SELECT `pid` FROM ' . DB_PREFIX . $t . ' WHERE `id`=' . $i_cat);
        if (!empty($i_pid) && $i_pid != 0) {

            $i_c .= $i_pid . ',';
            $i_c .= get_id_up($i_pid, $t) . ',';
        }
        return $i_c;
    }

    /**
     * function для экранирование спецсимволами
     * @param $data - данные
     * @param $method - метод экранирования (0 (по умолчанию) - простое экранирование, 1 - обратное)
     * @return mixed
     * стоит проверка на определние функции
     */
    if (!function_exists('ekranirovanie')) {
        function ekranirovanie($data, $method = 0)
        {
            $search = array ('<', '>', '"', '&', "'");
            $replace = array ('&lt;', '&gt;', '&quot;', '&amp;', '&#39;');
            if (!$method)
                $data = str_replace($search, $replace, $data);
            else
                $data = str_replace($replace, $search, $data);
            return $data;
        }
    }

//TODO: Jugene END!
//функция генерации номера заказа
    function incoder_id($name_tabl)
    {
        global $db;
        do {
            $r = rand(10000, 99999);
            $arr = str_split($r, 2);
            $str = 'KZ-' . $arr[0] . '-' . $arr[1] . $arr[2];
            $s = $db->one_data("SELECT COUNT(*) FROM " . DB_PREFIX . $name_tabl . " WHERE order_id='" . $str . "'");
        }
        while ($s);
        return $str;
    }
	
	
	// удаление всех файлов из указанной директории
function clearDir($path){ 
    if (substr($path, strlen($path)-1, 1) != '/') $path .= '/'; 
    if ($handle = @opendir($path)){ 
        while ($obj = readdir($handle)){ 
            if ( ($obj=='.') or ($obj=='..') ) continue; 
            if ( is_file($path.$obj) )  unlink($path.$obj); 
        }   
         closedir($handle); 
     } 
}

	//функция принимает дату и выдает нормальную дату
	function edit_date($date) {
		if ($date) {
			$date = explode('-', $date);
			$mas_mon=array('01' => 'января',
						   '02' => 'февраля',
						   '03' => 'марта',
						   '04' => 'апреля',
						   '05' => 'мая',
						   '06' => 'июня',
						   '07' => 'июля',
						   '08' => 'августа',
						   '09' => 'сентября',
						   '10' => 'октября',
						   '11' => 'ноября',
						   '12' => 'декабря');
			return $date[2] . ' ' . $mas_mon[$date[1]] . ' ' . $date[0] . 'г.';
		}
		else
			return false;
	}
	
/*
	функцыя пажинации 
	$all - всего записей,
	$pstr - записей на странице ,
	$lim - количесво стрниц в пажинации
*/
function paging ($all,$pstr,$lim){
	
	// количество страниц на каталоге
    $last = ceil($all/$pstr);

	// получаем номер текущей страницы
    if (strstr($_SERVER['REQUEST_URI'], '/page-')) {
		$page_now = explode('/page-', $_SERVER['REQUEST_URI']);
		$cur = (int) $page_now['1'];
	}
    else 
		$cur=1;
	
    if ($cur < 1 || $cur > $last)
		$cur=1;
		
		
    $sme = ceil($lim/2);
    $start = $cur - $sme;
    if (($start + $lim - 1) >= $last)
		$start = $last - $lim + 1;
    if ($start < 1)
		$start = 1;
   
	//собираем урл
	$url = crr_url(); 
	
	$razd = '';

	// пажинация для фильтров
	if (isset($_GET['filtr'])){
		$url_get='/?filtr='.$_GET['filtr'].';';
	}
	// пажинация для поиска
	if (isset($_GET['s'])){
		$url_get='/?s='.$_GET['s'];
	}
	
	
	// шаблон пажинации
	if ($last>1) {
		 		 
		$ret.='<ul >';
		// стрелка <--
		if ($cur > 1)
			$ret .= '<li><a href="' . purl($url, $razd, $cur - 1).$url_get.'">&laquo;</a></li>';  

		if ($last>1){
			for ($index = 1; $index <= $lim; $index++) {
				
				$url_get='';
				
				// фильтр
				if (isset($_GET['filtr'])){
					if($start==1)	
						$url_get='?filtr='.$_GET['filtr'].';';
					else	
						$url_get='/?filtr='.$_GET['filtr'].';';						
				}
				// поиск
				if (isset($_GET['s'])){
					if($start==1)	
						$url_get='?s='.$_GET['s'];
					else	
						$url_get='/?s='.$_GET['s'];						
				}
			
			
				if ($start<=$last)
					if ($start==$cur)
						// активная страница
						$ret.='<li class="active"><a>'.$start.'</a></li>';
					else
						// страница   
						$ret.='<li><a href="'.purl($url,$razd,$start).$url_get.'">'.$start.'</a></li>';
						
				$start++;
			}
		}
		
		// стрелка --> 
		
		if ($cur < $last)
			$ret .= '<li><a href="' . purl($url, $razd, $cur + 1).$url_get. '">&raquo;</a></li>';

		
		$ret.='</ul>'; 
	}

	$limit=($cur-1)*$pstr.','.$pstr;$end[0]=$ret;$end[1]=$limit;
	return $end;
}

function crr_url() {
	global $router,$route_file,$route_file_ext,$site_url;
  
	$url=$site_url.'/';

	foreach ($router as $v) {
		if ($v && !strstr($v, 'page-'))
			$url .= $v . '/';
	}
 
	if ($route_file)
		$url .= $route_file.'.'.$route_file_ext;

	return $url;
}

function purl($url,$razd,$n) {
	if ($n != 1)
		$url .= $razd . 'page-' . $n;
		
	return $url;
}	

/* end пажинацыя*/


// создает текуший урл + get параметр - значение
function cr_url_get ($kk,$vv){
 
    global $router,$site_url;
	
	$get=$_GET;
	
	unset ($get[$kk]);
	
	$url=$site_url.'/';
	$razd='?';
	
	foreach ($router as $v) {
		if($v)
			$url.=$v.'/';
	}
	
	if (count($get)>0){
		$url.='?';
		foreach ($get as $k=>$v) {
			$url .= $k.'='.$v.'&';
		} 
		$url=trim ($url,'&');
		$razd='&';
	} 

	if ($kk!='' and $vv)
		$url.=$razd.$kk.'='.$vv;
		
	return $url;
     
}

//Получение ip из заголовка и параметра X-Forwarded-For
function real_ip(){
	$global_header = getallheaders();

	if(!empty($global_header['X-Forwarded-For'])){
		$ip = explode(',',$global_header['X-Forwarded-For']);
		return $ip[0];
	}
	else
		return false;
}