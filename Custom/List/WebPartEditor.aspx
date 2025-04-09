<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="WebPartEditor.aspx.cs" Inherits="Zhongsoft.Portal.Custom.List.WebPartEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                部件名称<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox runat="server" ID="tbName" req="1"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
</asp:Content>
