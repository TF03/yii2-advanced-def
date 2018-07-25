<form id="form_<?=$GLOBALS['tabl'];?>" name="form_<?=$GLOBALS['tabl'];?>" action="/core/admin/ajax/add_edit_data_db.php" method="POST" enctype="multipart/form-data" onsubmit="return false">
	<input type="hidden" name="arrayData" value='<?=$GLOBALS['_POST']['arrayData'];?>'/>
	<input type="hidden" name="idItem" value="<?=$GLOBALS['id'];?>"/>
	<input type="hidden" name="dbTable" value="<?=$GLOBALS['tabl'];?>"/>
	<input type="hidden" name="MethodSave" value="<?php if(empty($GLOBALS['id'])) echo 'add'; else echo 'edit';?>"/>
	
	<div class="box grid_8 tabs" id="tabs_edit">
		<ul class="tab_header clearfix li_edit_admin">
			<?=$GLOBALS['ulHtml'];?>
		</ul>
		<div class="toggle_container">
			<?=$GLOBALS['inputHtml'];?>
		</div>
	</div>
	<div class="button_bar clearfix">
		<button class="dark green sendRequestAjax" onclick="sendAjaxPop<?=$GLOBALS['tabl'];?>('<?=$GLOBALS['tabl'];?>');">
			<div class="ui-icon ui-icon-check"></div>
			<span>Сохранить</span>
		</button>
		<button class="dark red close_dialog">
			<div class="ui-icon ui-icon-closethick"></div>
			<span>Отмена</span>
		</button>
	</div>
	<script>
		$(function() {
			$( "#tabs_edit" ).tabs();
		});	
	
		/* multi images */
        adminicaUi();
        /*sort*/
        $('[id ^= img_list_]').sortable({
            'update': function (event, ui) {
                // получаем имя поля в из админки
                name_img = $(this).attr('id').replace("img_list_","");
                // получаем массив сортировки
                var order = $(this).sortable('toArray');
                // формируем массив сортировки
                var temp_sort = "";
                order.forEach(function(i, val) {
                    temp_sort += i.replace("item-","")+",";
                });

               $('input[name=img_list_sort_'+name_img+']').val(temp_sort);

            }
        });
        
        /*del*/                
        $('[id ^= img_del_]').on("click",function(){
            //id удаляемого элемента
            del_img = $(this).attr('id').replace("img_del_","");
            
            // находим родителя
            name_parent = $(this).parent().parent().attr('id');
            // получаем имя поля в из админки
            name_img = $("#"+name_parent).attr('id').replace("img_list_","");
            
            //удаляем его из списка
            $("#"+name_parent+" #item-"+del_img).remove();
            // собираем список                
            var temp_sort = "";               
            $("#"+name_parent).children().each(function() {
                  temp_sort += $( this ).attr('id').replace("item-","")+","
            });
            $('input[name=img_list_sort_'+name_img+']').val(temp_sort);
        });
		/* end multi images */

		
		$('form').validationEngine({
			scroll:false,
            inlineValidation: true
		});
		tiniini();
        var tabl = "<?=$GLOBALS['tabl'];?>";
		
		// кнопка сгенерировать пароль
		$(document).on('click', '.generatePassword', function() {
			nameField = $(this).attr('info');
			result       = '';
			words        = '0123456789qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM';
			max_position = words.length - 1;
			for( i = 0; i < 8; ++i ) {
				position = Math.floor ( Math.random() * max_position );
				result = result + words.substring(position, position + 1);
			}
			$('input[name=' + nameField + ']').val(result);
		});
		
		// select в  multiselext
		$(document).on('change', '[id^=MultiSelelectTable___]', function() {	
			arrayMulSel = {<?php echo trim($GLOBALS['arrayMulSel'], ',');?>};
			// получаем ключ(название поля)
			key = $(this).attr('id').split('___');
			key = key[1];
			
			// получаем необходимые данные для Ajax
			dataMultiselSelTable 	= arrayMulSel[key]['dataMultiselSelTable'];
			multiselSelTable 		= arrayMulSel[key]['multiselSelTable'];
	
			dataPost = {
				data   	: dataMultiselSelTable,
				pid   	: $(this).val(),
				key		: multiselSelTable,
				dataDB	: $(".multisorter#multi" + multiselSelTable).val()};
			content = ajaxRequest('multiselect_select', dataPost).done(function(msg) {
				if(msg != 'false' && msg) {
					msgObj = JSON.parse(msg);
					$(".multisorter#multi" + multiselSelTable).remove();
					$('.multi' + multiselSelTable).append(msgObj[0]);
					$(function () {
						$(".multisorter#multi" + multiselSelTable).multiselect({height: "175",multiple: true,selectTable: msgObj[1]});
					});
				}
				else
					console.log('Error mulriSelect!');
			});
		});
		
		
		
		/**** Для типа набор цен ****/
		var ar = new Array ();
		var pr = 0;
		var sh_num=0;    
		var sh_num_input = 100;
		ar["ua"]  = "ua";
		ar["ru"]  = "ru";
		ar["kz"]  = "kz";
		ar["bel"] = "bel";
		function refresh_price() {


			for (var i in ar) {
				sel = $("input[name^=\"price_" + ar[i] + "_\"]");
				$.each(sel, function (index, value) {

					z = $(this).attr("value");
					z = parseFloat(z);
					if (z) {
						pr += z;
					}
				});
				$("label.all_price_" + ar[i]).html(parseFloat(pr));
				$("label.all_price_" + ar[i]).next().val(parseFloat(pr));
				pr = 0;
			}
		}
		//TODO: Jugene product set add
		function add_price_set(x) {
			val = $("#" + x).val();
			name = $("#" + x + " :selected").text();

			sel = $("#tab_" + x + " tr");
			// проверяем есле сть не добовляем
			en = 1;
			$.each(sel, function (index, value) {
				if ($(this).attr('num') == val)en = 0;
			});

			if (val == '0')
				en = 0;
				
			if (en == 1) {

				$("#tab_" + x).append("<tr id='tr_" + x + sh_num_input + "' num=" + val + "><td>" + name + "</td>" +
					"<td>price_ua <input name='price_ua_" + val + "'></td>"+
					"<td>price_ru <input name='price_ru_" + val + "'></td>"+
					"<td>price_kz <input name='price_kz_" + val + "'></td>"+
					"<td>price_bel <input name='price_bel_" + val + "'></td>"+
					"<td onclick=\"del_price_set(" + sh_num_input + ",\'" + x + "\')\"><a href='javascript:void(0);'> удалить <a/></td></tr>");

				zz = '';
				sel = $("#tab_" + x + " tr");
				$.each(sel, function (index, value) {
					zz = zz + $(this).attr('num') + ',';
				});
				zz = zz.slice(0, -1);
				$("#in_" + x).val(zz);

				// delete
				zn = $("#in_" + x + "_del").val();
				zn = zn.replace("," + val + ",","");
				zn = $("#in_" + x + "_del").val(zn);

				sh_num_input--;
			}
		}
		//TODO: Jugene delete
		function del_price_set(y, x) {

			// add id characteristic on hidden input
			idch = $("#tr_" + x + y).attr('num');
			zn = $("#in_" + x + "_del").val() + "," + idch + ",";
			$("#in_" + x + "_del").val(zn);

			$("#tr_" + x + y).remove();
			sel = $("#tab_" + x + " tr");
			zz = '';
			$.each(sel, function (index, value) {
				zz = zz + $(this).attr('num') + ',';
			});
			zz = zz.slice(0, -1);
			$("#in_" + x).val(zz);
		}
		/**** END Для типа набор цен ****/
		
		/**** Для типа 2 селектов и поля ввода ****/
		// функция для добавления свойства
		function add_tab_with_input(x) {

			// перечень всех переменных для функции
			val_sel_main 	= $('#main_' + x).val();
			val_sel 		= $('#value_' + x).val();
			table_sel 		= $("#tab_" + x + " tr");
			select_input 	= false;
			name_sel 		= '';
			en_add 			= 1;
			
			// указываем значение в селкте или input
			if(val_sel == '0') {
				val_sel = $('#input_' + x).val(); 
				select_input = true;
			}
			
			if(val_sel) {
				// проверка на наличие свойства
				re = new RegExp("^" + val_sel_main + "_");
				$.each(table_sel, function (index, value) {
					if (re.exec($(this).attr('num_ch')) || $(this).attr('num_ch') == val_sel_main) 
						en_add = 0;
				});
				if(en_add == 1) {
					if(select_input == true) {
						$("#tab_" + x).append("<tr id='tr_" + x + val_sel_main + "' num_ch='" + val_sel_main + "'>" + 
							"<td>" + $('#main_' + x + ' :selected').text() + "</td>" +
							"<td>" + "<input type='hidden' name='twoSelect" + x + "___" + val_sel_main + "' value='" + val_sel + "'>" + 
									"<input type='text' value='" + val_sel + "' disabled='disabled'></td>" +
							"<td onclick=\"del_tab_with_input('" + x + "', " + val_sel_main + ")\"><a href='javascript:void(0);'> удалить <a/></td></tr>");
						num_ch = val_sel_main;
					}
					else {
						$("#tab_" + x).append("<tr id='tr_" + x + val_sel_main + "' num_ch='" + val_sel_main + "_" + val_sel + "'>" + 
							"<td>" + $('#main_' + x + ' :selected').text() + "</td>" +
							"<td>" + "<input type='hidden' name='twoSelect" + x + "___" + val_sel_main + "_" + val_sel + "' value='" + $("#value_" + x + " :selected").text() + "'>" + 
									"<input type='text' value='" + $("#value_" + x + " :selected").text() + "' disabled='disabled'></td>" +
							"<td onclick=\"del_tab_with_input('" + x + "', " + val_sel_main + ")\"><a href='javascript:void(0);'> удалить <a/></td></tr>");
						num_ch = val_sel_main + "_" + val_sel;
					}
					// delete id characteristic on hidden input
					zn = ',' + $("#" + x + "_del").val() + ',';
					zn = zn.replace("," + num_ch + ",","");
					zn = zn.slice(-1, -1);
					zn = $("#" + x + "_del").val(zn); 
					$('#input_' + x).val('');
				}
			}
		}
		// функция для получения списка второго select
		function checked_first_select(x, table) {
			dataPost = {
				table  	: table,
				pid		: $('select#main_' + x).val()};
			content =  ajaxRequest('two_select_with_link', dataPost).done(function(msg) {
				if(msg != 'false') {
					$('select#value_' + x).html(msg);
					$('#input_' + x).val('');
				}
			});
		}
		// функция для удаления свойства
		function del_tab_with_input(x, y) {

			idch = $("#tr_" + x + y).attr('num_ch');
			if($("#" + x + "_del").val() == '')
				zn = idch;
			else
				zn = $("#" + x + "_del").val() + "," + idch;
			$("#" + x + "_del").val(zn);
			$("#tr_" + x + y).remove();
		}
		/**** END Для типа 2 селектов и поля ввода ****/
	</script>
</form>