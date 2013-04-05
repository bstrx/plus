<?php
    $path_to_theme = drupal_get_path('theme', 'generation_plus');
    $theme_path = base_path() . $path_to_theme;
?>

<div id="wrapper-footer" class="shadow">
    <div id="qr-code"></div>
    <div id="footer">
        Copyright © 2003-2013 Поколение Plus
    </div>
    <div id="social">
        <a href="https://twitter.com/" target="_blank"><img src="<?php print $theme_path ?>/images/twitter.png" title="Twitter"></a>
        <a href="http://vk.com/" target="_blank"><img src="<?php print $theme_path ?>/images/vk.png" title="ВКонтакте"></a>
        <a href="http://www.odnoklassniki.ru/" target="_blank"><img src="<?php print $theme_path ?>/images/od.png" title="Одноклассники"></a>
        <a href="http://www.youtube.com/" target="_blank"><img src="<?php print $theme_path?>/images/youtube.png" title="Youtube"></a>
    </div>
</div>

<script type="text/javascript">
    jQuery(document).ready(function($) {
        $('#subscription input[type=image]').hover(function() {
            $(this).attr('src', '<?php print $theme_path ?>/images/subscription-hover.png');
        }, function() {
            $(this).attr('src', '<?php print $theme_path ?>/images/subscription.png');
        });

        $('#user-login-form input[type=image]').hover(function() {
            $(this).attr('src', '<?php print $theme_path ?>/images/login-hover.png');
        }, function() {
            $(this).attr('src', '<?php print $theme_path ?>/images/login.png');
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

        $('#search-block-form input').watermark('поиск');

        var jLogin = $('#user-login-form input[name=realname]');
        var jPass = $('#user-login-form input[name=pass]');
        if (jLogin.length && jPass.length) {
            jLogin.watemark('логин');
            jPass.watemark('пароль');
        }

        var jName = $('.simplenews-subscribe input[name=realname]');
        var jEMail = $('.simplenews-subscribe input[name=mail]');
        if (jName.length && jEMail.length) {
            jName.watermark('ваше имя');
            jEMail.watermark('ваш e-mail');
        }
    });
</script>