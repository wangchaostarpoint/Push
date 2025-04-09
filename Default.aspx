<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Zhongsoft.Portal.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <%--<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE9" />--%>
    <%--<meta http-equiv="X-UA-Compatible" content="IE=edge" />--%>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <!--不缓存,x-->
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache, must-revalidate" />
    <meta http-equiv="expires" content="Wed, 26 Feb 1997 08:21:57 GMT" />
    <meta content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,initial-scale=1,user-scalable=no" name="viewport" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server" style="position: fixed">
        <input type="button" id="fullScreen" style="display: none" />
        <link href="Themes/Styles/tabpanel.css" rel="stylesheet" type="text/css" />
        <link href="Themes/Styles/defaultpage1.css" rel="stylesheet" type="text/css" />
        <script src="UI/Script/defaultpage.js" type="text/javascript"></script>
        <script src="UI/Script/jquery.tabpanel.js" type="text/javascript"></script>
        <table cellpadding="0" cellspacing="0" width="100%" height="100%">
            <tr>
                <td colspan="3">
                    <div class="header">
                        <div class="logo">
                        </div>
                        <!--导航开始-->
                        <div id="navcontain">
                            <ul id="nav">
                                <%=GenerateNavigatorHTML()%>
                            </ul>
                        </div>
                        <img id="nav_left" src="Themes/Images/arrow-left-box.png" alt="" />
                        <img id="nav_right" src="Themes/Images/arrow-right-box.png" alt="" />
                    </div>
                    <div class="hide_header">
                    </div>
                    <span id="headhideimg" title="关闭顶部导航" class="headhide headhide_img head_closep"></span>
                    <!--导航结束-->
                </td>
            </tr>
            <tr class="tabbg">
                <td colspan="3">
                    <div class="welcome">
                        <%= KPMSUser.Name%>
                    (<%=LoginID%>) &nbsp; 
                          <asp:LoginStatus Font-Bold="false" LogoutText="[注销]" ID="LoginStatus" OnLoggedOut="LoginStatus_LoggedOut" runat="server" />
                        <a href="<%=HomePageUrl %>" target="_blank" style="">
                            <span style="padding-left: 7px; color: blue; font-size: 14px; font-weight: bold"
                                id="span2">公司门户
                            </span>
                        </a>

                    </div>
                </td>
            </tr>
            <!--左侧菜单-->
            <tr>
                <td rowspan="2" id="left">
                    <div id="leftmenu">
                        <%=ChildMenuUrl%>
                    </div>
                </td>
                <td rowspan="2" class="middle" id="middle">
                    <img id="closeLeft" src="Themes/Images/close_left1.gif" /><img style="display: none;"
                        id="openLeft" src="Themes/Images/open_left1.png" />
                </td>
                <td valign="top">
                    <div id='tab-container' class="main_r">
                    </div>
                </td>
            </tr>
            <tr style="display: none;">
                <td class="foot">版权所有
                </td>
            </tr>
        </table>
        <input type="hidden" id="hiPortalName" runat="server" value="Portal" />
        <input type="hidden" id="hiPageTemp" runat="server" value="待办工作" />
        <input type="hidden" id="hiID" runat="server" value="" />
        <input type="hidden" id="hiURL" runat="server" value="" />
        <input type="hidden" id="Hidden1" runat="server" value="Portal" />
        <!--控制上方导航菜单鼠标挪上去之后，是否显示下级菜单：1显示；0不显示-->
        <input type="hidden" id="hiIsShowChild" runat="server" value="0" />
        <!--总包系统首页页面Code-->
        <input type="hidden" id="hiZBHomePageCode" runat="server" value="LIST--ZBHomePage" />
        <input type="hidden" id="hiWorkPlatName" runat="server" value="首页" />
        <input type="hidden" id="hiModuleID" runat="server" />
        <input type="hidden" id="hiPageID" runat="server" />
        <input type="hidden" id="hiPageName" runat="server" />
        <input type="hidden" id="hiPageUrl" runat="server" />
    </form>
