<?php drupal_add_js('http://yandex.st/share/share.js'); ?>
<div id="wrapper">
    <div id="wrapper-main">
        <?php print render($page['header']); ?>

        <div id="wrapper-content" class="shadow">
            <?php print render($page['content']); ?>
        </div>

        <?php print render($page['footer']); ?>
    </div>
</div>