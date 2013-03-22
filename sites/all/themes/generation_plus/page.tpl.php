<div id="wrapper">
    <div id="wrapper-main">
        <div id="header">
            <div id="top-menu">
                Саратов
            </div>
            <div id="logo"></div>
            <div id="quotation"></div>
        </div>
        <div id="main-menu">
            <?php print render($page['content']['superfish_1']);?>
        </div>
        <div id="wrapper-content">
            <div id="content">
                <div id="video"></div>
                <div id="subscription"></div>
            </div>
            <div id="block-audios"></div>
        </div>

        <div id="wrapper-photoreports">
            <div id="header-photoreports">
                <img id="logo-small" src="sites/all/themes/generation_plus/images/logo_small.png">
                <h3>ФОТООТЧЕТЫ</h3>
            </div>
            <div id="block-photoreports"></div>
        </div>

        <div class="clear"></div>

        <div id="block-articles">
            <?php
                $block = module_invoke('views', 'block_view', 'recent_articles-block');
                print render($block);
            ?>
        </div>
        <div id="wrapper-footer">
            <div id="qr-code"></div>
            <div id="footer">
                <div id="footer-text">
                    <div id="social"></div>
                    <div>Copyright © 2003-2013 Поколение Plus</div>
                </div>
            </div>
        </div>

        <div class="clear"></div>

    </div>
</div>


<?php if ($page['sidebar_first']): ?>
    <div id="sidebar-first" class="column sidebar"><div class="section">
            <?php print render($page['sidebar_first']); ?>
        </div></div> <!-- /.section, /#sidebar-first -->
<?php endif; ?>


<!--------------->
<div style='clear:both'> </div>

<?php
$block = module_invoke('views', 'block_view', 'recent_photoreports-block');
print render($block);
?>

