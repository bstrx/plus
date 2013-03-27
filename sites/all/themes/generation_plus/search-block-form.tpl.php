<?php //http://api.drupal.org/api/drupal/modules!search!search-block-form.tpl.php/7 ?>

<div class="container-inline">
    <?php if (empty($variables['form']['#block']->subject)): ?>
    <h2 class="element-invisible"><?php print t('Search form'); ?></h2>

    <?php endif; print_r( $search );?>
    <?php print $search_form; ?>
</div>
