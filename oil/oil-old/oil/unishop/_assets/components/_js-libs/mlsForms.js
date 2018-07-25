;(function($){

  $.mlsForm = {
    onchangeSubmit: function(checkbox){
      $(checkbox)
        .closest('form')
        .submit()
        .find(checkbox)
        .attr('disabled', true);
    },
    mergeForms: function(currentForm, includeForm){
      return includeForm.serialize()+'&'+currentForm.serialize();
    }
  }

})(jQuery);