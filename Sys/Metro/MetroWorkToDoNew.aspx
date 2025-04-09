<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MetroWorkToDoNew.aspx.cs"
    Inherits="Zhongsoft.Portal.Sys.Metro.MetroWorkToDoNew" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title></title>
    <link rel="stylesheet" type="text/css" href="../../themes/styles/common.css" />
    <script type="text/javascript" src="../../UI/script/modernizr.custom.js"></script>
    <style>
        body
        {
            line-height: 1.666;
            font-size: 12px;
            font-family: Verdana, "Microsoft Yahei" , "微软雅黑" , "宋体" ,Helvetica,sans-serif;
            color: #3e3d3d !important;
        }
        html, body, div, span, img, b, input, form, a
        {
            padding: 0;
            margin: 0;
            border: none;
        }
        
        .contentgrid
        {
            top: 0px;
            width: 99%;
            height: 100%;
            overflow: hidden;
            border-top: 1px solid #dcdcdc;
            zoom: 1;
        }
        .contentgrid_header
        {
            left: 0;
            top: 0;
            width: 100%;
            height: 40px;
            overflow: hidden;
            zoom: 1;
            position: absolute;
            border-bottom: 1px solid #dcdcdc;
            z-index: 22;
        }
        .header_title
        {
            position: relative;
            overflow: hidden;
            padding: 5px 0px 0px 0px; /*padding-right:30px;1223*/
            white-space: nowrap;
            text-overflow: clip;
            font-size: 0;
            float: left;
        }
        .title1
        {
            overflow: hidden;
            white-space: nowrap;
            zoom: 1;
            font-size: 14px; /* padding-top:3px;*/
            display: block; /*line-height:30px;*/
            vertical-align: top;
            cursor: pointer;
            max-width: 160px;
            margin-right: 5px;
            margin-top: 4px;
        }
        .title2
        {
            position: relative;
            font-size: 11px;
            display: inline-block;
            line-height: 20px;
            padding: 9px 6px 5px 2px;
            vertical-align: top;
        }
        .contentgrid_content
        {
            left: 0px;
            bottom: 3px;
            z-index: 22;
            width: 100%;
            overflow: hidden;
            zoom: 1;
        }
        .scroll_auto
        {
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
            position: absolute;
            overflow-x: hidden;
            overflow-y: auto;
            zoom: 1;
        }
        .unread, .hasread_send
        {
            height: 54px;
            border-bottom: 1px solid #bbb /*bbb*/;
            overflow: hidden;
            position: relative;
        }
        .unread
        {
            font-weight: bold; /* color: #fffffd;*/
        }
        .hasread_send
        {
            font-weight: normal; /* color: #f6f2ef;*/
        }
        .item_a
        {
            height: 54px;
            padding: 0px 10px 0px 10px;
            display: block;
            cursor: pointer;
            overflow: hidden;
            position: relative;
        }
        .item_a:hover
        {
            background: #ede7e7;
            color: #837f7f;
        }
        .item_time
        {
            /*color:#fffffd;*/
            top: 6px;
            right: 10px;
            text-align: right;
            line-height: 16px;
            overflow: hidden;
            padding-left: 46px;
            display: block;
            position: absolute;
            z-index: 20;
            zoom: 1;
            font-weight: normal;
        }
        .item_content
        {
            overflow: hidden;
            position: relative;
            padding: 0 70px 2px 0;
            display: block;
        }
        .item_content_title1
        {
            cursor: pointer;
            overflow: hidden;
            position: relative;
            height: 26px;
            display: block;
            max-width: 360px;/*160px改为360;*/
        }
        .item_content_title1_inner
        {
            /* color:#3e3d3d;*/
            white-space: nowrap;
            zoom: 1;
            left: 25px;
            width: 100%;
            overflow: hidden;
            position: absolute;
            top: 8px;
            line-height: 18px;
            display: block;
        }
        .item_content_title2
        {
            font-size: 14px;
            overflow: hidden;
            position: relative;
            height: 20px;
            display: block;
        }
        .item_content_title2_inner
        {
            /*color:#3e3d3d;*/
            white-space: nowrap;
            zoom: 1;
            left: 25px;
            width: 100%;
            overflow: hidden;
            position: absolute;
            top: 0px;
            line-height: 20px;
            display: block;
            text-overflow: ellipsis;
        }
        .ico
        {
            cursor: pointer;
            position: absolute;
            text-align: center;
            line-height: 0;
            overflow: hidden;
            font-size: 0;
            display: inline-block;
            zoom: 1;
            background: url(../../themes/images/newjian.png) no-repeat;
            opacity: 0.9;
            left: 2px;
            top: 5px;
            width: 14px;
            height: 14px;
        }
        .ico_send
        {
            cursor: pointer;
            position: absolute;
            text-align: center;
            line-height: 0;
            overflow: hidden;
            font-size: 0;
            display: inline-block;
            zoom: 1;
            background: url(../../themes/images/flow_l.png) no-repeat;
            opacity: 0.9;
            left: 0px;
            top: 5px;
            width: 19px;
            height: 14px;
        }
        .search
        {
            /* right:10px; top:5px; position:absolute; z-index:2;*/
            padding-left: 10px;
        }
        .search span
        {
            display: inline;
        }
        input.inputTxt
        {
            /*width: 145px;1024时是120px 1223*/
            height: 26px;
            color: #999;
            line-height: 20px;
            padding: 0 0 0 1px;
            margin-top: 7px;
            margin-right: 0px;
            margin-bottom: 0px; /*1024时是margin-left:0px 1223*/
            float: left;
            display: inline;
            outline-style: none;
        }
        input.m_btn
        {
            width: 30px;
            height: 26px;
            text-indent: -99999px;
            padding: 0 10px 0 0;
            margin: 7px 0 0 0;
            float: left;
            cursor: pointer;
            background: url(../../themes/images/search1.png) no-repeat center;
        }
        .paixu
        {
            float: right;
            margin: 0px;
            margin-right: 3px;
            cursor: pointer;
        }
        .loading
        {
            text-align: center;
            color: #303030;
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
            border-bottom-left-radius: 5px;
            border-bottom-right-radius: 5px;
            background: #c1c39a;
        }
        b.new
        {
            color: #ee1111 /*f03b32*/;
            font-size: 5px; /*box-shadow:0px 0px 2px #fff;*/
        }
        *
        {
            scrollbar-face-color: #736056; /*面子*/
            scrollbar-arrow-color: #C0C0C0; /*箭头*/
            scrollbar-3dlight-color: #8c7364 /*C0C0C0*/; /*最外左*/
            scrollbar-highlight-color: #99765f; /*滑倒边框左二*/
            scrollbar-shadow-color: #99765f; /*滑倒边框右二*/
            scrollbar-darkshadow-color: #8c7364 /*C0C0C0*/; /*右一*/
            scrollbar-track-color: #8c7364 /*F3F3F38/; /*滑道*/;
        }
        /*滚动条整体*/
        ::-webkit-scrollbar
        {
            width: 10px; /*滚动条宽度*/
        }
        /*滚动条按钮*/
        ::-webkit-scrollbar-button
        {
        }
        ::-webkit-scrollbar-track
        {
            background-color: #8b7d7d /*F3F3F3*/; /*滑道全部*/
        }
        ::-webkit-scrollbar-track-piece
        {
            background-color: #8b7d7d /*F3F3F3*/; /*滑道*/
            -webkit-border-radius: 5px; /*滑道圆角宽度*/
        }
        ::-webkit-scrollbar-thumb
        {
            background-color: #ede7e7 /*F3F3F3*/; /*滑动条表面*/
            border: solid 1px #999; /*滑动条边框*/
            border-radius: 5px; /*滑动条圆角宽度*/
        }
        /*横竖滚动条交角*/
        ::-webkit-scrollbar-corner
        {
            background-color: #fcfcfc /*F3F3F3*/;
        }
        /*横竖滚动条交角图案*/
        ::-webkit-resizer
        {
            /*background-image:url(themes/images/open.gif);*/
            background-repeat: no-repeat;
            background-position: bottom right;
        }
        /*鼠标滑过滑动条*/
        ::-webkit-scrollbar-thumb:hover
        {
            background-color: #5a4e4e;
            cursor: pointer;
        }
    </style>

