<?php
$path_to_theme = drupal_get_path('theme', 'generation_plus');
$img_base = base_path() . $path_to_theme . '/images';
?>
<div id="header">
    <div id="top-menu">
        <div id="location">
            <img src="<?php print $img_base ?>/location.png" width="17" height="22">
            <a href="#">Саратов</a>
        </div>
        <?php
        $tree = menu_tree('menu-top-menu');
        print render($tree);
        ?>
        <div id="login-block">
            <img src="<?php print $img_base ?>/key.png" width="19" height="10">
            <?php if (user_is_logged_in()): ?>
            <a href="<?php print $base_path ?>user/logout">Выйти</a>
            <?php else: ?>
            <a href="#" id="login-link">Войти</a>
            <?php endif; ?>
        </div>
    </div>

    <div id="logo">
        <a href="<?php print $base_path?>">
            <img src="<?php print $img_base ?>/logo.png" width="364" height="108">
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
    <div id="main-content" class="rounded">
        <div id="video" class="rounded">
            <object width="576" height="356">
                <param name="movie" value="http://www.youtube.com/v/_BqgFzmF4WU?version=3&amp;hl=ru_RU&amp;rel=0"></param>
                <param name="allowFullScreen" value="true"></param>
                <param name="allowscriptaccess" value="always"></param>
                <embed src="http://www.youtube.com/v/_BqgFzmF4WU?version=3&amp;hl=ru_RU&amp;rel=0" type="application/x-shockwave-flash" width="576" height="356" allowscriptaccess="always" allowfullscreen="true"></embed>
            </object>
        </div>
        <div id="subscription">
            <?php
            $block = module_invoke('simplenews', 'block_view', '1');
            print render($block['content']);
            ?>
            <div id="share">
                <img src="<?php print $img_base ?>/share.png" width="21" height="23">
                <div id="share-icons">
                    <div class="yashare-auto-init" data-yashareL10n="ru" data-yashareType="none" data-yashareQuickServices="vkontakte,twitter,odnoklassniki"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    jQuery(document).ready(function($) {
        $('#subscription input[type=image]').hover(function() {
            $(this).attr('src', '<?php print $img_base ?>/subscription-hover.png');
        }, function() {
            $(this).attr('src', '<?php print $img_base ?>/subscription.png');
        });

        $('#user-login-form input[type=image]').hover(function() {
            $(this).attr('src', '<?php print $img_base ?>/login-hover.png');
        }, function() {
            $(this).attr('src', '<?php print $img_base ?>/login.png');
        });

        $('#share > img').toggle(function() {
            $('#share-icons').css('display', 'inline-block');
        }, function() {
            $('#share-icons').css('display', 'none');
        });

        $('#login-link').toggle(function() {
            $('#user-login-block').slideDown(300);
        }, function() {
            $('#user-login-block').slideUp(300);
        });

        $('#main-menu li > a.active').next().css('display', 'inline');
    });
</script>





