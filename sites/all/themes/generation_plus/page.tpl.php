<!-- Это информация из двух блоков, блоки редактируются из шаблонных файлов неподалёку.Тут блоки зависят от региона
(content) и это нехорошо. С другой стороны, других напрягов по коду я не вижу

-->
<?php print render($page['content']['opensoft_last-articles']);?>
<?php print render($page['content']['opensoft_last-photoreports']);?>


<?php
//При таком способе блок не зависит от региона, но он не проходит через свою tpl'ку ;(
//ПЕЧАЛЬНО! Чтобы это исправить, необходима ещё куча кода при определении блока. Так - верхний вариант предпочтительней.


//$articlesBlock = module_invoke('opensoft', 'block_view', 'last-articles');
//print $articlesBlock;

// $photoreportsBlock = module_invoke('opensoft', 'block_view', 'last-photoreports');
// print $photoreportsBlock;
?>

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
