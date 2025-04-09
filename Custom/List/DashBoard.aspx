<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Zhongsoft.Portal.Custom.List.Dashboard" %>

<%@ Register Src="../../Metro/Controls/MetroHeader.ascx" TagName="MetroHeader" TagPrefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title></title>
    <base target="_self" />
    <link href="../../Themes/custom/Styles/defaultpage.css" type="text/css" rel="Stylesheet" />
    <link href="../../Themes/Styles/easyui.css" type="text/css" rel="Stylesheet" />
    <link href="../../Themes/Styles/objectlist.css" rel="stylesheet" type="text/css" />
    <script src="../../UI/Script/portal.cookie.js" type="text/javascript"></script>
    <script src="../../UI/Script/customer.list.js" type="text/javascript"></script>
    <link href="../../themes/custom/styles/jquery-ui-1.10.4.custom.css" rel="stylesheet"
        type="text/css" />
    <style type="text/css">
        .tabsImgTag
        {
            text-align: center;
        }
       .logotitle{ background:#56596a;}
    </style>
</head>
<body style="background: #fff;">
    <form id="form1" runat="server">
    <div>
        <%--添加功能区--%>
        <div id="divHeader" runat="server" class="detail-header" visible="false">
            <div class="tabs-title2"><%=this.Page.Title %><%-- — <%=AppConfig.Instance.BaseOrgUnitName %>--%></div>
	        <div class="tabs-title">                
		        <ul id="tabs">
			        <li><a class="tabs-tlink">功能区</a></li>
		        </ul>
	        </div>
        </div><%--功能区结束--%>
        <div id="metroheader" runat="server" visible="false" style="height: 45px!important;">
            <uc2:MetroHeader ID="metroHeader1" runat="server" />
        </div>
        <div id="toolDiv">
            <table id="tbManage"  runat="server" class="tz-table" style="width: 100%">
               
                <tr id="trleader" class="list-leader">
                    <td class="list-title" id="tdTitle">
                        <table>
                            <tr>
                                <td>
                                    <%=this.Page.Title %>
                                </td>
                                <td>
                                    <asp:DropDownList Width="150px" ID="ddlView" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlView_SelectedIndexChanged"
                                        EnableTheming="false">
                                    </asp:DropDownList>
                                </td>
                                <td style="font-weight: normal">
                                    <span class="menu-div" menu="#editor">
                                        <asp:LinkButton runat="server" class="kpms-btn" ID="btnManage" OnClientClick="return false;">
                            <span>视图管理<img src="../../Themes/Images/fleximages/ddn.png" /></span></asp:LinkButton>
                                        <div class="btn-menu" id="editor" style="width: 60px; display: none;">
                                            <div class="menu-item">
                                                <asp:LinkButton ID="btnCustomView" runat="server" EnableTheming="false" OnClick="btnCustomView_Click">
                                    <div class="menu-icon icon-new">
                                    </div>
                                    <div class="menu-text">
                                        新建</div></asp:LinkButton>
                                            </div>
                                            <div class="menu-item">
                                                <asp:LinkButton runat="server" ID="btnEditView" OnClientClick="return editView();"
                                                    EnableTheming="false" OnClick="btnEditView_Click">
                                                         <div class="menu-icon icon-editor">
                                    </div>
                                    <div class="menu-text">
                                        编辑</div>
                                                </asp:LinkButton>
                                            </div>
                                            <div class="menu-item">
                                                <asp:LinkButton runat="server" ID="btnDeleteView" OnClientClick="return deleteView();"
                                                    EnableTheming="false" OnClick="btnDeleteView_Click">
                                                          <div class="menu-icon icon-delete">
                                    </div>
                                    <div class="menu-text">
                                        删除</div>
                                                </asp:LinkButton>
                                            </div>
                                            <div class="menu-item">
                                                <asp:LinkButton runat="server" ID="btnSetDefault" EnableTheming="false" OnClick="btnSetDefault_Click"
                                                    OnClientClick="return confirm('确定设置此视图为默认视图？')">
                                                          <div class="menu-icon icon-default">
                                    </div>
                                    <div class="menu-text">
                                        默认</div>
                                                </asp:LinkButton>
                                            </div>
                                        </div>
                                    </span>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <%-- <td align="right">
                        <asp:LinkButton runat="server" ID="btnConfig" OnClick="btnConfig_Click"><span>编辑</span></asp:LinkButton>
                    </td>--%>
                </tr>
            </table>
        </div>
        <div runat="server" id="divContent">
        </div>
        <div id='iframediv' style='display: none'>
            <iframe id='ctrliframe' src='' frameborder='0' width='100%' height='100%' allowtransparency='true'>
            </iframe>
        </div>
    </div>
    <%--保存以iframe加载的部件id--%>
    <input type="hidden" runat="server" id="hiIframeIds" />
    <%--保存以ajiax加载的部件id--%>
    <input type="hidden" runat="server" id="hiAjaxIds" />
    <input type="hidden" runat="server" id="hiCtrlUrls" />
    <%--保存tabs的Id以及第一个有权限的tab序号 --%>
    <input type="hidden" runat="server" id="hiFirst" />
    <input type="hidden" runat="server" id="hiTabsId" />
    <script>

        var iframeIds = $("#<%=hiIframeIds.ClientID %>").val().split(',');
        var ajaxIds = $("#<%=hiAjaxIds.ClientID %>").val().split(',');
        var jsonCtrlUrls = jQuery.parseJSON($("#<%=hiCtrlUrls.ClientID %>").val());

        //分辨率不同，对于宽度控制不同的显示宽度
        function initPageByScreen() {
            var screenWidth = window.screen.width;
            if (screenWidth < 1366) {
                $('.left').css('width', '270px');
                $('.left').next('td').css('width', (screenWidth - 270) + 'px');

                $('.left2').css('width', '270px');
                $('.left2').next('td').css('width', (screenWidth - 270) + 'px');
            }
        }

        //设置Iframe高度为内部页面高度
        function iFrameHeight(type, positionFlag) {
            if (positionFlag == "left") {
                var ifm = document.getElementById(type);
                var subWeb = document.frames ? document.frames[type].document : ifm.contentDocument;
                //var subWeb = ifm.contentDocument;
                if (ifm != null && subWeb != null) {
                    ifm.height = subWeb.body.scrollHeight;
                }
            }
            else if (positionFlag == "right") {
                var headerH = $("#toolDiv").height();
                //非管理员工具条隐藏，不需要减去这个高度
                if ('<%=KPMSUser.IsAdmin.ToString().ToLower() %>' == 'false') {
                    headerH = 0;
                }
                if ('<%=IsShowHeader.ToString().ToLower() %>' == 'true') {
                    headerH = headerH + $("#divHeader").height();
                }
                var tabList = $("[role='tablist']");
                var tabHeight = 0;
                //tabList.length>0才可以正确判断是否有页签行
                if (tabList != null && tabList.length > 0) {
                    //tabHeight = 35;
                    tabHeight = tabList.height();
                }
                //Modify by xiedx 0410 采用cookie保存右侧的实际高度，页面加载高度有问题时使用
                if (($(window).height() - headerH - tabHeight) > 150) {
                    $('#' + type).height(($(window).height() - headerH - tabHeight -6 ) + 'px');
                    $('#' + "divWebPart_" + type).css("margin-bottom", "0px");
                    addCookie("TempHeight", ($(window).height() - headerH - tabHeight -6), 24);
                }
                else {
                    $('#' + type).height((getCookie("TempHeight") - headerH - tabHeight -6) + 'px');
                    $('#' + "divWebPart_" + type).css("margin-bottom", "0px");

                }
            }
        }

        function initTdHeight() {
            var headerH = $("#toolDiv").height();
            //非管理员工具条隐藏，不需要减去这个高度
            if ('<%=KPMSUser.IsAdmin.ToString().ToLower() %>' == 'false') {
                headerH = 0;
            }
            //-7td高度获取差7px，特殊处理
            $('.left').height(($(window).height() - headerH - 7) + 'px');
            $('.left').next('td').height("100%");

            //针对左侧两行，第二行固定的特殊处理 tianhl 20141216
            $('.left3').height('210px');
            $('.left2').height(($(window).height() - headerH - 7 - $('.left3').height()) + 'px');
        }

        //点击页签tab页加载页签内容
        function webpartTabsActive(ui) {
            var webpartid = $(ui.newTab).attr("webpartid");
            var openmode = $(ui.newTab).attr("openmode");
            var oldurl = $("#" + webpartid).attr("src");
            //判断oldurl是否为空
            if (oldurl == "" || oldurl == undefined) {
                if ($.inArray(webpartid, iframeIds) != -1) {
                    var url = jsonCtrlUrls[webpartid];
                    if (url != undefined) {
                        if (openmode != undefined && openmode == "Normal") {
                            openWin(url);
                        } else {
                            $("#" + webpartid).attr("src", encodeURI(url));
                        }
                    }
                } else if ($.inArray(webpartid, iframeIds) != -1) {
                    getAjaxHtml(webpartid, null);
                }
            }
            else {
                if (openmode != undefined && openmode == "Normal") {
                    openWin(oldurl);
                }
                //add by xiedx 0912 部件联动时如果列表有冻结行列显示不正常，需重新加载
                $("#" + webpartid).attr("src", oldurl);
            }
        }

        function openWin(url) {
            var tId = $("#<%=hiTabsId.ClientID %>").val();
            var first = $("#<%=hiFirst.ClientID %>").val();
            window.open(url);
            $('#' + tId).tabs('option', 'active', first);
        }

        //非管理员，不显示视图管理工具栏 tianhl 20140919
        function setToolbar() {
            if (!parseBool('<%=KPMSUser.IsAdmin.ToString().ToLower() %>')) {
                $("[flag='sys']").hide();
            }
        }

        function editView() {
            if (!parseBool("<%=HasEditPerm %>")) {
                alert("你没有权限编辑该视图。");
                return false;
            }
            return true;
        }

        function deleteView() {
            if (!parseBool("<%=HasEditPerm %>")) {
                alert("你没有权限删除该视图。");
                return false;
            }
            if ("<%=BaseViewId %>" == "<%=CurrentViewId%>") {
                return confirm("删除基础视图将会删除所有子视图，确定删除？");
            }
            else {
                return confirm("确定删除？");
            }
        }

        window.onresize = function () {
            initTdHeight();
        }

        function initCustomerPlugin() {
            buildMenu();
            initPageByScreen();
            initTdHeight();
            setToolbar();
        }

        function showIframediv(url) {
            document.getElementById('ctrliframe').src = url;
            $("#iframediv").dialog({
                height: 550,
                width: 900,
                modal: true
            })
        }
        function configDashboard() {
            var url = buildBizUrl(3, "<%=CurrentViewId %>", "/custom/List/DashboardEditor.aspx", null);
            return checkReturn(showModal(url, null, 1080, 600));
        }

        ///部件联动调用，selfId：触发部件id
        function setWebPartParam(selfId, param) {
            for (var i in jsonRelation) {
                if (jsonRelation[i].TriggerId == selfId) {
                    var targetId = jsonRelation[i].TargetId;
                    var rule = jsonRelation[i].ParamRule;
                    var regex = /Fields!\w+.Value/g;
                    var matchs = rule.match(regex);
                    for (var i = 0; i < matchs.length; i++) {
                        var key = matchs[i].replace("Fields!", "").replace(".Value", "");
                        rule = rule.replace(matchs[i], param[key]);
                    }
                    rule = rule.replace("'+", "").replace("+'", "");
                    rule = rule.replace("'", "");
                    if ($.inArray(targetId, iframeIds) != -1) {
                        if (document.getElementById(targetId) != null) {
                            document.getElementById(targetId).src = encodeURI(jsonCtrlUrls[targetId] + "&" + rule);
                        }
                    }
                    else if ($.inArray(targetId, ajaxIds) != -1) {
                        getAjaxHtml(targetId, "&" + rule);
                    }
                }
            }
        }

        //部件联动调用，selfId：触发部件id，适用于XChart
        function setChartWebPartParam(selfId, seriesName, category, value) {
            for (var i in jsonRelation) {
                if (jsonRelation[i].TriggerId == selfId) {
                    var targetId = jsonRelation[i].TargetId;

                    var rule = jsonRelation[i].ParamRule;
                    var regex = /ChartParams!\w+.Value/g;
                    var matchs = rule.match(regex);
                    for (var i = 0; i < matchs.length; i++) {
                        var key = matchs[i].replace("ChartParams!", "").replace(".Value", "");
                        var paramValue = "";
                        switch (key) {
                            case "SeriesName":
                                paramValue = seriesName;
                                break;
                            case "Category":
                                paramValue = category;
                                break;
                            case "Value":
                                paramValue = value;
                                break;
                        }
                        rule = rule.replace("'+", "").replace("+'", "");
                        rule = rule.replace("'", "");
                        rule = rule.replace(matchs[i], paramValue);
                        if ($.inArray(targetId, iframeIds) != -1) {
                            if (document.getElementById(targetId) != null) {
                                document.getElementById(targetId).src = encodeURI(jsonCtrlUrls[targetId] + "&" + rule);
                            }
                        }
                        else if ($.inArray(targetId, ajaxIds) != -1) {
                            getAjaxHtml(targetId, "&" + rule);
                        }
                    }
                }
            }
        }

        $(".closeleft").click(function () {
            var index = $(this).index();
            $(this).closest("table").children('tbody').children('tr').each(function () {
                $(this).children('td').each(function () {
                    if ($(this).index() < index) {
                        $(this).toggle();
                    }
                })
            })
        });

        window.onload = function () {
            initTdHeight();
            var len = iframeIds.length;
            for (i = 0; i < len; i++) {
                iFrameHeight(iframeIds[i], $("#" + iframeIds[i]).attr("positionFlag"));
            }
            $(".divloading").hide();
        };
        //根据部件key查找部件id
        function getWebpartIdByKey(key) {
            var ctrl = $("[key='" + key + "']");
            if (ctrl.length > 0) {
                return ctrl.eq(0).attr("id");
            }
            else {
                return null;
            }
        }
        //根据部件key查找部件
        function getIframeByKey(key) {
            var webpartId = getWebpartIdByKey(key);
            if (webpartId == null) {
                return null;
            }
            return window.frames[webpartId];
        }

        //部件tab跳转
        function setWebPartTab(key) {
            var webpartId = getWebpartIdByKey(key);
            if (webpartId == null)
                return;
            var a = $("a[href='#div_" + webpartId + "']");
            if (a.length > 0) {
                var tabDiv = a.closest(".tdDiv");
                if (tabDiv.length > 0) {
                    tabDiv.tabs("option", "active", a.attr("index"));
                }
            }
        }

        $(function () {
            var len = ajaxIds.length;
            for (i = 0; i < len; i++) {
                getAjaxHtml(ajaxIds[i], null);
            }
        });

        //异步ajax加载部件
        function getAjaxHtml(webpartId, rule) {
            $.ajax({
                url: jsonCtrlUrls[webpartId] + "&isajax=1" + rule,
                success: function (html) { $("#divWebPart_" + webpartId).html(html); }
            }
          );
        }
    </script>
    </form>
</body>
</html>
