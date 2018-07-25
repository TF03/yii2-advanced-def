<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Jugene
 * Date: 04.02.14
 * Time: 11:47
 * To change this template use File | Settings | File Templates.
 */
//  Валидация для типа INT
function validInt ($int) {
	
	if(!preg_match("/^[\d]+$/", $int))
		return false;
	else
		return true;
}

//  Валидация для типа FLOAT
function validFloat ($float) {
	
	if(!preg_match("/^[\d]+.[\d]+$/", $float))
		return false;
	else
		return true;
}

//  Валидация для типа ONLYTEXT
function validOnlytext ($onlytext) {
	
	if(!preg_match("/^((?>\pL\pM*)| )+$/u", $onlytext))
		return false;
	else
		return true;
}

//  Валидация для типа TEXT
function validText ($text) {
	
	if(!preg_match("/^((?>\pL\pM*)|[\d]| )+$/u", $text))
		return false;
	else
		return true;
}

//  Валидация для типа PHONE
function validPhone ($phone) {
	
	if(!preg_match("/^([\+][0-9]{1,3}[ \.\-])?([\(]{1}[0-9]{2,6}[\)])?([0-9 \.\-\/]{3,20})((x|ext|extension)[ ]?[0-9]{1,4})?$/", $phone))
		return false;
	else
		return true;
}

//  Валидация для типа EMAIL
function validEmail ($email) {
	
	if(!preg_match("/^(\S+)@([a-z0-9-]+)(\.)([a-z]{2,4})(\.?)([a-z]{0,4})+$/", $email))
		return false;
	else
		return true;
}