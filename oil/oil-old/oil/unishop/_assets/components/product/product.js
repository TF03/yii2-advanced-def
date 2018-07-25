//Libraries
(function($){
  /**
   *
   * @type {{loadCartButton: jQuery.mshProduct.loadCartButton, editCartButtons: jQuery.mshProduct.editCartButtons}}
   */
  $.mshProduct = {
    loadCartButton: function(variant){
      var product = variant.closest('[data-product-scope]');
      var variantId = variant.attr('data-product-variant--id');
      var buttonsForm = product.find('[data-product-button--form]');
      var isVariantInCart = Number(variant.attr('data-product-variant--in-cart'));
      var addToCartButton = product.find('[data-product-button--add]');
      var quantityField = product.find('[data-product-button--quantity]');
      var viewOrderButton = product.find('[data-product-button--view]');

      //Change variant_id for "Add to cart" button
      buttonsForm.attr('data-product-button--variant', variantId);

      //"Add to cart" and "Oder view" buttons toggle
      if(isVariantInCart){
          addToCartButton.add(quantityField).addClass('hidden');
          viewOrderButton.removeClass('hidden');
      }else{
          addToCartButton.add(quantityField).removeClass('hidden');
          viewOrderButton.addClass('hidden');
      }
    },
    editCartButtons: function(variantId, mod){
      var productVariant = $('[data-product-variant--id="'+variantId+'"]');
      var buttonVariantId = $('[data-product-button--variant="'+variantId+'"]').attr('data-product-button--variant');

      if(productVariant.size() > 0){
        // Product has variants
        productVariant.each(function(){
          var productVariantId = $(this).attr('data-product-variant--id');
          //change state in cart for variant
          $(this).attr('data-product-variant--in-cart', mod);
          //change "Add to car" button in all same products on page with same active variant
          if($(this).is(':checked') && (productVariantId === buttonVariantId)){
            $.mshProduct.loadCartButton($(this));
            //$('[data-product-button--variant='+productVariantId+']').each(function(){
            //  $(this).find('[data-product-button-item]').toggleClass('hidden');
            //});
          }
        });
      }else{
        // Product has no variants
        $('[data-product-button--variant='+variantId+']').find('[data-product-button-item]').toggleClass('hidden');
      }

    },
    getVariant: function(selector){
      var variant;
      
      //Linking to product variant depending on element type
      switch(selector.attr('data-product-variant')){
        case 'select' : variant = selector.find('option:checked'); break;
        default : variant = selector;
      }

      return variant;
    }
  }
})(jQuery);


//Add product to cart via Ajax
$(document).on('submit', '[data-product-button--form]', function(e){
  e.preventDefault();

  var addToCartForm = $(this);
  var loaderButton = addToCartForm.find('[data-product-button--loader]');
  var variantId = addToCartForm.attr('data-product-button--variant');
  var requestUrl = addToCartForm.attr('data-product-button--path')+'/'+variantId;
  var modalUrl = addToCartForm.attr('data-product-button--modal-url');
  var modalTpl = addToCartForm.attr('data-product-button--modal-template');

  $.ajax({
    url: requestUrl,
    data: addToCartForm.serialize(),
    type: addToCartForm.attr('method'),
    dataType: 'json',
    beforeSend: function(){
      $.mshButtons.addLoader(loaderButton);
    },
    complete: function(){
      $.mshButtons.removeLoader(loaderButton);
    },
    success: function(){

      $.mlsModal({
        src: modalUrl,
        data: {
          template: modalTpl
        },
        transferData: true
      });

      //Change "Add to cart" button to "Oder view" button inside product
      $.mshProduct.editCartButtons(variantId, 1);
    }
  });
});


//Add kit to cart via Ajax
$(document).on('click', '[data-product-kit]', function(e){
  e.preventDefault();

  var addToCartButton = $(this);
  var kitList = $('[data-product-kit--id="'+addToCartButton.attr('data-product-kit')+'"]');
  var requestUrl = addToCartButton.attr('href');
  var modalUrl = addToCartButton.attr('data-product-kit--modal-url');
  var modalTpl = addToCartButton.attr('data-product-kit--modal-template');

  $.ajax({
    url: requestUrl,
    data: addToCartButton.serialize(),
    type: 'get',
    beforeSend: function(){
       $.mshButtons.addLoader(addToCartButton);
    },
    complete: function(){
       $.mshButtons.removeLoader(addToCartButton);
    },
    success: function(){

      // open cart in modal window
      $.mlsModal({
          src: modalUrl,
          data: {
            template: modalTpl
          },
          transferData: true
      });

      // change "Add to Cart" button
      kitList.toggleClass('hidden');
    }
  });
});

//Change product variants
$(document).on('change', '[data-product-variant]', function(e){
  e.preventDefault();

  var variant = $.mshProduct.getVariant($(this));
  var product = variant.closest('[data-product-scope]');
  var variantId = variant.attr('data-product-variant--id');
  var mainThumb =  product.find('[data-product-photo-main-thumb]').closest('[data-product-photo-thumb]');
  var allThumbs = mainThumb.closest('[data-product-photo-scope]').find('[data-product-photo-thumb]');

  //Change "Add to cart" button
  $.mshProduct.loadCartButton(variant);

  //Change variant main photo
  product.find('[data-product-photo]').attr('src', variant.attr('data-product-variant--photo'));
  //Change variant thumb photo
  product.find('[data-product-photo-main-thumb]').attr('src', variant.attr('data-product-variant--thumb'));
  mainThumb.attr('href', variant.attr('data-product-variant--photo-link'));
  allThumbs.removeAttr('data-product-photo-thumb-active');
  mainThumb.attr('data-product-photo-thumb-active', '');
  $.mlsMedia.magnificGalley();
  //add link to large photo
  product.find('[data-product-photo-link]').attr('href', variant.attr('data-product-variant--photo-link'));
  //reinit zoom image plugin
  product.find('[data-zoom-image]').attr('data-zoom-image', variant.attr('data-product-variant--photo-link'));
  $.mlsMedia.zoomImage();

  //Change variant number
  product.find('[data-product-number]').html(variant.attr('data-product-variant--number'));

  //Check variant stock availability, and change button if necessary
  if(variant.attr('data-product-variant--stock') > 0){
    product.find('[data-product-available]').removeClass('hidden');
    product.find('[data-product-unavailable]').addClass('hidden');
  }else{
    product.find('[data-product-available]').addClass('hidden');
    product.find('[data-product-unavailable]').removeClass('hidden');
    //Add variant id to "notify when avaliable" button
    product.find('[data-product-notify]').attr('data-product-notify-variant', variantId);
  }

  //Change variant price
  product.find('[data-product-price--main]').html(variant.attr('data-product-variant--price'));
  product.find('[data-product-price--coins]').html(variant.attr('data-product-variant--coins'));   
});


/* Open modal window for in stock reminder page */
$(document).on('click', '[data-product-notify]', function(e){
  e.preventDefault();
  
  var notifyLink = $(this);

  $.mlsModal({
    src: $(this).attr('href'),
    data: {
      ProductId: notifyLink.attr('data-product-notify'),
      VariantId: notifyLink.attr('data-product-notify-variant')
    }
  });
});