<%@ Page Title="功能区分组编辑" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="RibbonGroupEditor.aspx.cs" Inherits="Zhongsoft.Portal.Custom.List.RibbonGroupEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                标签<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbLabel" runat="server" tablename="PortalRibbonGroup"
                    field="Label" req="1" ActiveStatus="(23.*)" MaxLength="50"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                图标
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbIcon" runat="server" tablename="PortalRibbonGroup"
                    field="Icon"  ActiveStatus="(23.*)" MaxLength="50"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                作用范围<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <asp:DropDownList runat="server" ID="ddlScope" ActiveStatus="(23.*)" tablename="PortalRibbonGroup"
                    req="1" field="Scope">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                排序<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbSort" runat="server" tablename="PortalRibbonGroup"
                    field="Sort" req="1" ActiveStatus="(23.*)" MaxLength="4"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiGroupId" tablename="PortalRibbonGroup"
        field="GroupId" />
    <input type="hidden" runat="server" id="hiParentId" tablename="PortalRibbonGroup"
        field="ParentId" />
</asp:Content>
