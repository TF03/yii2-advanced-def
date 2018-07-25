{if count($languages) > 1}
{$loc_cur_lang = getLanguage(array('id'=>CI::$APP->config->config['cur_lang']))}
{$loc_cur_lang_url = "/" . $loc_cur_lang.identif . $current_address}
<div class="list-nav__item">
	<i class="list-nav__ico">
		<i class="ico-flag ico-flag--{$loc_cur_lang.identif}"></i>
	</i>
	<i class="fa fa-caret-down"></i>
	<div class="list-nav__drop list-nav__drop--rtl">
		<ul class="overlay">
			{foreach $languages as $lang}			
			{$loc_page_url = "/" . $lang.identif . $current_address}		
			<li class="overlay__item">
				<a class="overlay__link" href="{$loc_page_url}">
				<i class="overlay__ico">
					<i class="ico-flag ico-flag--{$lang.identif}"></i>
				</i>
				{$lang.lang_name}
				</a>
			</li>
			{/foreach}
		</ul>
	</div>
</div>
{/if}