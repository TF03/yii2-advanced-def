<script type="text/javascript">
	// Удаление записи
	$(document).on('click', '.delete_item_table', function() {
		var idPop   = $(this).attr('dialog-window');
		var idItem  = $('input[name="#' + idPop + '"]').val();
		DbTable 	= $('input[name="tableDeleteDB"]').val();
		tableJSData = $('input[name="tableJSData"]').val();
		dataPost = {
			arrayData   : tableJSData,
			dbTable   	: DbTable,
			idItem   	: idItem};
		content =  ajaxRequest('del_data', dataPost).done(function(msg) {
			if(msg) {

				$('#' + idPop).dialog( "close" );
				// перезагружаем таблицу
				window["oTable" + DbTable].fnClearTable(0);
				window["oTable" + DbTable].fnDraw();
			}
			else {

				$('#' + idPop).dialog( "close" );
				$("#dialog_error div.section p").text('Произошла ошибка, удаление было ошибочным!');
				$("#dialog_error").dialog( "open" );
			}
		});
	});
</script>