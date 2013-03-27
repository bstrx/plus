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

function generation_plus_theme() {

    return array(
        'opensoft_mailing_form' => array(
            'render element' => 'form',
            'template' => 'mailing-form',
        ),
    );
}

function generation_plus_form_alter(&$form, &$form_state, $form_id) {
    if ($form_id == 'simplenews_block_form_1') {
        $form['realname'] = array(
            '#type' => 'textfield',
            '#required' => true,
            '#size' => '26',
            '#attributes' => array(
                'placeholder' => 'ваше имя'
            ),
            '#weight' => 1
        );
        $form['email'] = array(
            '#type' => 'textfield',
            '#required' => true,
            '#size' => '26',
            '#attributes' => array(
                'placeholder' => 'ваш e-mail'
            ),
            '#weight' => 2
        );
        $form['submit'] = array(
            '#type' => 'image_button',
            '#button_type' => 'submit',
            '#value' => t('Подписаться'),
            '#src' => 'sites/all/themes/generation_plus/images/subscription.png',
            '#weight' => 3
        );
    }
}
?>