$(document).ready(function(){


  /*
   * Toggle filter visibility on mobile devices
  */
  $(document).on('click', '[data-filter-toggle--btn]', function(e){
    e.preventDefault();
    $('[data-filter-toggle--filter]').toggleClass('hidden-xs');
    $(this).find('[data-filter-toggle--btn-text]').toggleClass('hidden');
  });


  
  /*
   * Toggle property valuse visibility if dropDown option in filter setting is true
  */
  $(document).on('click', '[data-filter-drop-handle]', function(e){
    e.preventDefault();
    $(this).closest('[data-filter-drop-scope]').find('[data-filter-drop-inner]').slideToggle(300);
    $(this).closest('[data-filter-drop-scope]').find('[data-filter-drop-ico]').toggleClass('hidden', 300);
  });
  
  
  /*
  * Positioning scroll into the middle of chacked value
  * Working only if scroll option in filter setting is true
  */
  $('[data-filter-scroll]').each(function(){
    var frame = $(this);     
    var fieldActive = frame.find('[data-filter-checkbox]:checked').first();
    
    if(fieldActive.size() > 0){
      var fieldActivePos = fieldActive.offset().top - frame.offset().top;      
      frame.scrollTop(fieldActivePos- (frame.height() / 2 - fieldActive.height()));
    }    
  });


  /*
   * Submit Form on Change event
  */
  $(document).on('change', '[data-filter-checkbox]', function(e){
    $.mlsForm.onchangeSubmit('[data-filter-checkbox]');
  });


  /*
   * Adding physical urls
   * Merge with order form
  */
  $(document).on('submit', '[data-filter]', function(e){
    e.preventDefault();

    var mainUrl = location.pathname;
    var filterForm = $(this);

    /* 
     * Adding physical urls if seo_expert module exists
     * PhysicalFilter object is declared in /application/modules/smart_filter/assets/js/physical_pages.js
    */
    if(typeof PhysicalFilter !== "undefined"){
      mainUrl = PhysicalFilter.getUrl(filterForm);
    }

    /*
     * On submit merge with order form to prevent canceling ordering option
    */
    var queryString = $.mlsForm.mergeForms($(this), $('[data-order-form]'));
    location.assign(mainUrl+"?"+queryString);

  });


  /*
   * Remove checked filters
  */
  $(document).on('click', '[data-filter-result]', function(e){
    e.preventDefault();
    
    var filterForm = $('[data-filter]');
    var chechboxTarget = $(this).attr('data-filter-result-value');
    var priceTarget = $(this).attr('data-filter-result="price"');
    var minPrice, maxPrice;

    //Remove Checkbox Brand and Properties filters
    if($(this).attr('data-filter-result') == 'checkbox'){
      //Trigger submit form on filter via unchecking target element
      filterForm.find('[data-url="'+chechboxTarget+'"], [data-physical="'+chechboxTarget+'"]').prop('checked', false).trigger('change');
    }
    
    //Remove Price filter
    if($(this).attr('data-filter-result') == 'price'){
      minPrice = filterForm.find('[data-filter-price-min]').attr('data-filter-price-min');
      maxPrice = filterForm.find('[data-filter-price-max]').attr('data-filter-price-max');

      filterForm
      .find('[data-filter-price-min]').val(minPrice)    //set min price into filter price input value
      .end()                                            //return back to filter form selector
      .find('[data-filter-price-max]').val(maxPrice)    //set max price into filter price input value
      .end().submit();                                  //return back to filter form selector and submit it
    }

  });

});