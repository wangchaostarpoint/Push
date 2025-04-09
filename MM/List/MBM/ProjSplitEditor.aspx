<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjSplitEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.List.MBM.ProjSplitEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    Title="项目拆分详细" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table class="tz-table">
        <tr>
            <td align="center" style="font-weight: bold" colspan="6">
                采购合同额拆分
            </td>
        </tr>
        <tr>
            <td class="td-l">
                是否拆分<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <asp:RadioButtonList ID="rblIsSplit" runat="server" RepeatDirection="Horizontal"
                    field="ISSPLIT" tablename="MBM_PROJECTDETAIL" activestatus="(23.*)">
                    <asp:ListItem Value="0" Selected="True">拆</asp:ListItem>
                    <asp:ListItem Value="1">不拆</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
    </table>
    <table class="tz-table">
        <tr split="1">
            <td>
                <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:DataList ID="dlProj" runat="server" RepeatColumns="3" RepeatDirection="Horizontal"
                            Width="100%">
                            <ItemTemplate>
                                <table>
                                    <tr>
                                        <td class="td-l">
                                            <asp:Label runat="server" ID="lblTitle" Text='<%#Eval("PHASEPROJNAME") %>'></asp:Label>
                                            <input type="hidden" runat="server" id="hiDetailID" value='<%#Eval("PROJEXPENDID") %>' />
                                        </td>
                                        <td class="td-r">
                                            <zhongsoft:LightTextBox ID="tbMoney" runat="server" regex="(^[1-9]\d{0,9}(\.\d{1,6})?$)|(^[0]\.\d{1,6}$)"
                                                errmsg="请输入正数，最多8位整数、6位小数！" CssClass="kpms-textbox-money" EnableTheming="false"
                                                money="1" onblur="totalMoney()" Text='<%#Eval("PHASEPROJMONEY") %>' />
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:DataList>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <table>
        <tr split="1">
            <td class="td-l">
                合计（万元）
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbTotal" CssClass="kpms-textbox-money" content="1" ReadOnly="true"
                    EnableTheming="false" activestatus="(23.*)" runat="server">
                </zhongsoft:LightTextBox>
                <input type="hidden" id="hiTotal" runat="server" field="TOTAL" content="1" tablename="MBM_PROJECTDETAIL" />
            </td>
        </tr>
        <tr split="1">
            <td align="center" style="font-weight: bold" colspan="6">
                付款拆分
            </td>
        </tr>
        <tr split="1">
            <td class="td-l">
                预付款（万元）
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbPrePayment" Field="PREPAYMENT" regex="(^[1-9]\d{0,9}(\.\d{1,6})?$)|(^[0]\.\d{1,6}$)"
                    errmsg="请输入正数，最多8位整数、6位小数！" CssClass="kpms-textbox-money" EnableTheming="false"
                    tableName="MBM_PROJECTDETAIL" activestatus="(23.*)" runat="server" onblur="getImprest(1);"
                    content="1">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                进度款（万元）
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbProjRessPayment" Field="PROGRESSPAYMENT" regex="(^[1-9]\d{0,9}(\.\d{1,6})?$)|(^[0]\.\d{1,6}$)"
                    errmsg="请输入正数，最多8位整数、6位小数！" CssClass="kpms-textbox-money" EnableTheming="false"
                    tableName="MBM_PROJECTDETAIL" activestatus="(23.*)" runat="server" onblur="getPlanChargeItem(0);"
                    onfocusout="getImprest(0);" content="1">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                考核款（万元）
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbExaminePayment" Field="EXAMINEPAYMENT" regex="(^[1-9]\d{0,9}(\.\d{1,6})?$)|(^[0]\.\d{1,6}$)"
                    errmsg="请输入正数，最多8位整数、6位小数！" CssClass="kpms-textbox-money" EnableTheming="false"
                    tableName="MBM_PROJECTDETAIL" activestatus="(23.*)" runat="server" onblur="getImprest(6);"
                    content="1">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr split="1">
            <td class="td-l">
                质保金（万元）
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbGuaranteeMoney" Field="GUARANTEEMONEY" regex="(^[1-9]\d{0,9}(\.\d{1,6})?$)|(^[0]\.\d{1,6}$)"
                    errmsg="请输入正数，最多8位整数、6位小数！" CssClass="kpms-textbox-money" EnableTheming="false"
                    tableName="MBM_PROJECTDETAIL" activestatus="(23.*)" runat="server" onblur="getImprest(7);"
                    content="1">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                采购合同额（万元）
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbPurchaseValue" CssClass="kpms-textbox-money" EnableTheming="false"
                    activestatus="(23.*)" runat="server" ReadOnly="true" content="1">
                </zhongsoft:LightTextBox>
                <input type="hidden" id="hiPurchaseValue" runat="server" field="PURCHASECONTRACTVALUE"
                    content="1" tablename="MBM_PROJECTDETAIL" />
            </td>
        </tr>
        <tr split="1">
            <td align="center" style="font-weight: bold" colspan="6">
                应付款明细
            </td>
        </tr>
        <tr split="1">
            <td class="td-l">
                应预付款（万元）
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbPayableMoney" CssClass="kpms-textbox-money" EnableTheming="false"
                    activestatus="(23.*)" runat="server" ReadOnly="true" onpropertychange="getItemSum()"
                    content="1">
                </zhongsoft:LightTextBox>
                <input type="hidden" id="hiPayableMoney" runat="server" field="PAYABLEMONEY" content="1"
                    tablename="MBM_PROJECTDETAIL" />
            </td>
        </tr>
        <tr split="1">
            <td class="td-l">
                应付款进度一（万元）
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbPrePayScheduleOne" CssClass="kpms-textbox-money" EnableTheming="false"
                    activestatus="(23.*)" runat="server" ReadOnly="true" onpropertychange="getItemSum()"
                    content="1">
                </zhongsoft:LightTextBox>
                <input type="hidden" id="hiPrePayScheduleOne" runat="server" field="PREPAYSCHEDULEONE"
                    content="1" tablename="MBM_PROJECTDETAIL" />
            </td>
            <td class="td-l">
                百分比
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbScheduleOnePercentage" regex="^(\d|[1-9]\d|100)(\.\d{1,2})?$"
                    errmsg="请填写小于等于100的正数，最多保留两位小数！" EnableTheming="false" CssClass="kpms-textbox-money"
                    MaxLength="5" Field="SCHEDULEONEPERCENTAGE" TableName="MBM_PROJECTDETAIL" ActiveStatus="(23.*)"
                    runat="server" onblur="getPlanChargeItem(2);" content="1">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                应付考核款（万元）
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbPayableExaminePayment" ReadOnly="true" CssClass="kpms-textbox-money"
                    EnableTheming="false" activestatus="(23.*)" runat="server" onpropertychange="getItemSum()"
                    content="1">
                </zhongsoft:LightTextBox>
                <input type="hidden" id="hiPayableExaminePayment" runat="server" field="PAYABLEEXAMINEPAYMENT"
                    content="1" tablename="MBM_PROJECTDETAIL" />
            </td>
        </tr>
        <tr split="1">
            <td class="td-l">
                应付款进度二（万元）
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbPrePayScheduleTwo" CssClass="kpms-textbox-money" EnableTheming="false"
                    activestatus="(23.*)" runat="server" ReadOnly="true" onpropertychange="getItemSum()"
                    content="1">
                </zhongsoft:LightTextBox>
                <input type="hidden" id="hiPrePayScheduleTwo" runat="server" field="PREPAYSCHEDULETWO"
                    content="1" tablename="MBM_PROJECTDETAIL" />
            </td>
            <td class="td-l">
                百分比
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbScheduleTwoPercentage" regex="^(\d|[1-9]\d|100)(\.\d{1,2})?$"
                    errmsg="请填写小于等于100的正数，最多保留两位小数！" EnableTheming="false" CssClass="kpms-textbox-money"
                    MaxLength="5" Field="SCHEDULETWOERCENTAGE" TableName="MBM_PROJECTDETAIL" ActiveStatus="(23.*)"
                    runat="server" onblur="getPlanChargeItem(3);" content="1">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                应付质保金（万元）
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbPayableGuaranteeMoney" ReadOnly="true" CssClass="kpms-textbox-money"
                    EnableTheming="false" activestatus="(23.*)" runat="server" onpropertychange="getItemSum()"
                    content="1">
                </zhongsoft:LightTextBox>
                <input type="hidden" id="hiPayableGuaranteeMoney" runat="server" field="PAYABLEGUARANTEEMONEY"
                    content="1" tablename="MBM_PROJECTDETAIL" />
            </td>
        </tr>
        <tr split="1">
            <td class="td-l">
                应付款进度三（万元）
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbPrePayScheduleThree" ReadOnly="true" CssClass="kpms-textbox-money"
                    EnableTheming="false" activestatus="(23.*)" runat="server" onpropertychange="getItemSum()"
                    content="1">
                </zhongsoft:LightTextBox>
                <input type="hidden" id="hiPrePayScheduleThree" runat="server" field="PREPAYSCHEDULETHREE"
                    content="1" tablename="MBM_PROJECTDETAIL" />
            </td>
            <td class="td-l">
                百分比
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbScheduleThreePercentage" regex="^(\d|[1-9]\d|100)(\.\d{1,2})?$"
                    errmsg="请填写小于等于100的正数，最多保留两位小数！" EnableTheming="false" CssClass="kpms-textbox-money"
                    MaxLength="5" Field="SCHEDULETHREEPERCENTAGE" TableName="MBM_PROJECTDETAIL" ActiveStatus="(23.*)"
                    runat="server" onblur="getPlanChargeItem(4);" content="1">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                分项累计应付款（万元）
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbTotalPayableMoney" ReadOnly="true" CssClass="kpms-textbox-money"
                    EnableTheming="false" activestatus="(23.*)" runat="server" content="1">
                </zhongsoft:LightTextBox>
                <input type="hidden" id="hiTotalPayableMoney" runat="server" field="TOTALPAYABLEMONEY"
                    content="1" tablename="MBM_PROJECTDETAIL" />
            </td>
        </tr>
        <tr split="1">
            <td class="td-l">
                应付款进度四（万元）
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbPrePayScheduleFour" ReadOnly="true" CssClass="kpms-textbox-money"
                    EnableTheming="false" activestatus="(23.*)" runat="server" onpropertychange="getItemSum()"
                    content="1">
                </zhongsoft:LightTextBox>
                <input type="hidden" id="hiPrePayScheduleFour" runat="server" field="PREPAYSCHEDULEFOUR"
                    content="1" tablename="MBM_PROJECTDETAIL" />
            </td>
            <td class="td-l">
                百分比
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbScheduleFourPercentage" regex="^(\d|[1-9]\d|100)(\.\d{1,2})?$"
                    errmsg="请填写小于等于100的正数，最多保留两位小数！" EnableTheming="false" CssClass="kpms-textbox-money"
                    MaxLength="5" Field="SCHEDULEFOURPERCENTAGE" TableName="MBM_PROJECTDETAIL" ActiveStatus="(23.*)"
                    runat="server" onblur="getPlanChargeItem(5);" content="1">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input id="hiProjDetailID" runat="server" field="PROJECTDETAILID" name="hiProjDetailID"
        tablename="MBM_PROJECTDETAIL" type="hidden" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            //验证正则表达式
            checkRegex();
            //验证正则表达式
            checkMaxLength();

            //是否拆分，显示不同内容
            var split = $("#<%=rblIsSplit.ClientID %> input[type='radio']:checked").val();
            setControl(split);

            $('#<%=rblIsSplit.ClientID %>').click(function () {
                var isSplit = $("#<%=rblIsSplit.ClientID %> input[type='radio']:checked").val();
                setControl(isSplit);
            })
        }

        //预付款，考核款，质保金填写时，将分项1，6，7自动填写上,计算采购合同款=预付款+考核款+质保金+进度款
        function getImprest(charge) {
            var imprest = $("#<%=tbPrePayment.ClientID %>").val() - 0;
            var checkCharge = $("#<%=tbExaminePayment.ClientID %>").val() - 0;
            var qualityCharge = $("#<%=tbGuaranteeMoney.ClientID %>").val() - 0;
            var planCharge = $("#<%=tbProjRessPayment.ClientID %>").val() - 0;
            if (charge == "1") {
                $("#<%=tbPayableMoney.ClientID %>").val($("#<%=tbPrePayment.ClientID %>").val());
                $("#<%=hiPayableMoney.ClientID %>").val($("#<%=tbPrePayment.ClientID %>").val());
            }
            if (charge == "6") {
                $("#<%=tbPayableExaminePayment.ClientID %>").val($("#<%=tbExaminePayment.ClientID %>").val());
                $("#<%=hiPayableExaminePayment.ClientID %>").val($("#<%=tbExaminePayment.ClientID %>").val());
            }
            if (charge == "7") {
                $("#<%=tbPayableGuaranteeMoney.ClientID %>").val($("#<%=tbGuaranteeMoney.ClientID %>").val());
                $("#<%=hiPayableGuaranteeMoney.ClientID %>").val($("#<%=tbGuaranteeMoney.ClientID %>").val());
            }
            var sum = parseFloat(imprest) + parseFloat(checkCharge) + parseFloat(qualityCharge) + parseFloat(planCharge);
            $("#<%=tbPurchaseValue.ClientID %>").val(parseFloat(sum));
            $("#<%=hiPurchaseValue.ClientID %>").val(parseFloat(sum));
        }

        //按百分比计算进度款的拆分项
        function getPlanChargeItem(ID) {
            var planCharge = $("#<%=tbProjRessPayment.ClientID %>").val() - 0;
            if (planCharge == "") {
                alert("请先填写进度款");
                return false;
            }
            else {
                var itemTwo = $("#<%=tbScheduleOnePercentage.ClientID %>").val() - 0;
                var itemThree = $("#<%=tbScheduleTwoPercentage.ClientID %>").val() - 0;
                var itemFour = $("#<%=tbScheduleThreePercentage.ClientID %>").val() - 0;
                var itemFive = $("#<%=tbScheduleFourPercentage.ClientID %>").val() - 0;
                var sumItem = parseFloat(itemTwo) + parseFloat(itemThree) + parseFloat(itemFour) + parseFloat(itemFive);
                //百分比之和超过100进行处理
                if (sumItem > 100) {
                    if (ID == 2) {
                        $("#<%=tbScheduleOnePercentage.ClientID %>").val("");
                    }
                    if (ID == 3) {
                        $("#<%=tbScheduleTwoPercentage.ClientID %>").val("");
                    }
                    if (ID == 4) {
                        $("#<%=tbScheduleThreePercentage.ClientID %>").val("");
                    }
                    if (ID == 5) {
                        $("#<%=tbScheduleFourPercentage.ClientID %>").val("");
                    }
                    alert("百分比总数不能超过100%!");
                    return false;
                }
                else {
                    //保留两位小数accMul  
                    $("#<%=tbPrePayScheduleOne.ClientID %>").val(accDiv(accMul(itemTwo, planCharge), 100));
                    $("#<%=tbPrePayScheduleTwo.ClientID %>").val(accDiv(accMul(itemThree, planCharge), 100));
                    $("#<%=tbPrePayScheduleThree.ClientID %>").val(accDiv(accMul(itemFour, planCharge), 100));
                    $("#<%=tbPrePayScheduleFour.ClientID %>").val(accDiv(accMul(itemFive, planCharge), 100));
                    $("#<%=hiPrePayScheduleOne.ClientID %>").val(accDiv(accMul(itemTwo, planCharge), 100));
                    $("#<%=hiPrePayScheduleTwo.ClientID %>").val(accDiv(accMul(itemThree, planCharge), 100));
                    $("#<%=hiPrePayScheduleThree.ClientID %>").val(accDiv(accMul(itemFour, planCharge), 100));
                    $("#<%=hiPrePayScheduleFour.ClientID %>").val(accDiv(accMul(itemFive, planCharge), 100));
                }
            }
        }

        //将七个采购分项的值自动做和
        function getItemSum() {
            var item1 = $("#<%=tbPrePayScheduleOne.ClientID %>").val() - 0;
            var item2 = $("#<%=tbPrePayScheduleTwo.ClientID %>").val() - 0;
            var item3 = $("#<%=tbPrePayScheduleThree.ClientID %>").val() - 0;
            var item4 = $("#<%=tbPrePayScheduleFour.ClientID %>").val() - 0;
            var item5 = $("#<%=tbPayableMoney.ClientID %>").val() - 0;
            var item6 = $("#<%=tbPayableExaminePayment.ClientID %>").val() - 0;
            var item7 = $("#<%=tbPayableGuaranteeMoney.ClientID %>").val() - 0;
            var itemSum = parseFloat(item1) + parseFloat(item2) + parseFloat(item3) + parseFloat(item4) + parseFloat(item5) + parseFloat(item6) + parseFloat(item7);
            $("#<%=tbTotalPayableMoney.ClientID %>").val(parseFloat(itemSum).toFixed(2));
            $("#<%=hiTotalPayableMoney.ClientID %>").val(parseFloat(itemSum).toFixed(2));
        }

        function checkForm() {
            if (accSub($("#<%=tbTotal.ClientID %>").val(), $("#<%=tbPurchaseValue.ClientID %>").val()) != 0.00 ||
            accSub($("#<%=tbTotalPayableMoney.ClientID %>").val(), $("#<%=tbPurchaseValue.ClientID %>").val()) != 0.00) {
                alert("合同额与采购合同金额、分项累计应付款三者不相等，请认真填写！");
                return false;
            }

            //            if ($("#<%=tbTotal.ClientID %>").val() != $("#<%=tbPurchaseValue.ClientID %>").val() || $("#<%=tbPurchaseValue.ClientID %>").val() != $("#<%=tbTotalPayableMoney.ClientID %>").val()) {
            //                alert("合同额与采购合同金额、分项累计应付款三者不相等，请认真填写！");
            //                return false;
            //            }
            return true;
        }

        //是否拆分，显示不同内容
        function setControl(split) {
            if (split == "0") {
                var $value = $("[split]");
                var count = $value.length;
                for (var i = 0; i < count; i++) {
                    $($value[i]).show();
                }
            }
            else {
                var $value = $("[split]");
                var count = $value.length;
                for (var i = 0; i < count; i++) {
                    $($value[i]).hide();
                }
                var $value = $("[content]");
                var count = $value.length;
                for (var i = 0; i < count; i++) {
                    $($value[i]).val("");
                }
            }
        }

        //计算合计
        function totalMoney() {
            var money = 0;
            var $value = $("[money]");
            var count = $value.length;
            for (var i = 0; i < count; i++) {
                var value = $($value[i]).val() - 0;
                money = parseFloat(value) + parseFloat(money);
            }
            $("#<%=tbTotal.ClientID %>").val(money);
            $("#<%=hiTotal.ClientID %>").val(money);
        }
    </script>
</asp:Content>
