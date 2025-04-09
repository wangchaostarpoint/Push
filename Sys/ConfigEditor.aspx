<%@ Page Title="系统配置" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="ConfigEditor.aspx.cs" Inherits="Zhongsoft.Portal.Sys.ConfigEditor" %>

<%@ Register Assembly="Zhongsoft.Portal.UI.Controls" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <zhongsoft:PropertyGrid runat="server" ID="grid" CssClass="tz-table" CellNameClass="td-l"
        CellValueClass="td-m" CategoryClass="tz-title">
    </zhongsoft:PropertyGrid>
</asp:Content>
