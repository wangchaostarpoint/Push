<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MetroIndex.aspx.cs" Inherits="Zhongsoft.Portal.MetroTest" %>

<%@ Register Src="Metro/Controls/MetroBanner.ascx" TagName="MetroBanner" TagPrefix="uc1" %>
<%@ Register Src="Metro/Controls/MetroHeader.ascx" TagName="MetroHeader" TagPrefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <meta http-equiv="X-UA-Compatible" content="IE=9,chrome=1" />
    <title></title>
    <link href="themes/custom/styles/fashionfoucs_lrtk1.css" rel="stylesheet" />
    <link href="themes/custom/styles/global.css" rel="stylesheet" />
</head>
<body style="min-width: 1024px; background: #817f8d; overflow-y:hidden;">
    <form id="form1" runat="server">
    <script type="text/javascript">
        $(function () {
            //屏幕分辨率
            var screenHeight = window.screen.height;
            var screenWidth = window.screen.width;

            var headerH = $("#metrobanner").height();
            var topheader = $("#metroheader").height();
            $('.ad_img').height(($(window).height() - headerH + 17) + 'px');
           
            if (navigator.userAgent.indexOf("MSIE 8.0") > 0) { //针对ie 8
                if (screenHeight <= 768) {//0108针对ie 8,高度768及以下的情况，如1366*768
                    $('#iframMetroDefault').height(($('.ad_img').height() - 24) + 'px');
                    $('#iframMetroDefault').css('margin-top', '40px');
                }
                else if (screenHeight <= 900) {//0108针对ie 8,高度900的情况，如1440*900
                    $('#iframMetroDefault').height(($('.ad_img').height() - 24) + 'px');
                    $('#iframMetroDefault').css('margin-top', '40px');
                }
                else {
                    //针对ie 8 ,如1920*1080
                    $('#iframMetroDefault').height(($('.ad_img').height() - 76) + 'px');
                    $('#iframMetroDefault').css('margin-top', '60px');
                }
                
            }
            else if (navigator.userAgent.indexOf("MSIE 9.0") > 0 || navigator.userAgent.indexOf("MSIE 10.0") > 0) {
                //针对ie 9\10 -36
                $('#iframMetroDefault').height(($('.ad_img').height() - 36) + 'px');
            }
            else {
                //其他IE版本
                $('#iframMetroDefault').height(($('.ad_img').height() - 6) + 'px');
                $('#iframMetroDefault').css('margin-top', '10px');
            }

            if("<%=IsShowHeader %>"=="1"){
               //前边是对右侧有代办列表左侧发起流程的首页分的情况，工作台不需要
                $('.ad_img').height(($(window).height() - topheader) + 'px');
                $('#iframMetroDefault').height(($('.ad_img').height()- 8) + 'px');               
            }

        })
         
        function setBannerCallback(metroId, groupId, tileId) {
            window.location = buildQueryUrl("MetroIndex.aspx", { metroId: metroId, groupId: groupId, tileId: tileId });
        }
        
    </script>
    <div id="banner">
        <div id="metroheader" style=" height:40px;">
            <uc2:MetroHeader ID="metroHeader" runat="server" />
        </div>
        <ul id="banner_img">
            <li class="item1">
                <div class="wrapper">
                    <div class="ad_img">
                        <iframe src="Sys/Metro/MetroDefault.aspx" frameborder="0" id="iframMetroDefault" runat="server"
                            width="90%" name="workSpace" allowtransparency="true" style="margin-top: 40px;
                            margin-left: 80px;"></iframe>
                    </div>
                </div>
            </li>
            <li class="item2">
                <div class="wrapper">
                    <div class="ad_img">
                        <iframe src="Sys/Workflow/WorkForwardList.aspx" frameborder="0" id="iframForward"
                            width="100%" height="480" name="forwardSpace" allowtransparency="true" style="margin-top: 0px;
                            margin-left: 0px;"></iframe>
                    </div>
                </div>
            </li>
            <asp:Repeater runat="server" ID="metroRepeater" OnItemDataBound="metroRepeater_ItemDataBound">
                <ItemTemplate>
                    <li id="liItem" runat="server">
                        <div class="wrapper" style="height: 100%;">
                            <div class="ad_img">
                                <div style="height: 100%;" id="divInner" runat="server">
                                    <iframe frameborder="0" id="mySpace" width="100%" height="100%" name="mySpace" allowtransparency="true"
                                        runat="server"></iframe>
                                </div>
                            </div>
                        </div>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
        <div id="metrobanner" style="height: 80px!important;">
            <uc1:MetroBanner ID="metroBanner" runat="server" />
        </div>
    </div>
    <input runat="server" type="hidden" id="hiFrameIDs" value="iframMetroDefault,iframForward" />
    <script type="text/javascript" src="UI/script/metro/fashionfoucs1.js"></script>
    <!-- 脚本调用要在JQuery脚本加载以后才可以正常执行，否则导致banner没法左右滚动切换！-->
    <script src="ui/script/metro/defaultpage.js" type="text/javascript"></script>
    <script src="ui/script/metro/jquery.plugin.min.js" type="text/javascript"></script>
    </form>
</body>
</html>
