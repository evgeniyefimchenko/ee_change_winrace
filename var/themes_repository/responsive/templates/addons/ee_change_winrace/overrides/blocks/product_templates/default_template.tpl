{if $addons.ee_change_winrace.ee_change_winrace_product == "Y"}
	{script src="js/tygh/exceptions.js"}

	{if $settings.abt__device != "mobile"}

	{$is_add_to_cart_mv=true}
	{$abt__shareb_mute=true}
	{if "MULTIVENDOR"|fn_allowed_for && ($product.master_product_id || !$product.company_id)}{$is_add_to_cart_mv=false}{/if}

	<div class="ut2-pb ty-product-block ty-product-detail">
		<div class="ut2-breadcrumbs__wrapper">
			{hook name="products:ut2_main_info_breadcrumbs"}
				{include file="common/breadcrumbs.tpl"}
			{/hook}
		</div>
		<div class="ut2-pb__title-wrap ut2-pb__inner-elements-wrap space-between">
			{* {hook name="products:main_info_title"} *}
			{if !$hide_title}
				<h1 class="ut2-pb__title" {live_edit name="product:product:{$product.product_id}"}><bdi>{$product.product nofilter}</bdi></h1>
			{/if}
			{*{/hook}*}
			{if $settings.abt__ut2.general.brand_feature_id}
				{include file="blocks/product_templates/components/product_brand_logo_prepare.tpl"}
				{if $brand_feature}
				{hook name="products:brand"}
					{if $settings.abt__ut2.products.view.show_brand_format[$settings.abt__device] == "name"}
						<div class="ut2-pb__product-brand-name">
							{include file="views/products/components/product_features_short_list.tpl" features=array($brand_feature) no_container=true feature_image=false hide_name=true feature_link=true}
						</div>
					{/if}
				{/hook}
				{/if}
			{/if}
		</div>
		
		{hook name="products:view_main_info"}

		<div class="ut2-pb__wrapper clearfix">
			{if $product}
				{assign var="obj_id" value=$product.product_id}
				{include file="common/product_data.tpl" product=$product but_role="big" but_text=__("add_to_cart") product_labels_position="right-top" hide_qty_label=true}

				<div class="ut2-pb__img-wrapper ty-product-block__img-wrapper">
					{hook name="products:image_wrap"}
						{if !$no_images}

							<div class="ut2-pb__img cm-reload-{$product.product_id}" data-ca-previewer="true" id="product_images_{$product.product_id}_update">
								{include file="views/products/components/product_images.tpl" product=$product show_detailed_link="YesNo::YES"|enum image_width=$settings.Thumbnails.product_details_thumbnail_width image_height=$settings.Thumbnails.product_details_thumbnail_height}
								<!--product_images_{$product.product_id}_update--></div>
						{/if}
					{/hook}

					{hook name="products:ab__s_pictograms_pos_1"}{/hook}
				</div>
				<div class="ut2-pb__right">
					{assign var="form_open" value="form_open_`$obj_id`"}
					{$smarty.capture.$form_open nofilter}

					{assign var="old_price" value="old_price_`$obj_id`"}
					{assign var="price" value="price_`$obj_id`"}
					{assign var="clean_price" value="clean_price_`$obj_id`"}
					{assign var="list_discount" value="list_discount_`$obj_id`"}
					{assign var="discount_label" value="discount_label_`$obj_id`"}
					
					{hook name="products:ab__deal_of_the_day_product_view"}{/hook}

					<div class="cols-wrap">
						<div class="col-left">{* Start col *}

							<div class="top-rate">
								{include file="blocks/product_templates/components/product_rating.tpl"}
							</div>

							{include file="blocks/product_templates/components/product_price.tpl"}
							
							{if $settings.abt__ut2.general.brand_feature_id}
								{include file="blocks/product_templates/components/product_brand_logo_prepare.tpl"}
								{if $brand_feature}
								{hook name="products:brand"}
									{if $settings.abt__ut2.products.view.show_brand_format[$settings.abt__device] == "logo"}
										<div class="ut2-pb__product-brand">
											{include file="views/products/components/product_features_short_list.tpl" features=array($brand_feature) feature_image=true hide_name=true feature_link=true}
										</div>
									{/if}
								{/hook}
								{/if}
							{/if}
							{assign var="product_amount" value="product_amount_`$obj_id`"}
							{$smarty.capture.$product_amount nofilter}

							{if $capture_options_vs_qty}{capture name="product_options"}{$smarty.capture.product_options nofilter}{/if}
							<div class="ut2-pb__option">
								{assign var="product_options" value="product_options_`$obj_id`"}
								{$smarty.capture.$product_options nofilter}
							</div>
							{if $capture_options_vs_qty}{/capture}{/if}

							<div class="ut2-pb__advanced-option clearfix">
								{if $capture_options_vs_qty}{capture name="product_options"}{$smarty.capture.product_options nofilter}{/if}
								{assign var="advanced_options" value="advanced_options_`$obj_id`"}
								{$smarty.capture.$advanced_options nofilter}
								{if $capture_options_vs_qty}{/capture}{/if}
							</div>

							{assign var="product_edp" value="product_edp_`$obj_id`"}
							{$smarty.capture.$product_edp nofilter}

							{if $capture_buttons}{capture name="buttons"}{/if}
							<div class="ut2-pb__button ty-product-block__button">
								{if $show_qty}
								<div class="ut2-qty__wrap {if $min_qty && $product.min_qty}min-qty{/if}">
									{if $capture_options_vs_qty}{capture name="product_options"}{$smarty.capture.product_options nofilter}{/if}
										{assign var="qty" value="qty_`$obj_id`"}
										{$smarty.capture.$qty nofilter}
		
										{assign var="min_qty" value="min_qty_`$obj_id`"}
										{$smarty.capture.$min_qty nofilter}
									{if $capture_options_vs_qty}{/capture}{/if}
								</div>
								{/if}
								{if $show_details_button}
									{include file="buttons/button.tpl" but_href="products.view?product_id=`$product.product_id`" but_text=__("view_details") but_role="submit"}
								{/if}
		
								{assign var="add_to_cart" value="add_to_cart_`$obj_id`"}
								{$smarty.capture.$add_to_cart nofilter}
		
								{assign var="list_buttons" value="list_buttons_`$obj_id`"}
								{$smarty.capture.$list_buttons nofilter}
							</div>
							{if $capture_buttons}{/capture}{/if}

							{hook name="products:ab__s_pictograms_pos_2"}{/hook}

							{if $show_short_descr}
								<div class="ut2-pb__short-descr" {live_edit name="product:short_description:{$product.product_id}"}>{$product.short_description nofilter}</div>
							{/if}
						</div>{* End col *}
						<?php /* Требуется оставиль для возможности использовать ab__motivation_block если приспичит
						<div class="col-right hidden">{* Start col *}
							{* ТУТ ВСТАВЛЯЕТСЯ БЛОК С ИНФОРМАЦИЕЙ О ПРОДАВЦЕ /public_html/design/themes/abt__unitheme2/templates/addons/abt__unitheme2_mv/hooks/products/ab__motivation_block.pre.tpl *}
							{hook name="products:ab__motivation_block"}{/hook}
							
							{if $settings.abt__ut2.products.custom_block_id|intval}
								{render_block block_id=$settings.abt__ut2.products.custom_block_id|intval dispatch="products.view" use_cache=false parse_js=false}
							{/if}

							{* Remove if using hook in motivation block *}
							{hook name="products:geo_maps"}{/hook}

							{hook name="products:promo_text"}
							{if $product.promo_text}
								<div class="ut2-pb__note">
									{$product.promo_text nofilter}
								</div>
							{/if}
							{/hook}

							{if $settings.abt__ut2.products.view.show_features[$settings.abt__device] == 'Y'}
								<div>
									{include file="views/products/components/product_features_short_list.tpl" features=$product.header_features}
								</div>
							{/if}

							{hook name="products:product_detail_bottom"}{/hook}

						</div>{* End col *}
						*/?>
					</div>

					<div class="info-brand__cart">
						<a href="#!" class="info-brand__item">
							<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
								<path d="M12 2C17.523 2 22 6.478 22 12C22 17.522 17.523 22 12 22C6.477 22 2 17.522 2 12C2 6.478 6.477 2 12 2ZM12 3.667C7.405 3.667 3.667 7.405 3.667 12C3.667 16.595 7.405 20.333 12 20.333C16.595 20.333 20.333 16.595 20.333 12C20.333 7.405 16.595 3.667 12 3.667ZM12 15.5C12.2652 15.5 12.5196 15.6054 12.7071 15.7929C12.8946 15.9804 13 16.2348 13 16.5C13 16.7652 12.8946 17.0196 12.7071 17.2071C12.5196 17.3946 12.2652 17.5 12 17.5C11.7348 17.5 11.4804 17.3946 11.2929 17.2071C11.1054 17.0196 11 16.7652 11 16.5C11 16.2348 11.1054 15.9804 11.2929 15.7929C11.4804 15.6054 11.7348 15.5 12 15.5ZM12 6.75C12.7293 6.75 13.4288 7.03973 13.9445 7.55546C14.4603 8.07118 14.75 8.77065 14.75 9.5C14.75 10.51 14.453 11.074 13.699 11.859L13.53 12.03C12.908 12.652 12.75 12.916 12.75 13.5C12.75 13.6989 12.671 13.8897 12.5303 14.0303C12.3897 14.171 12.1989 14.25 12 14.25C11.8011 14.25 11.6103 14.171 11.4697 14.0303C11.329 13.8897 11.25 13.6989 11.25 13.5C11.25 12.49 11.547 11.926 12.301 11.141L12.47 10.97C13.092 10.348 13.25 10.084 13.25 9.5C13.249 9.18028 13.1255 8.8731 12.9049 8.64165C12.6843 8.4102 12.3834 8.27208 12.0641 8.25568C11.7448 8.23929 11.4313 8.34587 11.1882 8.55351C10.9451 8.76115 10.7908 9.05406 10.757 9.372L10.75 9.5C10.75 9.69891 10.671 9.88968 10.5303 10.0303C10.3897 10.171 10.1989 10.25 10 10.25C9.80109 10.25 9.61032 10.171 9.46967 10.0303C9.32902 9.88968 9.25 9.69891 9.25 9.5C9.25 8.77065 9.53973 8.07118 10.0555 7.55546C10.5712 7.03973 11.2707 6.75 12 6.75Z" fill="#4AA356"/>
							</svg>
							<span class="info-brant__title">Задать вопрос о товаре</span>
						</a>
						<a href="#!" class="info-brand__item">
							<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
								<g clip-path="url(#clip0_745_1318)">
								<path d="M4.455 2.025C4.59583 1.86035 4.77066 1.72817 4.96745 1.63754C5.16425 1.54691 5.37834 1.49999 5.595 1.5H18.405C18.6217 1.49999 18.8358 1.54691 19.0325 1.63754C19.2293 1.72817 19.4042 1.86035 19.545 2.025L23.4585 6.591C23.8079 6.99875 24 7.51802 24 8.055V8.4375C24.0001 9.17996 23.7682 9.9039 23.3367 10.5081C22.9053 11.1124 22.2958 11.5667 21.5935 11.8076C20.8912 12.0485 20.1312 12.064 19.4197 11.8519C18.7082 11.6398 18.0807 11.2107 17.625 10.6245C17.2922 11.0532 16.8657 11.4 16.3783 11.6384C15.8908 11.8768 15.3552 12.0005 14.8125 12C14.2698 12.0006 13.7342 11.877 13.2467 11.6385C12.7592 11.4001 12.3327 11.0532 12 10.6245C11.6673 11.0532 11.2408 11.4001 10.7533 11.6385C10.2658 11.877 9.73019 12.0006 9.1875 12C8.64481 12.0006 8.10919 11.877 7.62168 11.6385C7.13416 11.4001 6.70771 11.0532 6.375 10.6245C5.91929 11.2107 5.29182 11.6398 4.58031 11.8519C3.86879 12.064 3.10877 12.0485 2.40649 11.8076C1.7042 11.5667 1.09473 11.1124 0.663273 10.5081C0.231813 9.9039 -8.18979e-05 9.17996 2.16968e-08 8.4375V8.055C1.89113e-05 7.51802 0.192085 6.99875 0.5415 6.591L4.4565 2.0235L4.455 2.025ZM7.125 8.4375C7.125 8.98451 7.3423 9.50911 7.72909 9.89591C8.11589 10.2827 8.64049 10.5 9.1875 10.5C9.73451 10.5 10.2591 10.2827 10.6459 9.89591C11.0327 9.50911 11.25 8.98451 11.25 8.4375C11.25 8.23859 11.329 8.04782 11.4697 7.90717C11.6103 7.76652 11.8011 7.6875 12 7.6875C12.1989 7.6875 12.3897 7.76652 12.5303 7.90717C12.671 8.04782 12.75 8.23859 12.75 8.4375C12.75 8.98451 12.9673 9.50911 13.3541 9.89591C13.7409 10.2827 14.2655 10.5 14.8125 10.5C15.3595 10.5 15.8841 10.2827 16.2709 9.89591C16.6577 9.50911 16.875 8.98451 16.875 8.4375C16.875 8.23859 16.954 8.04782 17.0947 7.90717C17.2353 7.76652 17.4261 7.6875 17.625 7.6875C17.8239 7.6875 18.0147 7.76652 18.1553 7.90717C18.296 8.04782 18.375 8.23859 18.375 8.4375C18.375 8.98451 18.5923 9.50911 18.9791 9.89591C19.3659 10.2827 19.8905 10.5 20.4375 10.5C20.9845 10.5 21.5091 10.2827 21.8959 9.89591C22.2827 9.50911 22.5 8.98451 22.5 8.4375V8.055C22.5 7.87624 22.4362 7.70336 22.32 7.5675L18.405 3H5.595L1.68 7.5675C1.56382 7.70336 1.49999 7.87624 1.5 8.055V8.4375C1.5 8.98451 1.7173 9.50911 2.10409 9.89591C2.49089 10.2827 3.01549 10.5 3.5625 10.5C4.10951 10.5 4.63411 10.2827 5.02091 9.89591C5.4077 9.50911 5.625 8.98451 5.625 8.4375C5.625 8.23859 5.70402 8.04782 5.84467 7.90717C5.98532 7.76652 6.17609 7.6875 6.375 7.6875C6.57391 7.6875 6.76468 7.76652 6.90533 7.90717C7.04598 8.04782 7.125 8.23859 7.125 8.4375ZM2.25 12.75C2.44891 12.75 2.63968 12.829 2.78033 12.9697C2.92098 13.1103 3 13.3011 3 13.5V22.5H21V13.5C21 13.3011 21.079 13.1103 21.2197 12.9697C21.3603 12.829 21.5511 12.75 21.75 12.75C21.9489 12.75 22.1397 12.829 22.2803 12.9697C22.421 13.1103 22.5 13.3011 22.5 13.5V22.5H23.25C23.4489 22.5 23.6397 22.579 23.7803 22.7197C23.921 22.8603 24 23.0511 24 23.25C24 23.4489 23.921 23.6397 23.7803 23.7803C23.6397 23.921 23.4489 24 23.25 24H0.75C0.551088 24 0.360322 23.921 0.21967 23.7803C0.0790177 23.6397 2.16968e-08 23.4489 2.16968e-08 23.25C2.16968e-08 23.0511 0.0790177 22.8603 0.21967 22.7197C0.360322 22.579 0.551088 22.5 0.75 22.5H1.5V13.5C1.5 13.3011 1.57902 13.1103 1.71967 12.9697C1.86032 12.829 2.05109 12.75 2.25 12.75ZM5.25 13.5C5.44891 13.5 5.63968 13.579 5.78033 13.7197C5.92098 13.8603 6 14.0511 6 14.25V19.5H18V14.25C18 14.0511 18.079 13.8603 18.2197 13.7197C18.3603 13.579 18.5511 13.5 18.75 13.5C18.9489 13.5 19.1397 13.579 19.2803 13.7197C19.421 13.8603 19.5 14.0511 19.5 14.25V19.5C19.5 19.8978 19.342 20.2794 19.0607 20.5607C18.7794 20.842 18.3978 21 18 21H6C5.60218 21 5.22064 20.842 4.93934 20.5607C4.65804 20.2794 4.5 19.8978 4.5 19.5V14.25C4.5 14.0511 4.57902 13.8603 4.71967 13.7197C4.86032 13.579 5.05109 13.5 5.25 13.5Z" fill="#4AA356"/>
								</g>
								<defs>
								<clipPath id="clip0_745_1318">
								<rect width="24" height="24" fill="white"/>
								</clipPath>
								</defs>
							</svg>
							<span class="info-brant__title">ETrend</span>
						</a>
					</div>

					<div class="top-product-layer">
						{if $show_sku == "true" &&  $product.product_code}
							<div class="ut2-pb__sku">
								{assign var="sku" value="sku_`$obj_id`"}
								{$smarty.capture.$sku nofilter}
							</div>
						{/if}
					</div>

					{hook name="products:product_form_close_tag"}
						{$form_close="form_close_`$obj_id`"}
						{$smarty.capture.$form_close nofilter}
					{/hook}

					{if $show_product_tabs}
						{include file="views/tabs/components/product_popup_tabs.tpl"}
						{$smarty.capture.popupsbox_content nofilter}
					{/if}

				</div>
			{/if}

		</div>
		{/hook}

		{if $smarty.capture.hide_form_changed == "YesNo::YES"|enum}
			{assign var="hide_form" value=$smarty.capture.orig_val_hide_form}
		{/if}

		{hook name="products:buy_together"}{/hook}
		{hook name="products:product_tabs_pre"}
		{if $show_product_tabs}
			{hook name="products:product_tabs"}
				{include file="views/tabs/components/product_tabs.tpl"}

				{if $blocks.$tabs_block_id.properties.wrapper}
					{include file=$blocks.$tabs_block_id.properties.wrapper content=$smarty.capture.tabsbox_content title=$blocks.$tabs_block_id.description}
				{else}
					{$smarty.capture.tabsbox_content nofilter}
				{/if}
			{/hook}
		{/if}
		{/hook}
		
		{hook name="products:bottom_product_layer"}{/hook}
	</div>

	<div class="product-details">
	</div>

	{capture name="mainbox_title"}{assign var="details_page" value=true}{/capture}

	{else}
		{include file="blocks/product_templates/components/abt__ut2_mobile_template.tpl" features=$product.header_features}
	{/if}

