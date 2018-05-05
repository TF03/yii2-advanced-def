{$total = $CI->session->userdata('shopForCompare') ? count($CI->session->userdata('shopForCompare')) : 0;}

<a class="user-panel__link {if !$total}user-panel__link--empty{/if}" href="{shop_url('compare')}"
   {if !$total}rel="nofollow"{/if} data-compare-removeclass="user-panel__link--empty">
  <i class="user-panel__ico user-panel__ico--compare">
    {view('includes/svg/svg-compare.tpl')}
  </i>
  {tlang('Compare')} (<span data-compare-total>{$total}</span>)
</a>