<?php
    global $base_root;
    $img_base = $base_root . base_path() . path_to_theme();
?>

<?php drupal_add_js('http://yandex.st/share/share.js'); ?>
<div id="wrapper">
    <div id="wrapper-main">

        <div id="header">
            <?php print render($page['header'])?>

            <div id="top-menu">
                <div id="location">
                    <img src="<?php print $img_base ?>/images/location.png" width="17" height="22">
                    <a href="#">Саратов</a>
                </div>
                <?php
                    $tree = menu_tree('menu-top-menu');
                    print render($tree);
                ?>
                <div id="login-block">
                    <img src="<?php print $img_base ?>/images/key.png" width="19" height="10">
                    <?php if (user_is_logged_in()): ?>
                        <a href="<?php print $base_path ?>?q=user/logout">Выйти</a>
                    <?php else: ?>
                        <a href="#" id="login-link">Войти</a>
                    <?php endif; ?>
                </div>
            </div>

            <div id="logo">
                <a href="<?php print $base_path?>">
                    <img src="<?php print $img_base ?>/images/logo.png" width="364" height="108">
                </a>
            </div>

            <div id="quotation">
                <?php
                    $block = module_invoke('views', 'block_view', 'quotations-block');
                    print render($block);
                ?>
            </div>
        </div>

        <div id="wrapper-main-menu" class="shadow">
            <div id="main-menu">
                <?php
                    $block = module_invoke('menu_block', 'block_view', 2);
                    print render($block['content']['#content']);

                    $block = module_invoke('search', 'block_view');
                    print render($block);
                ?>
            </div>
            <div id="main-menu-sub">
                <?php
                    $block = module_invoke('menu_block', 'block_view', 1);
                    print render($block['content']['#content']);
                ?>
            </div>
        </div>

        <div id="wrapper-content" class="shadow">
            <?php print render($page['content']); ?>
        </div>

        <div id="wrapper-footer" class="shadow">
            <div id="qr-code"></div>
            <div id="footer">
                    Copyright © 2003-2013 Поколение Plus
            </div>
            <div id="social">
                <a href="https://twitter.com/" target="_blank"><img src="<?php print $img_base ?>/images/twitter.png" title="Twitter"></a>
                <a href="http://vk.com/" target="_blank"><img src="<?php print $img_base ?>/images/vk.png" title="ВКонтакте"></a>
                <a href="http://www.odnoklassniki.ru/" target="_blank"><img src="<?php print $img_base ?>/images/od.png" title="Одноклассники"></a>
                <a href="http://www.youtube.com/" target="_blank"><img src="<?php print $img_base ?>/images/youtube.png" title="Youtube"></a>
            </div>
        </div>

    </div>
</div>