{else}
	{script src="js/tygh/exceptions.js"}

	{if $settings.abt__device != "mobile"}

	{$is_add_to_cart_mv=true}
	{$abt__shareb_mute=true}
	{if "MULTIVENDOR"|fn_allowed_for && ($product.master_product_id || !$product.company_id)}{$is_add_to_cart_mv=false}{/if}

	<div class="ut2-pb ty-product-block ty-product-detail">
		<div class="ut2-breadcrumbs__wrapper">
			{hook name="products:ut2_main_info_breadcrumbs"}
				{include file="common/breadcrumbs.tpl"}
			{/hook}
		</div>
		<div class="ut2-pb__title-wrap ut2-pb__inner-elements-wrap space-between">
			{* {hook name="products:main_info_title"} *}
			{if !$hide_title}
				<h1 class="ut2-pb__title" {live_edit name="product:product:{$product.product_id}"}><bdi>{$product.product nofilter}</bdi></h1>
			{/if}
			{*{/hook}*}
			{if $settings.abt__ut2.general.brand_feature_id}
				{include file="blocks/product_templates/components/product_brand_logo_prepare.tpl"}
				{if $brand_feature}
				{hook name="products:brand"}
					{if $settings.abt__ut2.products.view.show_brand_format[$settings.abt__device] == "name"}
						<div class="ut2-pb__product-brand-name">
							{include file="views/products/components/product_features_short_list.tpl" features=array($brand_feature) no_container=true feature_image=false hide_name=true feature_link=true}
						</div>
					{/if}
				{/hook}
				{/if}
			{/if}
		</div>
		
		{hook name="products:view_main_info"}

		<div class="ut2-pb__wrapper clearfix">
			{if $product}
				{assign var="obj_id" value=$product.product_id}
				{include file="common/product_data.tpl" product=$product but_role="big" but_text=__("add_to_cart") product_labels_position="right-top" hide_qty_label=true}

				<div class="ut2-pb__img-wrapper ty-product-block__img-wrapper">
					{hook name="products:image_wrap"}
						{if !$no_images}

							<div class="ut2-pb__img cm-reload-{$product.product_id}" data-ca-previewer="true" id="product_images_{$product.product_id}_update">
								{include file="views/products/components/product_images.tpl" product=$product show_detailed_link="YesNo::YES"|enum image_width=$settings.Thumbnails.product_details_thumbnail_width image_height=$settings.Thumbnails.product_details_thumbnail_height}
								<!--product_images_{$product.product_id}_update--></div>
						{/if}
					{/hook}

					{hook name="products:ab__s_pictograms_pos_1"}{/hook}
				</div>
				<div class="ut2-pb__right">
					{assign var="form_open" value="form_open_`$obj_id`"}
					{$smarty.capture.$form_open nofilter}

					{assign var="old_price" value="old_price_`$obj_id`"}
					{assign var="price" value="price_`$obj_id`"}
					{assign var="clean_price" value="clean_price_`$obj_id`"}
					{assign var="list_discount" value="list_discount_`$obj_id`"}
					{assign var="discount_label" value="discount_label_`$obj_id`"}

					<div class="top-product-layer">
						{include file="blocks/product_templates/components/product_rating.tpl"}

						{if $show_sku == "true" &&  $product.product_code}
							<div class="ut2-pb__sku">
								{assign var="sku" value="sku_`$obj_id`"}
								{$smarty.capture.$sku nofilter}
							</div>
						{/if}
					</div>
					
					{hook name="products:ab__deal_of_the_day_product_view"}{/hook}

					<div class="cols-wrap">
						<div class="col-left">{* Start col *}

							{include file="blocks/product_templates/components/product_price.tpl"}
							
							{if $settings.abt__ut2.general.brand_feature_id}
								{include file="blocks/product_templates/components/product_brand_logo_prepare.tpl"}
								{if $brand_feature}
								{hook name="products:brand"}
									{if $settings.abt__ut2.products.view.show_brand_format[$settings.abt__device] == "logo"}
										<div class="ut2-pb__product-brand">
											{include file="views/products/components/product_features_short_list.tpl" features=array($brand_feature) feature_image=true hide_name=true feature_link=true}
										</div>
									{/if}
								{/hook}
								{/if}
							{/if}
							{assign var="product_amount" value="product_amount_`$obj_id`"}
							{$smarty.capture.$product_amount nofilter}

							{if $capture_options_vs_qty}{capture name="product_options"}{$smarty.capture.product_options nofilter}{/if}
							<div class="ut2-pb__option">
								{assign var="product_options" value="product_options_`$obj_id`"}
								{$smarty.capture.$product_options nofilter}
							</div>
							{if $capture_options_vs_qty}{/capture}{/if}

							<div class="ut2-pb__advanced-option clearfix">
								{if $capture_options_vs_qty}{capture name="product_options"}{$smarty.capture.product_options nofilter}{/if}
								{assign var="advanced_options" value="advanced_options_`$obj_id`"}
								{$smarty.capture.$advanced_options nofilter}
								{if $capture_options_vs_qty}{/capture}{/if}
							</div>

							{assign var="product_edp" value="product_edp_`$obj_id`"}
							{$smarty.capture.$product_edp nofilter}

							{if $capture_buttons}{capture name="buttons"}{/if}
							<div class="ut2-pb__button ty-product-block__button">
								{if $show_qty}
								<div class="ut2-qty__wrap {if $min_qty && $product.min_qty}min-qty{/if}">
									{if $capture_options_vs_qty}{capture name="product_options"}{$smarty.capture.product_options nofilter}{/if}
										{assign var="qty" value="qty_`$obj_id`"}
										{$smarty.capture.$qty nofilter}
		
										{assign var="min_qty" value="min_qty_`$obj_id`"}
										{$smarty.capture.$min_qty nofilter}
									{if $capture_options_vs_qty}{/capture}{/if}
								</div>
								{/if}
								{if $show_details_button}
									{include file="buttons/button.tpl" but_href="products.view?product_id=`$product.product_id`" but_text=__("view_details") but_role="submit"}
								{/if}
		
								{assign var="add_to_cart" value="add_to_cart_`$obj_id`"}
								{$smarty.capture.$add_to_cart nofilter}
		
								{assign var="list_buttons" value="list_buttons_`$obj_id`"}
								{$smarty.capture.$list_buttons nofilter}
							</div>
							{if $capture_buttons}{/capture}{/if}

							{hook name="products:ab__s_pictograms_pos_2"}{/hook}

							{if $show_short_descr}
								<div class="ut2-pb__short-descr" {live_edit name="product:short_description:{$product.product_id}"}>{$product.short_description nofilter}</div>
							{/if}
						</div>{* End col *}
						<div class="col-right">{* Start col *}
							{hook name="products:ab__motivation_block"}{/hook}
							
							{if $settings.abt__ut2.products.custom_block_id|intval}
								{render_block block_id=$settings.abt__ut2.products.custom_block_id|intval dispatch="products.view" use_cache=false parse_js=false}
							{/if}

							{* Remove if using hook in motivation block *}
							{hook name="products:geo_maps"}{/hook}

							{hook name="products:promo_text"}
							{if $product.promo_text}
								<div class="ut2-pb__note">
									{$product.promo_text nofilter}
								</div>
							{/if}
							{/hook}

							{if $settings.abt__ut2.products.view.show_features[$settings.abt__device] == 'Y'}
								<div>
									{include file="views/products/components/product_features_short_list.tpl" features=$product.header_features}
								</div>
							{/if}

							{hook name="products:product_detail_bottom"}{/hook}

						</div>{* End col *}
					</div>

					{hook name="products:product_form_close_tag"}
						{$form_close="form_close_`$obj_id`"}
						{$smarty.capture.$form_close nofilter}
					{/hook}

					{if $show_product_tabs}
						{include file="views/tabs/components/product_popup_tabs.tpl"}
						{$smarty.capture.popupsbox_content nofilter}
					{/if}

				</div>
			{/if}

		</div>
		{/hook}

		{if $smarty.capture.hide_form_changed == "YesNo::YES"|enum}
			{assign var="hide_form" value=$smarty.capture.orig_val_hide_form}
		{/if}

		{hook name="products:buy_together"}{/hook}
		{hook name="products:product_tabs_pre"}
		{if $show_product_tabs}
			{hook name="products:product_tabs"}
				{include file="views/tabs/components/product_tabs.tpl"}

				{if $blocks.$tabs_block_id.properties.wrapper}
					{include file=$blocks.$tabs_block_id.properties.wrapper content=$smarty.capture.tabsbox_content title=$blocks.$tabs_block_id.description}
				{else}
					{$smarty.capture.tabsbox_content nofilter}
				{/if}
			{/hook}
		{/if}
		{/hook}
		
		{hook name="products:bottom_product_layer"}{/hook}
	</div>

	<div class="product-details">
	</div>

	{capture name="mainbox_title"}{assign var="details_page" value=true}{/capture}

	{else}
		{include file="blocks/product_templates/components/abt__ut2_mobile_template.tpl" features=$product.header_features}
	{/if}
{/if}