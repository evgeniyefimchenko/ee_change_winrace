{if $addons.ee_change_winrace.ee_change_winrace_cart == "Y"}
	<div class="ty-cart-total">
		<ul class="ty-cart-statistic__total-list">
			<li class="ty-cart-statistic__item ty-cart-statistic__total">
				<span class="ty-cart-statistic__total-title">Общая стоимость всех товаров:</span>
				<span class="ty-cart-statistic__total-value">
					{include file="common/price.tpl" value=$_total|default:$smarty.capture._total|default:$cart.subtotal span_id="cart_total" class="ty-price"}
				</span>
			</li>
		</ul>
		<!--checkout_totals--></div>
		<!-- /responsive/templates/addons/ee_change_winrace/overrides/views/checkout/components/checkout_totals.tpl -->
	</div>
{else}
	{if $location == "cart" && $cart.shipping_required == true && $settings.Checkout.estimate_shipping_cost == "YesNo::YES"|enum}
		{capture name="shipping_estimation"}
			{include_ext file="common/icon.tpl" class="ty-icon-flight ty-cart-total__icon-estimation"}<a id="opener_shipping_estimation_block" class="cm-dialog-opener cm-dialog-auto-size ty-cart-total__a-estimation" data-ca-target-id="shipping_estimation_block" title="{__("calculate_shipping_cost")}" href="{"checkout.cart"|fn_url}" rel="nofollow">{if $cart.shipping}{__("change")}{else}{__("calculate")}{/if}</a>
		{/capture}
		<div class="hidden" id="shipping_estimation_block" title="{__("calculate_shipping_cost")}">
			<div class="ty-cart-content__estimation">
				{include file="views/checkout/components/shipping_estimation.tpl" location="popup" result_ids="shipping_estimation_link"}
			</div>
		</div>
	{/if}
	<div class="ty-cart-total">
		<div class="ty-cart-total__wrapper clearfix" id="checkout_totals">
			{if $cart_products}
				<div class="ty-coupons__container">
					{include file="views/checkout/components/promotion_coupon.tpl"}
					{hook name="checkout:payment_extra"}
					{/hook}
					</div>
			{/if}

			{hook name="checkout:payment_options"}
			{/hook}

			{include file="views/checkout/components/checkout_totals_info.tpl"}
			<div class="clearfix"></div>
			<ul class="ty-cart-statistic__total-list">
				<li class="ty-cart-statistic__item ty-cart-statistic__total">
					<span class="ty-cart-statistic__total-title">{__("total_cost")}</span>
					<span class="ty-cart-statistic__total-value">
						{include file="common/price.tpl" value=$_total|default:$smarty.capture._total|default:$cart.total span_id="cart_total" class="ty-price"}
					</span>
				</li>
			</ul>
		<!--checkout_totals--></div>
	</div>

{/if}
