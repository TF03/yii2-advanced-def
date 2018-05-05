<?php
$error = '';
// Проверяем загружен ли файл
if($_FILES['modul']['type'] == 'application/zip'){
	// Проверяем загружен ли файл
	if(is_uploaded_file($_FILES['modul']['tmp_name']))
	{
		// Если файл загружен успешно, перемещаем его
		// из временной директории в конечную
		//move_uploaded_file($_FILES['modul']['tmp_name'], SITE_PATH.'upload/'.$_FILES['modul']['name']);
		
		//chmod(SITE_PATH.'upload/test_modul_1.zip', 0777);
		
		$zip = new ZipArchive;
		$res = $zip->open(SITE_PATH.'upload/test_modul_1.zip');
		if ($res === TRUE) {
			$zip->extractTo(SITE_PATH.'upload/xz/');
			$zip->close();
			echo 'ok';
		} else {
			echo 'not';
		}
		
	}  
	else {
		$error = 'Ошибка загрузки файла!!!';
	}
}
else {
	$error = 'Неверный формат, загружаемого модуля!!!';
}

if(!empty($error)){
	$admin_center_area .='<script>
							$(document).ready(function(){
								$("#dialog_error div.section p").text("'.$error.'");
								$("#dialog_error").dialog( "open" );
							});	
						</script>';
}						