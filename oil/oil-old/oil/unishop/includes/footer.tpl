{if widget('start_page_seo_text') && $CI->core->core_data['data_type'] == 'main'}
  <div class="page__container">
    <div class="page__seo-text">
      <div class="typo typo--seo">{widget('start_page_seo_text')}</div>
    </div>
  </div>
{/if}

<div class="page__footer">
  <div class="page__container">
    <div class="footer">  
      <div class="row">
        <div class="col-xs-6 col-sm-3">
          <div class="footer__title">{tlang('Catalog')}</div>
          <div class="footer__inner">
            {load_catalog_menu('navs/catalog_footer')}         
          </div>
        </div>
        <div class="col-xs-6 col-sm-3">
          <div class="footer__title">{tlang('Store')}</div>
          <div class="footer__inner">
            {load_menu('info_footer')} 
          </div>
        </div>
        <div class="clearfix visible-xs"></div>
        <div class="col-xs-6 col-sm-3 col--spacer-xs">
          <div class="footer__title">{tlang('User menu')}</div>
          <div class="footer__inner">
            {view('includes/footer_profile.tpl')}
          </div>
        </div>
        <div class="col-xs-6 col-sm-3 col--spacer-xs">
          <div class="footer__title">{tlang('Contacts')}</div>
          <div class="footer__inner">
            <ul class="footer__items">
              {if trim(siteinfo('address')) != ""}
              <li class="footer__item">{siteinfo('address')}</li>
              {/if}
              {if trim(siteinfo('mainphone')) != ""}
              <li class="footer__item">{siteinfo('mainphone')}</li>
              {/if}
              {if trim(siteinfo('adminemail')) != ""}
              <li class="footer__item">{siteinfo('adminemail')}</li>
              {/if}
              <li class="footer__item">
                <a class="footer__link" href="{site_url('feedback')}"
                  data-modal="feedback_modal"
                >{tlang('Feedback')}</a>
              </li>
            </ul>
          </div>
          <div class="footer__inner">
            <div class="soc-groups">
              {if trim(siteinfo('vk-link')) != ""}
              <a class="soc-groups__ico soc-groups__ico--vk" href="{siteinfo('vk-link')}" target="_blank">
                <i class="fa fa-vk fa-lg"></i>
              </a>
              {/if}
              {if trim(siteinfo('fb-link')) != ""}
              <a class="soc-groups__ico soc-groups__ico--fb" href="{siteinfo('fb-link')}" target="_blank">
                <i class="fa fa-facebook fa-lg"></i>
              </a>
              {/if}
              {if trim(siteinfo('google-link')) != ""}
              <a class="soc-groups__ico soc-groups__ico--gp" href="{siteinfo('google-link')}" target="_blank">
                <i class="fa fa-google-plus fa-lg"></i>
              </a>
              {/if}
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="page__basement">
  <div class="page__container">
    <div class="basement"> 
      <div class="row row--ib row--ib-mid">
        {if trim(siteinfo('companytype')) != ""}
        <div class="col-xs-12 col-sm-6 col--align-left-sm col--spacer-xs">{siteinfo('companytype')}</div>
        {/if}
        <div class="col-xs-12 col-sm-6 col--align-right-sm col--spacer-xs">{tlang('Powered by ')} <a class="basement__link" href="http://imagecms.net" target="_blank">{tlang('ImageCMS')}</a></div>
      </div>
    </div>
  </div>
</div>