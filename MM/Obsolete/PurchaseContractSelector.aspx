<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PurchaseContractSelector.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.Obsolete.PurchaseContractSelector" MasterPageFile="~/UI/Master/ObjectSelector.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                采购合同名称
                <zhongsoft:LightTextBox ID="tbName" runat="server" Width="120px"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvList" AllowPaging="true"
        PageSize="10" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true"
        BindGridViewMethod="DoSelectByFilter" OnJsonClick="addObject" JsonClickMode="onclick"
        ShowJsonRowColName="true">
        <Columns>
            <zhongsoft:LightBoundField DataField="CONTRACTTYPENAME" HeaderText="采购合同类型">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="CONTRACTNAME" HeaderText="采购合同名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="UNDERTAKEUSERNAME" HeaderText="采购合同承办人">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="APPLYNAME" HeaderText="采购申请部门">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="UNDERTAKEDEPTNAME" HeaderText="合同承办部门">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
