{if $addons.ee_change_winrace.ee_change_winrace_cart == "Y"}
	{script src="js/addons/ee_change_winrace/script.js"}
{/if}

{if $addons.ee_change_winrace.ee_change_winrace_vendor == "Y" && $runtime.controller == 'companies'}
	{script src="js/addons/ee_change_winrace/app_seller.min.js"}
{/if}

{if $addons.ee_change_winrace.ee_change_winrace_profile == "Y" && $runtime.controller == 'profiles'}
	{script src="js/addons/ee_change_winrace/app_profile.min.js"}
{/if}
