<ul class="footer__items">
	{if !$CI->dx_auth->is_logged_in()}
	<li class="footer__item">
		<a class="footer__link" href="{site_url('auth')}" data-modal="login_popup">{tlang('Sign in')}</a>
	</li>
	<li class="footer__item">
		<a class="footer__link" href="{site_url('auth/register')}">{tlang('Create Account')}</a>
	</li>
	{else:}
	<li class="footer__item">
		<a class="footer__link" href="{shop_url('profile')}">{tlang('Your Account')}</a>
	</li>
	<li class="footer__item">
		<a class="footer__link" href="{site_url('auth/change_password')}">{tlang('Change Password')}</a>
	</li>
	<li class="footer__item">
		<a class="footer__link" href="{site_url('wishlist')}">{tlang('Wishlist')}</a>
	</li>
	{/if}              
	<li class="footer__item">
		<a class="footer__link" href="{shop_url('compare')}">{tlang('Compare')}</a>
	</li>
	<li class="footer__item">
		<a class="footer__link" href="{site_url('callbacks')}" data-modal="callbacks_modal">{tlang('Callback')}</a>
	</li>
	{if $CI->dx_auth->is_logged_in()}
	<li class="footer__item">
		<a class="footer__link" href="{site_url('auth/logout')}">{tlang('Sign out')}</a>
	</li>
	{/if}
</ul>