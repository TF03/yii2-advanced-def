{$in_cart = getAmountInCart('ShopKit', $model->getId())}

<!-- Add to cart button -->
<a class="btn btn-primary {echo $in_cart > 0 ? 'hidden' : '' }" href="{shop_url('cart/api/addKit/'.$model->getId())}"
   data-product-kit="{echo $model->getId()}"
   data-product-kit--id="{echo $model->getId()}"
   data-product-kit--modal-url="{shop_url('cart')}"
   data-product-kit--modal-template="includes/cart/cart_modal"
>
    {tlang('Add all to cart')} <i class="button--loader hidden" data-button-loader="loader"></i>
</a>


<!-- Already in cart button -->
<a class="btn btn-light {echo $in_cart > 0 ? '' : 'hidden' }" href="{shop_url('cart')}"
   data-modal="includes/cart/cart_modal"
   data-product-kit--id="{echo $model->getId()}"
>
    {tlang('View in Cart')}
</a>