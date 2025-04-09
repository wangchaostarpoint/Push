<%@ Page Language="C#" AutoEventWireup="true" Title="在线预览" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="OnlineEdit.aspx.cs" Inherits="Zhongsoft.Portal.TestSubSys.List.OnlineEdit" %>

<%@ Register Src="~/Sys/Workflow/Controls/FormAttachmentView.ascx" TagName="FormAttachmentView"
    TagPrefix="uc3" %>
<asp:Content ID="Content5" ContentPlaceHolderID="toolBtn" runat="server">
    <link rel="stylesheet" type="text/css" href="../../Themes/Styles/form.css" />
    <script type="text/javascript">
        var $formCtx=<%=FormContext%>;
    </script>
    <zhongsoft:LightFileUploader runat="server" ID="LinkAttachment" EnableTheming="false"
        key="Attachment" CssClass="btn-function" OnClick="btnLoadDoc_Click">
               <span> <img src="../../Themes/Images/btn_f_fujian.gif" title="上传" /><br />上传</span>
    </zhongsoft:LightFileUploader>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="listGrid" runat="server">
    <div class="form-content-b" id="formAttachment" width="100%">
        <uc3:FormAttachmentView ID="FormAttachmentView" runat="server" />
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
