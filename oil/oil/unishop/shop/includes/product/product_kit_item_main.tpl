<article class="product-thumb">

  <!-- Photo  -->
  <div class="product-thumb__photo hidden-xs">
    <div class="product-photo">
      <span class="product-photo__item product-photo__item--sm">
        <img class="product-photo__img" src="{echo $model->firstVariant->getSmallPhoto()}"
             alt="{echo $model->getName()}" title="{echo $model->getName()}">
      </span>
    </div>
  </div>

  <!-- Title -->
  <h2 class="product-thumb__title">
    {echo $model->getName()}
  </h2>

  <!-- Price -->
  <div class="product-thumb__price">

    <div class="product-price">
      <div class="product-price__item">
        <div class="product-price__main">
          {echo emmet_money($model->firstVariant->getFinalPrice(), 'span.product-price__main-value', '', 'span.product-price__main-cur')}
        </div>
      </div>
    </div>

  </div>

</article>