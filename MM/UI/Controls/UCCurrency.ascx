<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCCurrency.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.UI.Controls.UCCurrency" %>
<table class="tz-table">
    <tr id="trSure">
        <td colspan="6" style="text-align: right">
            新增<zhongsoft:LightTextBox runat="server" ID="tbInShowNum" Width="50px" regex="^\d+$"
                Style="text-align: right" errmsg="请填写最多两位正整数" MaxLength="2"></zhongsoft:LightTextBox>行
            <asp:Button  EnableTheming="false"  runat="server" ID="btnInSure" OnClick="btnInSure_Click" Text="确定"  OnClientClick="return checkFillNum()"/>
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvCurrencyList" runat="server" DataKeyNames="PRIMARYID"
                OnRowDataBound="gvCurrencyList_RowDataBound" EmptyDataText="" UseDefaultDataSource="true"
                OnRowCommand="gvCurrencyList_RowCommand">
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="币种<span class='req-star'>*</span>">
                        <ItemTemplate>
                            <zhongsoft:LightDropDownList ID="ddlCurrency" runat="server" Width="140px" req="1">
                            </zhongsoft:LightDropDownList>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="汇率<span class='req-star'>*</span>">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbExchange" runat="server" class="kpms-textbox-money"
                                Style="text-align: right; width: 100px" EnableTheming="false" Text='<%#Eval("EXCHANGERATE") %>'
                                req="1" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,6})?$" errmsg="汇率请输入正数，最多8位整数，6位小数"></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="合同额(万元)<span class='req-star'>*</span>">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbContractAmount" runat="server" class="kpms-textbox-money"
                                req="1" EnableTheming="false" Text='<%# Eval("ContractValue") %>' Regex="^([1-9]\d{0,7}|[0])(\.\d{1,6})?$"
                                Style="text-align: right; width: 120px" errmsg="合同额请输入正数，最多8位整数，6位小数"></zhongsoft:LightTextBox><asp:Label
                                    ID="lbUnit" runat="server"></asp:Label>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除">
                    </zhongsoft:LightButtonField>
                </Columns>
                <PagerStyle HorizontalAlign="Right"></PagerStyle>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<input id="hiInitContract" runat="server" type="hidden" />
<script>

    function ucCurrency_Init() {
        $("#<%=gvCurrencyList.ClientID %> [id$=ddlCurrency]").live("change", function () {
            var selected = $(this).find("option:selected");
            var rateAttr = selected.attr("rate");
            var tbExechange = $(this).parent('td').parent('tr').find('[id$=tbExchange]');

            if (tbExechange != undefined) {
                tbExechange.val(rateAttr);
            }
            computeAllValue();
        });

        $("#<%=gvCurrencyList.ClientID %> [id$=tbContractAmount]").live("change", function () { computeAllValue(); });
        $("#<%=gvCurrencyList.ClientID %> [id$=tbExchange]").live("change", function () { computeAllValue(); });
    }

    //计算合同额信息
    function computeAllValue() {
        var sumValue = 0;

        $("#<%=gvCurrencyList.ClientID %> [id$=ddlCurrency]").each(function () {
            var tbExechange = $(this).parent('td').parent('tr').find('[id$=tbExchange]');
            var tbContractAmount = $(this).parent('td').parent('tr').find('[id$=tbContractAmount]');
            var exechangeVal = tbExechange.val();
            var contractAmount = tbContractAmount.val();
            if (tbExechange != null && tbContractAmount != null) {
                contractAmount = floatParse(contractAmount);
                exechangeVal = floatParse(exechangeVal);
                sumValue = accAddFloat6(accDivLeaveNum(accMul(exechangeVal, accMul(contractAmount, 10000, 2)), 10000, 6), sumValue);
            }
        });
        if ($('#<%=hiInitContract.ClientID %>').val() != "") {
            //要赋值的控件信息
            var payCtrls = $('#<%=hiInitContract.ClientID %>').val().split('|');
            $("#" + payCtrls[0]).val(sumValue);
        }
    }
    //确定行是否隐藏
    function accessOfSureDisplay(isHide) {
        if (isHide) {
            $("#trSure").hide();
        }
        else {
            $("#trSure").show();
        }
    }

    //获取币种金额行数
    function getCurrencyNum() {
        var count = 0;
        $("#<%=gvCurrencyList.ClientID %> [id$=ddlCurrency]").each(function () {
            var tbExchange = $(this).parent('td').parent('tr').find('[id$=tbExchange]');
            var tbContractAmount = $(this).parent('td').parent('tr').find('[id$=tbContractAmount]');
            if ($(this).val() != "" && tbExchange.val() != "" && tbContractAmount.val() != "") {
                count = count + 1;
            }
        });
        return count;
    }

    function checkFillNum() {
        var fillNum = $("#<%=tbInShowNum.ClientID %>").val();
        if (fillNum == "") {
            alert("请输入要添加的行数");
            return false;
        }
        return true;
    }
</script>
