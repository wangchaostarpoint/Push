<%@ Page Title="数据实体选择" Language="C#" MasterPageFile="~/UI/Master/ObjectSelector.Master"
    AutoEventWireup="true" CodeBehind="DictSelector.aspx.cs" Inherits="Zhongsoft.Portal.BDM.List.DictSelector" %>

<%@ Register Assembly="Zhongsoft.Portal.UI.Controls" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                连接
                <asp:DropDownList runat="server" ID="ddlDataCon" Width="100px" EnableTheming="false">
                </asp:DropDownList>
                模块
                <asp:DropDownList runat="server" ID="ddlModule" Width="100px" EnableTheming="false">
                </asp:DropDownList>
                类型
                <asp:DropDownList runat="server" ID="ddlType" Width="100px" EnableTheming="false">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                编号<asp:TextBox ID="tbTable" MaxLength="20" runat="server" Width="100px"></asp:TextBox>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolTip" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvList" AllowPaging="true"
        PageSize="10" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true"
        OnRowCommand="gvList_RowCommand" OnJsonClick="addObject" JsonClickMode="onclick">
        <Columns>
            <asp:BoundField DataField="DictName" HeaderText="表名" ItemStyle-Width="30%" />
            <asp:BoundField DataField="DictCode" HeaderText="表编号" ItemStyle-Width="30%" />
            <asp:BoundField DataField="ModuleName" HeaderText="所属模块" ItemStyle-Width="30%" />
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
