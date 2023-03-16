<link type="text/css" rel="stylesheet" href="/design/themes/responsive/css/addons/ee_change_winrace/air-datepicker.css">
<script>
    var phone_input_mask = document.querySelector("input[name='user_data[phone]']");
    var phone_input_mask_s = document.querySelector("input[name='user_data[s_phone]']");
    
    phone_input_mask.addEventListener('focus', () => {
        if (!phone_input_mask.value.startsWith('+7')) {
            phone_input_mask.value = '+7' + phone_input_mask.value;
        }
        if (!phone_input_mask_s.value.startsWith('+7')) {
            phone_input_mask_s.value = '+7' + phone_input_mask_s.value;
        }
    });
    
    phone_input_mask.addEventListener('blur', () => {
        if (phone_input_mask.value.charAt(3) == '_') {
            phone_input_mask.value = "";
            phone_input_mask_s.value = "";
        }
    });
    
    var password = document.getElementsByName("user_data[password1]")[0];
    var passwordConfirm = document.getElementsByName("user_data[password2]")[0];
 
    var lockIcon = document.getElementById("password-lock-img");
    var lockIconConfirm = document.getElementById("confirm_password-lock-img");
    
    var src_state_password = ""; 
    var src_state_confirm = "";
    
    const email_checkbox = document.getElementById("check_myself_email_box");
    const phone_checkbox = document.getElementById("check_myself_phone_box");
    
    const email_input = document.querySelector("input[name='user_data[email]']");
    const email_input_copy = document.querySelector("input[name='user_data[fields][63]']");
    
    window.onload = () => {
        email_checkbox.checked = true;
        email_input_copy.value = email_input.value;
        
        phone_checkbox.checked = true;
        phone_input_copy.value = phone_input.value;
    }
    
    email_input.addEventListener('input', () => {
        email_input_copy.value = email_input.value;
    });
    
    email_checkbox.addEventListener('change', () => {
        if (email_checkbox.checked) {
            email_input_copy.value = email_input.value;
        }
        else {
            email_input_copy.value = '';    
        }
    });

    const phone_input = document.querySelector("input[name='user_data[phone]']");
    const phone_input_copy = document.querySelector("input[name='user_data[s_phone]']");    

    phone_input.addEventListener('input', () => {
        phone_input_copy.value = phone_input.value;
    });

    phone_checkbox.addEventListener('change', () => {
        if (phone_checkbox.checked) {
            phone_input_copy.value = phone_input.value;
        }
        else {
            phone_input_copy.value = '';    
        }
    });
    
    if (password){
        password.addEventListener('input', function() {
            if (password && password.value.length > 0) {
                lockIcon.style.display = 'none';                
                if (!document.getElementById('password-eye-img')) {
                    var eyeIcon = document.createElement("img");
                    eyeIcon.setAttribute("id", "password-eye-img");
                    eyeIcon.src = src_state_password ? src_state_password : "/design/themes/responsive/media/images/addons/ee_change_winrace/show_password_text.svg";
                    document.getElementById("password-icon-container").appendChild(eyeIcon);
                    eyeIcon.addEventListener('click', function() {
                        const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
                        password.setAttribute('type', type);
                        eyeIcon.src = type === 'password' ? '/design/themes/responsive/media/images/addons/ee_change_winrace/show_password_text.svg' : '/design/themes/responsive/media/images/addons/ee_change_winrace/hide_password_text.svg' 
                        src_state_password = eyeIcon.src;
                    });
                }  
            }
            else {
                if (document.getElementById('password-eye-img')) {
                    document.getElementById('password-eye-img').remove();
                }
                lockIcon.style.display = 'block';
            }
        });
    }
    
    if (passwordConfirm){
        passwordConfirm.addEventListener('input', function() {
            if (passwordConfirm && passwordConfirm.value.length > 0) {
                lockIconConfirm.style.display = 'none';
                if (password.value != passwordConfirm.value) {
                    if (!passwordConfirm.parentNode.classList.contains("_form-error")){
                        passwordConfirm.parentNode.classList.add("_form-error");
                        if (passwordConfirm.parentNode.classList.contains("_form-error")) {
                            var error_message = document.createElement("div");
                            error_message.setAttribute("id", "error-message-confirm-password");
                            error_message.classList.add("form__error");
                            error_message.innerText = "Пароли не совпадают";
                            passwordConfirm.parentNode.insertBefore(error_message, passwordConfirm.nextSibling);   
                        }
                    }
                }
                else {
                    passwordConfirm.parentNode.classList.remove("_form-error");
                    if (document.getElementById("error-message-confirm-password")) {
                        document.getElementById("error-message-confirm-password").remove();
                    }
                    if (error_message) {
                        error_message.remove();
                    }
                }
                if (!document.getElementById('confirm_password-eye-img')) {
                    var eyeIcon = document.createElement("img");
                    eyeIcon.setAttribute("id", "confirm_password-eye-img");
                    eyeIcon.src = src_state_confirm ? src_state_confirm : "/design/themes/responsive/media/images/addons/ee_change_winrace/show_password_text.svg";
                    document.getElementById("confirm_password-icon-container").appendChild(eyeIcon);
                    eyeIcon.addEventListener('click', function() {
                        const type = passwordConfirm.getAttribute('type') === 'password' ? 'text' : 'password';
                        passwordConfirm.setAttribute('type', type);
                        eyeIcon.src = type === 'password' ? '/design/themes/responsive/media/images/addons/ee_change_winrace/show_password_text.svg' : '/design/themes/responsive/media/images/addons/ee_change_winrace/hide_password_text.svg';
                        src_state_confirm = eyeIcon.src;
                    });
                }  
            }
            else {
                if (document.getElementById('confirm_password-eye-img')) {
                    document.getElementById('confirm_password-eye-img').remove();
                }
                lockIconConfirm.style.display = 'block';
            }
        });
    }
    
    window.addEventListener("resize", function() {
        var form_divs = document.querySelectorAll(".text-field");        
        var username_div = document.querySelector("input[name='user_data[fields][74]']").parentElement;
        var password_div = document.querySelector("input[name='user_data[password1]']").parentElement;
        var confirm_div = document.querySelector("input[name='user_data[password2]']").parentElement;       
        
        if (window.innerWidth < 768) {  
            for (let i = 0; i < form_divs.length; i++) {
                form_divs[i].style.paddingBottom = "10px";
            }
            confirm_div.parentNode.insertBefore(password_div, confirm_div);
        }
        else {
            for (let i = 0; i < form_divs.length; i++) {
                form_divs[i].style.paddingBottom = "0";
            }
            username_div.insertAdjacentElement('afterend', password_div);
        }
        /*if (window.innerWidth < 567) {
            document.querySelector(".checkbox.phone-data").style.height = "45px";
        }
        else {
            document.querySelector(".checkbox.phone-data").style.height = "25px";
        }
        if (window.innerWidth < 529) {
            document.querySelector(".checkbox.delivery-data").style.height = "45px";
        }
        else {
            document.querySelector(".checkbox.delivery-data").style.height = "25px";
        }
        if (window.innerWidth < 395) {
            document.querySelector(".checkbox.address-data").style.height = "45px";
        }
        else {
            document.querySelector(".checkbox.address-data").style.height = "25px";
        }
        if (window.innerWidth < 332) {
            document.querySelector(".checkbox.phone-data").style.height = "70px";
        }*/
    });      
    </script>

