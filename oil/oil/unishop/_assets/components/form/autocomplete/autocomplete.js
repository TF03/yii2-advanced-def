;(function($){


	var scope = $('[data-autocomplete="header-search"]');
	var responseFrame = scope.find('[data-autocomplete-frame]');	
	var itemsNum = scope.find('[data-autocomplete-product]').size();
	var noItemsFrame = scope.find('[data-autocomplete-noitems]');
	var productsCount;
	var dataLength;
	var productWrapper;
	
	var appendProducts = function(data){

		/* Binding search result products json data into DOM vai data-attrs */
		$.each(data, function(index,val){
			if(index != 'queryString'){
				productWrapper = scope.find('[data-autocomplete-product="'+index+'"]');

				productWrapper.find('[data-autocomplete-product-name]').html(val.name);
				productWrapper.find('[data-autocomplete-product-price]').html(val.price);
				productWrapper.find('[data-autocomplete-product-img]').attr({'src': val.smallImage, 'alt': val.name});
				productWrapper.attr('href', location.origin+'/shop/product/'+val.url);
				productWrapper.removeClass('hidden');
			}
		});
		
		/* Calculate numbers of search results  Minus 1 filters "queryString" extra key */		
		dataLength = Object.keys(data).length - 1;

		/* Hiding saved products from previous search results */
		for(var i = itemsNum; i >= dataLength; i--){
			scope.find('[data-autocomplete-product="'+i+'"]').addClass('hidden');
		}

		return i;
	}	

	var getAutocompleteData = function(request,response){

		$.ajax({
			url: scope.attr('data-autocomplete-url'),
			method: 'post',
			data: {
				queryString: request.term
			},
			dataType: 'json',
			beforeSend: function(){
			},
			success: function(data){				
				
				/* 
				* Append products into DOM after success search.
				* Return numver of products
				*/
				productsCount = appendProducts(data);

				/* Show "no results" message if no items had been found and hide it in other case */
				productsCount < 0 ? noItemsFrame.removeClass('hidden'): noItemsFrame.addClass('hidden');

				/* Show autocomplete frame after search results */
				responseFrame.removeClass('hidden');

			}
		});

	}

	
	/* Autocomplete plugin init */
	$('[data-autocomplete-input]', scope).autocomplete({
		source: getAutocompleteData,
		minLength: 3,
		delay: 300
	});

	/* 
	 * Hide search results after clicking outside input field.
	 * Also prevent closing after click inside results frame
	*/
	$(document).on('click', function(event) {
		
		if($(event.target).closest(responseFrame).size() > 0){	
			event.stopPropagation();
		}else{
			responseFrame.addClass('hidden');
		}

	});

})(jQuery);