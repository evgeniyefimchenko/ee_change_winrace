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