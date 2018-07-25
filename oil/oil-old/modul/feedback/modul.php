<?php
	$feedbackBlock = '';
	
	$sql = $db -> select('
		SELECT *
		FROM ' . DB_PREFIX . 'feedback
		ORDER by `sort` DESC
		LIMIT 3
	');
			
	if ($sql) {
		foreach ($sql as $feedback) {
			$feedbackBlock .= '
				<div class="col-md-4 text-center" data-lk-deletable="Отзыв 1">
					<img height="123" src="./uploaded/img/feedback/' . $feedback['id'] . '/' . $feedback['img'] . '" alt="">
					<h4>' . $feedback['name'] . '</h4>
					<p>' . $feedback['feedback'] . '</p>
				</div>';
		}
	}