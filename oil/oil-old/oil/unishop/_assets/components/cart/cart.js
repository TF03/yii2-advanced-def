/**
 * Change cart product quantity
 */
$(document).on('submit', '[data-cart-summary--quantity]', function (e) {
    e.preventDefault();

    $.mlsCart.loadSummaryJson($(this), {
        loadFrame: true,
        transferData: true,
        toggleAddToCartButton: false,
        toggleKitButton: false
    });

});


/**
 * Delete item from cart
 */
$(document).on('click', '[data-cart-summary--delete]', function (e) {
    e.preventDefault();

    var variantId = $(this).attr('data-cart-summary--item-id')
    var kitList = $('[data-product-kit--id="' + variantId + '"]')

    $.mlsCart.loadSummaryJson($(this), {
        loadFrame: true,
        transferData: true,
        toggleAddToCartButton: true,
        toggleKitButton: true,
        variantId: variantId,
        kitList: kitList
    });

});


/**
 * Ajax gift coupon
 */
$(document).on('submit', '[data-cart-summary--coupon]', function (e) {
    e.preventDefault();

    var target = $(this);
    var responseFrame = $('[data-cart-summary]');

    $.ajax({
        url: target.attr('action'),
        type: target.attr('method') ? target.attr('method') : 'get',
        data: target.serialize(),
        beforeSend: function () {
            /* Frame loader */
            $.mlsAjax.preloaderShow({
                type: 'frame',
                frame: responseFrame
            });
        },
        success: function (data) {
            /* Insert response into document */
            $.mlsAjax.loadResponseFrame(data, responseFrame);
            // Grab extra data from response frame and insert it into remote places
            $.mlsAjax.transferData(data);
        }
    })

});


/**
 * Delivery methods change
 */
$(document).on('change', '[data-cart-delivery--input]', function (e) {
    e.preventDefault();

    var target = $(this);
    var targetUrl = target.attr('[data-cart-delivery--href]');
    var responseFrame = $('[data-cart-summary]');

    $.ajax({
        url: targetUrl,
        type: 'POST',
        data: target.serialize(),
        beforeSend: function () {
            /* Frame preloader */
            $.mlsAjax.preloaderShow({
                type: 'frame',
                frame: responseFrame
            });

        },
        success: function (data) {

            // Insert response into document
            $.mlsAjax.loadResponseFrame(data, responseFrame);

            // Grab extra data from response frame and insert it into remote places
            $.mlsAjax.transferData(data);

            // Toggle payment methods visibility
            $('[data-cart-delivery--payment]').addClass('hidden');
            target.closest('[data-cart-delivery--item]').find('[data-cart-delivery--payment]').removeClass('hidden');

        }
    });

});


/**
 * Order Checkout form sublit
 */
$(document).on('submit', '[data-cart-checkout-form]', function () {
    $(this).find('[data-cart-checkout-form-button]').prop('disabled', true);
});