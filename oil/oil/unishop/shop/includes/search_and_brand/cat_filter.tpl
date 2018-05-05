{if count($categories) > 0}
<ul class="search-nav">
  {foreach $categories as $category}  
  <li class="search-nav__item">
    <span class="search-nav__title">{key($category)}</span>
    <ul class="search-nav__inner">
      {foreach $category[key($category)] as $item}

        <!-- Building URL depending on page type: search or brand page -->
        {if $brand_url}
          <!-- Attaching order method to URL -->
          {$loc_order = $_GET['order'] ? "?order=".$_GET['order'] : ""}

          {$loc_url = "brand/".$brand_url ."/".$item.id . $loc_order}
        {else:}
          <!-- Attaching order method to URL -->
          {$loc_order = $_GET['order'] ? "&amp;order=".$_GET['order'] : ""}

          {$loc_url = "search?text=".$_GET['text']."&amp;category=".$item.id . $loc_order}
        {/if}

        <!-- Building active item -->
        {$loc_active = $_GET['category'] == $item.id ? "search-nav__inner-link--active" : ""}

        <li class="search-nav__inner-item">
          <a class="search-nav__inner-link {$loc_active}" href="{shop_url($loc_url)}">{$item.name}</a>
          <span class="search-nav__inner-count">({$item.count})</span>
        </li>
      {/foreach}
    </ul>
  </li>
  {/foreach}
</ul>
{/if}