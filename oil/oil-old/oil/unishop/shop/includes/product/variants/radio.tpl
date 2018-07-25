{$variants = $model->getProductVariants()}
<form class="variants-radio" action="{tpl_self_url()}" method="post">

  {foreach $variants as $variant}

    {$loc_disabled = $variant->getStock() > 0 ? "" : "disabled"}
    {$loc_checked =  $variant->getId() == $model->firstVariant->getId() ? "checked" : ""}

    <div class="variants-radio__item {if $loc_disabled}variants-radio__item--disabled{/if}">
    
    <!-- Variant radio field BEGIN -->
    {if count($variants) > 1}
    <label class="variants-radio__field">
      <span class="variants-radio__field-inner">

        <input class="variants-radio__control" type="radio" name="variant" value="{echo $variant->getId()}" {$loc_checked}
               data-product-variant="radio"
               data-product-variant--id="{echo $variant->getId()}"
               data-product-variant--in-cart="{echo getAmountInCart('SProducts', $variant->getId()) > 0 ? 1 : 0 }"
               data-product-variant--number="{echo $variant->getNumber()}"
               data-product-variant--stock="{echo $variant->getStock()}"
               data-product-variant--photo="{echo $product_main ? $variant->getMainPhoto() : $variant->getMediumPhoto()}"
               data-product-variant--thumb="{echo $variant->getSmallPhoto()}"
               data-product-variant--photo-link="{echo $variant->getLargePhoto()}"
        >
        <span class="variants-radio__title">
          {echo $variant->getName()}
          {if $loc_disabled}
            <span class="variants-radio__available">{tlang('Not available')}</span>
          {/if}
        </span>
      </span>
    </label>
    {/if}
    <!-- END Variant radio field -->
    
    <!-- Price field align to left if there is only one variant -->
    {$loc_to_left = count($variants) == 1 ? "variants-radio__price--left" : ""}
    
    <!-- Price BEGIN -->
    <div class="variants-radio__price {$loc_to_left}">
      {view('shop/includes/product/product_price.tpl', [
        'variant' => $variant
      ])}
    </div>
    <!-- END Price -->

    </div><!-- /.variants-radio__wrapper -->
  {/foreach}

</form><!-- /.variants-radio -->