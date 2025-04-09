<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Building.aspx.cs" Inherits="Zhongsoft.Portal.Sys.Building" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style>
        body, html
        {
            width: 100%;
            height: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table class="kpms-list" width="100%">
        <!---title--->
        <tr>
            <td class="kpms-listtitle" style="width: 100%; height: 100px; overflow: auto;">
                <asp:Label ID="lbTitle" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <div style="text-align: center; width: 100%">
        <div style="text-align: center; width: 100%">
            <img alt="正在建设中" src="/Portal/Themes/images/building.png" /></div>
        <br />
        <%--  要了解该页面建设内容的效果，<a class="kpms-star" href="#" id="aLink">请点击这里</a>--%>
    </div>
    <script type="text/javascript">
        if (parseBool("<%=IsDashboard %>"))//如果是dashboad部件，则页面加载完成隐藏dashboad页面的加载遮罩层
        {
            $(window).ready(function () { $('#divload_' + self.frameElement.id, window.parent.document).hide(); });
        }
    </script>
    </form>
</body>
</html>
