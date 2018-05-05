<div class="grid_16 box clearfix no_titlebar" style="opacity: 1;top: 8px;">
	<div class="indented_button_bar clearfix " id="forbutton_<?=$GLOBALS['aoTable'];?>">
		<?php if($GLOBALS['buttonMain']['add'] == true) {?>
			<button class="blue text_only has_text addData" data-dialog="dialog_edit_form<?=$GLOBALS['aoTable'];?>">
				<span>Добавить</span>
			</button>
		<?php } ?>
		<?php if($GLOBALS['buttonMain']['edit'] == true) {?>
			<button class="blue text_only has_text editData" data-dialog="dialog_edit_form<?=$GLOBALS['aoTable'];?>">
				<span>Редактировать</span>
			</button>
		<?php } ?>
		<?php if($GLOBALS['buttonMain']['delete'] == true) {?>
			<button class="blue text_only has_text style_del_multi" data-dialog="dialog_delete_form">
				<span>Удалить</span>
			</button>
			<button class="blue text_only has_text checked_all" onclick="checkedAll<?=$GLOBALS['aoTable'];?>();">
				<span>Выбрать все</span>
			</button>
			<button class="blue text_only has_text dischecked_all" onclick="uncheckedAll<?=$GLOBALS['aoTable'];?>();">
				<span>Отменить выбор</span>
			</button>
		<?php } ?>
		<input type="hidden" name="jsData<?=$GLOBALS['aoTable'];?>" value='<?=$GLOBALS['jsData'];?>'>
		<input type="hidden" name="trA<?=$GLOBALS['aoTable'];?>" value='<?=$GLOBALS['selectorBody'];?>'>
		<input type="hidden" name="whereViewMe" value=''>
	</div>
</div> 
<div class="box grid_16 single_datatable">
	<div id="dt<?=$GLOBALS['iTables'];?>" class="no_margin<?=$GLOBALS['aoTable'];?>"></div>
</div>
		
