<?php print $styles;?>
<div id="wrapper">
    <div id="wrapper-main">
        <div id="header">
            <div id="top-menu"></div>
            <div id="logo"></div>
            <div id="quotation"></div>
        </div>
        <?php if ($main_menu) { ?>
            <div id="main-menu" class="navigation">
                <?php print theme('links__system_main_menu', array(
                    'links' => $main_menu,
                    'attributes' => array(
                        'id' => 'main-menu-links'
                    ),
                    'heading' => array(
                        'text' => t('Main menu'),
                        'level' => 'h2',
                        'class' => array('element-invisible'),
                    ),
                ));
                ?>
            </div> <!-- /#main-menu -->
        <?php } ?>
        <div id="wrapper-content">
            <div id="content"></div>
            <div id="block-audios"></div>
        </div>

        <div id="wrapper-reports">
            <div id="header-reports"></div>
            <div id="block-reports"></div>
        </div>

        <div id="block-news"></div>
        <div id="footer"></div>
    </div>
</div>