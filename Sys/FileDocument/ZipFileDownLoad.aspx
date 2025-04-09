<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ZipFileDownLoad.aspx.cs" Inherits="Zhongsoft.Portal.Sys.FileDocument.ZipFileDownLoad"
    MasterPageFile="~/UI/Master/ObjectEditor.Master" Title="批量下载页面" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <script type="text/javascript">
        //关闭,关闭前不带提示框（“你查看的网页正在试图关闭标签页”）
        function closePage() {
            newwin = window.open("", "_parent", "");
            newwin.close();
        }
    </script>
</asp:Content>


