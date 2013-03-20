<div id="wrapper">
    <div id="wrapper-main">
        <div id="header">
            <div id="top-menu"></div>
            <div id="logo"></div>
            <div id="quotation"></div>
        </div>
        <div id="main-menu">
            <?php print render($page['content']['superfish_1']);?>
        </div>
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


<?php if ($page['sidebar_first']): ?>
    <div id="sidebar-first" class="column sidebar"><div class="section">
            <?php print render($page['sidebar_first']); ?>
        </div></div> <!-- /.section, /#sidebar-first -->
<?php endif; ?>
