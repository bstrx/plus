<?php
function generation_plus_menu_tree__main_menu($variables) {
  return '<ul class="menu">' . $variables['tree'] . '</ul>';
}

function generation_plus_menu_link__main_menu(array $variables) {
    $element = $variables['element'];
    $sub_menu = '';

    if ($element['#below']) {
        $sub_menu = drupal_render($element['#below']);
    }
    $output = l($element['#title'], $element['#href'], $element['#localized_options']);
    return '<li' . drupal_attributes($element['#attributes']) . '>' . $output . $sub_menu . "</li>";
}