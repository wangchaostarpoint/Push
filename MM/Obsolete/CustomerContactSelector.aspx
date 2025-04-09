<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerContactSelector.aspx.cs" Title="选择联系人"
    Inherits="Zhongsoft.Portal.MM.Obsolete.CustomerContactSelector" MasterPageFile="~/UI/Master/ObjectSelector.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                <%--  <asp:Label runat="server" ID="lblCustomerName" Text="客户名称"></asp:Label>
                <asp:TextBox ID="tbCustomerName" MaxLength="10" runat="server" Width="120px"></asp:TextBox>--%>
                联系人姓名<asp:TextBox ID="tbContacterName" MaxLength="10" runat="server" Width="120px"></asp:TextBox>
            </td>
            <td>
                <asp:LinkButton runat="server" ID="btnNew" OnClick="btnNew_Click" OnClientClick="return AddItem()">
                               <span>新建</span>
                </asp:LinkButton>
            </td>
        </tr>
    </table>
    <asp:Button runat="server" ID="btnAddCallBack" OnClick="btnAddCallBack_OnClick" Visible="False"/>
    <script type="text/javascript" language="javascript">
        function AddItem() {
            var param = { actionType: 2, CustomerID: "<%=CustomerID %>" };
            var url = buildQueryUrl("/MM/List/CRM/CustomerContacterEditor.aspx", param);
            var dom = showDivDialog(url, "", 610, 330, addCallBack);
            return false;
        }

        function addCallBack() {
            <%=Page.ClientScript.GetPostBackEventReference(this.btnAddCallBack,"") %>
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvContacterList" AllowPaging="true"
        PageSize="10" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true"
        BindGridViewMethod="DoSelectByFilter" OnJsonClick="addObject" JsonClickMode="onclick"
        ShowJsonRowColName="true">
        <Columns>
            <asp:BoundField DataField="ContacterName" HeaderText="姓名" />
            <asp:BoundField DataField="Post" HeaderText="职务" />
            <asp:BoundField DataField="PHONE" HeaderText="电话" />
            <asp:BoundField DataField="MOBILEPHONE" HeaderText="手机号码" />
            <%-- <asp:BoundField DataField="FAX" HeaderText="传真" />--%>
            <asp:BoundField DataField="EMAIL" HeaderText="邮箱" />
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
