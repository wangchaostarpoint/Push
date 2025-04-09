<%@ Page Language="C#" AutoEventWireup="true" Title="选择部门" MasterPageFile="~/UI/Master/ObjectSelector.Master"
    CodeBehind="OrgSelectorJson.aspx.cs" Inherits="Zhongsoft.Portal.Sys.OrgUsers.OrgSelectorJson" %>

<%@ Register Src="~/UI/Controls/OrgTree.ascx" TagName="OrgTree" TagPrefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    部门名称<asp:TextBox ID="tbOrgName" MaxLength="10" runat="server" Width="120px"></asp:TextBox>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">

    <table class="tz-table">
        <tr>
            <td width="38%" valign="top" class="selector-tree" style="display: none">
                <div style="overflow-x: auto; height: 400px !important">
                    <uc:OrgTree ID="orgTree" Flag="1" runat="server" />
                </div>
            </td>
            <td valign="top">
                <zhongsoft:LightPowerGridView BindJsonClick="true" ID="OrgsList" AllowPaging="true"
                    PageSize="10" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true"
                    OnRowCommand="OrgsList_RowCommand" OnJsonClick="addObject" JsonClickMode="onclick"
                    ShowJsonRowColName="true">
                    <Columns>
                        <asp:BoundField DataField="OrgUnitCode" HeaderText="部门编号" Visible="false"></asp:BoundField>
                        <asp:BoundField DataField="OrgUnitName" HeaderText="部门名称"></asp:BoundField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>

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

            //传参显示左侧树，否则只能显示二级部门，无法选择三级部门 tianhl 20190427
            var showTreeVal = '<%=ShowTree%>';
            //弹出层，url拼接有问题，会在?showTree=1后面又拼接了?xxxxyy
            if (showTreeVal.indexOf('?') > -1)
                showTreeVal = showTreeVal.substring(0, showTreeVal.indexOf('?'));
            if (showTreeVal == '1') {
                $('.selector-tree').show();
            }
        }

    </script>
</asp:Content>
