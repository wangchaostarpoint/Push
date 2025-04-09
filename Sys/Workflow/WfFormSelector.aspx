<%@ Page Title="选择表单" Language="C#" MasterPageFile="~/UI/Master/ObjectSelector.Master"
    AutoEventWireup="true" CodeBehind="WfFormSelector.aspx.cs" Inherits="Zhongsoft.Portal.Sys.Workflow.WfFormSelector" %>

<asp:Content ID="Content3" ContentPlaceHolderID="toolTip" runat="server">
    在搜索文本框中填写相关信息可以快速找到你要选择的表单。
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                表单名称
            </td>
            <td>
                <zhongsoft:LightTextBox runat="server" ID="tbFormName"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvForm" AllowPaging="true"
        ShowJsonRowColName="true" PageSize="10" runat="server" AutoGenerateColumns="false"
        UseDefaultDataSource="true" OnRowCommand="gvForm_RowCommand" OnJsonClick="addObject"
        JsonClickMode="onclick">
        <Columns>
            <asp:BoundField HeaderText="表单Id" DataField="FormId" />
            <asp:BoundField HeaderText="表单名称" DataField="FormName" />
            <asp:BoundField HeaderText="表单类型" DataField="FormType" />
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
