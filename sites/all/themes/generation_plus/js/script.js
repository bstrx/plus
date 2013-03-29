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

    $('#login-link').toggle(function() {
        $('#user-login-block').slideDown(300);
    }, function() {
        $('#user-login-block').slideUp(300);
    });
});