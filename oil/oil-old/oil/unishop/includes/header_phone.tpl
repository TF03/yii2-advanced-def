{if trim(siteinfo('mainphone')) != ""}
<div class="site-info">
    <div class="site-info__aside hidden-xs">
      <div class="site-info__ico site-info__ico--phone-big">
        {view('includes/svg/svg-phone-big.tpl')}
      </div>
    </div>
    <div class="site-info__inner">
      <div class="site-info__title">{echo siteinfo('mainphone')}</div>
      <div class="site-info__desc">
        <a class="site-info__link" href="{site_url('callbacks')}"
        	data-modal="callbacks_modal"
        >
        	{tlang('Callback')}
        </a>
      </div>
    </div>
</div>
{/if}