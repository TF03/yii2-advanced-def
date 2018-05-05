{$login = $CI->dx_auth->is_logged_in() ? '' : '?wishlist='.$varId}

{if $type == 'button'}

  <!-- Button link, used in catalog page -->
  {if $class != 'btn inWL'}
    <a class="btn-white" href="{$href}{$login}" data-modal>
      <i class="btn-white__ico btn-white__ico--wishlist">
        {view('includes/svg/svg-heart.tpl')}
      </i>
    </a>
  {else:}
    <a class="btn-white btn-white--active" href="{site_url('wishlist')}">
      <i class="btn-white__ico btn-white__ico--wishlist">
        {view('includes/svg/svg-heart.tpl')}
      </i>
    </a>
  {/if}

{else:}
  <div class="product-actions__ico product-actions__ico--wishlist">
    {view('includes/svg/svg-heart.tpl')}
  </div>
  <!-- Text link, used in product page -->
  {if $class != 'btn inWL'}
    <a class="product-actions__link" href="{$href}{$login}" data-modal>{tlang('Add to Wishlist')}</a>
  {else:}
    <a class="product-actions__link product-actions__link--open" href="{site_url('wishlist')}">{tlang('Open in Wishlist')}</a>
  {/if}

{/if}
