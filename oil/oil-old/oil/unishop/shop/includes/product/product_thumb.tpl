<article class="product-thumb">

  <!-- Photo  -->
  <div class="product-thumb__photo">
    <div class="product-photo">
      <button class="product-photo__item product-photo__item--sm" type="button"
              data-product-photo-href="{shop_url('product/'.$model->getUrl())}">
        <img class="product-photo__img" src="{echo $model->firstVariant->getSmallPhoto()}"
             alt="{echo $model->getName()}" title="{echo $model->getName()}">
      </button>
    </div>
  </div>

  <div class="product-thumb__inner">
    <!-- Title -->
    <h2 class="product-thumb__title">
      <a class="product-thumb__title-link" href="{shop_url('product/'.$model->getUrl())}">{echo $model->getName()}</a>
    </h2>

    <!-- Price -->
    <div class="product-thumb__price">

      <div class="product-price product-price--bg">
        {if $model->firstVariant->getDiscountStatic() > 0}
          <div class="product-price__item">
            <div class="product-price__old">
              {echo emmet_money($model->firstVariant->getOriginPrice(), 'span.product-price__old-value', '', 'span.product-price__old-cur')}
            </div>
          </div>
        {/if}
        <div class="product-price__item">
          <div class="product-price__main">
            {echo emmet_money($model->firstVariant->getFinalPrice(), 'span.product-price__main-value', '', 'span.product-price__main-cur')}
          </div>
        </div>
      </div>

    </div>
  </div>

</article>