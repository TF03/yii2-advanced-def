<?php
error_reporting(0);

// замена больших букв на меленькие в url
$d=$_SERVER['REQUEST_URI'];
if (preg_match("/[A-Z]/",$d)){
	$str_url= mb_strtolower($d);
	header('HTTP/1.1 301 Moved Permanently');
	header('Location: '.$str_url);
	exit();
} 

require './core/index.php';