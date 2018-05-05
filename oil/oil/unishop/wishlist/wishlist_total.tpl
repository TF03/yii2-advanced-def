{$total = module('wishlist')->getUserWishListItemsCount($CI->dx_auth->get_user_id())}

<a class="user-panel__link {if !$total}user-panel__link--empty{/if}" href="{site_url('wishlist')}" {if !$total}rel="nofollow"{/if}>
  <i class="user-panel__ico user-panel__ico--wishlist">
    {view('includes/svg/svg-heart.tpl')}
  </i>
  {tlang('Wishlist')} ({$total})
</a>