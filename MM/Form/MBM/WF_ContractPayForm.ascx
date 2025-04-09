<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ContractPayForm.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.Form.MBM.WF_ContractPayForm" %>
<%@ Import Namespace="Zhongsoft.Portal.MM.Entity" %>
<table class="tz-table">
    <tr>
        <td class="td-l">费用名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox runat="server" ID="tbCostName" field="CostName" tablename="MM_ContractPay"
                req="1" MaxLength="32" activestatus="(23.填写付款审批单)"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l">日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtApplyDate" field="ApplyDate" IsReadOnly="true"
                class="kpms-textbox-date" readonly="readonly" activestatus="(23.填写付款审批单)" tablename="MM_ContractPay">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">合同名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtContractName" IsMutiple="false"
                SelectPageMode="Dialog" EnableTheming="false" Text="选择合同" PageWidth="850" PageUrl="../../Obsolete/ContractSelector.aspx"
                ResultForControls="{'hiContractID':'id','txtContractCode':'ContractCode','hiContractValue':'ContractValue',
                'txtContractValue':'ContractValue','hiAlreadyPay':'HadPay','txtAlreadyPay':'HadPay','tbPayeeFullName':'PayeeFullName','tbAccountInfo':'AccountAndBank'}"
                OnClick="txtContractName_Click"
                ShowJsonRowColName="true" ResultAttr="name" tablename="MM_ContractPay" Filter="{BaseType:1}"
                field="ContractName" activestatus="(23.填写付款审批单)" />
            <input type="hidden" id="hiContractID" name="hiContractID" runat="server" field="ContractID"
                tablename="MM_ContractPay" />
        </td>
        <td class="td-l">合同编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtContractCode" readonly="readonly"
                class="kpms-textbox" activestatus="(23.填写付款审批单)" field="ContractCode" tablename="MM_ContractPay">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr flag="releContract">
        <td class="flexible" colspan="6">
            <span>关联收费合同</span> &nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr flag="releContract">
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvContract" runat="server" UseDefaultDataSource="true" permissionstatus="true"
                DataKeyNames="ReleChargeContractID">
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="60px">
                        <ItemTemplate>
                            <%# Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField DataField="ContractCode" HeaderText="合同编号" ItemStyle-Width="100px">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="ContractName" HeaderText="合同名称" ItemStyle-Width="100px">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="ContractValue" HeaderText="合同金额（万元）" DataFormatString="{0:F2}" ItemStyle-HorizontalAlign="Right">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="HadCharge" HeaderText="已收费（万元）" DataFormatString="{0:F2}" ItemStyle-HorizontalAlign="Right">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="CharePercent" HeaderText="已收费比例" DataFormatString="{0:P2}" ItemStyle-HorizontalAlign="Right">
                    </zhongsoft:LightBoundField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr>
        <td class="td-l">结合合同条件说明需付款理由<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbPayReason" runat="server" TextMode="MultiLine" MaxLength="1024" req="1"
                field="PayReason" tablename="MM_ContractPay" activestatus="(23.填写付款审批单)" CssClass="kpms-textarea"
                EnableTheming="false"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">本月计划付款额（万元）<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbThisMonthPlanPay" EnableTheming="false" req="1"
                CssClass="kpms-textbox-money" DataType="Decimal2" activestatus="(23.填写付款审批单)"></zhongsoft:LightTextBox>
            <input type="hidden" runat="server" id="hiThisMonthPlanPay" field="ThisMonthPlanPay"
                tablename="MM_ContractPay" />
        </td>
        <td class="td-l">合同总价（万元）<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtContractValue" activestatus="(23.填写付款审批单)" req="1" readonly="readonly"
                class="kpms-textbox-money" />
            <input type="hidden" runat="server" id="hiContractValue" field="ContractValue"
                tablename="MM_ContractPay" />
        </td>
        <td class="td-l">发票是否填开
        </td>
        <td class="td-r">
            <asp:CheckBox ID="cbIsHaveInvoice" activestatus="(23.填写付款审批单)"
                runat="server" field="IsHaveInvoice" tablename="MM_ContractPay"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">本次拟付款额（万元）<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox runat="server" ID="tbThisPlanPay" EnableTheming="false" req="1"
                CssClass="kpms-textbox-money" DataType="Decimal2" activestatus="(23.填写付款审批单)"></zhongsoft:LightTextBox>
            <input type="hidden" runat="server" id="hiThisPlanPay" field="ThisPlanPay"
                tablename="MM_ContractPay" />
        </td>
        <td class="td-l">占合同比例
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtThisPlanPer" activestatus="(23.填写付款审批单)" readonly="readonly"
                class="kpms-textbox-money" />
            %
        </td>
    </tr>
    <tr>
        <td class="td-l">扣税金或其他（万元）<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbOther" EnableTheming="false" req="1"
                CssClass="kpms-textbox-money" DataType="Decimal2" activestatus="(23.填写付款审批单)"></zhongsoft:LightTextBox>
            <input type="hidden" runat="server" id="hiOther" field="Other"
                tablename="MM_ContractPay" />
        </td>
    </tr>
    <tr>
        <td class="td-l">本次实际付款额（万元）<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbThisFactPay" EnableTheming="false" req="1"
                CssClass="kpms-textbox-money" DataType="Decimal2" activestatus="(23.付款)"></zhongsoft:LightTextBox>
            <input type="hidden" runat="server" id="hiThisFactPay" field="ThisFactPay"
                tablename="MM_ContractPay" />
        </td>
    </tr>
    <tr>
        <td class="td-l">累计付款额（万元）
        </td>
        <td class="td-m" colspan="3">
            <table style="width: 100%; border: none">
                <tr flag="ZB">
                    <td class="td-l">已支付</td>
                    <td class="td-l">本次付款</td>
                    <td class="td-l">累计付款</td>
                </tr>
                <tr>
                    <td class="td-r" flag="general">
                        <zhongsoft:XHtmlInputText runat="server" ID="txtAlreadyPay" activestatus="(23.填写付款审批单)" readonly="readonly"
                            class="kpms-textbox-money" />
                        <input type="hidden" runat="server" id="hiAlreadyPay" field="AlreadyPay"
                            tablename="MM_ContractPay" /></td>
                    <td class="td-r" flag="ZB">
                        <zhongsoft:XHtmlInputText runat="server" ID="txtThisPayZB" activestatus="(23.填写付款审批单)" readonly="readonly"
                            class="kpms-textbox-money" />
                    </td>
                    <td class="td-r" flag="ZB">
                        <zhongsoft:XHtmlInputText runat="server" ID="txtTotalPayZB" activestatus="(23.填写付款审批单)" readonly="readonly"
                            class="kpms-textbox-money" />
                    </td>
                </tr>
            </table>
        </td>
        <td class="td-l">占合同比例
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtAlreadyPer" activestatus="(23.填写付款审批单)" readonly="readonly"
                class="kpms-textbox-money" />
            %
        </td>
    </tr>
    <tr>
        <td class="td-l">收款人全称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbPayeeFullName" field="PayeeFullName" tablename="MM_ContractPay"
                req="1" MaxLength="128" activestatus="(23.填写付款审批单)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">账号及开户行<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbAccountInfo" field="AccountInfo" tablename="MM_ContractPay"
                req="1" MaxLength="128" activestatus="(23.填写付款审批单)"></zhongsoft:LightTextBox>
        </td>
    </tr>
