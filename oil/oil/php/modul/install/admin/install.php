<?php

/*
if(chgrp(SITE_PATH.'upload/test_modul_1.zip', '507')){
	echo 'gr ok';
}
else{
	echo 'gr no';
}

if(chown(SITE_PATH.'upload/test_modul', '507')){
	echo 'user ok';
}
else{
	echo 'user no';
}


*/

//chmod(SITE_PATH.'upload/test_modul_1.zip', 0777);
//echo unlink(SITE_PATH.'cash/test_nodul_1/.ini');
//clearDir(SITE_PATH.'cash/');
//die();
if(isset($_POST['send_form']) && $_POST['send_form'] == 'ok'){
	include SITE_PATH.'modul/install/admin/install_modul.php';
}


$admin_center_area .= '	<div class = "flat_area grid_16">
							<h2>
								Tortoise <small> - Install</small>       
							</h2>
						</div>
						
						<div class="box grid_16 no_titlebar" style="opacity: 1;">
							<div class="toggle_container">
								<form method="POST" action="/admin/?r=install" name="instalform" enctype="multipart/form-data">
									<input type="hidden" name="send_form" value="ok">
									<div class="block" style="opacity: 1;">
										<h2 class="section">Install moduls</h2>
										<fieldset class="label_side top">
											<label>Uniform File Upload</label>
											<div class="clearfix">
												<input type="file" id="fileupload" class="uniform" name="modul">
											</div>
										</fieldset>
									</div>
									
									<div class="button_bar clearfix">
										<button class="grey dark send_right img_icon has_text" onclick="document.instalform.submit();">
											<img src="images/icons/small/grey/file_cabinet.png">
											<span>Install</span>
										</button>
									</div>
								</form>	
							</div>
						</div>	';