<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BlankPage.aspx.cs" Inherits="Zhongsoft.Portal.Sys.Menu.BlankPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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

    <%--<script type="text/javascript">
        function InitFormPlugin() {
            $("#aLink").click(function() {
                var features = "dialogHeight: 750px; dialogWidth:950px; center: Yes; help: Yes; scroll:auto; status: no; resizable: no";
                window.showModalDialog("<%=DemoUrl %>", null, features);
            });
        }
    </script>--%>

    <form id="form1" runat="server">
    <table class="kpms-list" width="100%">
        <!---title--->
        <tr>
            <td class="kpms-listtitle" style="width: 100%; height:100px; overflow: auto;">
                <%--<img alt="" src="../../Themes/Images/btn_title.gif" visible="false" />--%>
                <asp:Label ID="lbTitle" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <div style="text-align: center;">
        <img src="../../Themes/Images/building.jpg" />
        <br />
        要了解该页面建设内容的效果，<a class="kpms-star" href="#" id="aLink">请点击这里</a>
    </div>
    </form>
</body>
</html>
