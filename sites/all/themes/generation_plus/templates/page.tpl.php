<div id="wrapper">
    <div id="wrapper-main">
        <div id="user-login-block">
            <?php
            $block = module_invoke('user', 'block_view', 'login');
            print render($block['content']);
            ?>
        </div>
        <div id="header">
            <div id="top-menu">
                <div id="location">
                    <img src="sites/all/themes/generation_plus/images/location.png">
                    <a href="#">Саратов</a>
                </div>
                <?php
                    $tree = menu_tree('menu-top-menu');
                    print render($tree);
                ?>
                <div id="login-block">
                    <img src="sites/all/themes/generation_plus/images/key.png">
                    <a href="#" id="login-link">Войти</a>
                </div>
            </div>
            <div id="logo">
                <a href="<?php print $base_path?>">
                    <img src="sites/all/themes/generation_plus/images/logo.png">
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
                        <video width="576" height="356" controls  class="rounded">
                            <source src="sites/all/themes/generation_plus/images/small.ogg" type="video/ogg">
                            <source src="sites/all/themes/generation_plus/images/small.webm" type="video/webm"/>
                            <source src="sites/all/themes/generation_plus/images/small.mp4" type="video/mp4">
                            Your browser does not support the video tag.
                        </video>
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
                <img id="logo-small" src="sites/all/themes/generation_plus/images/logo-small.png">
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
                <a href="https://twitter.com/" target="_blank"><img src="sites/all/themes/generation_plus/images/twitter.png" title="Twitter"></a>
                <a href="http://vk.com/" target="_blank"><img src="sites/all/themes/generation_plus/images/vk.png" title="ВКонтакте"></a>
                <a href="http://www.odnoklassniki.ru/" target="_blank"><img src="sites/all/themes/generation_plus/images/od.png" title="Одноклассники"></a>
                <a href="http://www.youtube.com/" target="_blank"><img src="sites/all/themes/generation_plus/images/youtube.png" title="Youtube"></a>
            </div>
        </div>
    </div>
</div>