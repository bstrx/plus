<div id="wrapper">
    <div id="wrapper-main">
        <div id="header">
            <div id="top-menu">
                Саратов
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
                <div id="content">
                    <div id="video">
                        <video width="576" height="356" controls>
                            <source src="sites/all/themes/generation_plus/images/small.ogg" type="video/ogg">
                            <source src="sites/all/themes/generation_plus/images/small.webm" type="video/webm"/>
                            <source src="sites/all/themes/generation_plus/images/small.mp4" type="video/mp4">
                            Your browser does not support the video tag.
                        </video>
                    </div>
                    <div id="subscription">
                        <div>Подпишись на нашу рассылку и получи бесплатный видео курс!</div>
                        <?php
                            print drupal_render(drupal_get_form('opensoft_mailing_form'));
                        ?>
                    </div>

                </div>
                <div class='clear'></div>
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
            <div id="social"></div>
        </div>
    </div>

</div>

<div class='clear'</div>
<?php if ($page['sidebar_first']): ?>
    <div id="sidebar-first" class="column sidebar"><div class="section">
            <?php print render($page['sidebar_first']); ?>
        </div></div> <!-- /.section, /#sidebar-first -->
<?php endif; ?>
