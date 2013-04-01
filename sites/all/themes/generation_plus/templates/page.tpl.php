<div id="wrapper">
    <div id="wrapper-main">

        <div id="header">

            <?php print render($page['header'])?>

            <div id="top-menu">
                <div id="location">
                    <img src="<?php print $directory ?>/images/location.png" width="17" height="22">
                    <a href="#">Саратов</a>
                </div>
                <?php
                    $tree = menu_tree('menu-top-menu');
                    print render($tree);
                ?>
                <div id="login-block">
                    <img src="<?php print $directory ?>/images/key.png" width="19" height="10">
                    <?php if (user_is_logged_in()): ?>
                        <a href="<?php print $base_path ?>?q=user/logout">Выйти</a>
                    <?php else: ?>
                        <a href="#" id="login-link">Войти</a>
                    <?php endif; ?>
                </div>
            </div>

            <div id="logo">
                <a href="<?php print $base_path?>">
                    <img src="<?php print $directory ?>/images/logo.png" width="364" height="108">
                </a>
            </div>

            <div id="quotation">
                <?php
                    $block = module_invoke('views', 'block_view', 'quotations-block');
                    print render($block);
                ?>
            </div>

        </div>

        <div class="shadow">

            <div id="wrapper-main-menu">
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

            <div id="wrapper-content">
                <div id="content" class="rounded">
                    <div id="video" class="rounded">
                        <object width="576" height="356">
                            <param name="movie" value="http://www.youtube.com/v/c-mzGDaeoSQ?version=3&amp;hl=ru_RU&amp;rel=0"></param>
                            <param name="allowFullScreen" value="true"></param>
                            <param name="allowscriptaccess" value="always"></param>
                            <embed src="http://www.youtube.com/v/c-mzGDaeoSQ?version=3&amp;hl=ru_RU&amp;rel=0" type="application/x-shockwave-flash" width="576" height="356" allowscriptaccess="always" allowfullscreen="true"></embed>
                        </object>
                    </div>
                    <div id="subscription">
                        <?php
                            $block = module_invoke('simplenews', 'block_view', '1');
                            print render($block['content']);
                        ?>
                    </div>
                </div>
                <div id="block-audios">
                    <?php
                        $block = module_invoke('views', 'block_view', 'recent_audio-block');
                        print render($block);
                    ?>
                </div>
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

        <div id="wrapper-footer" class="shadow">
            <div id="qr-code"></div>
            <div id="footer">
                    Copyright © 2003-2013 Поколение Plus
            </div>
            <div id="social">
                <a href="https://twitter.com/" target="_blank"><img src="<?php print $directory ?>/images/twitter.png" title="Twitter"></a>
                <a href="http://vk.com/" target="_blank"><img src="<?php print $directory ?>/images/vk.png" title="ВКонтакте"></a>
                <a href="http://www.odnoklassniki.ru/" target="_blank"><img src="<?php print $directory ?>/images/od.png" title="Одноклассники"></a>
                <a href="http://www.youtube.com/" target="_blank"><img src="<?php print $directory ?>/images/youtube.png" title="Youtube"></a>
            </div>
        </div>

    </div>
</div>
