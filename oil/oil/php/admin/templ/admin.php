<!doctype html public "✰">
<!--[if lt IE 7]>
<html lang = "en-us" class = "no-js ie6"> <![endif]-->
<!--[if IE 7]>
<html lang = "en-us" class = "no-js ie7"> <![endif]-->
<!--[if IE 8]>
<html lang = "en-us" class = "no-js ie8"> <![endif]-->
<!--[if IE 9]>
<html lang = "en-us" class = "no-js ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html lang = "en-us" class = "no-js"> <!--<![endif]-->
<head>
    <meta charset = "utf-8">
    <title>Tortoise</title>
    <meta name = "description" content = "Tortoise">
    <meta name = "author" content = "Tortoise">

    <!-- iPhone, iPad and Android specific settings -->
    <meta name = "viewport" content = "width=device-width, initial-scale=1, maximum-scale=1">
    <meta name = "apple-mobile-web-app-capable" content = "yes" />
    <meta name = "apple-mobile-web-app-status-bar-style" content = "black-translucent" />

    <link href = "images/interface/iOS_icon.png" rel = "apple-touch-icon">
    <!-- Styles -->
	<link rel="stylesheet" href="styles/nestable/nestable.css">
    <link rel = "stylesheet" href = "styles/adminica/reset.css">
    <link rel = "stylesheet" href = "styles/other/other.css">

    <!-- NOTE: The following css files have been combined and minified into plugins.css
    <link rel="stylesheet" href="styles/plugins/colorpicker/colorpicker.css">
    <link rel="stylesheet" href="styles/plugins/datatables/datatables.css">
    <link rel="stylesheet" href="styles/plugins/elfinder/elfinder.css">
    <link rel="stylesheet" href="styles/plugins/fancybox/fancybox.css">
    <link rel="stylesheet" href="styles/plugins/fullcalendar/fullcalendar.css">
    <link rel="stylesheet" href="styles/plugins/isotope/isotope.css">
    <link rel="stylesheet" href="styles/plugins/multiselect/multiselect.css">
    <link rel="stylesheet" href="styles/plugins/select2/select2.css">
    <link rel="stylesheet" href="styles/plugins/selectbox/selectbox.css">
    <link rel="stylesheet" href="styles/plugins/slidernav/slidernav.css">
    <link rel="stylesheet" href="styles/plugins/slidernav/smallipop.css">
    <link rel="stylesheet" href="styles/plugins/syntaxhighlighter/syntaxhighlighter.css">
    <link rel="stylesheet" href="styles/plugins/syntaxhighlighter/shThemeDefault.css">
    <link rel="stylesheet" href="styles/plugins/tagit/tagit.css">
    <link rel="stylesheet" href="styles/plugins/themeroller/themeroller.css">
    <link rel="stylesheet" href="styles/plugins/tinyeditor/tinyeditor.css">
    <link rel="stylesheet" href="styles/plugins/tiptip/tiptip.css">
    <link rel="stylesheet" href="styles/plugins/uistars/uistars.css">
    <link rel="stylesheet" href="styles/plugins/uitotop/uitotop.css">
    <link rel="stylesheet" href="styles/plugins/uniform/uniform.css"> -->
    <link rel = "stylesheet" href = "styles/plugins/all/plugins.css">

    <!-- NOTE: The following css files have been combined and minified into all.css
    <link rel="stylesheet" href="styles/adminica/text.css">
    <link rel="stylesheet" href="styles/adminica/grid.css">
    <link rel="stylesheet" href="styles/adminica/main.css">
    <link rel="stylesheet" href="styles/adminica/mobile.css">
    <link rel="stylesheet" href="styles/adminica/base.css">
    <link rel="stylesheet" href="styles/adminica/ie.css">
    <link rel="stylesheet" href="styles/themes/switcher.css"> -->
    <link rel = "stylesheet" href = "styles/adminica/all.css">

    <!-- Style Switcher
    The following stylesheet links are used by the styleswitcher to allow for dynamically changing the Adminica layout, nav, skin, theme and background.
    Styleswitcher documentation: http://style-switcher.webfactoryltd.com/documentation/
    layout_switcher.php	: layout - fluid by default.								(eg. styles/themes/layout_switcher.php?default=layout_fixed.css)
    nav_switcher.php	: header and sidebar nav  positioning - sidebar by default.	(eg. styles/themes/nav_switcher.php?default=header_top.css)
    skin_switcher.php 	: Adminica skin - dark by default.							(eg. styles/themes/skin_switcher.php?default=theme_light.css)
    theme_switcher.php 	: colour theme - black/grey by default.						(eg. styles/themes/theme_switcher.php?default=theme_red.css)
    bg_switcher.php 	: background image - dark boxes by default.					(eg. styles/themes/bg_switcher.php?default=bg_honeycomb.css)	-->
    <link rel = "stylesheet" href = "styles/themes/switcher.css">
    <link rel = "stylesheet" href = "styles/themes/skin_light.css">
    <link rel = "stylesheet" href = "styles/themes/theme_green.css">
    <link rel = "stylesheet" href = "styles/adminica/colours.css">
    <!-- this file overrides the theme's default colour scheme, allowing more colour combinations (see layout example page)
           <!-- NOTE: The following js files have been conbined and minified into plugins-min.js
           <script src="scripts/jquery/jquery.js"></script>
           <script src="scripts/jquery/jqueryui.js"></script>
           <script src="scripts/modernizr/modernizr.js"></script>
           <script src="scripts/prefixfree/prefixfree.js"></script>
           <script src="scripts/pjax/pjax.js"></script>
           <script src="scripts/isotope/isotope.js"></script>
           <script src="scripts/autogrow/autogrow.js"></script>
           <script src="scripts/colorpicker/colorpicker.js"></script>
           <script src="scripts/cookie/cookie.js"></script>
           <script src="scripts/datatables/datatables.js"></script>
           <script src="scripts/elfinder/elfinder.js"></script>
           <script src="scripts/dragscroll/dragScroll.js"></script>
           <script src="scripts/tinyeditor/tinyeditor.js"></script>
           <script src="scripts/fancybox/fancybox.js"></script>
           <script src="scripts/flot/flot_excanvas.js"></script>
           <script src="scripts/flot/flot.js"></script>
           <script src="scripts/flot/flot_resize.js"></script>
           <script src="scripts/flot/flot_pie.js"></script>
           <script src="scripts/flot/flot_pie_update.js"></script>
           <script src="scripts/fullcalendar/fullcalendar.js"></script>
           <script src="scripts/fullcalendar/fullcalendar_gcal.js"></script>
           <script src="scripts/hoverintent/hoverIntent.js"></script>
           <script src="scripts/iscroll/iscroll.js"></script>
           <script src="scripts/knob/knob.js"></script>
           <script src="scripts/multiselect/multiselect.js"></script>
           <script src="scripts/select2/select2.js"></script>
           <script src="scripts/selectbox/selectbox.js"></script>
           <script src="scripts/slidernav/slidernav.js"></script>
           <script src="scripts/smallipop/smallipop.js"></script>
           <script src="scripts/sparkline/sparkline.js"></script>
           <script src="scripts/syntaxhighlighter/shCore.js"></script>
           <script src="scripts/syntaxhighlighter/shBrushJScript.js"></script>
           <script src="scripts/syntaxhighlighter/shBrushXml.js"></script>
           <script src="scripts/tagit/tagit.js"></script>
           <script src="scripts/timepicker/timepicker.js"></script>
           <script src="scripts/tinyeditor/tinyeditor.js"></script>
           <script src="scripts/tiptip/tiptip.js"></script>
           <script src="scripts/touchpunch/touchpunch.js"></script>
           <script src="scripts/uistars/uistars.js"></script>
           <script src="scripts/uitotop/uitotop.js"></script>
           <script src="scripts/uniform/uniform.js"></script>
           <script src="scripts/validation/validation.js"></script> -->
    <script src = "scripts/plugins-min.js"></script>

    <!-- NOTE: The following js files have been conbined and minified into adminica_all-min.js
    <script src="scripts/adminica/adminica_ui.js"></script>
    <script src="scripts/adminica/adminica_mobile.js"></script>
    <script src="scripts/adminica/adminica_datatables.js"></script>
    <script src="scripts/adminica/adminica_calendar.js"></script>
    <script src="scripts/adminica/adminica_charts.js"></script>
    <script src="scripts/adminica/adminica_gallery.js"></script>
    <script src="scripts/adminica/adminica_various.js"></script>
    <script src="scripts/adminica/adminica_wizard.js"></script>
    <script src="scripts/adminica/adminica_forms.js"></script>
    <script src="scripts/adminica/adminica_load.js"></script>	-->
    <script src = "scripts/adminica/adminica_all-min.js"></script>
	<!-- TinyMCE -->
	<script type="text/javascript" src="/admin/scripts/tiny_mce/tiny_mce.js"></script>
	<script type="text/javascript" src="/admin/scripts/tiny_mce/tiny_mce_init.js"></script>
	<!-- /TinyMCE -->
	<!-- validationEngine -->
	<link type="text/css" href="/admin/styles/validationEngine/validationEngine.jquery.css" rel="stylesheet">
	<script type="text/javascript" src="/admin/scripts/validationEngine/jquery.validationEngine-ru.js"></script>
	<script type="text/javascript" src="/admin/scripts/validationEngine/jquery.validationEngine.js"></script> 
	<!-- /validationEngine -->
	<script src="/admin/scripts/datatables/dataTables.columnFilter.js" type="text/javascript"></script>
	<!-- datetimepicker -->
	<script src = "/admin/scripts/datetimepicker/jquery-ui-timepicker-addon.js"></script>
