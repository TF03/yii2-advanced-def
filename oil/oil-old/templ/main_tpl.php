<!DOCTYPE html>
<html lang="ru">
    <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Meta data -->
	<base href="<?='http://'.$_SERVER['HTTP_HOST']?>"/>
	<title><?=$GLOBALS['meta_title']?></title>
	<meta name="description" content="<?=$GLOBALS['meta_descr']?>" />
	<meta name="keywords" content="<?=$GLOBALS['meta_keyw']?>" />

	<!-- Final compiled and minified stylesheet -->
	<link rel="stylesheet" href="./_css/final.min.css">

	<?=$GLOBALS['headerScriptsHTML']?>
    </head>
    <body class="page">
	<!-- Mobile slide frame -->
	<div class="page__mobile" data-page-pushy-mobile="">

		<?=$GLOBALS['headMenuMobile']?>

	</div>
	<!-- Site background overlay when mobile menu is open -->
	<div class="page__overlay hidden" data-page-pushy-overlay=""></div>

	<!-- Main content frame -->
	<div class="page__body" data-page-pushy-container="">
		<div class="page__wrapper">
			<header class="page__hgroup">
			<!-- Top Headline -->
			<div class="page__headline hidden-xs hidden-sm">
				<div class="page__container">
					<div class="row row--ib row--ib-mid">

						<?=$GLOBALS['headMenu']?>

						<div class="col-md-6 clearfix">
							<div class="page__user-bar">
								<div class="user-panel">
									<?php if (!empty($GLOBALS['socialNetwork']['vk'])) { ?>
										<div class="user-panel__item">
											<a class="soc-groups__ico soc-groups__ico--vk" href="<?= $GLOBALS['socialNetwork']['vk']?>" target="_blank">
												<i class="fa fa-vk fa-lg"></i>
											</a>
										</div>
									<?php } ?>
									<?php if (!empty($GLOBALS['socialNetwork']['facebook'])) { ?>
										<div class="user-panel__item">
											<a class="soc-groups__ico soc-groups__ico--fb" href="<?= $GLOBALS['socialNetwork']['facebook']?>" target="_blank">
												<i class="fa fa-facebook fa-lg"></i>
											</a>
										</div>
									<?php } ?>
									<?php if (!empty($GLOBALS['socialNetwork']['twitter'])) { ?>
										<div class="user-panel__item">
											<a class="soc-groups__ico soc-groups__ico--tw" href="<?= $GLOBALS['socialNetwork']['twitter']?>" target="_blank">
												<i class="fa fa-twitter fa-lg"></i>
											</a>
										</div>
									<?php } ?>
									<?php if (!empty($GLOBALS['socialNetwork']['instagram'])) { ?>
										<div class="user-panel__item">
											<a class="soc-groups__ico soc-groups__ico--in" href="<?= $GLOBALS['socialNetwork']['instagram']?>" target="_blank">
												<i class="fa fa-instagram fa-lg"></i>
											</a>
										</div>
									<?php } ?>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Main Header -->
			<div class="page__header">
				<div class="page__container">
					<div class="row row--ib row--ib-mid">
						<!-- Hamburger menu -->
						<div class="col-xs-3 visible-xs-inline-block visible-sm-inline-block">
							<button class="svg--hamburger svg--hamburger-close" data-page-mobile-btn="">
								<svg id="Layer_1" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 22 18">
									<path class="cls-1" d="M12,9H34v4H12V9Z" transform="translate(-12 -9)"></path>
									<path class="cls-1" d="M12,16H34v4H12V16Z" transform="translate(-12 -9)"></path>
									<path class="cls-1" d="M12,23H34v4H12V23Z" transform="translate(-12 -9)"></path>
								</svg>
							</button>
							<button class="svg--hamburger svg--hamburger-open hidden" data-page-mobile-btn="">
								<svg id="Layer_1" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 7 7">
									<path class="cls-1" d="M899.84,838.15a0.56,0.56,0,0,1,.78.06l5.89,5.89a0.52,0.52,0,1,1-.72.72l-5.89-5.89A0.56,0.56,0,0,1,899.84,838.15Z" transform="translate(-899.69 -838.02)"></path>
									<path class="cls-1" d="M906.55,838.15a0.56,0.56,0,0,0-.78.06l-5.89,5.89a0.52,0.52,0,1,0,.72.72l5.89-5.89A0.56,0.56,0,0,0,906.55,838.15Z" transform="translate(-899.69 -838.02)"></path>
								</svg>
							</button>
						</div>
						<!-- Logo -->
						<div class="col-xs-6 col-md-3 col-lg-2 col--align-center col--align-left-md">
							<a href="">
								<img src="./_img/logo.png" alt="Unishop - Бесплатный интернет магазин онлайн покупок">
							</a>
						</div>
						<!-- Phones and call-back -->
						<div class="col-md-3 col-lg-2 col-md-push-5 col-lg-push-4 hidden-xs hidden-sm">
							<div class="site-info">
								<div class="site-info__aside hidden-xs">
									<div class="site-info__ico site-info__ico--phone-big">
										<svg id="Layer_1" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32">
											<path d="M303,881a7.33,7.33,0,0,1-2.45-.42,33.71,33.71,0,0,1-20.71-21.25,7.35,7.35,0,0,1,2.53-8.1L284,850a5,5,0,0,1,7.48,1.69l2.67,5.18a3.49,3.49,0,0,1-.53,4l-0.55.6a2,2,0,0,0-.3,2.21,9.45,9.45,0,0,0,4.09,4.09,2,2,0,0,0,2.21-.3l0.61-.55a3.56,3.56,0,0,1,4-.54l5.18,2.66a5,5,0,0,1,1.28,8l-1.8,1.82A7.4,7.4,0,0,1,303,881Zm-16-29a2,2,0,0,0-1.21.41l-1.58,1.2a4.35,4.35,0,0,0-1.5,4.8,30.69,30.69,0,0,0,18.85,19.35,4.44,4.44,0,0,0,4.55-1l1.8-1.82a2,2,0,0,0-.51-3.18L302.22,869a0.54,0.54,0,0,0-.56.08l-0.61.56a5,5,0,0,1-5.62.75,12.42,12.42,0,0,1-5.38-5.38,5,5,0,0,1,.75-5.61l0.55-.6a0.49,0.49,0,0,0,.08-0.56l-2.67-5.18A2,2,0,0,0,287,852Z" transform="translate(-279.5 -849)"></path>
										</svg>
									</div>
								</div>
								<div class="site-info__inner">
									<div class="site-info__title">
										<?php if (!empty($GLOBALS['settingsSite']['phone1'])) { ?>
											<?= $GLOBALS['settingsSite']['phone1']?>
										<?php } ?> <br>
										<?php if (!empty($GLOBALS['settingsSite']['phone2'])) { ?>
											<?= $GLOBALS['settingsSite']['phone2']?>
										<?php } ?>
									</div>
									<!--div class="site-info__desc">
										<a class="site-info__link" href="" data-modal="callbacks_modal">Обратный звонок</a>
									</div-->
								</div>
							</div>
						</div>
						<!-- Schedule -->
						<div class="col-lg-2 col-lg-push-4 hidden-xs hidden-sm hidden-md">
							<div class="site-info">
								<div class="site-info__aside hidden-xs">
									<div class="site-info__ico site-info__ico--clock-big">
										<svg id="Layer_1" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 36 36">
											<path class="cls-1" d="M359.5,845a18,18,0,1,0,18,18A18,18,0,0,0,359.5,845Zm0,32a14,14,0,1,1,14-14A14,14,0,0,1,359.5,877Z" transform="translate(-341.5 -845)"></path>
											<path class="cls-1" d="M358.23,855h1.66l0.67,10-3.07.05Z" transform="translate(-341.5 -845)"></path>
											<path class="cls-1" d="M357.63,864.87l1.7-2.64,6.14,5.12-0.62,1.36Z" transform="translate(-341.5 -845)"></path>
										</svg>
									</div>
								</div>
								<div class="site-info__inner">
									<div class="site-info__desc">
										<?php if (!empty($GLOBALS['settingsSite']['time_work'])) { ?>
											<?= $GLOBALS['settingsSite']['time_work']?>
										<?php } ?>
									</div>
								</div>
							</div>
						</div>
						<!-- Cart -->
						<div class="col-xs-3 col-md-1 col-lg-2 col-md-push-5 col-lg-push-4 clearfix">
							<div class="pull-right" data-ajax-inject="cart-header">
								<div class="cart-header">
									<div class="cart-header__aside">
										<a class="cart-header__ico  cart-header__ico--empty " href="" data-modal="includes/cart/cart_modal">
											<svg id="Layer_1" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 35 32">
												<path class="cls-1" d="M442.23,858.26l-6,13A3,3,0,0,1,433.5,873h-19a3,3,0,0,1-3-3V855.12l-3.56-3.56a1.5,1.5,0,1,1,2.12-2.12l4.56,4.56H439.5A3,3,0,0,1,442.23,858.26ZM414.5,870h19l3.69-8H414.5v8Zm25-13h-25v2h24.08l0.92-2h0Zm-24,18a3,3,0,1,1-3,3A3,3,0,0,1,415.5,875Zm16,0a3,3,0,1,1-3,3A3,3,0,0,1,431.5,875Z" transform="translate(-407.5 -849)"></path>
											</svg>
											<span class="cart-header__badge hidden-lg">0</span>
										</a>
									</div>
									<div class="cart-header__inner visible-lg">
										<div class="cart-header__title">
											<a class="cart-header__link  cart-header__link--empty " href="" data-modal="includes/cart/cart_modal">Корзина</a>
										</div>
										<div class="cart-header__desc">Пуста</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<?= $GLOBALS['mainCategoryMenuBlock']; ?>

			<?= isset($GLOBALS['mainBannerBlock']) ? $GLOBALS['mainBannerBlock'] : ''?>
			</header>

			<!-- Bread Crumbs -->
			<?php if (!empty($GLOBALS['breadcrumbsContent'])) { ?>
				<div class="page__breadcrumbs">
					<div class="page__container">
						<ul class="breadcrumbs" xmlns:v="http://rdf.data-vocabulary.org/#">
							<?php echo $GLOBALS['breadcrumbsContent'];?>
						</ul>
					</div>
				</div>
			<?php } ?>
			<div class="page__content">

				<?= $GLOBALS['mainBlockContainer']; ?>

			</div>
		</div>
		<!-- Footer -->
		<footer class="page__fgroup">
			<div class="page__container">
				<?php if (isset($GLOBALS['seo_text']) && !empty($GLOBALS['seo_text'])) { ?>
				<div class="page__seo-text">
					<div class="typo typo--seo">
						<?= $GLOBALS['seo_text'] ?>
					</div>
				</div>
				<?php } ?>
				<div class="page__footer">
					<div class="page__container">
						<div class="footer">  
							<div class="row">
								<div class="col-xs-6 col-sm-3">
									<div class="footer__title">Каталог</div>
									<div class="footer__inner">
										<ul class="footer__items">
											<li class="footer__item">
												<a class="footer__link" href="">Электроника</a>
											</li>
											<li class="footer__item">
												<a class="footer__link" href="">Мебель</a>
											</li>
											<li class="footer__item">
												<a class="footer__link" href="">Спортивные товары</a>
											</li>
											<li class="footer__item">
												<a class="footer__link" href="">Дом и сад</a>
											</li>
											<li class="footer__item">
												<a class="footer__link" href="">Детские товары</a>
											</li>
											<li class="footer__item">
												<a class="footer__link" href="">Одежда</a>
											</li>
										</ul>         
									</div>
								</div>
								<div class="col-xs-6 col-sm-3">
									<div class="footer__title">Магазин</div>
									<div class="footer__inner">
										<ul class="footer__items">
											<li class="footer__item">
												<a class="footer__link" href="" target="_self">О компании</a>
											</li>
											<li class="footer__item">
												<a class="footer__link" href="" target="_self">Доставка и оплата</a>
											</li>
											<li class="footer__item">
												<a class="footer__link" href="" target="_self">Клиенты о нас</a>
											</li>
											<li class="footer__item">
												<a class="footer__link" href="" target="_self">Блог</a>
											</li>
											<li class="footer__item">
												<a class="footer__link" href="" target="_self">Галерея</a>
											</li>
											<li class="footer__item">
												<a class="footer__link" href="" target="_self">Бренды</a>
											</li>
											<li class="footer__item">
												<a class="footer__link" href="" target="_self">Контакты</a>
											</li>
										</ul> 
									</div>
								</div>
								<div class="clearfix visible-xs"></div>
								<div class="col-xs-6 col-sm-3 col--spacer-xs">
									<div class="footer__title">Пользователь</div>
										<div class="footer__inner">
											<ul class="footer__items">
												<li class="footer__item">
													<a class="footer__link" href="" data-modal="callbacks_modal">Обратный звонок</a>
												</li>
											</ul>
										</div>
									</div>
									<div class="col-xs-6 col-sm-3 col--spacer-xs">
										<div class="footer__title">Контакты</div>
										<div class="footer__inner">
											<ul class="footer__items">
												<?php if (!empty($GLOBALS['settingsSite']['phone1'])) { ?>
													<li class="footer__item"><?= $GLOBALS['settingsSite']['phone1']?></li>
												<?php } ?>
												<?php if (!empty($GLOBALS['settingsSite']['phone2'])) { ?>
													<li class="footer__item"><?= $GLOBALS['settingsSite']['phone2']?></li>
												<?php } ?>
												<?php if (!empty($GLOBALS['settingsSite']['email'])) { ?>
													<li class="footer__item"><?= $GLOBALS['settingsSite']['email']?></li>
												<?php } ?>
											</ul>
										</div>
									<div class="footer__inner">
										<div class="soc-groups">
											<?php if (!empty($GLOBALS['socialNetwork']['vk'])) { ?>
												<a class="soc-groups__ico soc-groups__ico--vk" href="<?= $GLOBALS['socialNetwork']['vk']?>" target="_blank">
													<i class="fa fa-vk fa-lg"></i>
												</a>
											<?php } ?>
											<?php if (!empty($GLOBALS['socialNetwork']['facebook'])) { ?>
												<a class="soc-groups__ico soc-groups__ico--fb" href="<?= $GLOBALS['socialNetwork']['facebook']?>" target="_blank">
													<i class="fa fa-facebook fa-lg"></i>
												</a>
											<?php } ?>
											<?php if (!empty($GLOBALS['socialNetwork']['twitter'])) { ?>
												<a class="soc-groups__ico soc-groups__ico--tw" href="<?= $GLOBALS['socialNetwork']['twitter']?>" target="_blank">
													<i class="fa fa-twitter fa-lg"></i>
												</a>
											<?php } ?>
											<?php if (!empty($GLOBALS['socialNetwork']['instagram'])) { ?>
												<a class="soc-groups__ico soc-groups__ico--in" href="<?= $GLOBALS['socialNetwork']['instagram']?>" target="_blank">
													<i class="fa fa-instagram fa-lg"></i>
												</a>
											<?php } ?>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="page__basement">
					<div class="page__container">
						<div class="basement"> 
							<div class="row row--ib row--ib-mid">
								<div class="col-xs-12 col-sm-6 col--align-left-sm col--spacer-xs">© 2015-2016, Интернет-магазин. Все права защищены.</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</footer>
	</div>

	<?=$GLOBALS['footerScriptsHTML']?>

	<!-- Final compiled and minified JS -->
	<script type="text/javascript" src="./_js/vendor.min.js"></script>
	<script type="text/javascript" src="./_js/final.min.js"></script>
	<script type="text/javascript" src="./_js/physical_pages.js"></script>
	</body>
</html>