$(document).ready(function(){

  /*
   * On change form submit
  */
  $(document).on('change', '[data-order-select]', function(e){
    $.mlsForm.onchangeSubmit('[data-order-select]');
  });

  
  /*
   * On submit merge with filter form to prevent canceling filtered options
  */
  $(document).on('submit', '[data-order-form]', function(e){
    e.preventDefault();
    /* merging with filter form  */
    var queryString = $.mlsForm.mergeForms($(this), $('[data-filter]'));
    /* creating final url and follow it */
    location.assign(location.pathname+"?"+queryString);
  });

});