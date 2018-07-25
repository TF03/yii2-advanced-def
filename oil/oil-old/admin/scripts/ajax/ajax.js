// функция описания самого ajax
// nameFile  - /*название файла обработчика*/
	function ajaxRequest(nameFile, data) {

        return $.ajax({
					type: 	'POST',
					async: 	false,
					url: 	'/core/admin/ajax/' + nameFile + '.php',
					data: 	data
				});
	}