</head>
<body>
	<div id = "pjax">
		<div id = "wrapper" data-adminica-nav-top = "1" data-adminica-side-top = "1">

		<div id = "sidebar" class = "sidebar pjax_links">
			<div class = "cog">+</div>

			<a href = "index.php" class = "logo"><span>Tortoise</span></a>

			<div class = "user_box dark_box clearfix">
				<?php if(!empty($GLOBALS['infoUser']['logo'])) {?>
					<img src = "images/content/profiles/<?=$GLOBALS['infoUser']['logo'];?>" width = "55" alt = "Profile Pic" />
				<?php } else {?>
					<img src = "images/other/none-manager.jpg" width = "55" alt = "Profile Pic" />
				<?php } ?>

				<h2><?=$GLOBALS['adminTip']['name'];?></h2>
				<h3><a href = "javascript:void(0);"><?=$GLOBALS['infoUser']['name'];?></a></h3>
				<ul>
					<li><a href = "/admin/?r=users/admin_settings">Настройки</a><span class = "divider">|</span></li-->
					<li><a href = "login_slide.php" class = "dialog_button" data-dialog = "dialog_logout">Выйти</a></li>
				</ul>
			</div>
			<!-- #user_box -->

			<ul class = "side_accordion" id = "nav_side">
				<!-- add class 'open_multiple' to change to from accordion to toggles -->
				<li style="border: none;">
					<a href = "<?='http://'.$_SERVER['HTTP_HOST']?>" target="_blank" style="padding-left: 10px;">
						<img src = "images/other/site.png" />Открыть сайт
					</a>
				</li>
				<li>
					<a href = "<?='http://'.$_SERVER['HTTP_HOST'].'/admin/clear_cash.php'?>">
						<img src = "images/other/clear_cash.png" />Очистить кеш
					</a>
				</li>
				<li>
					<a href = "<?='http://'.$_SERVER['HTTP_HOST'].'/admin/sitemap_xml.php'?>">
						<img src = "images/other/file_xml.png" />Сгенерить sitemap
					</a>
				</li>
				<!--li>
					<a href = "javascript:void(0);">
						<img src = "images/icons/small/grey/mail.png" />Тест для списка
						<div class = "alert badge alert_red">99</div>
					</a>
					<ul class = "drawer">
						<li>
							<a href = "javascript:void(0);">test1</a>
						</li>
						<li>
							<a href = "javascript:void(0);">test2</a>
						</li>
					</ul>
				</li-->
			</ul>
		</div>
		<!-- #sidebar -->

		<!-- Closing Div for Stack Nav, you can boxes under the stack before this -->
		<div id = "main_container" class = "main_container container_16 clearfix">

			<div id = "nav_top" class = "dropdown_menu clearfix round_top">
				<ul class = "clearfix">
					<li class = "icon_only">
						<a href = "index.php" class = "pjax">
							<img src = "images/icons/small/grey/laptop.png" />
							<span class = "display_none">Home</span>
						</a>
					</li>

					<?=$GLOBALS['admin_topmenu'];?>
					
				</ul>
				<div id = "mobile_nav">
					<div class = "main"></div>
					<div class = "side"></div>
				</div>

			</div>
			<!-- #nav_top -->
			
			<?=$GLOBALS['admin_center_area']?>
		</div>

		<!-- Попап покинуть админку -->
		<div class = "display_none">
			<div id = "dialog_logout" class = "dialog_content narrow" title = "Выйти">
				<div class = "block">
					<div class = "section">
					   
						<div class = "dashed_line"></div>
						<p>Вы действительно хотите выйти из своей учётной записи?</p>
					</div>
					<div class = "button_bar clearfix">
						<button class = "dark blue no_margin_bottom link_button" data-link = "/admin/login.php?logout=1">
							<div class = "ui-icon ui-icon-check"></div>
							<span>Да</span>
						</button>
						<button class = "light send_right close_dialog">
							<div class = "ui-icon ui-icon-closethick"></div>
							<span>Отмена</span>
						</button>
					</div>
				</div>
			</div>
		</div>

		<!-- Загрузка страницы -->
		<div id = "loading_overlay">
			<div class = "loading_message round_bottom">
				<img src = "images/interface/loading.gif" alt = "loading" />
			</div>
		</div>
	</div>

	<script src="scripts/ajax/ajax.js"></script>
	<script src="scripts/ajax/jquery.form.js"></script>
	<script type="text/javascript"> 
	var trA     = '';  
	$(document).ready(function() { 
		
		// редактирование
		$('.editData').click(function() {
			// получаем таблицу, массив данных, селектор обращения
			idTable = $(this).parent('div[id^=forbutton_]').attr('id');
			aoTable = idTable.split('forbutton_');
			aoTable = aoTable[1]; 
			jsData  = $('input[name=jsData' + aoTable + ']').val();
			trA     = $('input[name=trA' + aoTable + ']').val();
			
			var lengthSelect = $(trA).length;
			if(lengthSelect == 1) {
				var idItem  = $(trA).attr('id').replace('id_field_', '');
				var idPop   = '#' + $(this).attr('data-dialog');
				var dataPost = {
					arrayData : jsData,
					dbTable   : aoTable,
					idItem    : idItem};
				var content = ajaxRequest('add_edit_data', dataPost).done(function(msg) {
					if(msg) {
						
						$(idPop + ' div.block').html( msg );
						$(idPop).dialog( "open" );
						return false;
					}
					else {
					
						$("#dialog_error div.section p").text('Произошла ошибка, данные не пришли! Попробуйте перезагрузить страницу!');
						$("#dialog_error").dialog( "open" );
						return false;
					}
				});
			}
			else if(lengthSelect > 1) {
				$("#dialog_error div.section p").text('Слишком много пунктов выбрано, необходимо 1!');
				$("#dialog_error").dialog( "open" );
				return false;
			}
			else {
				$("#dialog_error div.section p").text('Необходимо выбрать хотя бы 1 пункт!');
				$("#dialog_error").dialog( "open" );
				return false;
			}
		});

		// собираем id для удаления
		$('.style_del_multi').on('click', function() {

			// получаем таблицу, массив данных, селектор обращения
			idTable = $(this).parent('div[id^=forbutton_]').attr('id');
			aoTable = idTable.split('forbutton_');
			aoTable = aoTable[1]; 
			jsData  = $('input[name=jsData' + aoTable + ']').val(); 
			trA     = $('input[name=trA' + aoTable + ']').val(); 
			
			var idItems = '';
			$(trA).each(function (){
				idItems += $(this).attr('id').replace('id_field_', '') + ','; 
			});
			if(idItems) {

				idItems = idItems.slice(0, -1);
				var idPop  = '#' + $(this).attr('data-dialog');
				$('input[name="' + idPop + '"]').val(idItems);
				$('input[name="tableDeleteDB"]').val(aoTable);
				$('input[name="tableJSData"]').val(jsData);
				$(idPop).dialog( "open" );
				return false;
			}
			else {

				$("#dialog_error div.section p").text('Выберите хотя бы одну запись!');
				$("#dialog_error").dialog( "open" );
				return false;
			}
		});

		// добавление
		$('.addData').click(function() {

			// получаем таблицу, массив данных, селектор обращения
			idTable = $(this).parent('div[id^=forbutton_]').attr('id');
			aoTable = idTable.split('forbutton_');
			aoTable = aoTable[1]; 
			jsData  = $('input[name=jsData' + aoTable + ']').val(); 
			
			whereViewMe = $('input[name="whereViewMe"]').val();
					
			var idPop   = '#' + $(this).attr('data-dialog');
			var dataPost = {
				arrayData 	: jsData,
				dbTable   	: aoTable,
				whereViewMe	: whereViewMe};
			content = ajaxRequest('add_edit_data', dataPost).done(function(msg) {
				if(msg) {

					$(idPop + ' div.block').html( msg );
					$(idPop).dialog( "open" );
					return false;
				}
				else {

					$("#dialog_error div.section p").text('Произошла ошибка, данные не пришли!');
					$("#dialog_error").dialog( "open" );
					return false;
				}
			});
		});
	});
	</script>

	<div class="display_none">
		<div id="validateErrorPopUp" class="dialog_content" title="Ошибка валидации">
			<div class="block">
				<div class="section">
					<h1>Не все поля прошли валидацию! Проверте все вкладки!</h1>
					<div class="dashed_line"></div>	
					<p></p>
				</div>
				<div class="button_bar clearfix">
					<button class="dark blue no_margin_bottom close_dialog_this_dialog">
						<!--div class="ui-icon ui-icon-check"></div-->
						<span>Исправить</span>
					</button>
				</div>
			</div>
		</div>
	</div>
	<div class="display_none">						
		<div id="dialog_error" class="dialog_content narrow" title="Произошла ошибка">
			<div class="block">
				<div class="section">
					<h1>Ошибка</h1>
					<div class="dashed_line"></div>	
					<p></p>
				</div>
				<div class="button_bar clearfix">
					<button class="dark blue no_margin_bottom close_dialog">
						<div class="ui-icon ui-icon-check"></div>
						<span>Продолжить</span>
					</button>
				</div>
			</div>
		</div>
	</div>
	<div class="display_none">
		<div id="dialog_delete_form" class="dialog_content narrow no_dialog_titlebar" title="Точно хотите удалить?">
			<input type="hidden" name="#dialog_delete_form" value="">
			<input type="hidden" name="tableDeleteDB" value="">
			<input type="hidden" name="tableJSData" value="">
			<div class="block">
				<div class="section">
					<h1>Удалить запись</h1>
					<div class="dashed_line"></div>
					<p>Пожалуйста, подтвердите, что вы хотите удалить запись.</p>
				</div>
				<div class="button_bar clearfix">
					<button class="delete_confirm dark red no_margin_bottom delete_item_table" dialog-window="dialog_delete_form">
						<div class="ui-icon ui-icon-check"></div>
						<span>Удалить</span>
					</button>
					<button class="light send_right close_dialog">
						<div class="ui-icon ui-icon-closethick"></div>
						<span>Отмена</span>
					</button>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>