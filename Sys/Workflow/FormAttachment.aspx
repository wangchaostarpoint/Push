<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormAttachment.aspx.cs" 
MasterPageFile="~/UI/Master/ObjectCfg.Master"  Inherits="Zhongsoft.Portal.Sys.Workflow.FormAttachment" %>

<%@ Register Src="Controls/FormAttachmentView.ascx" TagName="FormAttachmentView"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolTip" runat="server">
    <link rel="stylesheet" type="text/css" href="../../Themes/Styles/form.css" />
    <div style="width: 100%; text-align: right">
        <zhongsoft:LightFileUploader runat="server" ID="LinkAttachment" key="Attachment"
            OnClick="LinkAttachment_Click" CssClass="btn-link" EnableTheming="true" Draggable="true">
               <span> 上传附件</span></zhongsoft:LightFileUploader></div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="topBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <div style="padding-top: 5px">
        <uc1:FormAttachmentView ID="FormAttachmentView" runat="server" />
    </div>
    <script>
        function formAttachmentAspReturn() {
            parent.returnValue = '1';
        }
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="bottomBar" runat="server">
</asp:Content>
