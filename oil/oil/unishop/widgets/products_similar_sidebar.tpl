{if $similarProducts}
<div class="content__sidebar-item">
  <div class="widget-sidebar">
    <div class="widget-sidebar__header">
      <h2 class="widget-sidebar__title">
        {getWidgetTitle('products_similar_sidebar')}
      </h2>        
    </div>      
    <div class="widget-sidebar__inner">
      {foreach $similarProducts as $product}
      <div class="widget-sidebar__item">
        {view('shop/includes/product/product_thumb.tpl', [
          'model' => $product
        ])}
      </div>
      {/foreach}
    </div>
  </div>
</div>
{/if}