</table>
<input runat="server" type="hidden" id="hiContractPayID" tablename="MM_ContractPay"
    field="ContractPayID" />
<input runat="server" type="hidden" id="hiReleContractCount" />
<input type="hidden" id="hiFormType" name="hiFormType" field="FormType"
    tablename="MM_ContractPay" runat="server" />
<script type="text/javascript">
    function initCustomerPlugin() {
        computeThisPayPer();
        $('#<%=tbThisPlanPay.ClientID%>').bind('blur', function () {
            computeThisPayPer();
            computeAlChargePer();
        })
        $('#<%=tbThisFactPay.ClientID%>').bind('blur', function () {
            computeAlChargePer();
        })
        computeAlChargePer();
        initReleContract();
        initZBinfo();
    }

    //计算本次计划付款占合同比例
    function computeThisPayPer() {
        var amount = $('#<%=txtContractValue.ClientID%>').val();
        var thisPlanPay = $('#<%=tbThisPlanPay.ClientID%>').val();
        if (thisPlanPay != "" && amount != "" && amount != 0) {
            var percent = (100 * parseFloat(thisPlanPay) / parseFloat(amount)).toFixed(2);
            $('#<%=txtThisPlanPer.ClientID%>').val(percent);
        }
    }

    //计算已付款占合同比例
    function computeAlChargePer() {
        var amount = $('#<%=txtContractValue.ClientID%>').val();
        var alreadyPay = $('#<%=txtAlreadyPay.ClientID%>').val();
        var formType = $('#<%=hiFormType.ClientID%>').val();
        if (formType != "<%=PayFormType.总包工程付款审批单.GetHashCode().ToString()%>") {
            if (alreadyPay != "" && amount != "" && amount != 0) {
                var percent = (100 * parseFloat(alreadyPay) / parseFloat(amount)).toFixed(2);
                $('#<%=txtAlreadyPer.ClientID%>').val(percent);
            }
        }
        else {
            var thisPay = 0;
            var thisPlanPay = $('#<%=tbThisPlanPay.ClientID%>').val();
            var thisFactPay = $('#<%=tbThisFactPay.ClientID%>').val();
            if (thisPlanPay != "") {
                thisPay = thisPlanPay;
            }
            if (thisFactPay != "") {
                thisPay = thisFactPay;
            }
            $('#<%=txtThisPayZB.ClientID%>').val(thisPay);
            if (alreadyPay != "") {
                var totalPay = (parseFloat(thisPay) + parseFloat(alreadyPay)).toFixed(2);
                $('#<%=txtTotalPayZB.ClientID%>').val(totalPay);
                if (totalPay != "" && amount != "" && amount != 0) {
                    var percent = (100 * parseFloat(totalPay) / parseFloat(amount)).toFixed(2);
                    $('#<%=txtAlreadyPer.ClientID%>').val(percent);
                }
            }
        }
    }

    //控制关联合同显隐，有则展示
    function initReleContract() {
        if ($('#<%=hiReleContractCount.ClientID%>').val() != 0) {
            $('[flag = "releContract"]').show();
        }
        else {
            $('[flag = "releContract"]').hide();
        }
    }

    //加载总包相关信息
    function initZBinfo() {
        var formType = $('#<%=hiFormType.ClientID%>').val();
        if (formType != "<%=PayFormType.总包工程付款审批单.GetHashCode().ToString()%>") {
            $('[flag = "ZB"]').hide();
            $('[flag = "general"]').attr("style", "border: none!important");
        }
        else {
            $('[flag = "ZB"]').show();
        }
    }
</script>
