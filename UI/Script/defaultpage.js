
// JavaScript Document
var topClose = 1; //top显示
var leftClose = 1; //没有关闭左侧菜单
var $midw = 1;
var $w = 1;
var $i = 1;
var $len = 1;
var $pagecount = 1;
var $cur = 1; //初始化显示的版面

function ChangeNav() {
    var $showbox = $('#nav');
    $midw = $(window).width();
    $('#navcontain').width($midw - 440);//395
    $w = $('#navcontain').width();
    $len = $('#nav>li').length * 110; //计算列表总长度
    $pagecount = Math.ceil($len / $w); //计算展示版面数量
    if ($pagecount > 1) {//modify by wenwen 日志过于庞大
        $('#nav_left').css('display', '');
        $('#nav_right').css('display', '');
    } else {
        $('#nav_left').css('display', 'none');
        $('#nav_right').css('display', 'none');
        $showbox.css({
            left: 0
        });
    }
}
//向前滚动
function PreClick() {
    var $showbox = $('#nav');
    if (!$showbox.is(':animated')) { //判断展示区是否动画
        if (Math.abs($showbox.offset().left) < $len / $pagecount || ($showbox.offset().left == 250)) {
            $showbox.animate({
                left: +0
            }, 500);
            $cur = 1;
        }
        else {
            $cur--;
            $showbox.animate({
                left: '+=' + $len / $pagecount
            }, 500);
        }
    }
}
//向后滚动
function NextClick() {
    var $showbox = $('#nav');
    if (!$showbox.is(':animated')) {
        if ($cur == $pagecount) {
        }
        else {
            $cur++;
            $showbox.animate({
                left: '-=' + $len / $pagecount
            }, 500);
        }
    }
}
window.onload = window.onresize = function () {
    changeSize();
}
function changeSize() {
    var w;
    var h;
    if (leftClose) {
        w = document.body.clientWidth - 225;
    } else {
        w = document.body.clientWidth - 35;
    }
    if (topClose) {
        h = document.body.clientHeight - 118;
        $('#leftmenu').height((document.body.clientHeight - 98) + 'px');
    } else {
        h = document.body.clientHeight - 66;
        $('#leftmenu').height((document.body.clientHeight - 44) + 'px');
    }

    $('#tab-container').height(h + 'px');
    $('#tab-container').width(w + 'px');
    $('#tab-container').resizetabpanel(w, h);
}



