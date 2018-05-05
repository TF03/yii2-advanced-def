<div class="content">
  <div class="content__container">

    <div class="row">

      <!-- Left BEGIN -->
      <div class="col-sm-4 col-md-3 col-lg-2">

        <!-- Sub categories -->
        <div class="hidden-xs">
          {view('shop/includes/category/category_subnav.tpl')}
        </div>

        <!-- Filter toggle button on mobile devices -->
        <div class="content__sidebar-item visible-xs">
          <button class="btn btn-default btn-block" data-filter-toggle--btn>
            <span data-filter-toggle--btn-text>{tlang('Show filter')} <i class="fa fa-angle-down"></i></span>
            <span class="hidden" data-filter-toggle--btn-text>{tlang('Hide filter')} <i class="fa fa-angle-up"></i></span>
          </button>
        </div>

        <!-- Filter -->
        <div class="hidden-xs" data-filter-toggle--filter>
          {module('smart_filter')->init();}
        </div>
      </div>
      <!-- END Left -->

      <!-- Center BEGIN -->
      <div class="col-sm-8 col-md-9 col-lg-10">

        <!-- Category title -->
        <div class="content__header">
          <h1 class="content__title">
            {$title}
          </h1>
          <span class="content__hinfo">
            {tlang('Result')}:
            {if $totalProducts > 0}
              <i class="content__hinfo-number">{echo $_GET['per_page'] ? $_GET['per_page'] : 1}</i>
              -
              <i class="content__hinfo-number">{echo $_GET['per_page'] + count($products)}</i>
              {tlang('of')}
            {/if}
            <i class="content__hinfo-number">{$totalProducts}</i>
            {echo SStringHelper::Pluralize($totalProducts, array(tlang('pluralize item 1'), tlang('pluralize item 2'), tlang('pluralize item 3')))}
          </span>
        </div>

        <!-- Horisontal banner -->
        {if $loc_banner = getBanner('catalog_horisontal_banner', 'object')}
          <div class="content__row content__row--sm">
            {view('xbanners/banners/banner_simple.tpl', [
            'parent_banner' => $loc_banner
            ])}
          </div>
        {/if}

        <!-- Products order and view change -->
        {view('shop/includes/category/category_toolbar.tpl', [
          'parent_default_order' => $category->getOrderMethod()
        ])}

        <!-- Filter selected results -->
        {view('smart_filter/includes/filter_results.tpl')}

        <!-- Product list -->
        <div class="content__row">
          {view('shop/includes/category/category_products.tpl')}
        </div>

        <!-- Category description -->
        {if trim($category->getDescription()) != "" and $page_number < 2}
          <div class="content__row">
            <div class="typo">{echo trim($category->getDescription())}</div>
          </div>
        {/if}

      </div><!-- /.col -->
      <!-- END Center -->

    </div>

  </div><!-- /.content__container -->
</div><!-- /.content -->