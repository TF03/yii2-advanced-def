<article class="product-thumb">

  <!-- Photo  -->
  <div class="product-thumb__photo hidden-xs">
    <div class="product-photo">
      <a class="product-photo__item product-photo__item--sm"
         href="{shop_url('product/'.$model->getSProducts()->getUrl())}">
        <img class="product-photo__img" src="{echo $model->getSProducts()->firstVariant->getSmallPhoto()}"
             alt="{echo $model->getSProducts()->getName()}" title="{echo $model->getSProducts()->getName()}">
        <div class="product-photo__labels">
          {if $model->getDiscountPercent()}
            <i class="product-photo__label product-photo__label--discount">-{echo $model->getDiscountPercent()}%</i>
          {/if}
        </div>
      </a>
    </div>
  </div>

  <!-- Title -->
  <h2 class="product-thumb__title">
    <a class="product-thumb__title-link"
       href="{shop_url('product/'.$model->getSProducts()->getUrl())}">{echo $model->getSProducts()->getName()}</a>
  </h2>


  <!-- Price -->
  <div class="product-thumb__price">

    <div class="product-price">
      <div class="product-price__item">
        <div class="product-price__old">
          {echo emmet_money($model->getOriginPrice(), 'span.product-price__old-value', '', 'span.product-price__old-cur')}
        </div>
      </div>

      <div class="product-price__item">
        <div class="product-price__main">
          {echo emmet_money($model->getFinalPrice(), 'span.product-price__main-value', '', 'span.product-price__main-cur')}
        </div>
      </div>
    </div>

  </div>

</article>