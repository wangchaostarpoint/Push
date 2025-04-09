<%@ Page Title="选择扩展权限" Language="C#" MasterPageFile="~/UI/Master/ObjectSelector.Master"
    AutoEventWireup="true" CodeBehind="ExAclSelector.aspx.cs" Inherits="Zhongsoft.Portal.Sys.Acl.ExAclSelector" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolTip" runat="server">
    在搜索文本框中填写人员相关信息可以快速找到你要选择的扩展权限。
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    扩展权限名称
    <asp:TextBox ID="tbName" runat="server" Width="150px" MaxLength="60"></asp:TextBox>
    <asp:DropDownList runat="server" Width="150px" ID="ddlModule">
    </asp:DropDownList>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvExAction" AllowPaging="true"
        PageSize="10" runat="server" AutoGenerateColumns="false" BindGridViewMethod="BindGrid"
        OnJsonClick="addObject" JsonClickMode="onclick">
        <Columns>
            <asp:BoundField DataField="ModuleName" HeaderText="模块名称" HeaderStyle-Width="30%">
            </asp:BoundField>
            <asp:BoundField DataField="ActionName" HeaderText="扩展权限名称"></asp:BoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
