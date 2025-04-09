<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DashboardPlaceHolder.aspx.cs"
    ValidateRequest="false" Inherits="Zhongsoft.Portal.Custom.List.DashboardPlaceHolder" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
  
    <style>
        .list td
        {
            word-break: normal !important;
            white-space: normal !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style=" width:100%;">
        <asp:PlaceHolder ID="ctrlPlace" runat="server"></asp:PlaceHolder>
    </div>
    <script>
        $(window).ready(function () { $('#divload_' + self.frameElement.id, window.parent.document).hide(); });
    </script>
    </form>
</body>
</html>
