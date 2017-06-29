<?php
	$headMenu = '<div class="col-md-6">
					<div class="page__top-menu">
						<nav class="list-nav">
							<ul class="list-nav__items">';
	$headMenuMobile = '
		<nav class="mobile-nav" data-mobile-nav="">
			<ul class="mobile-nav__list" data-mobile-nav-list="">';
	
	$sql = $db->select('
		SELECT *
		FROM ' . DB_PREFIX . 'menu_head
		WHERE `en` = 1 AND `pid` = "0"
		ORDER by `sort` ASC
	');
			
	if ($sql) {
		foreach ($sql as $menu) {
			$pidProducts = $db->select('
					SELECT *
					FROM ' . DB_PREFIX . 'menu_head
					WHERE `en` = 1 AND `pid` = "' . $menu['id'] . '"
					ORDER by `sort` ASC
				');
			if(!empty($pidProducts)) {
				$pidProductHtml = $pidProductHtmlMobile = '';
				foreach ($pidProducts as $pidProduct) {
					$pidProductHtmlMobile .= '
								<li class="mobile-nav__item" data-mobile-nav-item="">
									<a class="mobile-nav__link" href="' . $pidProduct['url'] . '">' . $pidProduct['name'] . ' </a>
								</li>';
					$pidProductHtml .= '
								<li class="overlay__item">
									<a class="overlay__link" href="' . $pidProduct['url'] . '" target="_self">' . $pidProduct['name'] . '</a>
								</li>';
				}
				$headMenuMobile .= '
							<li class="mobile-nav__item" data-mobile-nav-item="">
								<a class="mobile-nav__link" href="' . $menu['url'] . '" data-mobile-nav-link="">' . $menu['name'] . '
									<span class="mobile-nav__has-children">
										<i class="mobile-nav__ico"></i>
									</span>
								</a>
								<ul class="mobile-nav__list mobile-nav__list--drop hidden" data-mobile-nav-list="">
									<li class="mobile-nav__item" data-mobile-nav-item="">
										<button class="mobile-nav__link mobile-nav__link--go-back" data-mobile-nav-go-back="">Назад
											<span class="mobile-nav__has-children">
												<i class="mobile-nav__ico"></i>
											</span>
										</button>
									</li>
									<!--li class="mobile-nav__item" data-mobile-nav-item="">
										<a class="mobile-nav__link mobile-nav__link--view-all" href="">Смотреть все</a>
									</li-->
								' . $pidProductHtmlMobile . '
								</ul>
							</li>';
				$headMenu .= '
					<li class="list-nav__item">
						<a class="list-nav__link" href="' . $menu['link'] . '" target="_self">' . $menu['name'] . '<i class="list-nav__arrow list-nav__arrow--down">
							<svg id="Layer_1" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 11.99 8">
								<path class="cls-1" d="M708.83,783.39l5.88,5.71L712.9,791,707,785.29a1.27,1.27,0,0,1,.08-1.73A1.36,1.36,0,0,1,708.83,783.39Z" transform="translate(-706.7 -783)"></path>
								<path class="cls-1" d="M718.51,785l-5.61,6L711,789.18l5.61-6a1.79,1.79,0,0,1,1.75.12A1.67,1.67,0,0,1,718.51,785Z" transform="translate(-706.7 -783)"></path>
							</svg>
						</i></a>
						<nav class="list-nav__drop">
							<ul class="overlay">
								' . $pidProductHtml . '
							</ul>
						</nav>
					</li>';
			} else {
				$headMenuMobile .= '
							<li class="mobile-nav__item" data-mobile-nav-item="">
								<a class="mobile-nav__link" href="' . $menu['link'] . '" target="_self">' . $menu['name'] . '</a>
							</li>';
				$headMenu .= '
					<li class="list-nav__item">
						<a class="list-nav__link" href="' . $menu['link'] . '" target="_self">' . $menu['name'] . '</a>
					</li>';
			}
		}
	}
	$headMenu .= '
							</ul>
						</nav>
					</div>
				</div>   ';
	$headMenuMobile .= '
			</ul>
		</nav>';