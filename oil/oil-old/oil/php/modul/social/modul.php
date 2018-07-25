<?php
	$socialBlock = '';
	
	$sql = $db -> select('
		SELECT *
		FROM ' . DB_PREFIX . 'social
		WHERE `en` = 1
		ORDER by `sort` DESC
	');
			
	if ($sql) {
		foreach ($sql as $social) {
			$socialBlock .= '
			<li>
				<a href="' . $social['link'] . '" class="btn btn-default btn-lg" target="_blank"><i class="' . $social['iconClass'] . '"></i> <span class="network-name">' . $social['name'] . '</span></a>
			</li>';
		}
	}