{if $addons.ee_change_winrace.ee_change_winrace_profile == "Y"}
	{include file="views/profiles/components/profiles_scripts.tpl"}
	{$dispatch = "profiles.update"}
	{if $runtime.action}
		{$dispatch = "profiles.update.{$runtime.action}"}
	{/if}
    {$title_breadcrumbs = explode(' ', trim($breadcrumbs[1].title))}
	{assign var="profile" value=[$profile_fields,$user_data]|fn_ee_change_winrace_remake_profile_fields}
		<section class="my-profile">
            {if $title_breadcrumbs[0] == "Регистрация"}
                <h1 class="my-profile__title firstProfileTitle">Регистрация</h1>
            {/if}
			<div class="my-profile__container">            
				<form id="profile_formprofile_form" name="profile_form" enctype="multipart/form-data" action="{""|fn_url}" method="post">
					<input id="selected_section" type="hidden" value="general" name="selected_section"/>
					<input id="default_card_id" type="hidden" value="" name="default_cc"/>
					<input type="hidden" name="profile_id" value="{$user_data.profile_id}" />
					{foreach $profile_fields as $k => $v}					
						{if $k == 'C'}
                            {if $title_breadcrumbs[0] == "Регистрация"}
                                <h2 class="my-profile__title firstProfileTitle">Мой профиль</h2>
                            {else}
                                <h1 class="my-profile__title firstProfileTitle">Мой профиль</h1>
                            {/if}
							
							<div class="form-profile__row-inputs">
                                <div class="text-field text-field_floating">
                                    <input class="text-field__input" name="user_data[email]" id="user_data[email]" type="email" required="" value="{$user_data.email}" placeholder="Email" data-value="" data-error="Не может быть пустым" data-validate="" data-required="">
                                    <label class="text-field__label" for="email">Ваш Email*</label>
                                </div>
                                <div class="text-field text-field_floating">
                                    <input autocomplete="disabled" name="user_data[fields][74]" id="user_data[fields][74]" placeholder="ФИО или никнейм*" quired="" class="text-field__input" value="{$profile.fields.value.74}" data-value="" data-error="Не может быть пустым"
									data-validate="" data-required="">
                                    <label class="text-field__label" for="email">ФИО или никнейм*</label>
                                </div>
                                <div class="text-field text-field_floating">
                                    <input type="password" id="password1" placeholder="Пароль*" name="user_data[password1]" size="32" maxlength="32" class="text-field__input" autocomplete="off" value="">
                                    <label class="text-field__label" for="password1">Пароль*</label>
                                    <span id="password-icon-container" class="text-field__password-lock-icon">
                                        <img id="password-lock-img" class="password-lock-icon-img" src="/design/themes/responsive/media/images/addons/ee_change_winrace/unlock(Traced).svg" alt="lock icon">
                                    </span>
                                </div>
							</div>
							<div class="form-profile__row-inputs">
                                <div class="text-field text-field_floating">
                                    <input autocomplete="off" type="text" name="user_data[phone]" placeholder="Ваш телефон*" id="user_data[phone]" data-error="Не может быть пустым" data-validate="" data-required="phone"
									data-inputmask="'mask': '+9(999)-999-99-99'" value="{$user_data.phone}" data-value="{$user_data.phone}" class="text-field__input" inputmode="text">
                                    <label class="text-field__label" for="email">Ваш телефон*</label>
                                </div>
                                
                                
                                
                                <div class="text-field text-field_floating">
                                    {$date_format = "%d/%m/%Y"}
                                    {$extra = "required"}
                                    {$date_meta = "form-profile__input input"}
                                    {$date_id = "date_id"}
                                    {$date_name = "user_data[fields][75]"}
                                    {$date_val = $user_data.fields.75}
                                    <a class="cm-external-focus ty-calendar__link" data-ca-external-focus-id="{$date_id}">
                                        {include_ext file="common/icon.tpl" class="ty-icon-calendar ty-calendar__button" title=__("calendar")}
                                    </a>
                                    
                                    <script src="/js/addons/ee_change_winrace/air-datepicker.js"></script>
                                    <script>
					new AirDatepicker('#date_id', {
			                    maxDate: new Date(),
					    locale: {
						days: ['Воскресенье', 'Понедельник', 'Вторник', 'Среда', 'Четверг', 'Пятница', 'Суббота'],
						daysMin: ['{__("weekday_abr_0")}', '{__("weekday_abr_1")}', '{__("weekday_abr_2")}', '{__("weekday_abr_3")}', '{__("weekday_abr_4")}', '{__("weekday_abr_5")}', '{__("weekday_abr_6")}'],
						months: ["Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь"],
						monthsShort: ['{__("month_name_abr_1")|escape:"html"}', '{__("month_name_abr_2")|escape:"html"}', '{__("month_name_abr_3")|escape:"html"}', '{__("month_name_abr_4")|escape:"html"}', '{__("month_name_abr_5")|escape:"html"}', '{__("month_name_abr_6")|escape:"html"}', '{__("month_name_abr_7")|escape:"html"}', '{__("month_name_abr_8")|escape:"html"}', '{__("month_name_abr_9")|escape:"html"}', '{__("month_name_abr_10")|escape:"html"}', '{__("month_name_abr_11")|escape:"html"}', '{__("month_name_abr_12")|escape:"html"}'],
						today: 'Today',
						clear: 'Clear',
						dateFormat: 'dd/MM/yyyy',
                                                firstDay: {if $settings.Appearance.calendar_week_format == "sunday_first"}0{else}1{/if},
					    }
					});
				    </script>
                                    
                                    <input data-inputmask="'mask': '99/99/9999'" placeholder="Дата рождения*" type="text" id="date_id" name="{$date_name}" class="text-field__input cm-calendar"
                                    value="{if $date_val}{$date_val|date_format:"`$date_format`"}{/if}" {$extra} size="10" autocomplete="disabled"  name="user_data[email]" id="user_data[email]">
                                    <label class="text-field__label" for="email">Дата рождения*</label>
                                </div>
                                
                                
                                
								<div class="text-field text-field_floating">
                                    <input class="text-field__input" name="user_data[password2]" id="password2" type="password" size="32" maxlength="32" placeholder="Подтверждение пароля*" data-value="" data-error="Не может быть пустым" autocomplete="off">
                                    <label class="text-field__label" for="password2">Подтверждение пароля*</label>
                                    <span id="confirm_password-icon-container" class="text-field__password-lock-icon">
                                        <img id="confirm_password-lock-img" class="password-lock-icon-img" src="/design/themes/responsive/media/images/addons/ee_change_winrace/unlock(Traced).svg" alt="lock icon">
                                    </span>
                                </div>
							</div>
                            <div class="checkbox delivery-data">
                                <input id="check_myself_email_box" class="checkbox__input" type="checkbox">
                                <label for="check_myself_email_box" class="checkbox__label">
                                    <span class="checkbox__text">Email из моего профиля и моих данных доставки <strong>совпадают</strong></span>
                                </label>
                                <input type="hidden" id="check_myself_email_box_val" value="{$user_data.fields.70}" name="user_data[fields][70]" />
                            </div>
                            
                            <div class="checkbox phone-data">
                                <input id="check_myself_phone_box" class="checkbox__input" type="checkbox">
                                <label for="check_myself_phone_box" class="checkbox__label">
                                    <span class="checkbox__text">Телефоны из моего профиля и моих данных доставки <strong>совпадают</strong></span>
                                </label>
                                <input type="hidden" id="check_myself_phone_box_val" value="{$user_data.fields.70}" name="user_data[fields][70]" />
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
                                <div class="text-field text-field_floating">
                                    {if isset($user_data[$props.field_name])}
										{$inputID = "user_data[`$props.field_name`]"}
									{else}
										{$inputID = "user_data[fields][`$props.field_id`]"}
									{/if}
                                    {if $props.field_name|strpos:"mail"}
                                            {$required = 'email'}{$error_required = 'Неверный формат почты'}
                                        {elseif $props.field_name|strpos:"phone"}
                                            {$required = 'phone'}{$error_required = 'Не может быть пустым'}{*Нет проверки на валидность номера телефона*}
                                        {else}
                                            {$required = ''}{$error_required = 'Не может быть пустым'}
                                        {/if}								
                                        {if $props.field_type == 'I'}
                                        <input class="text-field__input" autocomplete="off" placeholder="{$props.description}" name="{$inputID}"  id="{$inputID}"{if $props.required == 'Y'} required {/if}
                                            value="{$profile[$props.field_name].value}" data-value="{$profile[$props.field_name].value}" data-error="{$error_required}" data-validate data-required="{$required}">
                                        {/if}
                                        {if $props.field_type == 'D'}
                                        {$date_format = "%d/%m/%Y"}
                                        {$extra = "required"}
                                        {$date_meta = "form-profile__input input"}
                                        {$date_id = "date_id"}
                                        {$date_name = "`$inputID`"}
                                        {$date_val = $profile[$props.field_name].value}
                                        <input class="text-field__input cm-calendar" placeholder="{$props.description}" data-inputmask="'mask': '99/99/9999'" type="text" id="date_id" name="{$inputID}"
                                        value="{if $date_val}{$date_val|date_format:"`$date_format`"}{/if}" {$extra} size="10" autocomplete="disabled" >
                                        <input />
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
                                        <input class="text-field__input" name="{$inputID}" placeholder="{$props.description}" id="{$inputID}"{if $props.required == 'Y'} required {/if}
                                        value="{$profile[$props.field_name].value}" data-value="{$profile[$props.field_name].value}" data-error="{$error_required}" data-validate data-required="{$required}">
                                    {/if}
                                    {if $props.field_type == 'A'}
                                        <select id="{$inputID}" class="text-field__input" name="{$inputID}"
                                        style="outline: 0!important; line-height: normal; padding-top: 1.1rem;">
                                            {foreach from=$states.RU item=state}
                                                <option {$profile[$props.field_name].value} {if $profile[$props.field_name].value == $state.code}selected="selected"{/if} value="{$state.code}">{$state.state}</option>
                                            {/foreach}
                                        </select>									
                                    {/if}
                                    {if $props.field_type == 'P'}
                                        <input autocomplete="off"  placeholder="{$props.description}" type="text" name="{$inputID}" id="{$inputID}" data-error="{$error_required}" data-validate data-required="{$required}"
                                        data-inputmask="'mask': '+9(999)-999-99-99'"
                                        value="{$profile[$props.field_name].value}" data-value="{$profile[$props.field_name].value}" class="text-field__input">									
                                    {/if}
                                    {if $props.field_type == 'Z'}
                                        <input autocomplete="off" type="text" placeholder="{$props.description}" name="{$inputID}" id="{$inputID}" data-error="{$error_required}" data-required="{$required}" data-validate
                                        value="{$profile[$props.field_name].value}" data-inputmask="'mask': '999999'" data-value="{$profile[$props.field_name].value}" class="text-field__input">
                                    {/if}
                                    <label class="text-field__label" for="password2">{$props.description}</label>
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
					<div class="checkbox address-data">
						<input id="check_mystic_box" class="checkbox__input" type="checkbox"
						{if $user_data.fields.70 == 'Y'}checked{/if} />
						<label for="check_mystic_box" class="checkbox__label">
							<span class="checkbox__text">Использовать данный адрес по умолчанию</span>
						</label>
						<input type="hidden" id="check_mystic_box_val" value="{$user_data.fields.70}" name="user_data[fields][70]" />
					</div>
					<div class="form-profile__bottom" style="margin-top: 28px;">			
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
