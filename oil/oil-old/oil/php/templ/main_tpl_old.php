<!DOCTYPE html>
<html> 
    <head>	
        <title><?=$GLOBALS['meta_title']?></title>			
		<base href="<?='http://'.$_SERVER['HTTP_HOST']?>"/>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="description" content="<?=$GLOBALS['meta_descr']?>" />
		<meta name="keywords" content="<?=$GLOBALS['meta_keyw']?>" />
		<meta name='yandex-verification' content='42b3a0d2869ac3ae' />
		
		<link href="./css/reset.css"   media="screen" rel="stylesheet" type="text/css" />
        <link href="./css/all.css"   media="screen" rel="stylesheet" type="text/css" />
        <link href="./css/jquery.formstyler.css"   media="screen" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="./css/jquery.bxslider.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="./css/jquery-ui-1.10.4.custom.css" type="text/css" media="screen" />
        <link href="./css/pro-css.css"   media="screen" rel="stylesheet" type="text/css" />
        
		<script src="http://code.jquery.com/jquery-1.9.1.min.js" type="text/javascript" ></script>
        
		<link href='./css/jquery.rating.css' type="text/css" rel="stylesheet"/>
        <script type="text/javascript"  src="./js/hoverintent.js"></script>        
        <script type="text/javascript"  src="./js/jquery-ui-1.10.4.custom.min.js"></script>        
        <script type="text/javascript"  src="./js/main.js"></script> 
        <script type="text/javascript"  src="./js/hide_link.js"></script>   

		<!-- lib ajax-->
        <script type="text/javascript"  src="./js/ajax_for_site.js"></script>        

		<?=$GLOBALS['headerScriptsHTML'];?>   
    </head>
    <body>
	 <?=$GLOBALS['callback_hun']?>
        <div class="main_wrapper">
            <div  id="scroll" class="clearfix">   
                <div  class="body scroll_body">
				
					<?=$GLOBALS['callback_button'];?>                    
					
                    <div class="comparison_pan">
					
						<?=$GLOBALS['comparison_header']?>
						
                    </div>
					
                    <div class="basket_pan">
							
						<?=$GLOBALS['basket_header']?>
						
                    </div>
                </div>
            </div>
            <div class="wrapper body">
                <div id="content" class="body clearfix ">
                    <div class="content_main clearfix ">
                        <article class="seo_main_page_content">
							<?=$GLOBALS['center_area'];?>
						</article>
                        <div class="banner_content">
                            <div class="banner_tabs">

                                <div id="tab1" class="tab active banner_slider_wrapp">
                                    <?= $GLOBALS['banner_main']; ?>
                                </div>
								<?= $GLOBALS['tab_product_main']; ?>
                                <div class="banner_tabs_titles">
                                    <ul class="tabs_list">
                                        <li class="active active1"><a class="tab_a active" href="#tab1">Акции</a></li>
										<?= $GLOBALS['tabA_main']; ?>
                                    </ul>
                                </div>
                            </div>

                        </div>
                        <aside class="right_sidebar">
                            
							<?= $GLOBALS['video_right'];?> <!-- Video -->
							
                            <?= $GLOBALS['reviews_right'];?> <!-- Reviews site -->
							
                            <div class="soc-tabs single_sidebar_content clearfix">
                                <ul>
                                    <li class="vk select"><a href="#vk"></a>
                                    <li class="fb"><a href="#fb"></a>
                                    <li class="tw"><a href="#tw"></a>
                                </ul>
                                <div id="vk">
                                    <!--<script type="text/javascript" src="http://userapi.com/js/api/openapi.js?49"></script>-->
                                    <!-- VK Widget -->
                                    <div id="vk_groups"></div>
                                    <script type="text/javascript">
                                        VK.Widgets.Group("vk_groups", {mode: 0, width: "300", height: "360", color3: "31859c"}, 4468830);
                                    </script>
                                </div>
                                <div id="fb">
                                    <div class="fb-like-box" data-href="http://www.facebook.com/inksystem.biz" data-width="300" data-height="360" data-show-faces="true" data-stream="false" data-header="false"  data-border-color="#ffffff"></div>
                                    <div id="fb-root"></div>
                                    <script>(function(d, s, id) {
                                            var js, fjs = d.getElementsByTagName(s)[0];
                                            if (d.getElementById(id))
                                                return;
                                            js = d.createElement(s);
                                            js.id = id;
                                            js.src = "//connect.facebook.net/ru_RU/all.js#xfbml=1";
                                            fjs.parentNode.insertBefore(js, fjs);
                                        }(document, 'script', 'facebook-jssdk'));</script>
                                </div>
								<div id="tw" style="width:300px; background-color:#4CB4FF;">
									<a class="twitter-timeline" href="https://twitter.com/search?q=inksystembiz" data-widget-id="346996025598291968" width="300" height="360" lang="RU">Твиты о "inksystembiz"</a>
									<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
								</div>
                            </div>
							
                            <?= $GLOBALS['news_right'];?> <!-- Reviews site -->
							
                        </aside>
                    </div>
                </div>
                <header id="header" class="clearfix ">
                    <div  class="body clearfix ">
                        <div class="header_main_info clearfix">
                            <div class="header_info_left">
                                <div itemscope="" itemtype="http://schema.org/Organization" class="logo">
                                    <a itemprop="url" href="/">
                                        <img itemprop="logo" src="img/logo.png">
                                    </a>
                                </div>
                                <div class="header_top_menu_search">
                                    
									<!-- Меню вспомогательноу -->
									<?=$GLOBALS['menu_help_head']?>
									
									<!-- Форма поиска -->
                                    <?=$GLOBALS['block_search'];?>
                                </div>
                            </div>
                            <div class="header_contact_info">
                                <!-- Выбор локации -->
								<?= $GLOBALS['block_contact']?>
								<!-- Выбор валюты -->
								<?=$GLOBALS['block_valuta'];?>
                            </div>
							
                            <!-- Блок с телефонами -->
                            <?=$GLOBALS['block_tel'];?>
							
                            <div class="social_icons">
                                <ul>
                                    <li><a href="http://vkontakte.ru/inksystem" target="_blank" class="vk"></a></li>
                                    <li><a href="http://www.facebook.com/inksystem.biz" target="_blank" class="facebook"></a></li> 
                                    <li><a href="http://www.youtube.com/inksystembiz" target="_blank" class="youtube"></a></li>
                                </ul>
                            </div>
                        </div>
                        
						<!-- Main menu -->
						<?=$GLOBALS['main_menu'];?>
						
                    </div>
                </header>
            </div>
            <footer id="footer" class="clearfix">
				<div class="footer_top clearfix">
					<div class="footer_body body  clearfix" >
						<div class="dealer_network_main body clearfix">
							<div class="dealer_network">
								<span class="dealer_network_title">Дилерская сеть</span>  <span class="dealer_network_title_name">INKSYSTEM</span>
								<p>247 городов</p>
								<p>23 страны мира</p>							
								<a href="dealer-network/" class="all_countries">Смотреть все страны</a>
							</div>
							
							<!-- diller network -->
							<?=$GLOBALS['dealer_network'];?>
							
							<div class="become_dealer">
								<span class="dealer_network_title">Стать дилером</span>
								<ul>
									<?=$GLOBALS['menu_footer'];?>
									<li><a href="/diller.html"  class="all_countries">Стать партнером</a></li>
									<li><a href="sitemap.html">Карта сайта</a></li>
									<li><a href="https://plus.google.com/108706260971570755437/?rel=author">Профиль +1</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
            </footer>
        </div>
		<div id="fade"></div>
        <div id="fade2"></div>
		
		<?=$GLOBALS['callback_popup'];?>
		
       
        <div class="popup_compare popup">
        </div>
        <div id="basket_popup" class="popup basket_popup">
        </div>
        <script type="text/javascript"  src="./js/jquery.formstyler.js"></script>      
        <script type="text/javascript"  src="./js/pixastic.core.js"></script>    
        <script type="text/javascript"  src="./js/acions/blurfast.js"></script>    
        <script type="text/javascript"  src="./js/pixastic.jquery.js"></script>    
        <script type="text/javascript"  src="./js/jquery.bxslider.min.js"></script>      
        <script src='./js/jquery.rating.pack.js' type="text/javascript" language="javascript"></script>
        <script  type="text/javascript">
                                    (function($) {
                                        $(function() {
                                            $('.change_currency>select').styler();
                                        });
                                    })(jQuery);
                                    (function() {
                                        $(':radio.rate_stars').rating();
                                    })(jQuery);
        </script>
        
		<link type="text/css" href="./css/validationEngine.jquery.css" rel="stylesheet">
        <script type="text/javascript" src="./js/jquery.validationEngine-ru.js"></script>
        <script type="text/javascript" src="./js/jquery.validationEngine.js"></script>
        <script  type="text/javascript">
        $('form').validationEngine({
			scroll:false
		}); 
        </script>
		<?=$GLOBALS['footerScriptsHTML'];?> 
    </body>
</html>