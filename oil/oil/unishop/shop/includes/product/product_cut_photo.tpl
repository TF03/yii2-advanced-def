<div class="product-photo">
  <button class="product-photo__item product-photo__item--md" type="button"
          data-product-photo-href="{shop_url('product/'.$model->getUrl())}">
    <img class="product-photo__img" src="{echo $model->firstVariant->getMediumPhoto()}" alt="{echo $model->getName()}"
         title="{echo $model->getName()}"
         data-product-photo>
    <!-- Photo labels -->
    {view('shop/includes/product/product_labels.tpl', [
    'model' => $model
    ])}
  </button>
</div>