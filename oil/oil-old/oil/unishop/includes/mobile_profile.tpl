{if !$CI->dx_auth->is_logged_in()}
	<li class="mobile-nav__item" data-mobile-nav-item>
		<a class="mobile-nav__link" href="{site_url('auth')}">{tlang('Sign in')}</a>
	</li>
	<li class="mobile-nav__item" data-mobile-nav-item>
		<a class="mobile-nav__link" href="{site_url('auth/register')}">{tlang('Create Account')}</a>
	</li>
{else:}
	<li class="mobile-nav__item" data-mobile-nav-item>
		<a class="mobile-nav__link" href="{shop_url('profile')}">{tlang('Your Account')}</a>
	</li>
	<li class="mobile-nav__item" data-mobile-nav-item>
		<a class="mobile-nav__link" href="{site_url('auth/change_password')}">{tlang('Change Password')}</a>
	</li>    
{/if}
	
<li class="mobile-nav__item">
	<a class="mobile-nav__link" href="{shop_url('cart')}">{tlang('Cart')}</a>
</li>

{if $CI->dx_auth->is_logged_in()}
<li class="mobile-nav__item">
	<a class="mobile-nav__link" href="{site_url('wishlist')}">{tlang('Wishlist')}</a>
</li>
{/if}

<li class="mobile-nav__item">
	<a class="mobile-nav__link" href="{shop_url('compare')}">{tlang('Compare')}</a>
</li>

{if $CI->dx_auth->is_logged_in()}
<li class="mobile-nav__item">
	<a class="mobile-nav__link" href="{site_url('auth/logout')}">{tlang('Sign out')}</a>
</li>
{/if}