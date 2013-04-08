<?php
    $path_to_theme = drupal_get_path('theme', 'generation_plus');
    $theme_path = base_path() . $path_to_theme;

    drupal_add_js('http://yandex.st/share/share.js');
    //add script for placeholders in IE<=8
    drupal_add_js($theme_path .'/js/jquery.watermark.min.js');
?>

<div id="header">
    <div id="top-menu">
        <div id="location">
            <img src="<?php print $theme_path ?>/images/location.png" width="17" height="22">
            <a href="#">Саратов</a>
        </div>
            <?php
                $tree = menu_tree('menu-top-menu');
                print render($tree);
            ?>
        <div id="login-block">
            <img src="<?php print $theme_path ?>/images/key.png" width="19" height="10">
            <?php if (user_is_logged_in()): ?>
            <a href="<?php print $base_path ?>user/logout">Выйти</a>
            <?php else: ?>
            <a href="#" id="login-link">Войти</a>
            <?php endif; ?>
        </div>
    </div>

    <div id="logo">
        <a href="<?php print $base_path?>">
            <img src="<?php print $theme_path ?>/images/logo.png" width="364" height="108">
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
        ?>
        <div id="search-block-form">
            <?php
                $block = module_invoke('search', 'block_view');
                print render($block);
            ?>
        </div>
    </div>
    <div id="main-menu-sub">
        <?php
            $block = module_invoke('menu_block', 'block_view', 1);
            print render($block['content']['#content']);
        ?>
    </div>
</div>