<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FileView.aspx.cs" Title="文件查看" Inherits="Zhongsoft.Portal.TSM.List.TM.FileView" MasterPageFile="~/UI/Master/ObjectList.Master"%>

<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server" Visible="false">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server" Visible="false">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server" Visible="false">

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <uc1:AttachmentView ID="AttaListFile" runat="server" RepeatColumns="1"/>
</asp:Content>
