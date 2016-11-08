
jQuery(document).ready(function() {

    /*
        Background slideshow
    */
    $.backstretch([
      "assets/img/backgrounds/1.jpg"   
    , "http://www.199y.com/picture/yqwan/2016031012132664banner_03.jpg"
    , " http://www.199y.com/picture/yqwan/2016031118022197banner_03.jpg"
    , "assets/img/backgrounds/2.jpg"
    , "assets/img/backgrounds/3.jpg"
   
    ], {duration: 3000, fade: 750});

    /*
        Tooltips
    */
    $('.links a.home').tooltip();
    $('.links a.blog').tooltip();

    /*
        Form validation
    */
    $('.register form').submit(function(){
        $(this).find("label[for='userid']").html('账号');
        $(this).find("label[for='password']").html('密码');
        ////
        var userid = $(this).find('input#userid').val();
        var password = $(this).find('input#password').val();
        
        if(userid == '') {
            $(this).find("label[for='userid']").append("<span style='display:none' class='red'> - 请输入合法用户名.</span>");
            $(this).find("label[for='userid'] span").fadeIn('medium');
            return false;
        }
        if(password == '') {
            $(this).find("label[for='password']").append("<span style='display:none' class='red'> - 请输入正确的密码.</span>");
            $(this).find("label[for='password'] span").fadeIn('medium');
            return false;
        }
    });


});


