{if $addons.ee_change_winrace.ee_change_winrace_profile == "Y"}
	{include file="views/profiles/components/profiles_scripts.tpl"}
	{$dispatch = "profiles.update"}
	{if $runtime.action}
		{$dispatch = "profiles.update.{$runtime.action}"}
	{/if}		
	{assign var="profile" value=[$profile_fields,$user_data]|fn_ee_change_winrace_remake_profile_fields}
		<section class="my-profile">
			<div class="my-profile__container">            
				<form id="profile_formprofile_form" name="profile_form" enctype="multipart/form-data" action="{""|fn_url}" method="post">
					<input id="selected_section" type="hidden" value="general" name="selected_section"/>
					<input id="default_card_id" type="hidden" value="" name="default_cc"/>
					<input type="hidden" name="profile_id" value="{$user_data.profile_id}" />
					{foreach $profile_fields as $k => $v}					
						{if $k == 'C'}
							<h2 class="my-profile__title firstProfileTitle">Мой профиль</h2>
							<div class="form-profile__row-inputs">
								<div class="form-profile__input-group">							
									<label class="form-profile__input-label _form-error" for="user_data[email]" style="color: #999!important;">
									<input name="user_data[email]" id="user_data[email]"  placeholder="Ваш Email*" required="" class="form-profile__input input show-on-focus__input" value="{$user_data.email}" data-value="" data-error="Не может быть пустым"
									data-validate="" data-required="">
									<div class="show-on-focus__label">Ваш Email*</div>
									</label>
								</div>
								<div class="form-profile__input-group">							
									<label class="form-profile__input-label _form-error" for="user_data[fields][74]" style="color: #999!important;">
									<input autocomplete="disabled" name="user_data[fields][74]" id="user_data[fields][74]" placeholder="ФИО или никнейм*" quired="" class="form-profile__input input show-on-focus__input" value="{$profile.fields.value.74}" data-value="" data-error="Не может быть пустым"
									data-validate="" data-required="">
									<div class="show-on-focus__label active">ФИО или никнейм*</div>
									</label>
								</div>
								<div class="form-profile__input-group">							
									<label class="form-profile__input-label" style="color: #999!important;">
										<input type="password" id="password1" placeholder="Пароль*" name="user_data[password1]" size="32" maxlength="32" class="form-profile__input input show-on-focus__input" autocomplete="off" value="">
										<div class="show-on-focus__label every_grey">Пароль*</div>
									</label>
								</div>
							</div>
							<div class="form-profile__row-inputs">
								<div class="form-profile__input-group">
									<label class="form-profile__input-label" for="user_data[phone]" style="color: #999!important;">
									<input autocomplete="off" type="text" name="user_data[phone]" placeholder="Ваш телефон*" id="user_data[phone]" data-error="Не может быть пустым" data-validate="" data-required="phone"
									data-inputmask="'mask': '+9(999)-999-99-99'" value="{$user_data.phone}" data-value="{$user_data.phone}" class="form-profile__input show-on-focus__input form-profile__input_date input fullInput" inputmode="text">									
									<div class="show-on-focus__label every_grey">Ваш телефон*</div>
									</label>
								</div>						
								<div class="form-profile__input-group">
									<label class="form-profile__input-label" for="user_data[birthday]" style="color: #999!important;">
									{$date_format = "%d/%m/%Y"}
									{$extra = "required"}
									{$date_meta = "form-profile__input input"}
									{$date_id = "date_id"}
									{$date_name = "user_data[fields][75]"}
									{$date_val = $user_data.fields.75}
									<input data-inputmask="'mask': '99/99/9999'" placeholder="Дата рождения*" type="text" id="date_id" name="{$date_name}" class="show-on-focus__input ty-calendar__input{if $date_meta} {$date_meta}{/if} cm-calendar"
									value="{if $date_val}{$date_val|date_format:"`$date_format`"}{/if}" {$extra} size="10" autocomplete="disabled" />
									<a class="cm-external-focus ty-calendar__link" data-ca-external-focus-id="{$date_id}">
										{include_ext file="common/icon.tpl" class="ty-icon-calendar ty-calendar__button" title=__("calendar")}
									</a>
									<script>
									(function(_, $) {$ldelim}
										$.ceEvent('on', 'ce.commoninit', function(context) {
											$('#{$date_id}').datepicker({
												changeMonth: true,
												duration: 'fast',
												changeYear: true,
												numberOfMonths: 1,
												selectOtherMonths: true,
												showOtherMonths: true,
												firstDay: {if $settings.Appearance.calendar_week_format == "sunday_first"}0{else}1{/if},
												dayNamesMin: ['{__("weekday_abr_0")}', '{__("weekday_abr_1")}', '{__("weekday_abr_2")}', '{__("weekday_abr_3")}', '{__("weekday_abr_4")}', '{__("weekday_abr_5")}', '{__("weekday_abr_6")}'],
												monthNamesShort: ['{__("month_name_abr_1")|escape:"html"}', '{__("month_name_abr_2")|escape:"html"}', '{__("month_name_abr_3")|escape:"html"}', '{__("month_name_abr_4")|escape:"html"}', '{__("month_name_abr_5")|escape:"html"}', '{__("month_name_abr_6")|escape:"html"}', '{__("month_name_abr_7")|escape:"html"}', '{__("month_name_abr_8")|escape:"html"}', '{__("month_name_abr_9")|escape:"html"}', '{__("month_name_abr_10")|escape:"html"}', '{__("month_name_abr_11")|escape:"html"}', '{__("month_name_abr_12")|escape:"html"}'],
												yearRange: 'c-70:c+0',
												dateFormat: 'dd/mm/yy'
											});
										});
									{$rdelim}(Tygh, Tygh.$));
									</script>
									<div class="show-on-focus__label every_grey">Дата рождения*</div>
									</label>								
								</div>						
								<div class="form-profile__input-group">							
									<label class="form-profile__input-label" style="color: #999!important;">
										<input type="password" placeholder="Подтверждение пароля*" id="password2"  name="user_data[password2]" size="32" maxlength="32" class="show-on-focus__input form-profile__input input" autocomplete="off">
										<div class="show-on-focus__label every_grey">Подтверждение пароля*</div>
									</label>
								</div>						
							</div>
						{/if}
						{if $k != 'C'}
						{if $k == 'S'}
							<h2 class="my-profile__title lastProfileTitle">Данные для доставки</h2>					
						{/if}
						{if $k != 'B' && $k != 'E'}
							{$temp_count = 0}
							{$item_count = 0}
							{foreach $v as $id => $props}				
								{$item_count = $item_count + 1}
								{if $temp_count == 0}
									<div class="form-profile__row-inputs">
								{/if}							
								<div class="form-profile__input-group">
									{if isset($user_data[$props.field_name])}
										{$inputID = "user_data[`$props.field_name`]"}
									{else}
										{$inputID = "user_data[fields][`$props.field_id`]"}
									{/if}								
									<label class="form-profile__input-label" for="{$inputID}" style="color: #999!important;">
									{if $props.field_name|strpos:"mail"}
										{$required = 'email'}{$error_required = 'Неверный формат почты'}
									{elseif $props.field_name|strpos:"phone"}
										{$required = 'phone'}{$error_required = 'Не может быть пустым'}{*Нет проверки на валидность номера телефона*}
									{else}
										{$required = ''}{$error_required = 'Не может быть пустым'}
									{/if}								
									{if $props.field_type == 'I'}
										<input autocomplete="off" placeholder="{$props.description}" name="{$inputID}"  id="{$inputID}"{if $props.required == 'Y'} required {/if}class="show-on-focus__input form-profile__input input {$props.class}"
										value="{$profile[$props.field_name].value}" data-value="{$profile[$props.field_name].value}" data-error="{$error_required}" data-validate data-required="{$required}"/>
									{/if}
									{if $props.field_type == 'D'}
										{$date_format = "%d/%m/%Y"}
										{$extra = "required"}
										{$date_meta = "form-profile__input input"}
										{$date_id = "date_id"}
										{$date_name = "`$inputID`"}
										{$date_val = $profile[$props.field_name].value}
										<input placeholder="{$props.description}" data-inputmask="'mask': '99/99/9999'" type="text" id="date_id" name="{$inputID}" class="show-on-focus__input ty-calendar__input{if $date_meta} {$date_meta}{/if} cm-calendar"
										value="{if $date_val}{$date_val|date_format:"`$date_format`"}{/if}" {$extra} size="10" autocomplete="disabled" />
										<a class="cm-external-focus ty-calendar__link" data-ca-external-focus-id="{$date_id}">
											{include_ext file="common/icon.tpl" class="ty-icon-calendar ty-calendar__button" title=__("calendar")}
										</a>
										<script>
										(function(_, $) {$ldelim}
											$.ceEvent('on', 'ce.commoninit', function(context) {
												$('#{$date_id}').datepicker({
													changeMonth: true,
													duration: 'fast',
													changeYear: true,
													numberOfMonths: 1,
													selectOtherMonths: true,
													showOtherMonths: true,
													firstDay: {if $settings.Appearance.calendar_week_format == "sunday_first"}0{else}1{/if},
													dayNamesMin: ['{__("weekday_abr_0")}', '{__("weekday_abr_1")}', '{__("weekday_abr_2")}', '{__("weekday_abr_3")}', '{__("weekday_abr_4")}', '{__("weekday_abr_5")}', '{__("weekday_abr_6")}'],
													monthNamesShort: ['{__("month_name_abr_1")|escape:"html"}', '{__("month_name_abr_2")|escape:"html"}', '{__("month_name_abr_3")|escape:"html"}', '{__("month_name_abr_4")|escape:"html"}', '{__("month_name_abr_5")|escape:"html"}', '{__("month_name_abr_6")|escape:"html"}', '{__("month_name_abr_7")|escape:"html"}', '{__("month_name_abr_8")|escape:"html"}', '{__("month_name_abr_9")|escape:"html"}', '{__("month_name_abr_10")|escape:"html"}', '{__("month_name_abr_11")|escape:"html"}', '{__("month_name_abr_12")|escape:"html"}'],
													yearRange: 'c-70:c+0',
													dateFormat: 'dd/mm/yy'
												});
											});
										{$rdelim}(Tygh, Tygh.$));
										</script>									
									{/if}
									{if $props.field_type == 'E'}
										<input name="{$inputID}" placeholder="{$props.description}" id="{$inputID}"{if $props.required == 'Y'} required {/if}class="show-on-focus__input form-profile__input input {$props.class}"
										value="{$profile[$props.field_name].value}" data-value="{$profile[$props.field_name].value}" data-error="{$error_required}" data-validate data-required="{$required}"/>									
									{/if}
									{if $props.field_type == 'A'}
										<select id="{$inputID}" class="form-profile__input input ty-profile-field__select-state cm-state cm-location-shipping" name="{$inputID}"
										style="outline: 0!important; line-height: normal;">
											{foreach from=$states.RU item=state}
												<option {$profile[$props.field_name].value} {if $profile[$props.field_name].value == $state.code}selected="selected"{/if} value="{$state.code}">{$state.state}</option>
											{/foreach}
										</select>									
									{/if}
									{if $props.field_type == 'P'}
										<input autocomplete="off"  placeholder="{$props.description}" type="text" name="{$inputID}" id="{$inputID}" data-error="{$error_required}" data-validate data-required="{$required}"
										data-inputmask="'mask': '+9(999)-999-99-99'"
										value="{$profile[$props.field_name].value}" data-value="{$profile[$props.field_name].value}" class="show-on-focus__input form-profile__input form-profile__input_date input">									
									{/if}
									{if $props.field_type == 'Z'}
										<input autocomplete="off" type="text" placeholder="{$props.description}" name="{$inputID}" id="{$inputID}" data-error="{$error_required}" data-required="{$required}" data-validate
										value="{$profile[$props.field_name].value}" data-inputmask="'mask': '999999'" data-value="{$profile[$props.field_name].value}" class="show-on-focus__input form-profile__input input">
									{/if}
									{if $props.field_name != 'b_s_default_address' and  $props.field_type != 'A'}
										<span class="show-on-focus__label {if $props.field_type == 'D'} every_grey{/if}">{$props.description}</span>
									{/if}

									{if $props.field_type == 'A'}
										<span class="show-on-focus__label_2 {if $props.field_type == 'D'} every_grey{/if}">{$props.description}</span>
									{/if}								
									</label>
								</div>
								{$temp_count = $temp_count + 1}
								{if $temp_count == 3 || $v|count == $item_count}
									</div>
									{$temp_count = 0}
								{/if}
							{/foreach}
						{/if}
						{/if}
					{/foreach}
					<div class="checkbox" style="margin-top: 15px; height: 25px;">
						<input id="check_mystic_box" class="checkbox__input" type="checkbox"
						{if $user_data.fields.70 == 'Y'}checked{/if} />
						<label for="check_mystic_box" class="checkbox__label">
							<span class="checkbox__text">Использовать данный адрес по умолчанию</span>
						</label>
						<input type="hidden" id="check_mystic_box_val" value="{$user_data.fields.70}" name="user_data[fields][70]" />
					</div>
					<div class="form-profile__bottom" style="margin-top: 15px;">			
						{include file="buttons/save.tpl" but_name="dispatch[{$dispatch}]" but_meta="ty-btn__secondary" but_id="save_profile_but"}
					</div>			
				</form>
			</div>
		</section>
	<!-- /design/themes/responsive/templates/addons/my_profile/overrides/views/profiles/update.tpl -->
{else}
	{include file="views/profiles/components/profiles_scripts.tpl"}

	{$dispatch = "profiles.update"}

	{if $runtime.action}
		{$dispatch = "profiles.update.{$runtime.action}"}
	{/if}

	{if $runtime.mode == "add" && $settings.General.quick_registration == "YesNo::YES"|enum}
		<div class="ty-account">

			<form name="profiles_register_form" enctype="multipart/form-data" action="{""|fn_url}" method="post">
				{include file="views/profiles/components/profile_fields.tpl" section="C" nothing_extra="YesNo::YES"|enum}
				{include file="views/profiles/components/profiles_account.tpl" nothing_extra="YesNo::YES"|enum location="checkout"}

				{if $smarty.request.return_url}
					<input type="hidden" name="return_url" value="{$smarty.request.return_url}" />
				{/if}

				{hook name="profiles:account_update"}
				{/hook}

				{include file="common/image_verification.tpl" option="register" align="left" assign="image_verification"}
				{if $image_verification}
				<div class="ty-control-group">
					{$image_verification nofilter}
				</div>
				{/if}

				<div class="ty-profile-field__buttons buttons-container">
					{include file="buttons/register_profile.tpl" but_name="dispatch[{$dispatch}]"}
				</div>
			</form>
		</div>
		{capture name="mainbox_title"}{__("register_new_account")}{/capture}
	{else}
		{capture name="tabsbox"}
			<div class="ty-profile-field ty-account form-wrap" id="content_general">
				<form name="profile_form" enctype="multipart/form-data" action="{""|fn_url}" method="post">
					<input id="selected_section" type="hidden" value="general" name="selected_section"/>
					<input id="default_card_id" type="hidden" value="" name="default_cc"/>
					<input type="hidden" name="profile_id" value="{$user_data.profile_id}" />

					{if $smarty.request.return_url}
						<input type="hidden" name="return_url" value="{$smarty.request.return_url}" />
					{/if}

					{capture name="group"}
						{include file="views/profiles/components/profiles_account.tpl"}
						{include file="views/profiles/components/profile_fields.tpl" section="C" title=__("contact_information")}

						{if $profile_fields.B || $profile_fields.S}
							{if $settings.General.user_multiple_profiles == "YesNo::YES"|enum && $runtime.mode == "update"}
								<p>{__("text_multiprofile_notice")}</p>
								{include file="views/profiles/components/multiple_profiles.tpl" profile_id=$user_data.profile_id}
							{/if}

							{if $settings.Checkout.address_position == "billing_first"}
								{$first_section = "B"}
								{$first_section_text = __("billing_address")}
								{$sec_section = "S"}
								{$sec_section_text = __("shipping_address")}
								{$body_id = "sa"}
							{else}
								{$first_section = "S"}
								{$first_section_text = __("shipping_address")}
								{$sec_section = "B"}
								{$sec_section_text = __("billing_address")}
								{$body_id = "ba"}
							{/if}

							{include file="views/profiles/components/profile_fields.tpl" section=$first_section body_id="" ship_to_another=true title=$first_section_text}
							{include file="views/profiles/components/profile_fields.tpl" section=$sec_section body_id=$body_id ship_to_another=true title=$sec_section_text address_flag=$profile_fields|fn_compare_shipping_billing ship_to_another=$ship_to_another}
						{/if}

						{hook name="profiles:account_update"}
						{/hook}

						{include file="common/image_verification.tpl" option="register" align="center"}

					{/capture}
					{$smarty.capture.group nofilter}

					<div class="ty-profile-field__buttons buttons-container">
						{if $runtime.mode == "add"}
							{include file="buttons/register_profile.tpl" but_name="dispatch[{$dispatch}]" but_id="save_profile_but"}
						{else}
							{include file="buttons/save.tpl" but_name="dispatch[{$dispatch}]" but_meta="ty-btn__secondary" but_id="save_profile_but"}
							<input class="ty-profile-field__reset ty-btn ty-btn__tertiary" type="reset" name="reset" value="{__("revert")}" id="shipping_address_reset"/>

							<script>
							(function(_, $) {
								var address_switch = $('input:radio:checked', '.ty-address-switch');
								$("#shipping_address_reset").on("click", function(e) {
									setTimeout(function() {
										address_switch.click();
									}, 50);
								});
							}(Tygh, Tygh.$));
							</script>
							{if $settings.General.show_delete_account_button === "YesNO::YES"|enum && $user_data.user_type === "UserTypes::CUSTOMER"|enum}
								{capture name="delete_my_account"}
									{include file="views/profiles/components/user_action_popup.tpl"
										action="anonymization_request"
										description=__("delete_my_account_description")
										title=__("delete_my_account")
										id=$block.block_id
									}
								{/capture}

								{include file="common/popupbox.tpl"
									link_text=__("delete_my_account")
									title=__("delete_my_account")
									id="anonymization_request_dialog_`$block.block_id`"
									content=$smarty.capture.delete_my_account
									link_meta="ty-ml-s"
								}
							{/if}
						{/if}
					</div>
				</form>
			</div>

			{capture name="additional_tabs"}
				{if $runtime.mode == "update"}
					{if $usergroups && !$user_data|fn_check_user_type_admin_area}
						<div id="content_usergroups">
							<table class="ty-table">
								<thead>
									<tr>
										<th style="width: 30%">{__("usergroup")}</th>
										<th style="width: 30%">{__("status")}</th>
										{if $settings.General.allow_usergroup_signup == "YesNo::YES"|enum}
											<th style="width: 40%">{__("action")}</th>
										{/if}
									</tr>
								</thead>
								<tbody>
								
									{foreach $usergroups as $usergroup}
										{if $user_data.usergroups[$usergroup.usergroup_id]}
											{$ug_status = $user_data.usergroups[$usergroup.usergroup_id].status}
										{else}
											{$ug_status = "F"}
										{/if}
										{if $settings.General.allow_usergroup_signup == "YesNo::YES"|enum || $settings.General.allow_usergroup_signup != "YesNo::YES"|enum && $ug_status == "A"}
											<tr>
												<td>{$usergroup.usergroup}</td>
												<td>
													{if $ug_status == "A"}
														{__("active")}
														{$_link_text = __("remove")}
														{$_req_type = "cancel"}
													{elseif $ug_status == "F"}
														{__("available")}
														{$_link_text = __("join")}
														{$_req_type = "join"}
													{elseif $ug_status == "D"}
														{__("declined")}
														{$_link_text = __("join")}
														{$_req_type = "join"}
													{elseif $ug_status == "P"}
														{__("pending")}
														{$_link_text = __("cancel")}
														{$_req_type = "cancel"}
													{/if}
												</td>
												{if $settings.General.allow_usergroup_signup == "YesNo::YES"|enum}
													<td>
														<a class="cm-ajax" data-ca-target-id="content_usergroups" href="{"profiles.usergroups?usergroup_id=`$usergroup.usergroup_id`&type=`$_req_type`"|fn_url}">{$_link_text}</a>
													</td>
												{/if}
											</tr>
										{/if}
									{/foreach}
								</tbody>
							</table>
						<!--content_usergroups--></div>
					{/if}

					{hook name="profiles:tabs"}
					{/hook}
				{/if}
			{/capture}

			{$smarty.capture.additional_tabs nofilter}

		{/capture}

		{if $smarty.capture.additional_tabs|trim != ""}
			{include file="common/tabsbox.tpl" content=$smarty.capture.tabsbox active_tab=$smarty.request.selected_section track=true}
		{else}
			{$smarty.capture.tabsbox nofilter}
		{/if}

		{capture name="mainbox_title"}{__("profile_details")}{/capture}
	{/if}

{/if}