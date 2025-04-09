<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SupplierSelector.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.Obsolete.SupplierSelector" MasterPageFile="~/UI/Master/ObjectSelector.Master"
    Title="选择供应商" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>供应商名称
                <zhongsoft:LightTextBox ID="tbSupplierName" runat="server" Width="120px"></zhongsoft:LightTextBox>
            </td>
            <td>
                <asp:LinkButton runat="server" ID="btnNew" OnClientClick="return AddItem()">
                              <span>新建</span>
                </asp:LinkButton>
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
            <zhongsoft:LightBoundField DataField="SupplyName" HeaderText="供应商名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ContactPerson" HeaderText="主要联系人">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="CompanyPhone" HeaderText="单位电话">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <asp:Button ID="btnResetList" runat="server" Visible="false" OnClick="btnResetList_OnClick" />
    <script type="text/javascript" language="javascript">
        function AddItem() {
            var param = { actionType: 2 };
            var url = buildQueryUrl("/MM/List/CRM/SupplyEditor.aspx", param);
            showDivDialog(url, "", 1000, 600, resetList);
            return false;
        }
        //弹出层callback方法
        function resetList() {
            <%=Page.ClientScript.GetPostBackEventReference(this.btnResetList,"") %>
        }
    </script>
</asp:Content>
