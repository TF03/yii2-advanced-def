<?php
	if (isset($_POST['buyPr'])) {
		$products = implode(',', $_POST['products']);
		$email = $_POST['email'];
		$name = $_POST['name'];
		$phone = $_POST['phone'];
		
		
		$db->execute('INSERT '.DB_PREFIX. 'order SET 
			`products`="'.$products.'", 
			`email`="'.$email.'", 
			`name`="'.$name.'", 
			`phone`="'.$phone.'"
		');
	}