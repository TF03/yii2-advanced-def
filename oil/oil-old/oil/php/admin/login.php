<?php
session_start();

if (!empty($_SESSION['adminInfo']))
	header('Location: /admin/');
	
require '../core/conf.php';
require '../core/db.php';
require '../core/core.php';
clearPostGet();

if ($_GET['logout'] == 1)
    session_destroy();


$error = '<strong>Tortoise приветствует Вас.</strong> Пожалуйста введите свой логин и пароль';
if ($_POST['login'] || $_POST['password']) {
    $sql = $db->one_array('	SELECT `id`, `tip`, `name`, `logo`, `login`
							FROM ' . DB_PREFIX . 'admin_user 
							WHERE `login` = "' . $_POST['login'] . '" AND `pas` = "' . $_POST['password'] . '"');

    if ($sql > 0) {
        $_SESSION['admin'] = 'admin';
        $_SESSION['adminInfo']['id'] 	= $sql['id'];
        $_SESSION['adminInfo']['tip']   = $sql['tip'];
        $_SESSION['adminInfo']['login'] = $sql['login'];
        header('Location: /admin/');
        exit();
    }

    if (!$_SESSION['admin'])
        $error = 'Введите корректно <strong>логин</strong> и <strong>пароль</strong>.';
}
?>

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

    <title>Adminica Tortoise</title>
    <meta name = "description" content = "">
    <meta name = "author" content = "">

    <!-- iPhone, iPad and Android specific settings -->
    <meta name = "viewport" content = "width=device-width, initial-scale=1, maximum-scale=1">
    <meta name = "apple-mobile-web-app-capable" content = "yes" />
    <meta name = "apple-mobile-web-app-status-bar-style" content = "black-translucent" />

    <link href = "images/interface/iOS_icon.png" rel = "apple-touch-icon">
    <!-- Styles -->
    <link rel = "stylesheet" href = "styles/adminica/reset.css">
    <link rel = "stylesheet" href = "http://fonts.googleapis.com/css?family=Open+Sans:400,700">

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
    <link rel = "stylesheet" href = "styles/themes/layout_switcher.php?default=layout_fixed.css">
    <link rel = "stylesheet" href = "styles/themes/nav_switcher.php?default=nav_top.css">
    <link rel = "stylesheet" href = "styles/themes/skin_switcher.php?default=switcher.css">
    <link rel = "stylesheet" href = "styles/themes/theme_switcher.php?default=theme_blue.css">
    <link rel = "stylesheet" href = "styles/themes/bg_switcher.php?default=bg_honeycomb.css">
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
</head>
	<body>
		<div id = "pjax">
			<div id = "wrapper">
				<div class = "isolate">
					<div class = "center narrow">
						<div class = "main_container full_size container_16 clearfix">
							<div class = "box">
								<div class = "block">
									<div class = "section">
										<div class = "alert dismissible alert_light">
											<img width = "24" height = "24" src = "images/icons/small/grey/locked.png">
											<?=$error;?>
										</div>
									</div>
									<form action = "?" class = "validate_form" method="POST">
										<fieldset class = "label_side top">
											<label for = "username_field">Логин</label>

											<div>
												<input type = "text" id = "username_field" name = "login" class = "required">
											</div>
										</fieldset>
										<fieldset class = "label_side">
											<label for = "password_field">Пароль</label>

											<div>
												<input type = "password" id = "password_field" name = "password" class = "required">
											</div>
										</fieldset>
										<fieldset class = "no_label bottom">
											<div style = "">
												<div class = "slider_unlock" title = "Slide to Login"></div>
												<button type = "submit" style = "display:none"></button>
											</div>
										</fieldset>
									</form>
								</div>
							</div>
						</div>
						<a href = "index.php" id = "login_logo"><span>Tortoise</span></a>
						<button data-dialog = "dialog_register" class = "dialog_button send_right" style = "margin-top:10px;">
							<img src = "images/icons/small/white/user.png">
							<span>Забыли пароль?</span>
						</button>
					</div>
				</div>
			</div>
			<div class = "display_none">
				<div id = "dialog_register" class = "dialog_content no_dialog_titlebar wide" title = "Register for Adminica">
					<div class = "block">
						<div class = "section">
							<h2>Форма восстановления пароля</h2>
						</div>
						<div class = "columns clearfix">
							<div class = "col_100">
								<fieldset class = "label_top top">
									<label for = "text_field_inline">Логин<span> который присвоен у вас на сайте</span></label>
									<div>
										<input type = "text">
									</div>
								</fieldset>
							</div>
						</div>
						<div class = "button_bar clearfix">
							<button class = "dark blue no_margin_bottom link_button" data-link = "index.php">
								<div class = "ui-icon ui-icon-check"></div>
								<span>Отправить новый пароль</span>
							</button>
							<button class = "light send_right close_dialog">
								<div class = "ui-icon ui-icon-closethick"></div>
								<span>Отмена</span>
							</button>
						</div>
					</div>
				</div>
			</div>
			<div id = "loading_overlay">
				<div class = "loading_message round_bottom">
					<img src = "images/interface/loading.gif" alt = "loading" />
				</div>
			</div>
		</div>
	</body>
</html>