<script type="text/javascript">
	$(document).ready(function() {
		// устанавливаем минимальную ширину для поп-апа
		$('#dialog_edit_form<?=$GLOBALS['aoTable'];?>.ui-dialog-content').parent().css('min-width','500px');

		window["oTable<?=$GLOBALS['aoTable'];?>"];
		
		$('.no_margin<?=$GLOBALS['aoTable'];?>').html( '<table class="datatable<?=$GLOBALS['aoTable'];?>"><thead><tr></tr></thead> <tbody onclick="activateTD<?=$GLOBALS['aoTable'];?>(event);"></tbody><tfoot><tr><?=$GLOBALS['tableFooter'];?></tr></tfoot></table>' );
		window["oTable<?=$GLOBALS['aoTable'];?>"] = $('.datatable<?=$GLOBALS['aoTable'];?>').dataTable( {
			"oLanguage": {
				"sProcessing":   "Подождите...",
			    "sLengthMenu":   "Показать _MENU_ записей",
			    "sZeroRecords":  "Записи отсутствуют.",
			    "sInfo":         "Записи с _START_ до _END_ из _TOTAL_ записей",
			    "sInfoEmpty":    "Записи с 0 до 0 из 0 записей",
			    "sInfoFiltered": "(отфильтровано из _MAX_ записей)",
			    "sInfoPostFix":  "",
			    "sSearch":       "Поиск:",
			    "sUrl":          "",
			    "oPaginate": {
			        "sFirst": "Первая",
			        "sPrevious": "Предыдущая",
			        "sNext": "Следующая",
			        "sLast": "Последняя"
			    },
			    "oAria": {
			        "sSortAscending":  ": активировать для сортировки столбца по возрастанию",
			        "sSortDescending": ": активировать для сортировки столбцов по убыванию"
			    }
			},
		// визуализацмя
			"bJQueryUI": true,
		// растягивает таблицу по заданной длинне
			"sScrollX": "101%",
		// дает возможность использовать один вызов $().DataTable() 
			"bRetrieve": true,
		// визуализацмя
			"bDestory" : true,
		// переинициализирует новую таблицу вместо старой
			"bProcessing": true,
		// включаем пажинацию
			"bPaginate": true,
		// устанавливается тип пажинации
			"sPaginationType": "full_numbers",
		// включаем список выбора по сколько показывать
			"bLengthChange": true,
		// включаем поиск
			"bFilter": true,
		// включаем сортировку
			"bSort": true,
		// включаем инфо о кол-ве товаров
			"bInfo": true,
		// указываем начальную сортировку по умолчанию (столбцы начинаются с 0)
			"aaSorting": [[ <?=$GLOBALS['countColum'];?> ]],
		// говорим, что обработка будет на сервере	
			"bServerSide": true,
		// указываем файл ajax
			"sAjaxSource": '../core/admin/ajax/dinamic_table.php',
		// указываем какие колонки будут
			"aoColumns": [
				<?=$GLOBALS['aoColumns'];?>
			],
		// настройки ajax передачи
			"fnServerData": function ( sSource, aoData, fnCallback, oSettings ) {
				aoData.push( { 'name': 'dopTable', 'value':'<?=$GLOBALS['aoTable'];?>'});
				aoData.push( { 'name': 'dopColums', 'value':'<?=$GLOBALS['columsTable'];?>'});
				aoData.push( { 'name': 'arrayData', 'value':'<?=$GLOBALS['jsData'];?>'});
				aoData.push( { 'name': 'dbWhere', 'value':'<?=$GLOBALS['dbWhere'];?>'});
				aoData.push( { 'name': 'buttonMain', 'value':'<?=serialize($GLOBALS['buttonMain']);?>'});
				sortDefault = '<?=$GLOBALS['sortDefault'];?>';
				if(sortDefault != '')
					aoData.push( { 'name': 'sortDefault', 'value':sortDefault});
					
				whereViewMe = $('input[name="whereViewMe"]').val();
				if(whereViewMe != '')
					aoData.push( { 'name': 'whereViewMe', 'value':whereViewMe});
					
				oSettings.jqXHR = $.ajax( {
					"dataType": 'json',
					"type": "POST",
					"url": sSource,
					"data": aoData,
					"success": fnCallback
				} );
			},
		// можно применять после отработки ajax
			"fnInitComplete": function () {
				$(".datatable<?=$GLOBALS['aoTable'];?>").css("visibility","visible");
			},
		// после возращения ajax добавляем id для tr
			"fnRowCallback": function( nRow, aData, iDisplayIndex ) {
			  $(nRow).attr("id", 'id_field_' + aData[0]);
			  return nRow;
			}
		} ).columnFilter({
				aoColumns: [ <?php echo trim($GLOBALS['aoFilters'], ',');?> ]
			}); 
	});

	// активация и деактивация поля в таблице
	function activateTD<?=$GLOBALS['aoTable'];?> (event) {
		// редактирование индивидуальное
		if($(event.target).hasClass('style_edit_del')) {
			var idItem  = $(event.target.parentNode.parentNode).attr('id').replace('id_field_', '');
			var idPop = '#' + $(event.target).attr('data-dialog');
			dataPost = {
						arrayData : '<?=$GLOBALS['jsData'];?>',
						dbTable   : '<?=$GLOBALS['aoTable'];?>',
						idItem    : idItem};
			content =  ajaxRequest('add_edit_data', dataPost).done(function(msg) {
				if(msg) {
				
					$(idPop + '#dialog_edit_form<?=$GLOBALS['aoTable'];?> div.block').html( msg );
					$(idPop).dialog( "open" );
				}
				else {
				
					$("#dialog_error div.section p").text('Произошла ошибка, данные не пришли!');
					$("#dialog_error").dialog( "open" );
				}
			});
		}
		// удаление индивидуальное
		else if($(event.target).hasClass('style_del_single')) {
			idItem  = $(event.target.parentNode.parentNode).attr('id').replace('id_field_', '');
			idPop = '#' + $(event.target).attr('data-dialog');
			$('input[name="' + idPop + '"]').val(idItem);
			$('input[name="tableDeleteDB"]').val('<?=$GLOBALS['aoTable'];?>');
			$('input[name="tableJSData"]').val('<?=$GLOBALS['jsData'];?>');
			$(idPop).dialog( "open" );//dialog_delete_form
		}
		else if($(event.target.parentNode).hasClass('dtSelect'))
			$(event.target.parentNode).removeClass('dtSelect');
		else
			$(event.target.parentNode).addClass('dtSelect');
	}

	// выбрать все
	function checkedAll<?=$GLOBALS['aoTable'];?> () {
		$('.datatable<?=$GLOBALS['aoTable'];?> tbody tr').addClass('dtSelect');
	}
	
	// отменить все выбранные
	function uncheckedAll<?=$GLOBALS['aoTable'];?> () {
		$('.datatable<?=$GLOBALS['aoTable'];?> tbody tr').removeClass('dtSelect');
	}

	// действие сортировать (потом переделать)
	function sortdbUpDown<?=$GLOBALS['aoTable'];?> (info) {
		dataPost = {
			dbTable   	: '<?=$GLOBALS['aoTable'];?>',
			info	   	: info,
			sortDefault	: '<?=$GLOBALS['sortDefault'];?>'};
			content =  ajaxRequest('sort_data', dataPost).done(function(msg) {
				if(msg != '') {
					// перезагружаем таблицу
					window["oTable<?=$GLOBALS['aoTable'];?>"].fnClearTable(0);
					window["oTable<?=$GLOBALS['aoTable'];?>"].fnDraw();
					if(msg != 'ok') {
						window["oTable<?=$GLOBALS['aoTable'];?>"].fnPageChange(Number(msg));
					}
				}
				else {
					$("#dialog_error div.section p").text('Произошла ошибка, удаление было ошибочным!');
					$("#dialog_error").dialog( "open" );
				}
		});
	}
	
	// действие сохранения
	function sendAjaxPop<?=$GLOBALS['aoTable'];?> (dbTable) {

		if ($("#form_" + dbTable).validationEngine('validate')) {
			$.each( $('textarea.tiny') ,
				function(){
					$(this).val(tinyMCE.get($(this).attr('name')).getContent());
				});
				
			// version 1
			var postData = $('form[name="form_' + dbTable + '"]').ajaxForm({
				target: '/core/admin/ajax/add_edit_data_db.php'
			}).ajaxSubmit(	function (msg) {
				if(msg != '') {
					
					// перезагружаем таблицу
					window["oTable" + dbTable].fnClearTable(0);
					window["oTable" + dbTable].fnDraw();
					if(msg != 'ok') {
						window["oTable" + dbTable].fnPageChange(Number(msg));
					}

					// закрываем поп-ап
					$("#dialog_edit_form<?=$GLOBALS['aoTable'];?>").dialog( "close" );
					return false;
				}
			});
			/*.submit();if(postData.ajaxSuccess()) {

				// перезагружаем таблицу
				window["oTable" + dbTable].fnClearTable(0);
				window["oTable" + dbTable].fnDraw();

				// закрываем поп-ап
				$("#dialog_edit_form<?=$GLOBALS['aoTable'];?>").dialog( "close" );
				return false;
			}*/
		}
		else {
			$('#dialog_edit_form<?=$GLOBALS['aoTable'];?>').parent().hide();
			$('#validateErrorPopUp').dialog( "open" );
		}
	}
</script>

<div class="display_none">
	<div id="dialog_edit_form<?=$GLOBALS['aoTable'];?>" class="dialog_content" title="Окно редактирования <?=$GLOBALS['title'];?>">
		<div class="block">
		</div> 
	</div>
</div>