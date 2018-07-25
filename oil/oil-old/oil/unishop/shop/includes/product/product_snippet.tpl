<article class="product-snippet"
         data-product-scope>

  <div class="row">
    <div class="col-sm-5 col-md-3">

      <!-- Photo output BEGIN -->
      <div class="product-snippet__photo">
        {view('shop/includes/product/product_cut_photo.tpl', [
        'model' => $model
        ])}
      </div>
      <!-- END photo output -->

      <!-- Rating and reviews BEGIN -->
      <div class="product-snippet__rating">
        {view('shop/includes/product/product_rating.tpl', [
        'model' => $model
        ])}
      </div>
      <!-- END Rating and reviews -->

    </div><!-- /.col -->

    <div class="col-sm-7 col-md-9">

      <!-- Title BEGIN -->
      <h2 class="product-snippet__title">
        <a class="product-snippet__title-link"
           href="{shop_url('product/'.$model->getUrl())}">{echo $model->getName()}</a>
      </h2>
      <!-- END Title -->


      <!-- Additional info BEGIN -->
      <div class="product-snippet__addition">
        <!-- Brand -->
        {if $model->getBrand()}
          <div class="product-snippet__addition-item">
            {tlang('Brand')}:
            <a class="product-snippet__addition-link"
               href="{shop_url('brand/'.$model->getBrand()->getUrl())}">{echo $model->getBrand()->getName()}</a>
          </div>
        {/if}
        <!-- SCU Number -->
        {if $model->firstVariant->getNumber()}
          <div class="product-snippet__addition-item">
            {tlang('Number')}: <span data-product-number>{echo $model->firstVariant->getNumber()}</span>
          </div>
        {/if}
      </div><!-- /.product-snippet__addition -->
      <!-- END Additional info -->


      <!-- Product price -->
      <div class="product-snippet__price">
        {view('shop/includes/product/product_price.tpl', [
        'variant' => $model->firstVariant,
        'parent_modifier' => 'product-price--bg'
        ])}
      </div>

      <!-- Product variants -->
      {if count($model->getProductVariants()) > 1}
        <div class="product-snippet__variants">
          {view('shop/includes/product/variants/select.tpl', [
          'model' => $model
          ])}
        </div>
      {/if}

      <!-- Product "add to cart" and "already in cart" buttons -->
      <div class="product-snippet__actions">
        <div class="product-snippet__action-item">
          <!-- Product "add to cart" and "already in cart" buttons -->
          {view('shop/includes/product/product_buy.tpl', [
          'model' => $model,
          'parent_quantity' => false
          ])}
        </div>
        <div class="product-snippet__action-item" data-ajax-inject="wishlist-btn-{echo $model->firstVariant->getId()}">
          <!-- Wishlist buttons. Dont show button on whishlist page -->
          {module('wishlist')->renderWLButton($model->firstVariant->getId(), ['type' => 'button'])}
        </div>
        <div class="product-snippet__action-item">
          <!-- "Add to" or "Open in" compare buttons -->
          {view('shop/includes/compare/compare_button.tpl', ['model' => $model, 'type' => 'button'])}
        </div>
      </div><!-- /.product-cut__buttons -->


      <!-- Short description BEGIN -->
      {if $model->getShortDescription()}
        <div class="product-snippet__desc hidden-xs">
          <div class="typo">{echo strip_tags($model->getShortDescription())}</div>
        </div>
      {/if}
      <!-- END Short description -->


      <!-- Main properties BEGIN -->
      {$loc_main_params = ShopCore::app()->SPropertiesRenderer->renderPropertiesArray($model, true)}
      {if count($loc_main_params) > 0}
        <div class="product-snippet__params">

          <div class="main-params">
            {foreach $loc_main_params as $item}
              <div class="main-params__item">
                <span class="main-params__key">{$item.Name}:</span>
                <span class="main-params__val">{$item.Value}</span>
              </div>
            {/foreach}
          </div>

        </div>
      {/if}
      <!-- END Main properties -->

    </div><!-- /.col -->
  </div><!-- /.row -->
</article>