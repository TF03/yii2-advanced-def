<li class="overlay__item overlay__item--active" {if $wrapper}data-global-doubletap{/if}>
  <a class="overlay__link" href="{$link}" {$target}>{$title}
    {if $wrapper}
      <i class="overlay__arrow overlay__arrow--right">
        {view('includes/svg/svg-arrow-right.tpl')}
      </i>
    {/if}
  </a>
  {$wrapper}
</li>