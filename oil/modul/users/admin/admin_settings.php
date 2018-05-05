<?php
$dir_d = 'images/content/profiles';
if(!empty($dir_d)) {
	$dir = SITE_PATH . 'admin/' . $dir_d;
	if (is_dir($dir)) {
		if ($dh = opendir($dir)) {
			while (($file = readdir($dh)) !== false) {
				$select = '';
				if($file != '.' && $file != '..' && $file != '.DS_Store') {
					if ($file == $infoUser['logo']) {
						$select = 'selected="selected" data-skip="1"';
						$selected = 'selected="selected"';
					}
					$f = explode('.', $file);
					$val .= '<option ' . $select . 'value="' . $file . '" data-icon="' . $dir_d . '/' . $file . '" data-html-text="' . $f[0] . '">' . $f[0] . '</option>';
				}
			}
			closedir($dh);
		}
	}
}
if(empty($selected))
	$selected = '<option value="0" selected="selected" data-skip="1" data-html-text="Выбери картинку">Выбери картинку</option>';
else
	$selected = '';
$val = '<select ' . $disabled  . ' class="full_width logoImages" name="logo">
		' . $selected . $val . '</select>';
$val .= '<script type="text/javascript">
			// The select element to be replaced:
			var select = $(\'select.logoImages\');

			var selectBoxContainer = $(\'<div>\',{
				width		: select.outerWidth(),
				class	: \'tzSelect\',
				html		: \'<div class="selectBox"></div>\'
			});

			var dropDown = $(\'<ul>\',{class:\'dropDown\'});
			var selectBox = selectBoxContainer.find(\'.selectBox\');
			
			// Looping though the options of the original select element
			
			select.find(\'option\').each(function(i){
				var option = $(this);
				if(option.val()==select.val()){
					if(option.data(\'icon\'))
						selectBox.html(\'<img src="\'+option.data(\'icon\')+\'" width="30" /><span>\'+
								option.data(\'html-text\')+\'</span>\');
					else
						selectBox.html(\'<span>\'+
								option.data(\'html-text\')+\'</span>\');
				}
				
				// As of jQuery 1.4.3 we can access HTML5 
				// data attributes with the data() method.
				
				if(option.data(\'skip\')){
					return true;
				}
				
				// Creating a dropdown item according to the
				// data-icon and data-html-text HTML5 attributes:
				
				var li = $(\'<li>\',{
					html:	\'<img src="\'+option.data(\'icon\')+\'"  width="36" /><span>\'+
							option.data(\'html-text\')+\'</span>\'
				});
				li.click(function(){
					
					selectBox.html(\'<img src="\'+option.data(\'icon\')+\'"  width="30" /><span>\'+
							option.data(\'html-text\')+\'</span>\');
					dropDown.trigger(\'hide\');
					
					// When a click occurs, we are also reflecting
					// the change on the original select element:
					select.val(option.val());
					
					return false;
				});
				
				dropDown.append(li);
			});
			
			selectBoxContainer.append(dropDown.hide());
			select.hide().after(selectBoxContainer);
			
			// Binding custom show and hide events on the dropDown:
			
			dropDown.bind(\'show\',function(){
				
				if(dropDown.is(\':animated\')){
					return false;
				}
				
				selectBox.addClass(\'expanded\');
				dropDown.slideDown();
				
			}).bind(\'hide\',function(){
				
				if(dropDown.is(\':animated\')){
					return false;
				}
				
				selectBox.removeClass(\'expanded\');
				dropDown.slideUp();
				
			}).bind(\'toggle\',function(){
				if(selectBox.hasClass(\'expanded\')){
					dropDown.trigger(\'hide\');
				}
				else dropDown.trigger(\'show\');
			});
			
			selectBox.click(function(){
				dropDown.trigger(\'toggle\');
				return false;
			});

			// If we click anywhere on the page, while the
			// dropdown is shown, it is going to be hidden:
			
			$(document).click(function(){
				dropDown.trigger(\'hide\');
			});
		</script>';

$admin_center_area .= '
<div class="box grid_16">
	<div class="block">
		<h2 class="section">Tortoise <small> - Настройки пользователя ' . $infoUser['name'] . '</small> </h2>
		<span class="errorSettingsField"></span>
		<div class="columns clearfix">
			<div class="col_50">
				<fieldset class="label_side label_small top">
					<label for="text_field_inline">Логин</label>
					<div>
						<input type="text" name="login" value="' . $_SESSION['adminInfo']['login'] . '">
					</div>
				</fieldset>
			</div>
			<div class="col_50">
				<fieldset class="label_side label_small top right">
					<label for="text_field_inline">Пароль</label>
					<div>
						<input type="text" name="password" value="' . $infoUser['pas'] . '" style="width: 70% !important;">
						<button class="light text_only has_text generatePassword" style="margin: 0;margin-top: -2px;">
							<span>Сгенерировать</span>
						</button>
					</div>
				</fieldset>
			</div>
		</div>
		<div class="columns clearfix">
			<div class="col_50">
				<fieldset class="label_side label_small">
					<label for="text_field_inline">Аватарка</label>
					<div>
						' . $val . '
					</div>
				</fieldset>
			</div>
			<div class="col_50">
				<fieldset class="label_side label_small">
					<label for="text_field_inline"></label>
					<div class="clearfix">
						<button class="skin_colour img_icon has_text sendSettings">
							<span>Сохранить</span>
						</button>
					</div>
				</fieldset>
			</div>
		</div>
		<script>
			// кнопка сгенерировать пароль
			$(document).on("click", ".generatePassword", function() {
				result       = "";
				words        = "0123456789qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM";
				max_position = words.length - 1;
				for( i = 0; i < 8; ++i ) {
					position = Math.floor ( Math.random() * max_position );
					result = result + words.substring(position, position + 1);
				}
				$("input[name=password]").val(result);
			});
			$(document).on("click", ".sendSettings", function() {
				dataPost = {
					id			: "' . $_SESSION['adminInfo']['id'] . '",
					login   	: $("input[name=login]").val(),
					password	: $("input[name=password]").val(),
					logo		: $("select[name=logo]").val()};
				ajaxRequest("admin_settings", dataPost).done(function(msg) {
					if(msg == "false") 
						$("span.errorSettingsField").addClass("settingsError").removeClass("settingsSave").text("Ошибка!");
					else
						$("span.errorSettingsField").removeClass("settingsError").addClass("settingsSave").text("Сохранено!");
				});
			});
		</script>
	</div>
</div>';