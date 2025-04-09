
// JavaScript Document
// <reference path="../intellisense/jquery-1.4.1-vsdoc.js" />

; (function($) {
    $.fn.tabpanel = function(option) {
        var dfop = {
            items: [], //选项卡数据项 {id,text,classes,disabled,closeable,content,url,cuscall,onactive}
            width: 500,
            height: 400,
            scrollwidth: 150, //如果存在滚动条，点击按钮次每次滚动的距离
            autoscroll: true, //当选项卡宽度大于容器时自动添加滚动按钮
            closeAll: true, //是否显示关闭所有按钮
            max: 20    //最多显示tab页的数量
        };
        var flag = true;
        var headerheight = 0;
        $.extend(dfop, option);
        var me = $(this).addClass("x-tab-panel").width(dfop.width);
        innerwidth = dfop.width - 2;
        //构建Tab的Html
        var tcs = dfop.autoscroll ? "x-tab-scrolling-top" : "";
        var header = $("<div class='x-tab-panel-header x-unselectable " + tcs + "' unselectable='on' style='width:" + (window.screen.availWidth) + "px;MozUserSelect:none;KhtmlUserSelect:none;'></div>");
        var stripwrap = $("<div class='x-tab-strip-wrap'/>");
        var scrollerright = $("<div class='x-tab-scroller-right x-unselectable' style='height: 24px; visibility: hidden; mozuserselect: none; khtmluserselect: none;' unselectable='on'/>");
        var scrollerleft = $("<div class='x-tab-scroller-left x-unselectable' style='height: 24px; visibility: hidden; mozuserselect: none; khtmluserselect: none;' unselectable='on'/>");
        var ulwrap = $("<ul class='x-tab-strip x-tab-strip-top'></ul>");
        var stripspacer = $("<div class='x-tab-strip-spacer'/>");
        var closeAll = $("<div class='x-tab-closeall' title='关闭所有' />");
        var litemp = [];
        for (var i = 0, l = dfop.items.length; i < l; i++) {
            var item = dfop.items[i];
            builditemlihtml(item, litemp);
        }
        litemp.push("<li class='x-tab-edge'/><div class='x-clear'></div>");

        ulwrap.html(litemp.join(""));
        litemp = null;
        stripwrap.append(ulwrap);
        if (dfop.autoscroll) {
            header.append(scrollerright).append(scrollerleft);
        }
        header.append(stripwrap).append(stripspacer);
        var bodyheight = dfop.height - headerheight; //高度修改这个地方
        var bodywrap = $("<div class='x-tab-panel-bwrap'/>");
        var body = $("<div class='x-tab-panel-body x-tab-panel-body-top'/>").css({ width: innerwidth });
        var bodytemp = [];
        for (var i = 0, l = dfop.items.length; i < l; i++) {
            var item = dfop.items[i];
            builditembodyhtml(item, bodytemp);
        }
        body.html(bodytemp.join("")).appendTo(bodywrap);
        me.append(header).append(bodywrap);
        initevents();
        function builditemlihtml(item, parray) {

            parray.push("<li id='tab_li_", item.id, "' title='", item.text, "' class='", item.isactive ? "x-tab-strip-active " : "", item.disabled ? "x-tab-strip-disabled" : "", item.closeable ? " x-tab-strip-closable" : "", item.classes ? " x-tab-with-icon" : "", "'>");
            parray.push("<a class='x-tab-strip-close' onclick='return false;'/>");
            parray.push("<a class='x-tab-right' onclick='return false;' href='#'>");
            parray.push("<em class='x-tab-left'><span class='x-tab-strip-inner'><span style='width:" + item.width + "px;' class='x-tab-strip-text ", item.classes || "", "'>", cutString(item.text, 18), "</span></span></em>");
            parray.push("</a></li>");
            if (dfop.closeAll & item.closeable) {
                me.append(closeAll);
                if (topClose) {//开始时判断
                    closeAll.css('top', '70px');
                } else {
                    closeAll.css('top', '6px');
                }
                dfop.closeAll = false; //如果closeAll为true则添加关闭全部按钮
            }
        }
        function builditembodyhtml(item, parray) {
            parray.push("<div class='x-panel x-panel-noborder", item.isactive ? "" : " x-hide-display", "' id='tab_item_", item.id, "' style='width:", innerwidth, "px'>");
            parray.push("<div class='x-panel-bwrap'>");
            parray.push("<div class='x-panel-body x-panel-body-noheader x-panel-body-noborder'  id='tab_item_content_", item.id, "' style='position:relative;  width:", innerwidth, "px; height:", bodyheight, "px; overflow: auto;'>");
            if (item.url) {
                parray.push("<iframe name='tab_item_frame_", item.id, "' width='100%' height='100%' h='0'  id='tab_item_frame_", item.id, "' src='about:blank' frameBorder='0' />");
                //               parray.push("<div id='tab_mask_", item.id, "' class=\"x-el-mask\"/>");
                //               parray.push("<div id='tab_loadingmsg_", item.id, "' class=\"x-el-mask-msg x-mask-loading\"><div>正在加载", item.text, "...</div></div>");
            }
            else if (item.cuscall) {
                parray.push("<div class='loadingicon'/>");
            }
            else {
                parray.push(item.content);
            }
            parray.push("</div></div></div>");
        }
        function initevents() {
            //reset scoller
            resetscoller(); //设置默认是否出现滚动掉
            scollerclick(); //滚动条的点击事件，如果存在的话
            closetabAll(); //关闭所有事件
            ulwrap.find("li:not(.x-tab-edge)").each(function(e) {
                inititemevents(this); //给每个选项卡 添加事件,
            });
        }
        function closetabAll() {
            closeAll.hover(function() {
                $(this).addClass('x-tab-closeallhover');
            }, function() {
                $(this).removeClass('x-tab-closeallhover');
            })
            closeAll.click(function() {
                for (var i = 0; i < dfop.items.length; i++) {
                    var item = dfop.items[i];
                    if ($("#tab_li_" + item.id).hasClass("x-tab-strip-closable")) {
                        deleteitembyliid("tab_li_" + item.id);
                        i--;
                    }
                }
            })
        }
        function inititemevents(liitem) {
            liswaphover.call(liitem); //选项卡的鼠标hover效果
            liclick.call(liitem); //选项卡的点击事件
            closeitemclick.call(liitem); // 点击关闭按钮的事件
        }
        function scollerclick() {
            if (dfop.autoscroll) {
                scrollerleft.click(function(e) { scolling("left") });
                scrollerright.click(function(e) { scolling("right") });
            }
        }
        function resetscoller() {
            if (dfop.autoscroll) {
                var edge = ulwrap.find("li.x-tab-edge");
                var eleft = edge.position().left;
                var sleft = stripwrap.prop("scrollLeft");
                if (sleft + eleft > header.width()) {
                    header.addClass("x-tab-scrolling");
                    scrollerleft.css("visibility", "visible");
                    scrollerright.css("visibility", "visible");
                    if (sleft > 0) {
                        scrollerleft.removeClass("x-tab-scroller-left-disabled");
                    }
                    else {
                        scrollerleft.addClass("x-tab-scroller-left-disabled");
                    }
                    if (eleft > header.width()) {

                        scrollerright.removeClass("x-tab-scroller-right-disabled");
                    }
                    else {
                        scrollerright.addClass("x-tab-scroller-right-disabled");
                    }
                    dfop.showscrollnow = true;

                }
                else {
                    header.removeClass("x-tab-scrolling");
                    stripwrap.animate({ "scrollLeft": 0 }, "fast");
                    scrollerleft.css("visibility", "hidden");
                    scrollerright.css("visibility", "hidden");
                    dfop.showscrollnow = false;
                }
            }
        }
        //
        function scolling(type, max) {
            //debugger;
            if (!dfop.autoscroll || !dfop.showscrollnow) {
                return;
            }
            //debugger;
            //var swidth = stripwrap.attr("scrollWidth");
            var sleft = stripwrap.prop("scrollLeft");
            var edge = ulwrap.find("li.x-tab-edge");
            var eleft = edge.position().left;
            if (type == "left") {
                if (scrollerleft.hasClass("x-tab-scroller-left-disabled")) {
                    return;
                }
                if (sleft - dfop.scrollwidth - 20 > 0) {
                    sleft -= dfop.scrollwidth;
                }
                else {
                    sleft = 0;
                    scrollerleft.addClass("x-tab-scroller-left-disabled");
                }
                if (scrollerright.hasClass("x-tab-scroller-right-disabled")) {
                    scrollerright.removeClass("x-tab-scroller-right-disabled");
                }
                stripwrap.animate({ "scrollLeft": sleft }, "fast");
            }
            else {
                if (scrollerright.hasClass("x-tab-scroller-right-disabled") && !max) {
                    return;
                }
                //left + ;
                if (max || (eleft > header.width() && eleft - dfop.scrollwidth - 20 <= header.width())) {
                    //debugger;
                    sleft = sleft + eleft - (header.width() - 38);
                    scrollerright.addClass("x-tab-scroller-right-disabled");
                    // sleft = eleft-innerwidth;
                }
                else {
                    sleft += dfop.scrollwidth;
                }
                if (sleft > 0) {
                    if (scrollerleft.hasClass("x-tab-scroller-left-disabled")) {
                        scrollerleft.removeClass("x-tab-scroller-left-disabled");
                    }
                }
                stripwrap.animate({ "scrollLeft": sleft }, "fast");
            }
        }
        function scollingToli(liitem) {
            var sleft = stripwrap.prop("scrollLeft");
            var lleft = liitem.position().left;
            var lwidth = liitem.outerWidth();
            var edge = ulwrap.find("li.x-tab-edge");
            var eleft = edge.position().left;
            if (lleft <= 0) {
                sleft += (lleft - 2);
                if (sleft < 0) {
                    sleft = 0;
                    scrollerleft.addClass("x-tab-scroller-left-disabled");
                }
                if (scrollerright.hasClass("x-tab-scroller-right-disabled")) {
                    scrollerright.removeClass("x-tab-scroller-right-disabled");
                }
                stripwrap.animate({ "scrollLeft": sleft }, "fast");
            }
            else {
                if (lleft + lwidth > header.width() - 40) {
                    sleft = sleft + lleft + lwidth + -header.width() + 40; // 40 =scrollerleft and scrollerrightwidth;
                    if (scrollerleft.hasClass("x-tab-scroller-left-disabled")) {
                        scrollerleft.removeClass("x-tab-scroller-left-disabled");
                    }
                    //滚到最后一个了，那么就要禁用right;
                    if (eleft - (lleft + lwidth + -header.width() + 40) <= header.width()) {
                        scrollerright.addClass("x-tab-scroller-right-disabled");
                    }
                    stripwrap.animate({ "scrollLeft": sleft }, "fast");

                }
            }
            liitem.click();

        }
        function liswaphover() {
            $(this).hover(function(e) {
                if (!$(this).hasClass("x-tab-strip-disabled")) {
                    $(this).addClass("x-tab-strip-over");
                }
            }, function(e) {
                if (!$(this).hasClass("x-tab-strip-disabled")) {
                    $(this).removeClass("x-tab-strip-over");
                }
            });
        }
        function closeitemclick() {
            if ($(this).hasClass("x-tab-strip-closable")) {
                $(this).find("a.x-tab-strip-close").click(function() {
                    deleteitembyliid($(this).parent().attr("id"));
                });
            }
        }
        function liclick() {
            $(this).click(function(e) {
                var itemid = this.id.substr(7);
                var curr = getactiveitem();
                var clickitem = getitembyid(itemid);
                frm = document.getElementById("tab_item_frame_" + clickitem.id);

                if (curr != null && itemid == curr.id) {
                    if (flag) { frm.src = clickitem.url; flag = false; } //add flush by liww at 2013-03-26
                    return;
                }

                if (clickitem && clickitem.disabled) {
                    return;
                }
                if (curr) {
                    $("#tab_li_" + curr.id).removeClass("x-tab-strip-active");
                    $("#tab_item_" + curr.id).addClass("x-hide-display");
                    curr.isactive = false;
                }
                if (clickitem) {

                    $(this).addClass("x-tab-strip-active");
                    $("#tab_item_" + clickitem.id).removeClass("x-hide-display");
                    if (clickitem.url) {
                        var cururl = frm.src;
                        var oldFlag=flag;
                        if (flag) { frm.src = clickitem.url; flag = false; } //add flush by liww at 2013-03-26
                        if (cururl == "about:blank"&&!oldFlag) {//Modify by huah 2014-7-15 添加 !oldFlag 条件，防止第一次加载tab页时向服务器请求两次
                            /**/
                            frm.src = clickitem.url;
                            //                            if ($.browser.msie) {
                            //                                frm.onreadystatechange = function() {
                            //                                    if (frm.readyState == "complete") {
                            //                                        $("#tab_mask_" + clickitem.id).remove();
                            //                                        $("#tab_loadingmsg_" + clickitem.id).remove();
                            //                                        frm.onreadystatechange = null;
                            //                                    }
                            //                                };
                            //                            } else {
                            //                                frm.onload = function() {
                            //                                    $("#tab_mask_" + clickitem.id).remove();
                            //                                    $("#tab_loadingmsg_" + clickitem.id).remove();
                            //                                    frm.onload = null;
                            //                                };
                            //                            }

                            //                            var parent = $(frm).parent();
                            //                            var loadingpanel = $("#tab_loadingmsg_" + clickitem.id);
                            //                            var pos = { left: parent.width() / 2 - loadingpanel.outerWidth() / 2, top: parent.height() / 2 - loadingpanel.outerHeight() / 2 };
                            //                            loadingpanel.css(pos);
                        }
                    }
                    else if (clickitem.cuscall && !clickitem.cuscalled) {
                        var panel = $("#tab_item_content_" + clickitem.id);
                        var ret = clickitem.cuscall(this, clickitem, panel);
                        clickitem.cuscalled = true;
                        if (ret) //如果存在返回值，且不为空
                        {
                            clickitem.content = ret;
                            panel.html(ret);
                        }
                    }
                    clickitem.isactive = true;
                    if (clickitem.onactive) {
                        clickitem.onactive.call(this, clickitem);
                    }

                    $(".main_l").height($("#tab_item_frame_" + clickitem.id).height() + 6);
                }
            });
        }
        //获取当前活跃项
        function getactiveitem() {
            for (var i = 0, j = dfop.items.length; i < j; i++) {
                if (dfop.items[i].isactive) {
                    return dfop.items[i];
                    break;
                }
            }
            return null;
        }
        //根据ID获取Item数据
        function getitembyid(id) {
            for (var i = 0, j = dfop.items.length; i < j; i++) {
                if (dfop.items[i].id == id) {
                    return dfop.items[i];
                    break;
                }
            }
            return null;
        }
        function getIndexbyId(id) {
            for (var i = 0, j = dfop.items.length; i < j; i++) {
                if (dfop.items[i].id == id) {
                    return i;
                    break;
                }
            }
            return -1;
        }
        //添加项
        function addtabitem(item) {
            var chkitem = getitembyid(item.id);
            if (dfop.items.length == dfop.max) {
                alert('页签已达到最大数量，请关闭不常用的页签！');
            } else {
                if (!chkitem) {
                    var isactive = item.isactive;
                    var lastitem = dfop.items[dfop.items.length - 1];
                    dfop.items.push(item);
                    var lastli = $("#tab_li_" + lastitem.id);
                    var lastdiv = $("#tab_item_" + lastitem.id);
                    var litemp = [];
                    var bodytemp = [];
                    builditemlihtml(item, litemp);
                    builditembodyhtml(item, bodytemp);
                    var liitem = $(litemp.join(""));
                    var bodyitem = $(bodytemp.join(""));
                    lastli.after(liitem);
                    lastdiv.after(bodyitem);
                    //事件
                    var li = $("#tab_li_" + item.id);
                    inititemevents(li);
                    if (isactive) {
                        li.click();
                    }
                    resetscoller();
                    scolling("right", true);
                }
                else {
                    alert("指定的页签已存在!");
                }
            }
        }
        function initleft(item) {
            //by liww at 2013-03-26
            $('#' + item.id).click(function() {
                var clickitem = getitembyid(item.id);
                frm = document.getElementById("tab_item_frame_" + clickitem.id);
                frm.src = clickitem.url;
                //                if ($.browser.msie) {
                //                    frm.onreadystatechange = function() {
                //                        if (frm.readyState == "complete") {
                //                            $("#tab_mask_" + clickitem.id).remove();
                //                            $("#tab_loadingmsg_" + clickitem.id).remove();
                //                            frm.onreadystatechange = null;
                //                        }
                //                    };
                //                } else {
                //                    frm.onload = function() {
                //                        $("#tab_mask_" + clickitem.id).remove();
                //                        $("#tab_loadingmsg_" + clickitem.id).remove();
                //                        frm.onload = null;
                //                    };
                //                }
            })

        }


        function openitemOrAdd(item, allowAdd) {
            var checkitem = getitembyid(item.id);
            if (!checkitem && allowAdd) {
                addtabitem(item);
            }
            else {
                var li = $("#tab_li_" + item.id);
                scollingToli(li);
            }
        }
        //移除一个tab 项
        function deleteitembyliid(liid) {
            var id = liid.substr(7);
            $("#" + liid).remove();
            $("#tab_item_" + id).remove();
            var index = getIndexbyId(id);
            if (index >= 0) {
                var nextcur;
                if (index < dfop.items.length - 1) {
                    nextcur = dfop.items[index + 1];
                }
                else if (index > 0) {
                    nextcur = dfop.items[index - 1];
                }
                if (nextcur) {
                    $("#tab_li_" + nextcur.id).click();
                }
                dfop.items.splice(index, 1);
                resetscoller();
                scolling("right", true);
            }

        }
        function resize(width, height) {
            if (width) { dfop.width = width };
            if (height) { dfop.height = height; }
            innerwidth = width;
            bodyheight = dfop.height - headerheight;
            me.css("width", dfop.width);
            if (closeAll) {
                header.css("width", innerwidth - 20);
            } else {
                header.css("width", innerwidth);
            }

            body.css({ width: innerwidth, height: bodyheight });
            for (var i = 0, j = dfop.items.length; i < j; i++) {
                var item = dfop.items[i];
                $("#tab_item_" + item.id).css({ width: innerwidth });
                $("#tab_item_content_" + item.id).css({ width: innerwidth, height: bodyheight });
            }
            resetscoller();
        }
        //设置选项卡项是否disabled
        function setdisabletabitem(itemId, disabled) {
            var chitem = getitembyid(itemId);
            if (!chitem || chitem.disabled == disabled) {
                return;
            }
            if (disabled) {
                chitem.disabled = true;
                $("#tab_item_" + item.id).addClass("x-tab-strip-disabled");
            }
            else {
                chitem.disabled = false;
                $("#tab_item_" + item.id).removeClass("x-tab-strip-disabled");
            }
        }
        me[0].tab = {
            addtabitem: addtabitem,
            opentabitem: openitemOrAdd,
            resize: resize,
            setdisabletabitem: setdisabletabitem,
            deleteitembyliid: deleteitembyliid
        };

        /**  
        * 根据长度截取先使用字符串，超长部分追加...  
        * @param str 对象字符串  
        * @param len 目标字节长度  
        * @return 处理结果字符串  
        */

        function cutString(str, len) {

            //length属性读出来的汉字长度为1  
            if (str.length * 2 <= len) {
                return str;
            }
            var strlen = 0;
            var s = "";

            for (var i = 0; i < str.length; i++) {
                s = s + str.charAt(i);
                if (str.charCodeAt(i) > 128) {
                    strlen = strlen + 2;
                    if (strlen >= len) {
                        return s.substring(0, s.length - 1) + "...";
                    }
                } else {
                    strlen = strlen + 1;
                    if (strlen >= len) {
                        return s.substring(0, s.length - 2) + "...";
                    }
                }
            }

            return s;
        }
    };
    $.fn.addtabitem = function(item) {
        if (this[0].tab) {
            return this[0].tab.addtabitem(item);
        }
        return false;
    }
    $.fn.opentabitem = function(item, orAdd) {
        if (this[0].tab) {
            return this[0].tab.opentabitem(item, orAdd);
        }
        return false;
    }
    $.fn.resizetabpanel = function(w, h) {
        if (this[0].tab) {
            return this[0].tab.resize(w, h);
        }
        return false;
    }
    $.fn.setdisabletabitem = function(itemId, disabled) {
        if (this[0].tab) {
            return this[0].tab.setdisabletabitem(itemId, disabled);
        }
        return false;
    }
    $.fn.deleteitembyliid = function(itemID) {
        if (this[0].tab) {
            return this[0].tab.deleteitembyliid("tab_li_" + itemID);
        }
        return false;
    }
})(jQuery)