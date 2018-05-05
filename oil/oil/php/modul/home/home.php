<?php
	/*$content = '';
	$optionForForm = array();
	$meta_title = 'KosmetoS';
	$meta_descr = 'KosmetoS';
	$meta_keyw = 'KosmetoS';
	
	$sql = $db -> select('
		SELECT *
		FROM ' . DB_PREFIX . 'complect
		WHERE `en` = 1');
			
	if ($sql) {
		$i = 1;
		foreach ($sql as $complect) {
			if ($i % 2) {
				$class = $afterNext = 'content-section-a';
				$nextClass = 'content-section-b';
			} else {
				$class = $afterNext = 'content-section-b';
				$nextClass = 'content-section-a';
			}
			
			if (!empty($complect['price'])) {
				$price = number_format($complect['price'], 0, '.', ' ');
			} else {
				$price = '';
			}
			
			$optionForForm[] = '<option value="' . $complect['id'] . '">' . $complect['title'] . '</option>';
			$content .= '
				<div class="' . $class . '">
					<div class="container">
						<div class="row">
							<h2 class="section-heading">' . $complect['title'] . '</h2>
							<hr class="section-heading-spacer">
							<div class="row short-text">
								<p>' . $complect['short_text'] . '</p>
							</div>
						</div>
						<div class="row product-complect">
							<div class="col-lg-3 col-sm-3 block-product">
								<img class="img-responsive" height="300" src="./uploaded/img/complect/' . $complect['id'] . '/' . $complect['item_1_img'] . '" alt="">
								<h3>' . $complect['item_1_title'] . '</h3>
								<p class="lead">' . $complect['item_1_short_text'] . '</p>
							</div>
							<div class="col-lg-3 col-sm-3 block-product">
								<img class="img-responsive" height="300" src="./uploaded/img/complect/' . $complect['id'] . '/' . $complect['item_2_img'] . '" alt="">
								<h3>' . $complect['item_2_title'] . '</h3>
								<p class="lead">' . $complect['item_2_short_text'] . '</p>
							</div>
							<div class="col-lg-3 col-sm-3 block-product">
								<img class="img-responsive" height="300" src="./uploaded/img/complect/' . $complect['id'] . '/' . $complect['item_3_img'] . '" alt="">
								<h3>' . $complect['item_3_title'] . '</h3>
								<p class="lead">' . $complect['item_3_short_text'] . '</p>
							</div>
						</div>
						<div class="row block-info">
							<div class="col-lg-5 col-sm-5 block-surprise">
								<img src="/img/surprise.png" width="100" height="100">
								<span class="surprise-text">В подарок&nbsp;&nbsp;&nbsp;&nbsp;<span class="surprise-red">' . $complect['present'] . '</span></span>
							</div>
							<div class="col-lg-5 col-sm-5 block-button">
								<button class="button-buy" type="submit" data-product="' . $complect['id'] . '">Купить за ' . $price . ' грн.</button>
							</div>
						</div>
					</div>
				</div>';
			
			++$i;
		}
	}
	$optionForForm = implode('', $optionForForm);*/