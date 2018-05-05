<div class="cart-product">

  <div class="cart-product__photo hidden-xs hidden-sm">

    <div class="product-photo">
      <a class="product-photo__item product-photo__item--xs" href="{echo shop_url($product_url)}">
        <img class="product-photo__img" src="{echo $product_image}" alt="{echo $product_title}"
             title="{echo $product_title}">
      </a>
    </div>

  </div><!-- /.__photo -->

  <div class="cart-product__info">

    <!-- Product brand -->
    {if $product_brand}
      <div class="cart-product__brand">
        {echo $product_brand->getName()}
      </div>
    {/if}

    <!-- Product title -->
    <div class="cart-product__title">
      <a class="cart-product__link" href="{echo shop_url($product_url)}">{echo $product_title}</a>
      <!-- Product option (variant) -->
      {if $variant_title and trim($variant_title) != trim($product_title)}
        <span class="cart-product__option">{echo $variant_title}</span>
      {/if}
    </div>
  </div><!-- /.__info -->

</div><!-- /.__product -->