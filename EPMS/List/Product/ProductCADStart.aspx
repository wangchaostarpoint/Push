<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductCADStart.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Product.ProductCADStart" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>OpenAutoCAD</title>

    <script type="text/javascript">
        function OpenCAD() {
            var orgId = '<%=Request.QueryString.Get("OrganizationId") %>';
            var wbsId = '<%=Request.QueryString.Get("WBSId") %>';
            if (orgId != '') {
                try {
                    document.getElementById("CADActive").QiDongCheckOutIn(orgId, "全部", wbsId);
                   
                }
                catch (e) {
                    alert("如果您未安装协同校审系统，请先安装,再启动；如果您已安装请运行加载项！");
                }
            }
            window.close();
        }
    </script>

</head>
<body onload="OpenCAD();">
    <form id="form1" runat="server">
    <div>
        <object id="CADActive" visible="false" classid="clsid:F4B25887-127F-46A9-BF75-30332B826B51">
        </object>
    </div>
    </form>
</body>
</html>