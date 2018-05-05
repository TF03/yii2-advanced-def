<?php

///upload image
require_once  SITE_PATH.'core/admin/class.upload.php'; 

function uploadimage($width,$height,$folder,$name){
   
	$image_name=$_FILES[$name]['name'];
	
	$size = getimagesize ($_FILES[$name]['tmp_name']);

	//копируется с изменением размеров  
	$handle = new upload($_FILES[$name]);
	
	if ($handle->uploaded) {
	 
		$handle->image_resize          = true;
		$handle->image_x= $width;
		
		if($height){
			$handle->image_ratio_crop      = true;
			$handle->image_y=$height;
		}
		else{
			$handle->image_ratio_y         = true;
		}
		 
		$handle->Process($folder);
		$image_name=$handle->file_dst_name;
		// $handle->clean();
	}

	return $image_name;    
}

function uploadfile($folder,$name)
{
    $file_name=$_FILES[$name]['name'];

    $handle = new upload($_FILES[$name]);
    
	if ($handle->uploaded) {
        $handle->Process($folder);
        $file_name=$handle->file_dst_name;
    }
	return $file_name;
}