</body>
</html>
<script type="text/javascript">
    if (parseInt(document.documentMode) < 8 || navigator.appVersion.indexOf("MSIE 7.0") > -1) {
        $("#ieprompt").dialog({
            resizable: false,
            autoOpen: false,
            minHeight: 480,
            minWidth: 750,
            modal: true,
            buttons: {
                "关闭": function () {
                    $(this).dialog("close");
                }
            }
        });
        $('#ieprompt').dialog('open');
        $("#ieprompt").parent().appendTo("form");
    }

    //初始化tab页
    function initTabs() {
        var tabo = {};
        //"待办流程"
        var nameText = '<%=MenuName%>';// $("#<%=hiPageTemp.ClientID %>").val();
        tabo.items = [{
            id: "home",
            text: nameText,
            classes: "icon_home",
            isactive: true,
            content: ""
        }];
        tabo.width = (document.body.clientWidth) - 195;
        tabo.height = document.body.clientHeight - 125;
        $("#tab-container").tabpanel(tabo);
        $("#tab-container").opentabitem({
            id: $('#<%=hiID.ClientID %>').val(),
            text: " &nbsp; " + nameText,
            url: $('#<%=hiURL.ClientID %>').val(),
            isactive: true,
            closeable: false
        }, true);
        $("#tab-container").deleteitembyliid("home");
        //第一次进入默认收起左侧菜单导航 by cyx
        $('#left').css('display', '');
        $('#openLeft').css('display', 'none');
        $('#closeLeft').css('display', '');
        leftClose = 1;
        changeSize();
    }

    function showUserConfig() {
        var url = "/Custom/List/DashBoard.aspx";
        var json = {
            listId: "12CFBB7E-56C0-4D70-BC2D-951A4D064A5C",
            IsShowHeader: 2
        };
        url = buildQueryUrl(url, json);
        window.open(url);
    }

    //取首页菜单提示数量
    var forwardInfo, workTodoInfo, alertinfo;
    //var flagForwardInfo = "我的待阅";
    var flagWorkToDoInfo = '待办工作';
    //var flagAlertInfo = "工作提醒";

    //设计项目相关
    var projectSZInfo;
    var flagProjectSZInfo = "担任项目设总";
    var projectZRGInfo;
    var flagProjectZRGInfo = "担任专业总工";
    var projectZSRInfo;
    var flagProjectZSRInfo = "担任专业负责人";
    var projectSJRInfo;
    var flagProjectSJRInfo = "担任设计人";
    var projectJHRInfo;
    var flagProjectJHRInfo = "担任校核人";
    var projectSCRInfo;
    var flagProjectSCRInfo = "担任审查人";
    var projectXMGZRInfo;
    var flagProjectXMGZRInfo = "担任项目跟踪人";

    var ProjectNumJson;
    getProjectNum();
    function getProjectNum() {
        $.ajax({
            type: 'POST',
            url: buildQueryUrl("/EPMS/Handler/ProjectNumberHandler.ashx", null),
            data: { UserId: '<%=KPMSUser.UserId%>' },
            async: false,
            cache: false,
            success: function (res) {
                var $l = eval('(' + res + ')');
                ProjectNumJson = $l;
            },
            error: function (err) {
                //alert(err);
            }
        });
    }

    $("#leftmenu").find('a').each(function () {

        if (this.innerText != "" || this.innerText != null || this.innerText != undefined) {
            //if (this.innerText == flagForwardInfo) {
            //    forwardInfo = this;
            //    //getForward();
            //} else
            if (this.innerText == flagWorkToDoInfo) {
                workTodoInfo = this;
                getTodo();
            }
            //else if (this.innerText == flagAlertInfo) {
            //    alertinfo = this;
            //    //getAlertInfo();
            //}
            else if (this.innerText == flagProjectSZInfo) {
                projectSZInfo = this;
                var all = projectSZInfo.innerHTML;
                all = all.replace(flagProjectSZInfo, flagProjectSZInfo + '[<font color="red">' + ProjectNumJson.Sz + '</font>]');
                projectSZInfo.innerHTML = all;
                //getSzNum();
            }
            else if (this.innerText == flagProjectZRGInfo) {
                projectZRGInfo = this;
                //担任主任工
                var all3 = projectZRGInfo.innerHTML;
                all3 = all3.replace(flagProjectZRGInfo, flagProjectZRGInfo + '[<font color="red">' + ProjectNumJson.Zg + '</font>]');
                projectZRGInfo.innerHTML = all3;
                //getZrgNum();
            }
            else if (this.innerText == flagProjectZSRInfo) {
                projectZSRInfo = this;
                //担任主设人
                var all2 = projectZSRInfo.innerHTML;
                all2 = all2.replace(flagProjectZSRInfo, flagProjectZSRInfo + '[<font color="red">' + ProjectNumJson.Zsr + '</font>]');
                projectZSRInfo.innerHTML = all2;
                //getZsrNum();
            }
            else if (this.innerText == flagProjectSJRInfo) {
                projectSJRInfo = this;
                //担任设计人
                var all4 = projectSJRInfo.innerHTML;
                all4 = all4.replace(flagProjectSJRInfo, flagProjectSJRInfo + '[<font color="red">' + ProjectNumJson.sjr + '</font>]');
                projectSJRInfo.innerHTML = all4;
                //getSjrNum();
            }
            else if (this.innerText == flagProjectJHRInfo) {
                projectJHRInfo = this;
                var all5 = projectJHRInfo.innerHTML;
                all5 = all5.replace(flagProjectJHRInfo, flagProjectJHRInfo + '[<font color="red">' + ProjectNumJson.jhr + '</font>]');
                projectJHRInfo.innerHTML = all5;
            } else if (this.innerText == flagProjectSCRInfo) {
                 projectSCRInfo = this;
                var all6 = projectSCRInfo.innerHTML;
                all6 = all6.replace(flagProjectSCRInfo, flagProjectSCRInfo + '[<font color="red">' + ProjectNumJson.scr + '</font>]');
                projectSCRInfo.innerHTML = all6;
            }else if (this.innerText == flagProjectXMGZRInfo) {
                 projectXMGZRInfo = this;
                var all7 = projectXMGZRInfo.innerHTML;
                all7 = all7.replace(flagProjectXMGZRInfo, flagProjectXMGZRInfo + '[<font color="red">' + ProjectNumJson.xmgzr + '</font>]');
                projectXMGZRInfo.innerHTML = all7;
            }
        }
    }
    );
  <%--  //获取传阅
    function getForward() {
        $.ajax({
            type: 'POST',
            url: buildQueryUrl("/sys/Handler/DefaultHandler.ashx", null),
            data: { MethodName: "GetForwardItemsCount", UserId:'<%=KPMSUser.UserId%>' },
            async: false,
            cache: false,
            success: function (res) {
                if (res == "") {
                    return;
                }
                var index = forwardInfo.innerHTML.indexOf(flagForwardInfo);
                forwardInfo.innerHTML = forwardInfo.innerHTML.substring(0, index) + flagForwardInfo + '(<font color="red">' + res + '</font>)';
            },
            error: function (err) {
            }
        });
    }--%>

    //获取待办
    function getTodo() {

        $.ajax({
            type: 'POST',
            url: buildQueryUrl("/sys/Handler/DefaultHandler.ashx", null),
            data: { MethodName: "GetToDoItemsCount", UserId:'<%=KPMSUser.UserId%>' },
            async: false,
            cache: false,
            success: function (res) {
                if (res == "") {
                    return;
                }
                if (workTodoInfo == undefined) return;

                var index = workTodoInfo.innerHTML.indexOf(flagWorkToDoInfo);
                workTodoInfo.innerHTML = workTodoInfo.innerHTML.substring(0, index) + flagWorkToDoInfo + '(<font color="red">' + res + '</font>)';
            },
            error: function (err) {
            }
        });
    }

   <%-- //获取工作提醒数量
    function getAlertInfo() {
        $.ajax({
            type: 'POST',
            url: buildQueryUrl("/sys/PortalAlter/Handler/AlterHandler.ashx", null),
            data: { MethodName: "GetPortalAlertAlertNum", UserId:'<%=KPMSUser.UserId%>' },
            async: false,
            cache: false,
            success: function (res) {
                if (res == "") { return; }

                var index = alertinfo.innerHTML.indexOf(flagAlertInfo);
                alertinfo.innerHTML = alertinfo.innerHTML.substring(0, index) + flagAlertInfo + '(<font color="red">' + res + '</font>)';
            },
            error: function (err) {
            }
        });
    }--%>
</script>
