<?php

$elements = drupal_get_form('user_login_block');
$rendered = drupal_render($elements);

$output  = '<div id="user-login-block"><form action="' . $elements['#action'] .
    '" method="' . $elements['#method'] .
    '" id="' . $elements['#id'] .
    '" accept-charset="UTF-8"><div class="bordered">';

$output .= $elements['name']['#children'];
$output .= $elements['pass']['#children'];
$output .= $elements['actions']['#children'];
$output .= '</div>';
$output .= $elements['links']['#children'];
$output .= $elements['form_build_id']['#children'];
$output .= $elements['form_id']['#children'];
$output .= '</form></div>';

print $output;
?>