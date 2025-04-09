<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    CodeBehind="FileEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.WBS.FileEditor" %>

<%@ Register Src="~/EPMS/UI/WBS/FileInfoDetail.ascx" TagName="FileInfoDetail" TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <uc1:FileInfoDetail ID="FileInfoDetail" runat="server" />
    <input id="hiKeyID" type="hidden" tablename="FileItemEntity" field="FileItemID" runat="server" />
</asp:Content>