<style type="text/css">
<!--
#tags {padding-right:10px; padding-left:0px; padding-bottom:0px; margin: 0px 0px 0px 0px;  padding-top:0px; height: 36px; }
#tags li { display:block; position:relative; float:left; margin-bottom:-1px;  list-style-type:none; height: 36px; }
#tags li a {/*padding-right: 10px;*/ padding-left: 4px;  float:left; color: #fff/*c6ebfb*/;/* line-height:30px;*/height: 36px; -webkit-transition: color 0.2s;transition: color 0.2s; } 
#tags li.selectTag {  position: relative; height: 32px;border-bottom:3px solid #fffffd; /*margin-left:-3px;background:#dcdcdc; border-top-left-radius:10px;border-top-right-radius:10px;border-bottom-left-radius:0;border-bottom-right-radius:0; border-top:1px solid #dcdcdc; border-right:1px solid #dcdcdc;border-left:1px solid #dcdcdc;border-bottom:1px solid transparent;*/-webkit-transition: color 0.2s;	transition: color 0.2s; }
#tags li.selectTag A { color:#333/*fffffd*/;-webkit-transition: color 0.2s;	transition: color 0.2s;}
#tags li.selectTag A .title1{ padding-bottom:5px; /*padding-left:6px; margin-left:5px;*/-webkit-transition: color 0.2s;	transition: color 0.2s;}
.tagContent { display: none;  width:100%; clear:both; }
#tagContent div.selectTag {display: block;}
-->
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="con">
        <script type="text/javascript">
            function selectTag(showContent, selfObj) {
                // 操作标签
                var tag = document.getElementById("tags").getElementsByTagName("li");
                var taglength = tag.length;
                for (i = 0; i < taglength; i++) {
                    tag[i].className = "";
                }
                selfObj.parentNode.className = "selectTag";
                // 操作内容
                for (i = 0; j = document.getElementById("tagContent" + i); i++) {
                    j.style.display = "none";
                }
                document.getElementById(showContent).style.display = "block";
            }

            $("#atodolist").live("dblclick", function () {
                searchTodoList();
                $("#todonew").html("");
            })

        </script>
        <script type="text/javascript">

            function getTodoNum(json) {
                $("#todoNum").html(json.AllCount);
            }

            function getYSTodoNum(json) {
                $("#todoysNum").html(json.AllCount);
            }

            function getOldTodoNum(json) {
                $("#todoOldNum").html(json.AllCount);
            }

            function getPYSTodoNum(json) {
                $("#todopysNum").html(json.AllCount);
            }

            function searchTodoList() {
                $("#<%=toDoList.ClientID %>").toContentGrid(
                     { OtherParam:
                     '{"UserId":"' + "<%=KPMSUser.UserId %>"
                      + '","KeyWord":"' + $("#todoKey").val()
                      + '","Sort":"' + $("#<%=hiSort.ClientID %>").val()
                      + '","Timestamp":"' + $("#<%=hiTimestamp.ClientID %>").val() + '"}'
                     });
            }

            function sortToDoList(sort, self) {
                $("#<%=hiSort.ClientID %>").val(sort);
                searchTodoList();
                var src = $(self).find("img").attr("src");
                if (src == '../../themes/images/desc.png') {
                    $(self).find("img").attr("src", "../../themes/images/asc.png");
                }
                else {
                    $(self).find("img").attr("src", "../../themes/images/desc.png");
                }
            }

            function interval() {
                $.ajax({
                    type: 'POST',
                    url: "MetroWorkToDoNew.aspx",
                    data: { "asyfunc": "Interval", UserId: "<%=KPMSUser.Id %>", Timestamp: $("#<%=hiTimestamp.ClientID %>").val() },
                    async: true,
                    dataType: "json",
                    success: function (json) {
                        if (json.ToDoNew > 0) {
                            $("#todonew").html("●");
                        }
                    }
                })
            }
            setInterval(interval, 6000 * 5);

           
            
        </script>
        <script type="text/javascript">


            $(function () {
                var screenHeight = window.screen.height; //更改方式window.screen.height
                if (screenHeight < 768) {
                    $('#<%=toDoList.ClientID %>_divContent').height('400px');
                    $('#<%=oldToDoList.ClientID %>_divContent').height('400px');
                }
                else if (screenHeight < 1000) {
                    if (navigator.userAgent.indexOf("MSIE 7.0") > 0) {

                        //ie 7特殊处理，部分电脑IE8设置成兼容模式后，实质是IE7  
                        $('#<%=toDoList.ClientID %>_divContent').height((screenHeight - 380) + 'px');
                        $('#<%=oldToDoList.ClientID %>_divContent').height((screenHeight - 380) + 'px');
                    }

                    else if (navigator.userAgent.indexOf("MSIE 8.0") > 0) {

                        //ie 8特殊处理，$(window).height()取值不正确;需要用屏幕高度计算  
                        $('#<%=toDoList.ClientID %>_divContent').height((screenHeight - 380) + 'px');
                        $('#<%=oldToDoList.ClientID %>_divContent').height((screenHeight - 380) + 'px');
                    }
                    else {
                        //由-100改为-90
                        $('#<%=toDoList.ClientID %>_divContent').height(($(window).height() - 90) + 'px');
                        $('#<%=oldToDoList.ClientID %>_divContent').height(($(window).height() - 90) + 'px');
                    }
                }
                else { //大屏幕1920
                    if (navigator.userAgent.indexOf("MSIE 7.0") > 0) {

                        //ie 7特殊处理，部分电脑IE8设置成兼容模式后，实质是IE7  
                        $('#<%=toDoList.ClientID %>_divContent').height((screenHeight - 430) + 'px');
                        $('#<%=oldToDoList.ClientID %>_divContent').height((screenHeight - 430) + 'px');
                    }
                    else if (navigator.userAgent.indexOf("MSIE 8.0") > 0) {
                        //ie 8特殊处理，$(window).height()取值不正确;需要用屏幕高度计算  原来-380px,大屏幕1920需-430px
                        $('#<%=toDoList.ClientID %>_divContent').height((screenHeight - 430) + 'px');
                        $('#<%=oldToDoList.ClientID %>_divContent').height((screenHeight - 430) + 'px');
                    }
                    else {
                        //由-100改为-90
                        $('#<%=toDoList.ClientID %>_divContent').height(($(window).height() - 90) + 'px');
                        $('#<%=oldToDoList.ClientID %>_divContent').height(($(window).height() - 90) + 'px');
                    }
                }
            })
        </script>
        <div>
            <div class="header_title">
                <ul id="tags">
                    <li class="selectTag"><a id="atodolist" onclick="selectTag('tagContent0',this)"><span
                        class="title1"><b id="todonew" class="new"></b>待办流程(<label id="todoNum">0</label>)</span></a></li>
                    <%--<li><a onclick="selectTag('tagContent2',this)"><span class="title1">通知/提醒&nbsp;(0)</span></a>
                    </li>--%>
                    <li><a id="atodolistold" onclick="selectTag('tagContent1',this)"><span class="title1">
                        <b id="todoold" class="new"></b>旧平台(<label id="todoOldNum">0</label>)</span></a></li>
                    <li><a id="atodolistys" onclick="selectTag('tagContent2',this)"><span class="title1">
                        <b id="todoys" class="new"></b>预算待办(<label id="todoysNum">0</label>)</span></a></li>
                    <li><a id="atodolistpys" onclick="selectTag('tagContent3',this)"><span class="title1">
                        <b id="todopys" class="new"></b>项目预算(<label id="todopysNum">0</label>)</span></a></li>
                </ul>
            </div>
            <div class="search">
                <span>
                    <input id="todoKey" class="inputTxt" type="text" />
                </span>
                <input class="m_btn" type="button" title="搜索" onclick="return searchTodoList();" content="searchResult" />
            </div>
            <input runat="server" id="hiTimestamp" type="hidden" />
        </div>
        <div class="paixu" id="MT_nav">
            <input type="hidden" runat="server" id="hiSort" />
            <nav>
              <ul>
                  <li class="MT-item" >
                      <a style=" margin: 7px 0px 0px 35px;"><img src="../../themes/images/sort.png" width="29" height="26" /></a>	
                      <div>
                        <span class="MT-arrow"></span>
                        <a onclick="sortToDoList('user',this)">&nbsp;<img src="../../themes/images/desc.png" width="9" height="11" />&nbsp;发送人</a>
                        <a onclick="sortToDoList('formtype',this)">&nbsp;<img src="../../themes/images/desc.png" width="9" height="11" />&nbsp;表单类型</a>
                        <a onclick="sortToDoList('org',this)">&nbsp;<img src="../../themes/images/asc.png" width="9" height="11" />&nbsp;发送部门</a>
                        <a onclick="sortToDoList('important',this)">&nbsp;<img src="../../themes/images/asc.png" width="9" height="11" />&nbsp;重要程度</a>
                        <a onclick="sortToDoList('attention',this)"class="MT-list-last">&nbsp;<img src="../../themes/images/asc.png" width="9" height="11" />&nbsp;关注情况</a>
                       </div>
                   </li>
            </ul>
           </nav>
        </div>
        <div id="tagContent">
            <div class="tagContent selectTag" id="tagContent0">
                <zhongsoft:ContentGrid runat="server" ID="toDoList" BindMethod="GetToDoList" ContentClass="contentgrid_content"
                    CssClass="contentgrid" LoadingClass="loading" LoadingHeight="40" PageSize="20"
                    PageCount="5" CallBack="getTodoNum" />
            </div>
            <div class="tagContent selectTag" id="tagContent1" style="display: none;">
                <zhongsoft:ContentGrid runat="server" ID="oldToDoList" BindMethod="GetOldToDoList"
                    ContentClass="contentgrid_content" CssClass="contentgrid" LoadingClass="loading"
                    LoadingHeight="40" PageSize="20" PageCount="5" CallBack="getOldTodoNum" />
            </div>
            <div class="tagContent selectTag" id="tagContent2" style="display: none;">
                <zhongsoft:ContentGrid runat="server" ID="ysToDoList" BindMethod="GetYSToDoList"
                    ContentClass="contentgrid_content" CssClass="contentgrid" LoadingClass="loading"
                    LoadingHeight="40" PageSize="20" PageCount="5" CallBack="getYSTodoNum" />
            </div>
            <div class="tagContent selectTag" id="tagContent3" style="display: none;">
                <zhongsoft:ContentGrid runat="server" ID="pysToDoList" BindMethod="GetPYSToDoList"
                    ContentClass="contentgrid_content" CssClass="contentgrid" LoadingClass="loading"
                    LoadingHeight="40" PageSize="20" PageCount="5" CallBack="getPYSTodoNum" />
            </div>
        </div>
    </div>
    </form>
