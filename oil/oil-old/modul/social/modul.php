<?php
	$socialBlock = '';
	
	$socialNetwork = $db->one_array('
		SELECT *
		FROM ' . DB_PREFIX . 'social
		WHERE `id` = 1
	');