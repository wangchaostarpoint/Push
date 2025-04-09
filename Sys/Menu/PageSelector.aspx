<%@ Page Title="页面选择" Language="C#" MasterPageFile="~/UI/Master/ObjectSelector.Master"
    AutoEventWireup="true" CodeBehind="PageSelector.aspx.cs" Inherits="Zhongsoft.Portal.Sys.PageSelector" %>

<%@ Register Assembly="Zhongsoft.Portal.UI.Controls" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<asp:Content ID="Content3" ContentPlaceHolderID="toolTip" runat="server">
    在搜索文本框中填写页面相关信息可以快速找到你要选择的页面。
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                页面类型
            </td>
            <td>
                <asp:DropDownList runat="server" ID="ddlType" Width="100px">
                </asp:DropDownList>
            </td>
            <td>
                页面名称
            </td>
            <td>
                <asp:TextBox ID="tbName" MaxLength="20" runat="server" Width="100px"></asp:TextBox>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <table class="tz-table">
        <tr>
            <td width="35%" valign="top" class="selector-tree">
                <div style="overflow-x: auto; height: 300px">
                    <asp:TreeView ID="treMenu" runat="server" OnSelectedNodeChanged="tvMenuTree_SelectedNodeChanged"
                        Height="100%" Width="100%" ShowLines="false">
                        <SelectedNodeStyle BackColor="#F7F7F7" />
                    </asp:TreeView>
                </div>
            </td>
            <td valign="top">
                <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvList" AllowPaging="true"
                    PageSize="10" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true"
                    BindGridViewMethod="LoadData" OnJsonClick="addObject" AllowSorting="true" JsonClickMode="onclick">
                    <Columns>
                        <asp:BoundField HeaderStyle-Width="40%" DataField="PageName" HeaderText="页面名称" SortExpression="PageName" />
                        <asp:BoundField HeaderStyle-Width="60%" DataField="PageUrl" HeaderText="URL" />
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
</asp:Content>
