<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MetroBanner.ascx.cs"
    Inherits="Zhongsoft.Portal.Metro.Controls.MetroBanner" %>
<%@ Register Namespace="Zhongsoft.Portal.Metro.Controls" TagPrefix="zs" Assembly="Zhongsoft.Portal" %>
<script type="text/javascript">
    $(document).ready(function () {
        var screenWidth = window.screen.width;
        if (screenWidth < 1100) {
            $('#bannerleft').css('width', '215px');
            $('#banner_ctr').css('width', screenWidth - 215 - 355 + 'px');

        }

        else {
            $('#bannerleft').css('width', '255px')
            $('#banner_ctr').css('width', screenWidth - 255 - 355 + 'px');
        }

    })
    function refreshTabBar(metroId, groupId, tileId) {
        var metroId = "<%=MetroId %>"
        setBannerCallback(metroId, '', '');
    }
</script>
<table style="width: 100%; height: 80px; position: absolute; bottom: 0px; z-index: 2;
    background: url(themes/custom/images/topbg.png) repeat-x;" cellpadding="0" cellspacing="0">
    <tr>
        <td id="bannerleft">
            <a href="<%=WebAppPath%>/Default.aspx" target="_self" style="float: left;">
                <img src="<%=WebAppPath%>/themes/custom/images/chuantong.png" width="48" height="48" style="margin:6px;"
                    title="进入旧版门户" />
            </a><a href="<%=WebAppPath%>/MetroIndex.aspx" target="_self">
                <img style="float: left;margin:6px;" src="<%=WebAppPath%>/themes/custom/images/home.png" title="首页"
                    width="48" height="48" /></a> <a href="#" onclick="refreshTabBar('','','')" style="padding-left: 15px;
                        margin-left: 15px">
                        <img style="float: left;margin:6px;" src="<%=WebAppPath%>/themes/custom/images/return.png" title="返回"
                            width="48" height="48" /></a>
            <img id="nav_left" src="themes/custom/images/arr_left.png" />
        </td>
        <td>
            <div id="banner_ctr">
                <div id="nav">
                    <div id="drag_ctr">
                    </div>
                    <ul id="nav1">
                        <li><a class="btn-big" title="待办  点击可重新加载"><span>
                            <img src="themes/custom/images/xtp0.png" width="53" height="48" /><br />
                            待办</span></a></li>
                        <li><a class="btn-big" title="传阅"><span>
                            <img src="themes/custom/images/xtpt.png" width="53" height="48" /><br />
                            传阅</span></a></li>
                        <asp:Repeater runat="server" ID="metroRepeater" OnItemDataBound="metroRepeater_ItemDataBound">
                            <ItemTemplate>
                                <li><a class="btn-big" runat="server" id="anchor"><span>
                                    <img src="<%=WebAppPath%>/<%=EDPortal.BLL.Sys.SysConfig.Instance.IconStorageUrl %><%#Eval("Icon") %>"
                                        width="53" height="48" /><br />
                                    <asp:Label runat="server" ID="lbMetroName"></asp:Label></span></a></li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </div>
            </div>
        </td>
        <td style="width: 355px;">
            <img id="nav_right" src="themes/custom/images/arr_right.png" />
            <div style="height: 64px; float: left; margin-bottom: 7px;">
                <a href="<%=WebAppPath%>/MetroIndex.aspx" target="_self" style="float: left; padding-top:8px;">
                    <img alt="" runat="server" id="imgLogo" src="~/Themes/UserImages/imglogo.png" />                   
                </a>
                <div class="welcome">
                        &nbsp;&nbsp;欢迎您：<%= KPMSUser.Name%>
                        (<%=KPMSUser.LoginId%>)<asp:LoginStatus Font-Bold="true" LogoutText="[注销]" ID="LoginStatus"
                            runat="server" />
                        &nbsp;<a id="aPersonalSet" title="个人设置"><img src="<%=WebAppPath%>/themes/custom/images/setting.png" width="17" height="17" style=" margin-bottom:3px;" /></a>
                        <a id="aHomePageSet" title="设置为首页"><img src="<%=WebAppPath%>/themes/custom/images/set_home.png" width="16" height="16" style=" margin-bottom:3px;" /></a>
                    <asp:LinkButton runat="server" ID="btnSetHomePage" OnClick="btnSetHomePage_Click"
                        Visible="false"></asp:LinkButton>
                </div>
            </div>
        </td>
    </tr>
</table>
<script type="text/javascript">
    var flagTodo = "待办";
    var flagInfo = "传阅";
    var todo; var info;
    function initCustomerPlugin() {
        
        show(<%=index %>);
        var todoResult = $("#banner_ctr a:contains('" + flagTodo + "')");
        if (todoResult.length > 0) {
            todo = todoResult[0];
            getTodo();
            window.setInterval(getTodo, 120000);
        }
        var infoResult = $("#banner_ctr a:contains('" + flagInfo + "')");
        if (infoResult.length > 0) {
            info = infoResult[0];
            getInfo();
            window.setInterval(getInfo, 120000);
        }
        
        $("#aPersonalSet").click(function () {
            showPersonalSet()
        })
        $("#aHomePageSet").click(function () {
            setHomePage()
        })
    }
    //获取待办
    function getTodo() {
        $.post("/Portal/Sys/Workflow/WorkToDoList.aspx",
                    { asyfunc: "GetToDoItemsCount" },
                    function (res) {
                        if (todo != null) {
                           //                                alert("又调用了一次，返回结果" + res);
                           var index = todo.innerHTML.indexOf(flagTodo);
                           //todo.innerHTML = todo.innerHTML.substring(0, index) + flagTodo + '(<font color="red">' + res + '</font>)';
                           todo.innerHTML = todo.innerHTML.substring(0, index) + flagTodo + '（' + res + '）';
                        }
                    }
            );
    }

    //获取传阅
    function getInfo() {
            $.post("/Portal/Sys/Workflow/WorkForwardList.aspx",
                    { asyfunc: "GetForwardItemsCount" },
                    function (res) {
                        if (info != null) {
                            var index = info.innerHTML.indexOf(flagInfo);
                            info.innerHTML = info.innerHTML.substring(0, index) + flagInfo + '（' + res + '）';
                        }
                    }
            );
        }

        function showPersonalSet() {
            var url = "/Custom/List/DashBoard.aspx";
            var json = { listId: "12CFBB7E-56C0-4D70-BC2D-951A4D064A5C", IsShowHeader: 1 };
            url = buildQueryUrl(url, json);
            window.open(url);
        }

        function setHomePage() {
            if(confirm("您确认将当前页面设置为首页？")){
                <%=Page.GetPostBackEventReference(this.btnSetHomePage,"") %>;
            }
            return false;
        }

</script>
