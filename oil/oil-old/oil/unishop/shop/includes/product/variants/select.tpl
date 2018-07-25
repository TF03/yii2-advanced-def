{$variants = $model->getProductVariants()}

{if count($variants) > 1}
  <form class="variants-select" action="{tpl_self_url()}" method="post">

    <select class="variants-select__field" name="variant" data-product-variant="select">
      {foreach $variants as $variant}

        {$loc_disabled = $variant->getStock() > 0 ? "" : "disabled"}
        {$loc_selected = $variant->getId() != $model->firstVariant->getId() ? "" : 'selected="selected"'}
        {$loc_formatter = emmet_money($variant->getFinalPrice())}
        <option value="{echo $variant->getId()}" {$loc_selected}
                data-product-variant--id="{echo $variant->getId()}"
                data-product-variant--in-cart="{echo getAmountInCart('SProducts', $variant->getId()) > 0 ? 1 : 0 }"
                data-product-variant--number="{echo $variant->getNumber()}"
                data-product-variant--stock="{echo $variant->getStock()}"
                data-product-variant--price="{echo $loc_formatter->getPrice()}"
                data-product-variant--coins="{echo $loc_formatter->getCoins()}"
                data-product-variant--photo="{echo $product_main ? $variant->getMainPhoto() : $variant->getMediumPhoto()}"
                data-product-variant--thumb="{echo $variant->getSmallPhoto()}"
                data-product-variant--photo-link="{echo $variant->getLargePhoto()}"
        >
          {echo $variant->getName()} {echo $variant->getStock() > 0 ? "" : "&nbsp;&nbsp;(".tlang('Not available').")"}
        </option>
      {/foreach}
    </select>

  </form>
{/if}
