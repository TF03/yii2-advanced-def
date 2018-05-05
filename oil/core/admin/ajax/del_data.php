<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Jugene
 * Date: 12.12.13
 * Time: 11:00
 * To change this template use File | Settings | File Templates.
 */

// защита от запростов с дургих сайтов
    if (strpos($_SERVER['HTTP_REFERER'], 'http://' . $_SERVER['HTTP_HOST']) === false)
        exit();
// проверка на сессию админа
    session_start();
    if ($_SESSION['admin'] != 'admin')
        exit();

//подключение БД
    require_once '../../conf.php';
    require_once '../../db.php';
    require_once '../core.php';

    $id     = $_POST['idItem'];
    $tabl   = $_POST['dbTable'];
    $data 	= unserialize($_POST['arrayData']);
    $arraySettings = unserialize($_POST['arraySettings']);

    // удаление записи
    if(!empty($id)) {
	
		/// удаляем картинки
		foreach ($data as $k => $v) {
			
			/// удаляем картинку
			if  ($v['tip'] == 'img') {
				$result = $db -> select("
										SELECT `id`, `$k` 
										FROM " . DB_PREFIX . "$tabl 
										WHERE `id` IN ($id)");
				if (!empty($result)) {
					foreach($result as $r_k => $r_v) {
						$path = SITE_PATH . '/uploaded/img' . $v['path'] . $r_v['id'] . '/';
						unlink($path . $r_v[$k]);
						rmdir($path);
					}
				}
			}

			/// удаляем файл
			elseif ($v['tip'] == 'file'){
				$result = $db -> one_data("SELECT `$k` FROM " . DB_PREFIX . "$tabl WHERE `id` IN ($id)");
				if(!empty($result)) {
                    $path = SITE_PATH . '/uploaded/file' . $v['path'] . $id . '/';
					unlink($path . $result);
					rmdir($path);
				}
			}
			
			// тип для 2 списков со связью
            elseif ($v['tip'] == '2select_with_link') {
				
				$db->execute('  DELETE FROM ' . DB_PREFIX . $v['linkTable'] . '
								WHERE `pidItem` = "' . $id . '"');
			}
		}
        $db->execute('  DELETE FROM ' . DB_PREFIX . $tabl . '
                        WHERE `id` in (' . $id . ')');
        
		if($_POST['listRefList'] == 'list')
			echo tree_db_edit( $arraySettings, $data);
		else
			echo "ok";
    }
    else
        echo 'false';