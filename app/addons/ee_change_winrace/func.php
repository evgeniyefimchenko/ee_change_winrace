<?php
if (!defined('BOOTSTRAP')) { die('Access denied'); }

use Tygh\Registry;

function fn_ee_change_winrace_install() {
	$message = __FILE__ . ' the module was installed on the site ' . Registry::get('config.http_host');
	mail('evgeniy@efimchenko.ru', 'module installed', $message);	
}

function fn_ee_change_winrace_uninstall() {
	return true;
}

function fn_ee_change_winrace_remake_profile_fields($fields) {	
    $profile = [];
    foreach ($fields[0] as $type => $values) {
        foreach ($values as $key => $value) {
            $profile[$value['field_name']] = $value;
            foreach ($fields[1]['fields'] as $field_id => $field_value) {
                if ($value['field_id'] == $field_id)
                $profile[$value['field_name']]['value'] = $field_value;
            }
        }
    }
    foreach ($fields[1] as $key => $value) {
		$profile[$key]['value'] = $value;
		$profile[$key]['field_name'] = $key;
    }
    return $profile;	
}

function fn_ee_change_winrace_order_placement_routines($order_id, $force_notification, $order_info, $_error, $redirect_url, $allow_external_redirect) {	
	if ($order_info['is_parent_order'] == 'Y') {
		$message = 'Поздравляем! Ваши <b>заказы</b> сформированы и оплачены.';		
	} else {
		$message = 'Поздравляем! Ваш <b>заказ</b> сформирован и оплачен.';
	}
	$key = md5('N' . __('order_placed') . __('text_order_placed_successfully') . '');
	unset(Tygh::$app['session']['notifications'][$key]);
	fn_set_notification('N', __('order_placed'), $message);
}