</body>
</html>
<%--以下脚本用于分辨率区分 12/23--%>
<script type="text/javascript">
    var screenWidth = window.screen.width; //更改方式window.screen.width
    if (screenWidth < 1100) {
        $('.inputTxt').css('width', '119px');
        $('.inputTxt').css('margin-left', '0px');

    }
    else {
        $('.inputTxt').css('width', '123px');
        $('.inputTxt').css('margin-left', '-12px');
    }

    //执行查询按钮点击
    function btnQueryClick() {
        $("[content='searchResult']").click();
    }

    //    setInterval(function () {由于异步处理，所以加载不上click事件
    //        $('[state="attetion"]').each(function () {
    //            $(this).bind("click", function () {
    //                formAttention($(this).attr("prcInstId"), $(this).attr("type"), $(this))
    //            });
    //        })
    //    }
    //    , 5000);
    function formAttention(prcInstId, type, imgId) {
        var userId = '<%=KPMSUser.Id %>';
        $.ajax({
            type: "POST",
            url: buildQueryUrl("Sys/Handler/WorkflowAttentionHandler.ashx", null),
            data: { prcInstId: prcInstId, userId: userId, type: type },
            async: false,
            success: function (result) {
                var $type;
                if (result.indexOf("失败") < 0) {
                    if ("add" == type) {
                        $type = "cancel";
                        $("#" + imgId).attr("title", "已关注,点击取消关注");
                        $("#" + imgId).attr("src", "../../Themes/Images/btn_attention.png");
                    }
                    else {
                        $type = "add";
                        $("#" + imgId).attr("title", "未关注,点击加关注");
                        $("#" + imgId).attr("src", "../../Themes/Images/btn_notattention.png");
                    }
                    //为按钮添加文本、click事件
                    $("#" + imgId).removeAttr("onclick")
                    $("#" + imgId).bind("click", function () {
                        formAttention(prcInstId, $type, imgId)
                    });
                }
                else {
                    alert(result);
                }
            }
        });
    }
</script>