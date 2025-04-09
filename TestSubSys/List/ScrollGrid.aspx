<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ScrollGrid.aspx.cs" Inherits="Zhongsoft.Portal.TestSubSys.List.ScrollGrid" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .bgas
        {
            background-image: url(../../Themes/Images/btn_f_send.gif);
        }
        
        
        
        .contentgrid_item
        {
            height: 40px;
            border-bottom: 1px solid #EEE;
            cursor: pointer;
        }
        
        .contentgrid_header
        {
            height: 40px;
            width: 100%;
            border-bottom: 1px solid #DCDCDC;
            border-bottom-width: 1px;
            border-bottom-style: solid;
            border-bottom-color: #DCDCDC;
            z-index: 22;
        }
        
        .contentgrid_content
        {
            width: 100%;
            overflow-y: auto;
            overflow-x: hidden;
        }
        
        .contentgrid
        {
            z-index: 40;
            border-width: 1px;
            border-style: solid;
            border-color: #D9D9D9;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="templateTabs" style="display: none">
        <ul>
            <li index="0"><a href='#base' style="text-align: center">
                <img src="../../Themes/Images/btn_f_send.gif" />
                <br />
                人员</a></li>
            <li index="1"><a href='#list' title="111111" style="text-align: center">
                <img src="../../Themes/Images/btn_f_send.gif" /><br />
                人员</a></li>
            <li index="2"><a href='#sort' style="text-align: center">
                <img src="../../Themes/Images/btn_f_send.gif" /><br />
                人员</a></li>
        </ul>
        <div id="base">
            1
        </div>
        <div id="list">
            2
        </div>
        <div id="sort">
            3
        </div>
    </div>
    <script>
        $("#templateTabs").tabs();
    </script>
    <table>
        <tr>
            <td>
                <%--        <zhongsoft:ContentGrid runat="server" ID="contentGrid1" Width="400" Height="300" CssClass="contentgrid"
                    GetHtmlMethod="GetJson"  />--%>
            </td>
            <td>
                <zhongsoft:ContentGrid runat="server" ID="contentGrid" Width="500" ContentHeight="400"
                    CssClass="contentgrid" CallBack="adsa" ShowHeader="true" BindMethod="GetToDoList"
                    PageSize="20" />
            </td>
        </tr>
    </table>
    <script type="text/javascript">
       


        function adsa(josn) {
            alert(josn.AllCount);
        }


        $("#divid").scroll(function () {
            $("<div>13213213123</div><div>13213213123</div><div>13213213123</div>").prependTo($(this));
            $("1111").appendTo($(this));

        });

        //        (function ($) {
        //            $.fn.extend(
        //            {
        //                toScrollGrid: function (options) {
        //                    var setting = $.extend({}, options);
        //                    var maxCount = setting.PageSize * 5; //页面html数据条数设为pagesize的5倍
        //                    var id = $(this).attr("id");
        //                    var $header = $("#" + id + "_divHeader");
        //                    var $divContent = $("#" + id + "_divContent");
        //                    var $divIn = $("#" + id + "_divIn");
        //                    var topv = $divIn.offset().top;
        //                    var flag = 0;
        //                    var minIndex = 1;
        //                    var maxIndex = maxCount;
        //                    var allCount = 0;
        //                    var rowHeight = 40;
        //                    if (maxIndex > 0) {
        //                        rowHeight = $divIn.height() / maxIndex;
        //                    }
        //                    var loadingHeight = setting.LoadingHeight;
        //                    var loadingClass = "contentdivloading";

        //                    getHtml(0, minIndex, maxIndex); //第一次加载数据

        //                    //type=0 第一次加载， type=1 上翻 type=2 下翻
        //                    function getHtml(type, start, end) {
        //                        if (type == 0) {
        //                            addLoading(0);
        //                        }
        //                        else if (type == 1) {
        //                            addLoading($divContent.height() - loadingHeight);
        //                        }
        //                        else if (type == 2) {
        //                            addLoading(0);
        //                        }
        //                        if (flag == 1) { $("." + loadingClass).remove(); return; }
        //                        flag = 1;
        //                        $.ajax({
        //                            type: 'POST',
        //                            url: setting.Url,
        //                            data: { "asyfunc": setting.Method, startIndex: start, endIndex: end, otherParams: setting.OtherParam },
        //                            async: true,
        //                            dataType: "json",
        //                            success: function (json) {
        //                                allCount = json.AllCount;
        //                                var html = json.ContentHtml;
        //                                var header = json.HeaderHtml;
        //                                $header.html(header);
        //                                if (type == 0) {
        //                                    $(html).appendTo($divIn);
        //                                    minIndex = 1;
        //                                    maxIndex = $divIn.children("div").length;
        //                                    rowHeight = $divIn.height() / $divIn.children("div").length;
        //                                    $("." + loadingClass).remove();
        //                                    topv = $divIn.offset().top;
        //                                    flag = 0;
        //                                    return;
        //                                }
        //                                var oldlength = $divIn.children("div").length;
        //                                var $last = $divIn.children("div:last");
        //                                var $first = $divIn.children("div:first");
        //                                if (type == 1) {
        //                                    $(html).appendTo($divIn);
        //                                }
        //                                else if (type == 2) {
        //                                    $(html).prependTo($divIn);
        //                                }
        //                                var newlength = $divIn.children("div").length;
        //                                if (type == 1) {
        //                                    //修改html中div的最小索引、和最大索引
        //                                    maxIndex = maxIndex + (newlength - oldlength);
        //                                    //删除超出最大数量的div
        //                                    if (newlength > maxCount) {
        //                                        minIndex = minIndex + (newlength - maxCount);
        //                                        var num = newlength - maxCount;
        //                                        $divIn.children("div:lt(" + num + ")").remove();
        //                                    }

        //                                    rowHeight = $divIn.height() / $divIn.children("div").length;
        //                                    if (newlength > maxCount && (newlength - oldlength) > 0) {
        //                                        //控制滚轮滚到新加载的第一条数据处
        //                                        flag = 1;
        //                                        $divContent.scrollTop($last.offset().top - $divIn.offset().top - rowHeight);
        //                                    }
        //                                }
        //                                else if (type == 2) {
        //                                    //修改html中div的最小索引、和最大索引
        //                                    minIndex = minIndex - (newlength - oldlength);
        //                                    //删除超出最大数量的div
        //                                    if (newlength > maxCount) {
        //                                        maxIndex = maxIndex - (newlength - maxCount);
        //                                        $divIn.children("div:gt(" + (maxCount - 1) + ")").remove();
        //                                    }
        //                                    rowHeight = $divIn.height() / $divIn.children("div").length;
        //                                    if ((newlength - oldlength) > 0) {
        //                                        //控制滚轮滚到新加载的第一条数据处
        //                                        var scrollHeight = (newlength - oldlength) * rowHeight >= $divContent.height() ? $divContent.height() : (newlength - oldlength) * rowHeight;
        //                                        flag = 1;
        //                                        $divContent.scrollTop($first.offset().top - $divIn.offset().top - scrollHeight + rowHeight);
        //                                    }
        //                                }
        //                                $("." + loadingClass).remove();
        //                                topv = $divIn.offset().top;
        //                                flag = 0;
        //                            },
        //                            error: function (err) {
        //                                $("." + loadingClass).remove();
        //                                topv = $divIn.offset().top;
        //                                alert("数据提取出现错误。");
        //                            }
        //                        });
        //                    }

        //                    function addLoading(h) {
        //                        var target = $divContent;
        //                        var divMask = $("<div class='" + loadingClass + "'></div>");
        //                        var msgDivHeight = loadingHeight;
        //                        var msgDivWidth = target.width() - 18;
        //                        var msgDivLeft = 0;
        //                        var msgDivTop = 0;
        //                        divMask.css({
        //                            position: 'absolute',
        //                            top: target.offset().top + h,
        //                            left: target.offset().left - 2,
        //                            'z-index': 99,
        //                            width: msgDivWidth,
        //                            height: msgDivHeight
        //                        }).append($('<div style="position:absolute; border:none;width:' + msgDivWidth
        //            + 'px;height:' + msgDivHeight + 'px; padding:2px;top:' + msgDivTop +
        //            'px;left:' + msgDivLeft +
        //            'px"><div  style="line-height:' + (loadingHeight - 6) + 'px;font-weight:bold;background:white;padding:2px 10px 2px 10px;opacity:1;text-align:center; vertical-align:middle">'
        //            + ' <img src="' + $appCtx.appPath + '/themes/Images/loading.gif" alt="数据加载中" /></span><strong>数据加载中...' + '</strong></div></div>')); ;
        //                        target.append(divMask);
        //                    };

        //                    $divContent.scroll(function () {
        //                        if (flag == 1) { topv = $divIn.offset().top; return; }
        //                        if (topv > $divIn.offset().top) {
        //                            topv = $divIn.offset().top;
        //                            if (($divIn.offset().top + $divIn.height()) < ($divContent.offset().top + $divContent.height() + rowHeight)) {
        //                                if (maxIndex < allCount) {
        //                                    var start = maxIndex + 1;
        //                                    var end = maxIndex + setting.PageSize;
        //                                    getHtml(1, start, end > allCount ? allCount : end);
        //                                }
        //                                else {

        //                                }
        //                            }
        //                        } else if (topv < $divIn.offset().top) {
        //                            topv = $divIn.offset().top;
        //                            if ($divIn.offset().top > ($divContent.offset().top - rowHeight)) {
        //                                if (minIndex > 1) {
        //                                    var start = minIndex - setting.PageSize;
        //                                    var end = minIndex - 1;
        //                                    getHtml(2, start < 1 ? 1 : start, end);
        //                                }
        //                                else {

        //                                }
        //                            }
        //                        }

        //                    });
        //                }
        //            })

        //        })(jQuery);

        //        $('#contentGrid').toScrollGrid({ PageSize: 10, Url: 'http://localhost:8085/Portal/TestSubSys/List/ScrollGrid.aspx?secid=AD9D6032-FB21-434D-90C1-C465C5D72F7C', Method: 'GetJson', AllCount: 94, OtherParam: '{"id":"32213","dasda":"asfmdsk\u0027f\u0027s"}' });
    </script>
    </form>
</body>
</html>
