var scrflag = "fscr";
function checkScrCookie() {
    var $div = $("#formbody");
    var f = getCookie(scrflag);
    if (f == 1) {
        setScrFull();
    }
}
//全屏
function setScrFull() {
    var $div = $("#formbody");
    var w = $(window).width() - 22;
    $('#fScrFlag label').html('还原');
    $('#fScrFlag img').attr('src', '../../Themes/custom/images/btn/toolbar_pic/btn_f_renew.png');
    $div.removeClass("form-main").addClass("form-contentfulls");

//    $('.form-contentfulls .form-toolbarmid').css("width", w);
//    $('.form-contentfulls .form-topmid').css("width", w);
//    $('.form-contentfulls .form-contentmid').css("width", w);
//    $('.form-contentfulls .form-bottommid').css("width", w);
}
//还原
function setScrInit() {
    var $div = $("#formbody");
    $('#fScrFlag label').html('全屏');
    $('#fScrFlag img').attr('src', '../../Themes/custom/images/btn/toolbar_pic/btn_f_full.png');
    $div.removeClass("form-contentfulls").addClass("form-main");
    //    $('.form-content .form-toolbarmid').css("width", "942");
    //    $('.form-content .form-topmid').css("width", "942");
    //    $('.form-content .form-contentmid').css("width", "942");
    //    $('.form-content .form-bottommid').css("width", "942");
}
//绑定
function bindBtnScr() {
    $('#fScrFlag').click(function () {
        var $flag = $("#fScrFlag label");
        if ($flag.html() == "还原") {
            addCookie(scrflag, 0, 24);
            setScrInit();
        } else if ($flag.html() == "全屏") {
            addCookie(scrflag, 1, 24);
            setScrFull();
        }
    })
}