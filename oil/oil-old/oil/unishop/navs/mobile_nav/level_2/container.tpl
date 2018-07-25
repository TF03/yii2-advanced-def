<ul class="mobile-nav__list mobile-nav__list--drop hidden" data-mobile-nav-list>
	<li class="mobile-nav__item" data-mobile-nav-item>
    <button class="mobile-nav__link mobile-nav__link--go-back" data-mobile-nav-go-back>
      {tlang('Go back')}
      <span class="mobile-nav__has-children"><i class="mobile-nav__ico"></i></span>
    </button>
  </li>
  <li class="mobile-nav__item" data-mobile-nav-item>
    <a class="mobile-nav__link mobile-nav__link--view-all" href="{tpl_menu_parent_link($link)}">
      {tlang('View all')}
    </a>
  </li>
	{$wrapper}
</ul>