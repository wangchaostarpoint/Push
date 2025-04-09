<%@ Page Title="收费节点" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master" AutoEventWireup="true" CodeBehind="ContractChargePointDetail.aspx.cs" Inherits="Zhongsoft.Portal.MM.List.MCM.ContractChargePointDetail" %>

<%@ Import Namespace="Zhongsoft.Portal.ACL" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="kpms-table" style="width: 100%" flag="update">
        <tr>
            <td ishidden="1" align="right" class="kpms-rollist-hand" id="tdAdd" runat="server">新增
                <zhongsoft:LightTextBox ID="tbNum" runat="server" onblur="CheckCnt(this)" ToolTip="请输入1-10之间的整数"
                    Width="30" Text="1"></zhongsoft:LightTextBox>条节点
                <asp:Button runat="server" ID="btnQuery" Text="确定" OnClientClick="return CheckTbNum();" OnClick="btnQuery_OnClick" />
            </td>
        </tr>
    </table>
    <zhongsoft:LightPowerGridView runat="server" ID="gvList" UseDefaultDataSource="True" BindGridViewMethod="BindData" AllowPaging="True" PageSize="15"
        OnRowDataBound="gvList_OnRowDataBound" OnRowCommand="gvList_OnRowCommand">
        <Columns>
            <zhongsoft:LightBoundField HeaderText="合同名称" DataField="ContractName" ItemStyle-Width="15%" />
            <zhongsoft:LightBoundField HeaderText="合同额（万元）" DataField="ContractValue" DataFormatString="{0:F6}" ItemStyle-Width="10%" />
            <zhongsoft:LightTemplateField HeaderText="收费节点<span class='req-star'>*</span>" ItemStyle-Width="20%">
                <ItemTemplate>
                    <zhongsoft:LightTextBox runat="server" ID="tbChargePoint" EnableTheming="False" CssClass="kpms-textarea" Rows="3" TextMode="MultiLine" MaxLength="256"
                        Text='<%#Eval("ChargePoint") %>' req="1" />
                    <input type="hidden" runat="server" id="hiChargePointID" value='<%#Eval("ChargePointID") %>' />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="收款<br/>比例（%）<span class='req-star'>*</span>" ItemStyle-Width="8%">
                <ItemTemplate>
                    <zhongsoft:LightTextBox runat="server" ID="tbChargeRate" DataType="Decimal2" EnableTheming="False" CssClass="kpms-textbox-money"
                        Text='<%#Eval("ChargeRate") %>' req="1" onblur="calcCharge(this);" Style="width: 100%" />
                    <input type="hidden" runat="server" id="hidContractValue" value='<%#Eval("ContractValue") %>' />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="已完成节<br/>点比例（%）" ItemStyle-Width="8%">
                <ItemTemplate>
                    <zhongsoft:LightTextBox runat="server" ID="tbCompleteRate" EnableTheming="False" CssClass="kpms-textbox-money" DataType="Decimal2"
                        Text='<%#Eval("CompleteRate") %>' Style="width: 100%" onblur="calcChargeTwo(this);" />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="应收款<br/>（万元）" ItemStyle-Width="8%">
                <ItemTemplate>
                    <zhongsoft:XHtmlInputText runat="server" readonly="readonly" class="kpms-textbox-money" ID="txtShouldCharge" style="width: 100%" />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="预计收款<br/>日期" ItemStyle-Width="10%">
                <ItemTemplate>
                    <zhongsoft:XHtmlInputText runat="server" readonly="readonly" class="kpms-textbox-date" ID="txtEstimatedChargeDate" />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="已收款<br/>（万元）" ItemStyle-Width="8%">
                <ItemTemplate>
                    <zhongsoft:LightTextBox runat="server" ID="tbCharged" DataType="Decimal6" EnableTheming="False" CssClass="kpms-textbox-money" Text='<%#Eval("Charged") %>'
                        onblur="calcMoney(this);" Style="width: 100%" />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="欠款<br/>（万元）" ItemStyle-Width="8%">
                <ItemTemplate>
                    <zhongsoft:XHtmlInputText runat="server" readonly="readonly" class="kpms-textbox-money" ID="txtOverDraft" style="width: 100%" />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <asp:TemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="5%">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtnDelete" EnableTheming="false" CommandName="delData"
                        OnClientClick='return confirm("确定要删除吗？");' CommandArgument='<%#Eval("ChargePointID") %>'>
                        <img alt="删除" title="删除" src="../../../Themes/Images/btn_dg_delete.gif" />
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">

        function initCustomerPlugin() {
            if ("<%=ActionType%>" =="<%=AccessLevel.Read%>") {
                $('[flag="update"]').hide();
            }
        }

        function calcCharge(chargeRate) {
            var totalMoney = 0;
            var tr = $('#<%=gvList.ClientID %>').children('tbody').children('tr');
            for (var i = 0; i < tr.length; i++) {
                if (i == 0 && !isNaN(parseFloat(tr[i].cells[3].children[0].value))) {
                    totalMoney += parseFloat(tr[i].cells[3].children[0].value);
                }
                else if (i > 0 && !isNaN(parseFloat(tr[i].cells[1].children[0].value))) {
                    totalMoney += parseFloat(tr[i].cells[1].children[0].value);
                }
            }
            if (parseFloat(totalMoney) > 100) {
                alert("收款比例总和不可大于100%!");
                chargeRate.value = "";
                chargeRate.parentElement.nextSibling.nextSibling.children[0].value = "";
                chargeRate.parentElement.nextSibling.nextSibling.nextSibling.nextSibling.children[0].value = "";
                chargeRate.parentElement.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.children[0].value = "";
                return;
            }
            var chargeRateValue = chargeRate.value;
            var doneChargeRate = chargeRate.parentElement.nextSibling.children[0].value;
            var contractValue = chargeRate.parentElement.children[1].value;
            var hadCharge = chargeRate.parentElement.nextSibling.nextSibling.nextSibling.nextSibling.children[0].value;
            //应收款金额=合同额*节点收款比例*已完成比例
            if (!isNaN(parseFloat(chargeRateValue)) && !isNaN(parseFloat(contractValue)) && !isNaN(parseFloat(doneChargeRate))) {
                chargeRate.parentElement.nextSibling.nextSibling.children[0].value =
                    parseFloat(parseFloat(contractValue) / 100 * parseFloat(chargeRateValue) * parseFloat(doneChargeRate) / 100).toFixed(6);
                if (!isNaN(parseFloat(hadCharge))) {
                    chargeRate.parentElement.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.children[0].value =
                        parseFloat(parseFloat(chargeRate.parentElement.nextSibling.nextSibling.children[0].value) - parseFloat(hadCharge)).toFixed(6);
                }
            } else {
                chargeRate.parentElement.nextSibling.nextSibling.children[0].value = "";
                chargeRate.parentElement.nextSibling.nextSibling.nextSibling.nextSibling.children[0].value = "";
                chargeRate.parentElement.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.children[0].value = "";
            }
        }

        function calcChargeTwo(doneChargeRate) {
            var doneChargeRateValue = doneChargeRate.value;
            if (parseFloat(doneChargeRateValue) > 100) {
                alert("已完成比例不可大于100%!");
                doneChargeRate.value = "";
                doneChargeRate.parentElement.nextSibling.children[0].value = "";
                doneChargeRate.parentElement.nextSibling.nextSibling.nextSibling.children[0].value = "";
                doneChargeRate.parentElement.nextSibling.nextSibling.nextSibling.nextSibling.children[0].value = "";
                return;
            }
            var chargeRateValue = doneChargeRate.parentElement.previousSibling.children[0].value;
            var contractValue = doneChargeRate.parentElement.previousSibling.children[1].value;
            var hadCharge = doneChargeRate.parentElement.nextSibling.nextSibling.nextSibling.children[0].value;
            //应收款金额=合同额*节点收款比例*已完成比例
            if (!isNaN(parseFloat(chargeRateValue)) && !isNaN(parseFloat(contractValue)) && !isNaN(parseFloat(doneChargeRateValue))) {
                doneChargeRate.parentElement.nextSibling.children[0].value = parseFloat(parseFloat(contractValue) / 100 * parseFloat(chargeRateValue) * parseFloat(doneChargeRateValue) / 100).toFixed(6);
                if (!isNaN(parseFloat(hadCharge))) {
                    doneChargeRate.parentElement.nextSibling.nextSibling.nextSibling.nextSibling.children[0].value =
                        parseFloat(parseFloat(doneChargeRate.parentElement.nextSibling.children[0].value) - parseFloat(hadCharge)).toFixed(6);
                }
            } else {
                doneChargeRate.parentElement.nextSibling.children[0].value = "";
                doneChargeRate.parentElement.nextSibling.nextSibling.nextSibling.children[0].value = "";
                doneChargeRate.parentElement.nextSibling.nextSibling.nextSibling.nextSibling.children[0].value = "";
            }
        }

        function calcMoney(charged) {
            var chargedValue = charged.value;
            var shouldCharge = charged.parentElement.previousSibling.previousSibling.children[0].value;
            if (parseFloat(chargedValue) > parseFloat(shouldCharge)) {
                alert("已收款不可大于应收款");
                charged.value = "";
                return;
            }
            if (!isNaN(parseFloat(shouldCharge)) && !isNaN(parseFloat(chargedValue))) {
                charged.parentElement.nextSibling.children[0].value =
                    parseFloat(parseFloat(shouldCharge) - parseFloat(chargedValue)).toFixed(6);
            } else {
                charged.parentElement.nextSibling.children[0].value = "";
            }
        }

        function CheckTbNum() {

            if ($("#<%=tbNum.ClientID %>").val() == "") {
                alert("请填写要添加的行数");
                return false;
            }
        }

        function CheckCnt(obj) {
            if (obj.value != "") {
                if (isNaN(parseInt(obj.value))) {
                    alert("请输入1-10之间的整数");
                    obj.value = "";
                }
                else {
                    var num = parseInt(obj.value);
                    obj.value = num;
                    if (num < 1 || num > 10) {
                        alert("请输入1-10之间的整数");
                        obj.value = "";
                    }
                }
            }
        }
    </script>
</asp:Content>
