<div class="delivery-radio"
  data-cart-delivery
>
  {foreach $deliveryMethods as $delivery}
    <div class="delivery-radio__field" data-cart-delivery--item>

      <div class="delivery-radio__control">
        <input type="radio" name="deliveryMethodId" value="{echo $delivery->getId()}" id="deliveryMethod_{echo $delivery->getId()}"
        data-cart-delivery--input
        data-cart-delivery--href="{shop_url('cart')}"
        {if $delivery->getId() == get_value('deliveryMethodId')}checked{/if}>
      </div>
      <div class="delivery-radio__content">
        
        <label class="delivery-radio__title" for="deliveryMethod_{echo $delivery->getId()}">
          {echo $delivery->getName()}
        </label>
        
        {if trim(strip_tags($delivery->getDescription())) != ""}
          <div class="delivery-radio__info">
            {echo $delivery->getDescription()}
          </div>
        {/if}
        
        <!-- Delivery Price is undefined -->
        {if $delivery->getDeliverySumSpecified()}
          <div class="delivery-radio__info">
            {echo $delivery->getDeliverySumSpecifiedMessage()}
          </div>
        <!-- Delivery Price is defined -->
        {/if}

        {if $delivery->getPrice() > 0}
          <div class="delivery-radio__info">
            {tlang('Price')}: {echo str_replace(" ","", emmet_money($delivery->getPrice()))}
          </div>
          {if $delivery->getFreeFrom()}
            <div class="delivery-radio__info">
              {tlang('Free from')}: {echo str_replace(" ","", emmet_money($delivery->getFreeFrom()))}
            </div>
          {/if}
        {/if}

        <!-- Payment methods selection -->
        {if count($delivery->getPaymentMethodss()) > 0}
        <div class="delivery-radio__select hidden" data-cart-delivery--payment>
          <div class="delivery-radio__select-label">
            {tlang('Payment method')}:
          </div>
          <div class="delivery-radio__select-control">
            {view('shop/includes/cart/cart_payment_select.tpl', [
            'delivery' => $delivery
            ])}
          </div>
        </div>
        {/if}

      </div><!-- /.content -->

    </div><!-- /.field -->
  {/foreach}
</div><!-- /.delivery-radio -->