<?php
$path_to_theme = drupal_get_path('theme', 'generation_plus');
$img_base = base_path() . $path_to_theme . '/images';
?>

<div id="wrapper-footer" class="shadow">
    <div id="qr-code"></div>
    <div id="footer">
        Copyright © 2003-2013 Поколение Plus
    </div>
    <div id="social">
        <a href="https://twitter.com/" target="_blank"><img src="<?php print $img_base ?>/twitter.png" title="Twitter"></a>
        <a href="http://vk.com/" target="_blank"><img src="<?php print $img_base ?>/vk.png" title="ВКонтакте"></a>
        <a href="http://www.odnoklassniki.ru/" target="_blank"><img src="<?php print $img_base ?>/od.png" title="Одноклассники"></a>
        <a href="http://www.youtube.com/" target="_blank"><img src="<?php print $img_base?>/youtube.png" title="Youtube"></a>
    </div>
</div>
