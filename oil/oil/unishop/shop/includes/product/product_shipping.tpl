<div class="product-shipping">

  <!-- Delivery Methods -->
  {if count($delivery_methods) > 0}
    <div class="product-shipping__row">
      <div class="product-shipping__header">
        <span class="product-shipping__ico product-shipping__ico--delivery">
          {view('includes/svg/svg-delivery.tpl')}
        </span>
        <div class="product-shipping__title">
          <div class="tooltip">
            <span class="tooltip__label">{tlang('Shipping methods')}</span>
            <div class="tooltip__position">
              <div class="tooltip__ico">
                {view('includes/svg/svg-tooltip.tpl')}
                <div class="tooltip__drop tooltip__drop--rtl">
                  <div class="tooltip__desc tooltip__desc--md">
                    <div class="typo">
                      <dl>
                        {foreach $delivery_methods as $item}
                          <dt>{echo $item->getName()}</dt>
                          <dd>
                            <!-- Delivery Price is undefined -->
                            {if $item->getDeliverySumSpecified()}
                              <div>
                                {echo $item->getDeliverySumSpecifiedMessage()}
                              </div>
                            {/if}
                            <!-- Delivery Price is defined -->
                            {if $item->getPrice() > 0}
                              <div>
                                {tlang('Price')}: {echo str_replace(" ","", emmet_money($item->getPrice()))}<br>
                                {if $item->getFreeFrom()}
                                  {tlang('Free from')}: {echo str_replace(" ","", emmet_money($item->getFreeFrom()))}
                                {/if}
                              </div>
                            {/if}
                            <!-- Delivery Description -->
                            {if trim(strip_tags($item->getDescription())) != ""}
                              {echo $item->getDescription()}
                            {/if}
                          </dd>
                        {/foreach}
                      </dl>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div><!-- /.tooltip -->
        </div><!-- /.product-shipping__title -->
      </div><!-- /.product-shipping__header -->
      <ul class="product-shipping__list">
        {foreach $delivery_methods as $item}
          <li class="product-shipping__item">
            {echo $item->getName()}
          </li>
        {/foreach}
      </ul>
    </div>
    <!-- /.product-shipping__row -->
  {/if}

  <!-- Payment Methods -->
  {if count($payments_methods) > 0}
    <div class="product-shipping__row">
      <div class="product-shipping__header">
        <span class="product-shipping__ico product-shipping__ico--payment">
          {view('includes/svg/svg-payment.tpl')}
        </span>
        <div class="product-shipping__title">
          <div class="tooltip">
            <span class="tooltip__label">{tlang('Payment methods')}</span>
            <div class="tooltip__position">
              <div class="tooltip__ico">
                {view('includes/svg/svg-tooltip.tpl')}
                <div class="tooltip__drop tooltip__drop--rtl">
                  <div class="tooltip__desc tooltip__desc--md">
                    <div class="typo">
                      <dl>
                        {foreach $payments_methods as $item}
                          <dt>{echo $item->getName()}</dt>
                          <dd>{echo $item->getDescription()}</dd>
                        {/foreach}
                      </dl>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div><!-- /.tooltip -->
        </div><!-- /.product-shipping__title -->
      </div><!-- /.product-shipping__header -->
      <ul class="product-shipping__list">
        {foreach $payments_methods as $item}
          {$loc_desc = trim(strip_tags($item->getDescription())) != "" ? "product-shipping__tooltip-link" : ""}
          <li class="product-shipping__item">
            {echo $item->getName()}
          </li>
        {/foreach}
      </ul>
    </div><!-- /.product-shipping__row -->
  {/if}

  <!-- Phones -->
  {if siteinfo('mainphone')}
    <div class="product-shipping__row">
      <div class="product-shipping__header">
        <span class="product-shipping__ico product-shipping__ico--phone">
          {view('includes/svg/svg-phone-big.tpl')}
        </span>
        <div class="product-shipping__title">{tlang('Questions? Ask our experts')}</div>
      </div>
      <p class="product-shipping__desc">
        {tlang('Call:')} <span class="product-shipping__phone">{echo siteinfo('mainphone')}</span><br/>
        {tlang('or')} <a class="site-info__link" href="{site_url('callbacks')}"
                         data-modal="callbacks_modal">{tlang('order a callback')}</a>
      </p>
    </div>
  {/if}

</div><!-- /.product-shipping -->