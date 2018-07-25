<article class="product-cut"
         data-product-scope>

  <!-- Block visible once page is loaded -->
  <div class="product-cut__main-info">

    <!-- Photo output BEGIN -->
    <div class="product-cut__photo">
      {view('shop/includes/product/product_cut_photo.tpl', [
      'model' => $model
      ])}
    </div>

    <!-- Rating and reviews BEGIN -->
    <div class="product-cut__rating">
      {view('shop/includes/product/product_rating.tpl', [
      'model' => $model
      ])}
    </div>

    <!-- Title BEGIN -->
    <h2 class="product-cut__title">
      <a class="product-cut__title-link" href="{shop_url('product/'.$model->getUrl())}">{echo $model->getName()}</a>
    </h2>

    <!-- Product price -->
    <div class="product-cut__price">
      {view('shop/includes/product/product_price.tpl', [
      'variant' => $model->firstVariant,
      'parent_modifier' => 'product-price--bg'
      ])}
    </div>

    <!-- Delete item from wishlist -->
    {if $parent_wishlist}
      <div class="product-cut__delete">
        <a class="svg svg--delete"
           href="{site_url('/wishlist/deleteItem/' . $parent_wishlist.variant_id .'/'. $parent_wishlist.wish_list_id)}"
           title="{tlang('Remove from list')}">
          {view('includes/svg/svg-delete.tpl')}
        </a>
      </div>
    {/if}

    <!-- Move item between wishlists -->
    {if $parent_wishlist}
      <div class="product-cut__move">
        <a class="product-cut__move-link"
           href="{site_url('/wishlist/renderPopup/'.  $parent_wishlist.variant_id .'/'. $parent_wishlist.wish_list_id  .'/'. $user.id)}"
           data-modal
        >{tlang('Change list')}</a>
      </div>
    {/if}


    <!-- Block hidden at once, visible on hover -->
    <div class="product-cut__extra-info">

      <!-- Product variants -->
      <div class="product-cut__variants">
        {view('shop/includes/product/variants/select.tpl', ['model' => $model])}
      </div>

      <div class="product-cut__actions">
        <div class="product-cut__action-item">
          <!-- Product "add to cart" and "already in cart" buttons -->
          {view('shop/includes/product/product_buy.tpl', [
          'model' => $model,
          'parent_quantity' => false
          ])}
        </div>
        {if !$parent_wishlist}
          <div class="product-cut__action-item" data-ajax-inject="wishlist-btn-{echo $model->firstVariant->getId()}">
            <!-- Wishlist buttons. Dont show button on whishlist page -->
            {module('wishlist')->renderWLButton($model->firstVariant->getId(), ['type' => 'button'])}
          </div>
        {/if}
        <div class="product-cut__action-item">
          <!-- "Add to" or "Open in" compare buttons -->
          {view('shop/includes/compare/compare_button.tpl', ['model' => $model, 'type' => 'button'])}
        </div>
      </div><!-- /.product-cut__buttons -->

    </div><!-- /.product-cut__extra-info -->
  </div><!-- /.product-cut__main-info -->
</article>