<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AclPage.aspx.cs" Inherits="Zhongsoft.Portal.Custom.List.AclPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <iframe runat="server" id="iframeSpace" frameborder="0" width="100%" height="100%">
    </iframe>
    </form>
    <script>


        function initCustomerPlugin() {

            setSize();
        }

        window.onresize = function () {
         
            setSize();
        }

        function setSize() {
            $('#iframeSpace').height($(window.frameElement).height()-2);
            $('#iframeSpace').width($(window.frameElement).width());
        }
    </script>
</body>
</html>
