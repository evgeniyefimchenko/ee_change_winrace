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