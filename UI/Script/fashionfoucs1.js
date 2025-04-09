var curIndex = 0;
var time = 800;
var slideTime = 5000;
var adTxt = $("#banner_img>li>div>.ad_txt");
var adImg = $("#banner_img>li>div>.ad_img");
var adImg1 = $("#banner_img>li>div>.ad_img1");
var int = setInterval("autoSlide()", slideTime);
$("#banner_ctr>ul>li[class!='first-item'][class!='last-item']").click(function () {
    show($(this).index("#banner_ctr>ul>li[class!='first-item'][class!='last-item']"));
    window.clearInterval(int);
    int = setInterval("autoSlide()", slideTime);
});
function autoSlide() {
   
}
function show(index) {
    $.easing.def = "easeOutQuad";
    $("#drag_ctr,#drag_arrow").stop(false, true).animate({ left: index * 83 + 500 }, 300);
    $("#banner_img>li").eq(curIndex).stop(false, true).fadeOut(time);
	
    adImg.eq(curIndex).stop(false, true).animate({ left: "120px" }, time);
	 adImg1.eq(curIndex).stop(false, true).animate({ right: "120px" }, time);
    setTimeout(function () {
        $("#banner_img>li").eq(index).stop(false, true).fadeIn(time);
		   

        adImg.eq(index).css({ left: "-100px", opacity: "0" }).stop(false, true).animate({ left: "120px", opacity: "1" }, time);
		 adImg1.eq(index).css({ right: "50px", opacity: "0" }).stop(false, true).animate({ right: "30px", opacity: "1" }, time);
		 
	
    }, 200)
    curIndex = index;
}

var screenWidth = window.screen.width;
if (screenWidth < 1200) {
    $('#bannerleft').css('width', '100px');
}

