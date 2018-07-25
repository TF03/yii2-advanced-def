<div class="user-panel__item">
  <span class="user-panel__link">
    <i class="user-panel__ico user-panel__ico--profile">
      {view('includes/svg/svg-user.tpl')}
    </i>
    {tlang('Profile')}
    <i class="list-nav__arrow list-nav__arrow--down">
      {view('includes/svg/svg-arrow-down.tpl')}
    </i>
  </span>
  <div class="user-panel__drop user-panel__drop--rtl">
    <div class="overlay">
      
      {if !$CI->dx_auth->is_logged_in()}
      <!-- User auto menu. Visible when user is not authorized -->
      <div class="overlay__item">
        <a class="overlay__link" href="{site_url('auth')}" data-modal="login_popup">{tlang('Sign in')}</a>
      </div>
      <div class="overlay__item">
        <a class="overlay__link" href="{site_url('auth/register')}">{tlang('Create Account')}</a>
      </div>
      {else:}
      <!-- User profile menu. Visible when user is logged in -->
      <div class="overlay__item">
        <a class="overlay__link" href="{shop_url('profile')}">{tlang('Your Account')}</a>
      </div>
      <div class="overlay__item">
        <a class="overlay__link" href="{site_url('auth/change_password')}">{tlang('Change Password')}</a>
      </div>
      <div class="overlay__item">
        <a class="overlay__link" href="{site_url('auth/logout')}">{tlang('Sign out')}</a>
      </div>
      {/if}
    </div>
  </div>
</div>