<section class="widget-primary" data-slider="widget-primary">
  <h2 class="widget-primary__title">{$parent_title}</h2>
  <div class="widget-primary__inner">
    <div class="widget-primary__arrow widget-primary__arrow--left hidden" data-slider-arrow-left>
      {view('includes/svg/svg-arrow-big-left.tpl')}
    </div>
    <div class="widget-primary__arrow widget-primary__arrow--right hidden" data-slider-arrow-right>
      {view('includes/svg/svg-arrow-big-right.tpl')}
    </div>
    <div class="row row--ib row--vindent-m" data-slider-slides="1,2,3,6">
      {foreach $parent_products as $product}
        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-2" data-slider-slide>
          {view('shop/includes/product/product_cut.tpl', [
          'model' => $product
          ])}
        </div>
      {/foreach}
    </div>
  </div>
</section>