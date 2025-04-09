<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PublishCostInfo.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Publish.PublishCostInfo" %>
<style type="text/css">
    .list table, .list table td
    {
        border-spacing: 0px !important;
        border-collapse: collapse !important;
        border: #b9d1f1 1px solid !important;
    }
</style>
<table class="tz-table" width="100%" id="CostInfo">
    <tr id="trleader">
        <td class="flexible" onclick="openDetail('projCost')">
            <span id="projInfo1">费用项目列表</span>&nbsp<asp:Label ID="lbSum" runat="server" Visible="false" />
            &nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
</table>
<table class="tz-table" width="100%" id="projCost">
    <tr>
        <td colspan="4">
            <zhongsoft:LightPowerGridView ID="gvList" runat="server" ShowFooter="false" UseDefaultDataSource="true"
                PageSize="10" AutoGenerateColumns="false" Width="100%" DataKeyNames="PublishCostItemID"
                EmptyDataText="没有费用项目信息" OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand"
                BindGridViewMethod="UserControl.BindInfo" ShowExport="true">
                <Columns>
                    <asp:TemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="40px">
                        <ItemTemplate>
                            <%#((GridViewRow)Container).DataItemIndex + 1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <zhongsoft:LightBoundField DataField="CostItemName" HeaderText="费用项目名称">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="UnitName" HeaderText="规格单位" HeaderStyle-Width="10%">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="是否加长" HeaderStyle-Width="15%" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="lbIsLengthen" runat="server" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="单价（元）" HeaderStyle-Width="8%">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbPrice" runat="server" Regex="^([1-9]\d{0,2}|[0])(\.\d{1,2})?$"
                                content="price" errmsg="单价必须填写数字，最多3位整数，2位小数" MaxLength="6" CssClass="kpms-textbox-money"
                                EnableTheming="false" Text='<%# DataBinder.Eval(Container.DataItem, "Price") %>'>
                            </zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="数量" HeaderStyle-Width="8%">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbAmount" runat="server" Regex="^([1-9]\d{0,4}|[0])(\.\d{1,2})?$"
                                content="amount" errmsg="数量必须填写数字，最多5位整数，2位小数" MaxLength="8" CssClass="kpms-textbox-money"
                                EnableTheming="false" Text='<%# DataBinder.Eval(Container.DataItem, "Amount") %>'>
                            </zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="金额（元）" HeaderStyle-Width="8%">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText ID="txtSum" runat="server" MaxLength="6" class="kpms-textbox-money"
                                readonly="readonly" content="sum" EnableTheming="false" value='<%# DataBinder.Eval(Container.DataItem, "Sum") %>'>
                            </zhongsoft:XHtmlInputText>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" CausesValidation="false"
                        DeleteText="确认删除该记录吗？" Visible="false" />
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<script type="text/javascript">
    function initCostPlugin() {
        $("#<%=gvList.ClientID %>").find("[id$=tbPrice]").live("blur", function () { total($(this)); });
        $("#<%=gvList.ClientID %>").find("[id$=tbAmount]").live("blur", function () { total($(this)); });
    }

    //金额
    function total(obj) {
        var price = 0;
        var amount = 0;
        var sum = 0;
        //单价
        var $price = $(obj).parent('td').parent('tr').find('input[content="price"]');
        //数量
        var $amount = $(obj).parent('td').parent('tr').find('input[content="amount"]');
        //金额
        var $sum = $(obj).parent('td').parent('tr').find('input[content="sum"]');

        if ($price != null) {
            price = $price.val();
            if (price == "") {
                price = 0;
            }
        }
        if ($amount != null) {
            amount = $amount.val();
            if (amount == "") {
                amount = 0;
            }
        }

        //金额
        sum = parseFloat(price) * parseFloat(amount);
        sum = parseFloat(sum).toFixed(2);
        $sum.val(sum);
    }
</script>
