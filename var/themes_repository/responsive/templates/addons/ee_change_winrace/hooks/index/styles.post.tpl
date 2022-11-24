{if $addons.ee_change_winrace.ee_change_winrace_cart == "Y"}
	{style src="addons/ee_change_winrace/styles.css"}
{/if}

{if $addons.ee_change_winrace.ee_change_winrace_vendor == "Y" && $runtime.controller == 'companies'}
	{style src="addons/ee_change_winrace/styles_vendor.less"}
	{style src="addons/ee_change_winrace/style_vendor.min.css"}	
{/if}

{if $addons.ee_change_winrace.ee_change_winrace_profile == "Y" && $runtime.controller == 'profiles'}
	{style src="addons/ee_change_winrace/styles_profile.less"}
	{style src="addons/ee_change_winrace/style_profile.min.css"}		
{/if}
