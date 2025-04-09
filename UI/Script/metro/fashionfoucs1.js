var curIndex = 0;
var time = 0;
var slideTime = 0;

var adImg = $("#banner_img>li>div>.ad_img");
$("#banner_ctr>#nav>ul>li[class!='first-item'][class!='last-item']").click(function () {
    var sIndex = $(this).index("#banner_ctr>#nav>ul>li[class!='first-item'][class!='last-item']")
    var idArray = new Array();
    idArray = $("#hiFrameIDs").val().split(',');
    //Add by xiedx 刷新
    if (sIndex == curIndex) {
        $("#" + idArray[curIndex]).attr("src", $("#" + idArray[curIndex]).attr("src"));
        return false;
    }
    show(sIndex);
    //点击按钮时实时加载 xiedx 20141016
    if ($("#" + idArray[curIndex]).attr("src") == undefined && $("#" + idArray[curIndex]).attr("mySrc") != undefined) {
        $("#" + idArray[curIndex]).attr("src", $("#" + idArray[curIndex]).attr("mySrc"));
    }
    //    window.frames[idArray[curIndex]].contentWindow.onload();
});

/*自动滚动代码*/
function show(index) {
    $.easing.def = "easeOutQuad";
    $("#drag_ctr").css({ left: index * 83 });
    $("#banner_img>li").eq(curIndex).hide();
    adImg.eq(curIndex).css({ left: "0px" });
    $("#banner_img>li").eq(index).show();
    adImg.eq(index).css({ left: "-1px", opacity: "1" });
    curIndex = index;
}



