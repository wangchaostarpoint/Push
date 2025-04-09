<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectNavigator.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.ProjectPortal.ProjectNavigator" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title></title>
    <link href="../../../Themes/Styles/projectsite.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        html, body
        {
            overflow: hidden;
            height: 100%;
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table class="kpms-table100">
        <tr>
            <td valign="top">
                <div id="temptabs" style="height: 100%">
                    <%=GenerateNavigatorHTML()%>
                </div>
            </td>
        </tr>
    </table>
    <!--如果没有配置Url，显示为正在建设页面-->
    <input type="hidden" runat="server" id="hiEmptyUrl" value="/Sys/Building.aspx" />
    <!--设计内容项目树中项目层节点对应项目网站中部分文档-->
    <input type="hidden" runat="server" id="hiDesignContentFiles" value="'过程文档','项目设计计划','互提资料文档','外部资料文档','成品资料'" />
    <input type="hidden" runat="server" id="hiOrganizationID" />
    </form>
    <script language="javascript">
        function ChangeUrl(MenuId, MenuName, Url, organizationId) {
            var url;
            if (Url.indexOf("?") == -1) {
                url = encodeURI(Url + "?IsPortal=true&MenuId=" + MenuId + "&OrganizationID=" + organizationId + "&projectPhaseEntityID=" + organizationId);
            }
            else {
                url = encodeURI(Url + "&IsPortal=true&OrganizationID=" + organizationId + "&projectPhaseEntityID=" + organizationId);
            }
            $("#content").attr("src", url);
        }
        function initCustomerPlugin() {
            $("#temptabs").tabs({ activate: function (event, ui) { webpartTabsActive(ui); }
            });
            $('.divWebpart').height($(window).height() - $("#ulTab").height());
        }

        //点击页签tab页加载页签内容
        function webpartTabsActive(ui) {
            var webpartid = $(ui.newTab).attr("webpartid");
            var url = $(ui.newTab).attr("iframeurl");
            var oldurl = $("#" + webpartid).attr("src");
            //判断oldurl是否为空
            if (oldurl == "" || oldurl == undefined) {
                $("#" + webpartid).attr("src", url);
            }
        }
   
    </script>
    <script type="text/javascript">
        //项目网站
        function ViewProjectPortal() {
//            var url = "/Portal/EPMS/List/ProjectPortal/ProjectHomePage.aspx?projectPhaseID=" + $("#<%=hiOrganizationID.ClientID %>").val();
            var url = "/Portal/CatalogTree/EPMSFileTree.aspx?organizationID=" + $("#<%=hiOrganizationID.ClientID %>").val();

            window.open(url);
            return false;
        }
    </script>
</body>
</html>