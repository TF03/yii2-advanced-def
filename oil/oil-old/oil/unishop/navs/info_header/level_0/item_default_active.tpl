<li class="list-nav__item list-nav__item--active" {if $wrapper}data-global-doubletap{/if}>
  <a class="list-nav__link" href="{$link}" {$target}>{$title}
    {if $wrapper}
      <i class="list-nav__arrow list-nav__arrow--down">
        {view('includes/svg/svg-arrow-down.tpl')}
      </i>
    {/if}
  </a>
  {$wrapper}
</li>