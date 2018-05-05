<?php

$breadcrumbsContent = '';
if($modul != 'home' && $file != 'home') {
	if(is_array($breadNames)) {
		foreach($breadNames as $k=>$v) {
		
			if(!empty($v['url'])) {
				$br .= '<li class="breadcrumbs__item" typeof="v:Breadcrumb">
							<a class="breadcrumbs__link" href="' . $v['url'] . '" rel="v:url" property="v:title">
								' . $v['name'] . '
							</a>
						</li>';
			} else {
				$br .= '
						<li class="breadcrumbs__item hidden-xs hidden-sm" typeof="v:Breadcrumb" rel="v:url nofollow" property="v:title">
							' . $v['name'] . '
						</li>';
			}
		}
		$breadcrumbsContent = '
						<li class="breadcrumbs__item" typeof="v:Breadcrumb">
							<a class="breadcrumbs__link" href="http://demoshop.imagecms.net/" rel="v:url" property="v:title">Главная</a>
						</li>
						' . trim($br, ' &raquo;') . '';
	} else {
		$breadcrumbsContent = '
						<li class="breadcrumbs__item" typeof="v:Breadcrumb">
							<a class="breadcrumbs__link" href="http://demoshop.imagecms.net/" rel="v:url" property="v:title">Главная</a>
						</li>
						<li class="breadcrumbs__item hidden-xs hidden-sm" typeof="v:Breadcrumb" rel="v:url nofollow" property="v:title">
							' . $breadNames . '
						</li>';
	}
}