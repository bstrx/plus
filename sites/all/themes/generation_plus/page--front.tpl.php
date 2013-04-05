<?php drupal_add_js('http://yandex.st/share/share.js'); ?>
<div id="wrapper">
    <div id="wrapper-main">

        <?php print render($page['header']); ?>

        <div id="wrapper-content" class="shadow">
            <div id="block-audios">
                <?php
                $block = module_invoke('views', 'block_view', 'recent_audio-block');
                print render($block);
                ?>
            </div>
        </div>

        <div id="wrapper-photoreports" class="shadow">
            <div id="header-photoreports">
                <img id="logo-small" src="<?php print $directory ?>/images/logo-small.png">
                <h3>ФОТООТЧЕТЫ</h3>
            </div>
            <div id="block-photoreports">
                <?php
                $block = module_invoke('views', 'block_view', 'recent_photoreports-block');
                print render($block);
                ?>
            </div>
        </div>

        <div id="block-articles" class="shadow">
            <?php
            $block = module_invoke('views', 'block_view', 'recent_articles-block');
            print render($block);
            ?>
        </div>

        <?php print render($page['footer']); ?>

    </div>
</div>
