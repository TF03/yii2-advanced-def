<div class="content__sidebar-item">

  <form class="filter" method="GET" action="{tpl_self_url()}"
        data-filter
  >

    <!-- Price -->
    {if $curMax > 0}
      <div class="filter__item">
        <div class="filter__header">
          <div class="filter__title">{tlang('Price range')}</div>
        </div>
        <div class="filter__inner">
          <div class="filter__range-field">
            <div class="row">
              <div class="col-xs-6">
                <input class="filter__range-control" type="text" name="lp" value="{echo $curMin}"
                       data-filter-price-min="{echo $minPrice}">
              </div>
              <div class="col-xs-6">
                <input class="filter__range-control" type="text" name="rp" value="{echo $curMax}"
                       data-filter-price-max="{echo $maxPrice}">
              </div>
            </div>
          </div>
          <div class="filter__range-slider">
            <div class="range-slider">
              <div class="range-slider__wrapper">
                <div class="range-slider__control" data-range-slider></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    {/if}


    <!-- Brands -->
    {if count($brands) > 0}
      <div class="filter__item">
        <div class="filter__header">
          <div class="filter__title">{tlang('Brand')}</div>
        </div>
        <div class="filter__inner">
          {foreach $brands as $item}
            {$loc_checked = in_array($item->id, $_GET['brand']) ? "checked" : ""}
            {$loc_available = $item->countProducts > 0 || $loc_checked ? "" : "disabled"}
            <label class="filter__checkgroup">
          <span class="filter__checkgroup-control">
            <input type="checkbox" name="brand[]" value="{echo $item->id}" {$loc_checked} {$loc_available}
                   data-filter-checkbox
                   data-url="{echo $item->url}"
            >
          </span>
          <span class="filter__checkgroup-title {$loc_available}">
            {echo $item->name}
          </span>
          <span class="filter__checkgroup-count">
            ({echo $item->countProducts})
          </span>
            </label>
          {/foreach}
        </div>
      </div>
    {/if}


    <!-- Properties -->
    {if count($propertiesInCat) > 0}
      {foreach $propertiesInCat as $prop}

        <!-- if filter has dropDown type -->
        {$loc_is_dropdown = in_array('dropDown', getPropertyTypes($prop->property_id)) ? true : false}
        <!-- if false, properties will be visible by default -->
        {$loc_dropdown_hidden = $prop->selectedValues ? false : true}
        <!-- if filter has scroll type -->
        {$loc_is_scroll = in_array('scroll', getPropertyTypes($prop->property_id)) ? true : false}
        <div class="filter__item" data-filter-drop-scope>

          <div class="filter__header" {if $loc_is_dropdown}data-filter-drop-handle{/if}>
            <div class="filter__title">{echo $prop->name}</div>
            <!-- Show/hide properties buttons, visible when filter has dropDown type -->
            {if $loc_is_dropdown}
              <div class="filter__handle">
                <div class="filter__handle-ico filter__handle-ico--plus {if !$loc_dropdown_hidden}hidden{/if}"
                     data-filter-drop-ico></div>
                <div class="filter__handle-ico filter__handle-ico--minus {if $loc_dropdown_hidden}hidden{/if}"
                     data-filter-drop-ico></div>
              </div>
            {/if}
          </div><!-- /.filter__header -->

          <div class="filter__inner
               {if $loc_is_dropdown and $loc_dropdown_hidden}filter__inner--js-hidden{/if}
               {if $loc_is_scroll && count($prop->possibleValues) > 10}filter__inner--scroll{/if}
               "
               data-filter-drop-inner
               {if $loc_is_scroll}data-filter-scroll{/if}
          >
            {foreach $prop->possibleValues as $item}
              {$loc_checked = in_array(htmlspecialchars_decode($item.value, ENT_QUOTES), $_GET['p'][$prop->property_id]) ? "checked" : ""}
              {$loc_available = $item.count > 0 || $loc_checked ? "" : "disabled"}
              <label class="filter__checkgroup">
              <span class="filter__checkgroup-control">
                <input type="checkbox" name="p[{echo $prop->property_id}][]"
                       value="{echo $item.value}" {$loc_checked} {$loc_available}
                       data-filter-checkbox
                       data-physical="{echo $prop->csv_name}-{echo $item.id}"
                >
              </span>
              <span class="filter__checkgroup-title {$loc_available}">
                {echo $item.value}
              </span>
              <span class="filter__checkgroup-count">
                ({echo $item.count})
              </span>
              </label>
            {/foreach}
          </div><!-- /.filter__inner -->

        </div>
        <!-- /.filter__item -->

      {/foreach}
    {/if}
  </form>

</div>