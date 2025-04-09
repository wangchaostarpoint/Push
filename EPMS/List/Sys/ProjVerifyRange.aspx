<%@ Page Language="C#" AutoEventWireup="true" Title="校审范围" CodeBehind="ProjVerifyRange.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Sys.ProjVerifyRange" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: center;">
        <img id="imgVerify" alt="校审范围" />
    </div>
    <script type="text/javascript">
        function initCustomerPlugin() {
            var root = '<%=WebAppPath %>/Sys/Download/EPMS/';
            if ('<%=VerifyType %>' == 'big') {
                $('#imgVerify').attr('src', root + 'BigProjVerify.png');
            }
            else {
                $('#imgVerify').attr('src', root + 'MidProjVerify.png');
            }
        }
    </script>
    </form>
</body>
</html>
