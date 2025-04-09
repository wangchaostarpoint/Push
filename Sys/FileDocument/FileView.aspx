<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FileView.aspx.cs" Inherits="Zhongsoft.Portal.Sys.FileDocument.FileView" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>文档预览</title>
    
    
</head>
<body>
 <script>

     var $currUserName = "<%=KPMSUser.UserName %>";
     var $fileUri = "/FileDownloadHandler.ashx?fileId=<%=FileId %>";
     var $fileType = "<%=FileType %>";
     function initCustomerPlugin() {
         if ($fileType == ".xlsx"
        || $fileType == ".xls")
             openExcel($fileUri);
         else
             openWord($fileUri);
     }
     </script>
    <form id="form1" runat="server">
     <div style="width: 100%;">
        <object id="dsoFrame" width="100%" height="95%" classid="CLSID:00460182-9E5E-11D5-B7C8-B8269041DD57"
            codebase="/Portal/Sys/Download/dsoframer.ocx#version=2, 3, 0, 1" viewastext>
            <param name="_ExtentX" value="32015">
            <param name="_ExtentY" value="21167">
            <param name="BorderColor" value="-2147483632">
            <param name="BackColor" value="-2147483643">
            <param name="ForeColor" value="-2147483640">
            <param name="TitlebarColor" value="-2147483635">
            <param name="TitlebarTextColor" value="-2147483634">
            <param name="BorderStyle" value="0">
            <param name="Titlebar" value="0">
            <param name="Toolbars" value="0">
            <param name="Menubar" value="0">
        </object>
    </div>
    </form>
     <script type="text/javascript" src="/Portal/UI/script/form.dsoframer.js"></script>
</body>
</html>
