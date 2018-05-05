<div class="content__row content__row--sm">
  <div class="catalog-toolbar">
    <div class="row">

      <!-- Order BEGIN -->
      <div class="col-sm-7">
        {if ShopCore::app()->SSettings->getSortingFront()}
          <form class="catalog-toolbar__item" action="{tpl_self_url()}" method="GET" data-order-form>
            <div class="catalog-toolbar__label hidden-xs">{tlang('Sort by')}</div>
            <div class="catalog-toolbar__field">
              <select class="form-control input-sm" name="order" data-order-select>
                {foreach ShopCore::app()->SSettings->getSortingFront() as $order}
                  {$loc_selected = ($order.get == $_GET['order'] || ($order.id == $parent_default_order && !$_GET['order'])) ? "selected" : ""}
                  <option value="{$order.get}" {$loc_selected}>{$order.name_front}</option>
                {/foreach}
              </select>
              <!-- Include extra data from search form and category filter -->
              {if $_GET['text']}
                <input type="hidden" name="text" value="{$_GET['text']}">
              {/if}
              {if $_GET['category']}
                <input type="hidden" name="category" value="{$_GET['category']}">
              {/if}
            </div>
          </form>
        {/if}
      </div>
      <!-- END Order -->

      <!-- Change View BEGIN -->
      <div class="col-sm-5 hidden-xs">
        <div class="pull-right">
          <div class="catalog-toolbar__item">
            <div class="catalog-toolbar__label hidden-xs">{tlang('View')}</div>
            <div class="catalog-toolbar__field">
              <div class="btn-group btn-group-sm">
                <button class="btn btn-default"
                        data-catalog-view-item="card"
                        {if !$_COOKIE['catalog_view'] || $_COOKIE['catalog_view'] == 'card'}disabled{/if}
                >
                  <i class="fa fa-th-large fa-lg" title="{tlang('Card')}"></i>
                </button>
                <button class="btn btn-default"
                        data-catalog-view-item="snippet"
                        {if $_COOKIE['catalog_view'] == 'snippet'}disabled{/if}
                >
                  <i class="fa fa-th-list fa-lg" title="{tlang('Snippet')}"></i>
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- END Change View -->

    </div>
  </div>
</div>