/* Component functions */
(function($){

	$.mshButtons = {
		addLoader: function(button){		
			button.attr('disabled', 'disabled').find('[data-button-loader="loader"]').removeClass('hidden');
		},
		removeLoader: function(button){		
			button.removeAttr('disabled').find('[data-button-loader="loader"]').addClass('hidden');
		}
	}

})(jQuery);


/* Event listeners */

/* Button icon loader */
$(document).on('click', '[data-button-loader="button"]', function(){
	$.mshButtons.addLoader($(this));
});