//打开tab页
function nav(id, text, url) {
    flag = true; //判断是否刷新
    $("#tab-container").opentabitem({ id: id, text: text, url: url, isactive: true, closeable: true }, true);
    curiframeid = id;

    window.scrollTo(0, 0); //滚动到顶部
}
var curiframeid = "";
function initCustomerPlugin() {
    //ie6的特殊支持
    if ($.browser.msie && parseInt($.browser.version) <= 6) {
        $('#navcontain').css('z-index', '10');
        $("#nav ul a").each(function () {
            $(this).hover(function () {
                $(this).addClass('ie6ahover');
            }, function () {
                $(this).removeClass('ie6ahover');
            })
        })
    }
    //记录点击以前的菜单对象
    var beforenav = $("#nav li.current").first();
    //显示二级菜单
    $("#nav").children("li").each(function () {
        $(this).hover(function () {
            if ($(this).find('li').length > 0) {
                $(this).addClass('sfhover').siblings("li").removeClass("current");
            }
        }, function () {
            $(this).removeClass('sfhover');
            beforenav.addClass("current");
        })
    });
    //导航条滚动
    ChangeNav();
    $(window).resize(function () {
        ChangeNav();
    });
    $('#nav_left').bind('click', PreClick);
    $('#nav_right').bind("click", NextClick);
    //导航条单击效果
    $("#nav li").click(function (e) {
        beforenav = $(this);
        if ($(this).find('li').length > 0) {//有下拉菜单
            var target = $(this).children('a').attr('target');
            $("#nav").children("li").removeClass('current');
            $(this).addClass('current');
            $('.leftmenu').css('display', 'none');
            $('#' + target).css('display', '');
            OpenLeft();
            if ($(e.target).attr('href') == undefined) { return false; }
            else {
                var t = $(e.target).attr('href').substring(1);
                $('#' + target + ' a').each(function () {//左侧菜单效果
                    if ($(this).attr('name') !== undefined && $(this).attr('name') == t) {
                        var id = $(this).attr('target');
                        $('.leftmenu a span').removeClass('leftmenuclick');
                        if (id != undefined) {//有二级
                            $('#' + id).siblings('div').each(function () {
                                if ($(this).is(':visible')) {
                                    $(this).prev('a').trigger('click');
                                }
                            }).end().css('display', '').prev('a').find('img').attr('src', 'themes/images/open.gif');
                            $('#' + id).find('a').each(function () {
                                if ($(this).attr('target') == undefined) {
                                    $(this).trigger('click'); //关闭后再点击也要展开
                                    flag = true;
                                    return false;
                                } else {
                                    if ($('#' + $(this).attr('target')).is(":hidden")) {
                                        $(this).trigger('click');
                                    }
                                }
                            })

                            //add by ailanjha 有二级菜单，则左侧默认打开
                            OpenLeft();
                        } else {//无二级
                            $(this).trigger('click');
                            $(this).siblings('div').each(function () {
                                if ($(this).is(':visible')) {
                                    $(this).prev('a').trigger('click');
                                }
                            })

                            //add by ailanjha 无二级菜单，则左侧默认关闭
                            CloseLeft();
                        }
                        return false;
                    }
                })
            }
        }

    });

    //左侧菜单效果
    $('.leftmenu a').each(function () {
        var id = $(this).attr('target');
        if (id != undefined) {
            $(this).click(function () {
                if ($('div#' + id).is(':hidden')) {
                    $('div#' + id).css('display', '');
                    if ($(this).find('img').attr('src').indexOf('sed') > 0) {
                        $(this).find('img').attr('src', 'themes/images/sedopen.gif');
                    } else {
                        $(this).find('img').attr('src', 'themes/images/open.gif');
                    }
                } else {
                    $('div#' + id).css('display', 'none');
                    if ($(this).find('img').attr('src').indexOf('sed') > 0) {
                        $(this).find('img').attr('src', 'themes/images/sedclose.gif');
                    } else {
                        $(this).find('img').attr('src', 'themes/images/close.gif');
                    }
                }
            })
        } else {
            $(this).click(function () {
                $('.leftmenu a span').removeClass('leftmenuclick');
                $(this).children('span').addClass('leftmenuclick');
            })
        }
    })

    initTabs();
    //close left
    //modify by ailanjha
    $('#middle').click(function () {
        if (leftClose) {

            $('#left').css('display', 'none');
            $('#openLeft').css('display', '');
            $('#closeLeft').css('display', 'none');
            leftClose = 0;
            changeSize();
        } else {
            $('#left').css('display', '');
            $('#openLeft').css('display', 'none');
            $('#closeLeft').css('display', '');
            leftClose = 1;
            changeSize();

        }
    })

    function CloseLeft() {
        $('#left').css('display', 'none');
        $('#openLeft').css('display', '');
        $('#closeLeft').css('display', 'none');
        leftClose = 0;
        changeSize();
    }

    function OpenLeft() {
        $('#left').css('display', '');
        $('#openLeft').css('display', 'none');
        $('#closeLeft').css('display', '');
        leftClose = 1;
        changeSize();
    }


    //    $('#middle').toggle(function() {
    //        $('#left').css('display', 'none');
    //        $('#openLeft').css('display', '');
    //        $('#closeLeft').css('display', 'none');
    //        leftClose = 0;
    //        changeSize();
    //    }, function() {
    //        $('#left').css('display', '');
    //        $('#openLeft').css('display', 'none');
    //        $('#closeLeft').css('display', '');
    //        leftClose = 1;
    //        changeSize();
    //    })

    //end modify


    //close header
    $('#headhideimg').click(function () {
        if (topClose) {
            $('.header').css({ position: 'absolute', top: '-62px' }).css('z-index', '100');
            $('.hide_header').css('display', 'block');
            topClose = 0;
            changeSize();
            $('.x-tab-panel-header').css('top', '4px'); //特别注意这个地方也要改
            $('.x-tab-closeall').css({ position: 'absolute', top: '6px' });
            $('.hide_header').mouseover(function () {
                $('.header').css({ top: '0px' }).css('z-index', '10');
                $('.header').hover(function () {
                }, function () {
                    $('.header').css({ position: 'absolute', top: '-62px' }).css('z-index', '100');
                })
            })
            $(this).removeClass('head_closep').addClass('head_openp');
        } else {
            $('.header').css({ position: '' }).unbind();
            $('.hide_header').css('display', 'none');
            topClose = 1;
            changeSize();
            $('.x-tab-panel-header').css('top', '69px');
            $('.x-tab-closeall').css({ position: 'absolute', top: '70px' });
            $(this).removeClass('head_openp').addClass('head_closep');
        }
    })

    $('#headhideimg').hover(function () {
        $(this).removeClass('headhide_img').addClass('headhide_imghover');
    }, function () {
        $(this).removeClass('headhide_imghover').addClass('headhide_img');
    })

}
