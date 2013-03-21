<!-- Это информация из двух блоков, блоки редактируются из шаблонных файлов неподалёку.Тут блоки зависят от региона
(content) и это нехорошо. С другой стороны, других напрягов по коду я не вижу

-->
<?
$block = module_invoke('views', 'block_view', 'recent_articles-block');
print render($block);

//При таком способе блок не зависит от региона, но он не проходит через свою tpl'ку ;(
//ПЕЧАЛЬНО! Чтобы это исправить, необходима ещё куча кода при определении блока. Так - верхний вариант предпочтительней.


//$articlesBlock = module_invoke('opensoft', 'block_view', 'last-articles');
//print $articlesBlock;

// $photoreportsBlock = module_invoke('opensoft', 'block_view', 'last-photoreports');
// print $photoreportsBlock;
?>

<div id="wrapper" bgcolor="chucknorris">
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

        <div id="block-articles"></div>
        <div id="wrapper-footer">
            <div id="qr-code"></div>
            <div id="footer" bgcolor="chucknorris">
                <div id="footer-text">
                    <div id="social"></div>
                    <div>Copyright © 2003-2013 Поколение Plus</div>
                </div>
            </div>
        </div>
    </div>
</div>


<?php if ($page['sidebar_first']): ?>
    <div id="sidebar-first" class="column sidebar"><div class="section">
            <?php print render($page['sidebar_first']); ?>
        </div></div> <!-- /.section, /#sidebar-first -->
<?php endif; ?>
