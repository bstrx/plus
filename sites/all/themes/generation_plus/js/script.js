jQuery(document).ready(function($) {
    $('#subscription input[type=image]').hover(function() {
       $(this).attr('src', 'sites/all/themes/generation_plus/images/subscription-hover.png');
    }, function() {
       $(this).attr('src', 'sites/all/themes/generation_plus/images/subscription.png');
    });

    $('#user-login-form input[type=image]').hover(function() {
        $(this).attr('src', 'sites/all/themes/generation_plus/images/login-hover.png');
    }, function() {
        $(this).attr('src', 'sites/all/themes/generation_plus/images/login.png');
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

    var  jImg = $('<img src="sites/all/themes/generation_plus/images/main-menu-active-corner.png" width="14" height="8">');
    var jImgHover = jImg.clone();

    $('#main-menu li > a.active').parent().append(jImg);
    $('#main-menu li > a:not(a.active)').mouseover(function() {
        $(this).parent().append(jImgHover);
    });
    $('#main-menu li > a.active').mouseover(function() {
        jImgHover.remove();
    });
});