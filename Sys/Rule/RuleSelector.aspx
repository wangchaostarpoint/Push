<%@ Page Title="选择规则" Language="C#" MasterPageFile="~/UI/Master/ObjectSelector.Master"
    AutoEventWireup="true" CodeBehind="RuleSelector.aspx.cs" Inherits="Zhongsoft.Portal.Sys.Rule.RuleSelector" %>

<asp:Content ID="Content3" ContentPlaceHolderID="toolTip" runat="server">
    在搜索文本框中填写相关信息可以快速找到你要选择的规则。
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                编号/名称
            </td>
            <td>
                <asp:TextBox ID="tbTableInfo" runat="server" EnableViewState="true" MaxLength="60"></asp:TextBox>
            </td>
            <td>
                类型
            </td>
            <td>
                <asp:DropDownList runat="server" ID="ddlRuleype">
                </asp:DropDownList>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvList" AllowPaging="true"
        PageSize="10" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true"
        OnRowCommand="gvList_RowCommand" OnRowDataBound="gvList_RowDataBound" OnJsonClick="addObject"
        JsonClickMode="onclick">
        <Columns>
            <asp:BoundField HeaderText="规则名称" DataField="RuleName" />
            <asp:BoundField HeaderText="规则编号" DataField="RuleCode" />
            <asp:TemplateField HeaderText="规则类型">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lblType"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
