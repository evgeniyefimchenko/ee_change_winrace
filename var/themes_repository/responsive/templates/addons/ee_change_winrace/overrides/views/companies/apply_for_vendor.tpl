{if $addons.ee_change_winrace.ee_change_winrace_vendor == "Y"}
	{hook name="vendors:apply_page"}
		<div class="ty-company-fields vendor-cont">
			{include file="views/profiles/components/profiles_scripts.tpl"}        
			{* start add new form *}
			<section class="my-profile">
				<div class="my-profile__container">
					<h1 class="my-profile__title">Регистрация продавца</h1>
					<form action="{"companies.apply_for_vendor"|fn_url}" method="post" name="apply_for_vendor_form" enctype="multipart/form-data">
						<a href="#">
							<div class="my-profile__banner banner-my-profile">
								<div class="banner-my-profile__text">
									Узнайте больше и оцените преимущество торговли на WinRace-<br>
									профильной площадке для торговли товарами спорта, туризма и отдыха
								</div>
								<a href="#" class="banner-my-profile__button" style="text-align: center;">
									Подробнее<img style="padding-left: 10px;" src="/design/themes/responsive/media/images/addons/ee_change_winrace/banner-icon.png">
								</a>
							</div>
						</a>
						<h1 class="my-profile__title">Контактное лицо</h1>
						<div class="form-profile__half-row-inputs form-label">
                            <div class="text-field text-field_floating">
                                <input required autocomplete="off" type="text" placeholder="Имя *" name="company_data[admin_firstname]" data-error="Не может быть пустым" data-validate data-required="" class="text-field__input">
                                <label class="text-field__label" for="company_data[admin_firstname]">Имя *</label>
                            </div>
                            <div class="text-field text-field_floating">
                                <input required autocomplete="off" type="text" placeholder="Email *" name="company_data[email]" data-error="Неверный формат почты" data-validate data-required="email" class="text-field__input">
                                <label class="text-field__label" for="company_data[email]">Email *</label>
                            </div>
						</div>
						<div class="form-profile__half-row-inputs form-label">
                            <div class="text-field text-field_floating">
                                <input required autocomplete="off" type="text" placeholder="Фамилия *" name="company_data[admin_lastname]" data-error="Не может быть пустым" data-validate data-required="" class="text-field__input">
                                <label class="text-field__label" for="company_data[admin_lastname]">Фамилия *</label>
                            </div>
                            <div class="text-field text-field_floating">
                                <input required autocomplete="off" type="text" placeholder="Телефон *" name="company_data[phone]" data-error="Неверный формат телефона" data-validate data-inputmask="'mask': '+9(999)-999-99-99'" class="text-field__input">
                                <label class="text-field__label" for="company_data[admin_firstname]">Телефон *</label>
                            </div>
						</div>
						<h1 class="my-profile__title">Информация о компании</h1>
						<div class="form-profile__half-row-inputs form-label">
                            <div class="text-field text-field_floating">
                                <input required autocomplete="off" type="text" placeholder="Название вашего, магазина, бренда, ООО/ИП *" name="company_data[company]" data-error="Не может быть пустым" data-validate data-required="" class="text-field__input">
                                <label class="text-field__label" for="company_data[admin_firstname]">Название вашего, магазина, бренда, ООО/ИП *</label>
                            </div>
							<div class="text-field text-field_floating">
								<label class="form-profile__input-label" for="state">
									<select id="state" class="text-field__input" name="company_data[state]" data-error=""
									style="outline: 0!important; line-height: normal; padding-top: 1.1rem;">
										{foreach from=$states.RU item=state}
											<option value="{$state.code}">{$state.state}</option>
										{/foreach}
									</select>
									<div class="every_grey show-on-focus__label_2">Область / Субъект РФ</div>
								</label>
							</div>
						</div>
						<div class="form-profile__half-row-inputs form-label">
                            <div class="text-field text-field_floating">
                                <input autocomplete="off" type="text" required placeholder="Какая у вас продукция, где можно посмотреть ваши товары? *" name="company_data[fields][72]" data-error="Не может быть пустым" data-validate data-required="" class="text-field__input">
                                <label class="text-field__label" for="company_data[admin_firstname]">Какая у вас продукция, где можно посмотреть ваши товары? *</label>
                            </div>
                            <div class="text-field text-field_floating">
                                <input name="company_data[city]" id="city" required  placeholder="Город" type="text" data-error="Не может быть пустым" autocomplete="off" required autocomplete="off" type="text" placeholder="Имя *" name="company_data[admin_firstname]" data-error="Не может быть пустым" data-validate data-required="" class="text-field__input">
                                <label class="text-field__label" for="company_data[admin_firstname]">Город</label>
                            </div>
						</div>
						<div class="form-profile__bottom form-profile__bottom_seller ">
							<div class="checkbox">
								<input id="c_1" data-error="Не может быть пустым" class="checkbox__input" required type="checkbox" />
								<label for="c_1" class="checkbox__label">
									<span class="checkbox__text checkbox__text_thing">Даю согласие на обработку моих данных <a href="/politika-konfidencialnosti/">Политика конфиденциальности</a></span>
								</label>
							</div>
							<script>
							var verifyGrecaptcha = undefined;
							var verifyCallback = function(response) {
								verifyGrecaptcha = response;
							};
								</script>
							<div class="g-recaptcha" data-sitekey="6Lc7KLshAAAAABGbSElBA7IlVqetiWBVLyOzVbar" data-callback="verifyCallback" data-expired-callback="verifyCallback"></div>
							<script src="https://www.google.com/recaptcha/api.js?_v=20220830015640" async defer></script>
							<script>
								var verifyGrecaptcha = 1;
							</script>
							<div class="buttons-container" style="background: none; padding: 15px 0 0 0;">
								{include file="buttons/button.tpl" but_text=__("submit") but_name="dispatch[companies.apply_for_vendor]" but_id="but_apply_for_vendor" but_meta="ty-btn__primary"}
							</div>
						</div>
					</form>
				</div>
			</section>
			{* end new form *}
			{$kill_bad_code = 1}
			{if !$kill_bad_code}
				<div id="apply_for_vendor_account" >
					<form action="{"companies.apply_for_vendor"|fn_url}" method="post" name="apply_for_vendor_form" enctype="multipart/form-data">
						{if $invitation_key}
							<input type="hidden" name="company_data[invitation_key]" value="{$invitation_key}" />
						{/if}
						{hook name="vendors:apply_fields"}
							{include file="views/profiles/components/profile_fields.tpl" section="C" nothing_extra="Y" default_data_name="company_data" profile_data=$company_data}

						{hook name="vendors:apply_description"}
						{/hook}

							<input type="hidden" name="company_data[lang_code]" value="{$smarty.const.CART_LANGUAGE}" />
						{/hook}

						{include file="common/image_verification.tpl" option="apply_for_vendor_account" align="left"}

						<div class="buttons-container">
							{include file="buttons/button.tpl" but_text=__("submit") but_name="dispatch[companies.apply_for_vendor]" but_id="but_apply_for_vendor" but_meta="ty-btn__primary"}
						</div>
					</form>
				</div>
			{/if}
		</div>
	{/hook}
	<!-- /responsive/templates/addons/ee_change_winrace/overrides/views/companies/apply_for_vendor.tpl -->
{else}
	{hook name="vendors:apply_page"}
	<div class="ty-company-fields">
		{include file="views/profiles/components/profiles_scripts.tpl"}
		<h1 class="ty-mainbox-title">{__("apply_for_vendor_account")}</h1>
		<div id="apply_for_vendor_account" >
			<form action="{"companies.apply_for_vendor"|fn_url}" method="post" name="apply_for_vendor_form" enctype="multipart/form-data">
				{if $invitation_key}
					<input type="hidden" name="company_data[invitation_key]" value="{$invitation_key}" />
				{/if}
				{hook name="vendors:apply_fields"}
					{include file="views/profiles/components/profile_fields.tpl" section="C" nothing_extra="Y" default_data_name="company_data" profile_data=$company_data}
					{hook name="vendors:apply_description"}
					{/hook}
					<input type="hidden" name="company_data[lang_code]" value="{$smarty.const.CART_LANGUAGE}" />
				{/hook}
				{include file="common/image_verification.tpl" option="apply_for_vendor_account" align="left"}
				<div class="buttons-container">
					{include file="buttons/button.tpl" but_text=__("submit") but_name="dispatch[companies.apply_for_vendor]" but_id="but_apply_for_vendor" but_meta="ty-btn__primary"}
				</div>
			</form>
		</div>
	</div>
	{/hook}
{/if}