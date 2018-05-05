<script type="text/javascript">
	// Удаление записи
	$(document).on('click', '.viewMe', function() {
	
		tableProd = '<?=$GLOBALS['tableProd'];?>';
		$('input[name="whereViewMe"]').val($(this).attr('info'));
		
		if($(this).hasClass('activeTree')) {
			if($(this).parent('ul').hasClass('firstListJug')) {
				$('ul.firstListJug li').removeClass('activeTree');
				$('ul.firstListJug > li:first-child').addClass('activeTree');
				$('input[name="whereViewMe"]').val($('ul.firstListJug > li:first-child').attr('info'));
			}
			else {
				$(this).parent('ul').children('li').removeClass('activeTree');
				$('input[name="whereViewMe"]').val($(this).parent('ul').parent('div').prev('li').attr('info'));
			}
		}
		else {
			if($(this).parent('ul').children('li.activeTree').length > 0) {
				$(this).parent('ul').children('li').removeClass('activeTree');
			}
			$(this).addClass('activeTree');
		}
		// перезагружаем таблицу
		window["oTable" + tableProd].fnClearTable(0);
		window["oTable" + tableProd].fnDraw();
	});
</script>