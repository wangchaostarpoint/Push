// JavaScript Document

var cookies = "styles";

function bindstylebtn() {
    $('div#hh a').click(function () {
        var styles = $(this).attr('styles');
        addCookie(cookies, styles, 24);

        document.location.reload(); //当前页面

    })
}

checkcookie();
//加载字体大小、系统样式
function checkcookie() {
    if ($('.font').length > 0) {
        var styleFolder = "";
        if ($fontStyle != "") {
            styleFolder = $fontStyle + "/";
        }
        $('.font').attr("href", "themes/custom/styles/" + styleFolder + "font.css");
    }

    if ($('.sys').length > 0) {
        var styleFolder = "";
        if ($sysStyle != "") {
            styleFolder = $sysStyle + "/";
        }
        $('.sys').attr("href", "themes/custom/styles/" + styleFolder + "sys.css");
    }
}






