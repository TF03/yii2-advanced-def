<div class="grid_16 box clearfix no_titlebar" style="opacity: 1;">
	<div class="indented_button_bar clearfix" id="forbutton_<?=$GLOBALS['aoTable'];?>">
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
	</div>
</div>

<div class="dd" id="nest_1">
	<?=$GLOBALS['treeData'];?>
</div>

<script src="scripts/nestable/jquery.nestable.js"></script>
<script>
/*Функция получения массива сортировки, по дереву*/
var json_data_nestable = '';
var updateOutput = function(e)
{
	var list   = e.length ? e : $(e.target),
		output = list.data('output');
			
	if (window.JSON) {
		json_data_nestable = window.JSON.stringify(list.nestable('serialize'));
	} else {
		json_data_nestable = 'JSON browser support required for this demo.';
	}


	dataPost = {
		arrayData : json_data_nestable,
		dbTable   : '<?=$GLOBALS['aoTable']?>'};
		content =  ajaxRequest('sort_tree', dataPost).done(function(msg) {
			if(msg) {
				console.log('sort save');
				return false;
			}
			else {
				console.log('sort not save');
				return false;
			}
		});
	
};
$('#nest_1').nestable().on('change', updateOutput);
$('#nest_1 input').nestable().off('change', updateOutput);

// Удаление записи
$(document).on('click', '.delete_item_table', function() {
	var idPop  = $(this).attr('dialog-window');
	var idItem = $('input[name="#' + idPop + '"]').val();
	dataPost = {
		arrayData   	: '<?=$GLOBALS['jsData'];?>',
		dbTable   		: '<?=$GLOBALS['aoTable']?>',
		arraySettings 	: '<?=$GLOBALS['tr_array_settings']?>',
		idItem    		: idItem,
		listRefList		: 'list'};
	content =  ajaxRequest('del_data', dataPost).done(function(msg) {
		if(msg) {

			$('#' + idPop).dialog( "close" );
			// должна быть перезагрузка дерева
			refreshNestables(msg);
		}
		else {

			$('#' + idPop).dialog( "close" );
			$("#dialog_error div.section p").text('Произошла ошибка, удаление было ошибочным!');
			$("#dialog_error").dialog( "open" );
		}
	});
});
	
var numIdNestable = 2;
// выбрать все
function checkedAll<?=$GLOBALS['aoTable'];?> () {
	if(numIdNestable == 2)
		$('div#nest_' + (numIdNestable - 1) + ' .checker span').addClass('checked').children('input[type="checkbox"]').attr('checked', 'checked');
	else
		$('div#nest_' + (numIdNestable - 1) + ' input[type="checkbox"]').attr('checked', 'checked');
}

// отменить все выбранные
function uncheckedAll<?=$GLOBALS['aoTable'];?> () {
	if(numIdNestable == 2)
		$('div#nest_' + (numIdNestable - 1) + ' .checker span').removeClass('checked').children('input[type="checkbox"]').removeAttr('checked');
	else
		$('div#nest_' + (numIdNestable - 1) + ' input[type="checkbox"]').removeAttr('checked');
} 
	
// действие сохранения
function sendAjaxPop<?=$GLOBALS['aoTable'];?> (dbTable) {
	$.each( $('textarea.tiny') ,
		function(){
			$(this).val(tinyMCE.get($(this).attr('name')).getContent());
		});
	$('form[name="form_<?=$GLOBALS['aoTable'];?>"]')
		.append('<input type="hidden" value="list" name="listRefList">')
		.append('<input type="hidden" value=\'<?=$GLOBALS['tr_array_settings'];?>\' name="arraySettings">').ajaxForm({
			target: '/core/admin/ajax/add_edit_data_db.php'
	}).ajaxSubmit(	function (msg) {
						if(msg != '') {
							refreshNestables(msg);
							// закрываем поп-ап
							$("#dialog_edit_form<?=$GLOBALS['aoTable'];?>").dialog( "close" );
							return false;
						}
					});
}
function refreshNestables(msg) {
	
	$('#nest_' + (numIdNestable -1)).after('<div class="dd" id="nest_' + numIdNestable + '">' + msg + '</div>').remove();
	$('#nest_' + numIdNestable).nestable().on('change', updateOutput);
	$('#nest_' + numIdNestable + ' input').nestable().off('change', updateOutput);
	if(!trA) 
		trA = $('input[name=trA<?=$GLOBALS['aoTable'];?>]').val();
	trA = trA.replace("div#nest_" + (numIdNestable - 1), "div#nest_" + numIdNestable);
	$('input[name=trA<?=$GLOBALS['aoTable'];?>]').val(trA); 
	numIdNestable++; 
}
</script>

<div class="display_none">
	<div id="dialog_edit_form<?=$GLOBALS['aoTable'];?>" class="dialog_content" title="Окно редактирования <?=$GLOBALS['title'];?>">
		<div class="block">
		</div> 
	</div>
</div>