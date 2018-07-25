<li class="tree-nav__item" {if $wrapper}data-global-doubletap{/if}>
  <a class="tree-nav__link" href="{$link}">{$title}
    {if $wrapper}
      <i class="tree-nav__arrow tree-nav__arrow--right">
        {view('includes/svg/svg-arrow-right.tpl')}
      </i>
    {/if}
  </a>
  {$wrapper}
</li>