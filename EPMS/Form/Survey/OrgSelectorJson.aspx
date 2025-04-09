<%@ Page Title="选择部门" MasterPageFile="~/UI/Master/ObjectSelector.Master" Language="C#"
    AutoEventWireup="true" CodeBehind="OrgSelectorJson.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.Form.Survey.OrgSelectorJson" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    部门名称<asp:TextBox ID="tbOrgName" MaxLength="10" runat="server" Width="120px"></asp:TextBox>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="OrgsList" AllowPaging="true"
        PageSize="10" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true"
        OnRowCommand="OrgsList_RowCommand" OnJsonClick="addObject" JsonClickMode="onclick"
        ShowJsonRowColName="true">
        <Columns>
            <asp:BoundField DataField="OrgUnitCode" HeaderText="部门编号"></asp:BoundField>
            <asp:BoundField DataField="OrgUnitName" HeaderText="部门名称"></asp:BoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script>
        function initCustomerPlugin() {

            $("#<%=this.tbOrgName.ClientID %>").autocomplete({
                source: function (request, response) {
                    $.getJSON("JsonSelectorHandler.ashx", {
                        term: request.term + ',unit'
                    }, response);
                },
                minLength: 1,
                select: function (event, ui) {
                    if (ui.item) {
                        $("#<%=tbOrgName.ClientID %>").attr("value", ui.item.value);
                    }
                }
            });
        }
    
    </script>
</asp:Content>
