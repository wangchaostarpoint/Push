<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ReceiptIssuedForm.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.Form.MM.WF_ReceiptIssuedForm" %>
<script type="text/javascript" src="<%=WebAppPath %>/UI/Script/dataformat.js"></script>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">
            单据编号
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText ID="txtBillNo" runat="server" Field="BILLNO" readonly="readonly"
                class="kpms-textbox" tablename="FM_RECEIPTISSUED" Activestatus="(23.填写申请单)(3.修改申请单)">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            申请部门<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <input id="hiApplyDeptID" type="hidden" runat="server" field="APPLYDEPTID" tablename="FM_RECEIPTISSUED" />
            <zhongsoft:XHtmlInputText ID="txtApplyDept" runat="server" Field="APPLYDEPTNAME"
                TableName="FM_RECEIPTISSUED" readonly="readonly" class="kpms-textbox" Activestatus="(23.填写申请单)">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
            申请人<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <input id="hiApplyUserID" type="hidden" runat="server" field="APPLYUSERID" tablename="FM_RECEIPTISSUED" />
            <input id="hiApplyUserCode" type="hidden" runat="server" field="APPLYUSERCODE" tablename="FM_RECEIPTISSUED" />
            <zhongsoft:XHtmlInputText runat="server" ID="txtApplyUserName" Field="APPLYUSERNAME"
                req="1" class="kpms-textbox" tablename="FM_RECEIPTISSUED" activestatus="(23.填写申请单)"
                readonly="readonly">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            收款类型<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlRecTypeName" runat="server" Field="RECEIVABLESTYPEID"
                req="1" TableName="FM_RECEIPTISSUED" Activestatus="(23.填写申请单)(3.修改申请单)" RepeatDirection="Horizontal">
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l">
            收据编号<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtReceiptCode" runat="server" Field="RECEIPTCODE"
                req="1" class="kpms-textbox" tablename="FM_RECEIPTISSUED" Activestatus="(23.开具收据)">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            申请日期<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtApplyDate" runat="server" readonly="readonly" class="kpms-textbox-date"
                req="1" TableName="FM_RECEIPTISSUED" Field="APPLYDATE" Activestatus="(23.填写申请单)">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
            交款日期<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtPayMentTime" runat="server" class="kpms-textbox-date"
                readonly="readonly" req="1" TableName="FM_RECEIPTISSUED" Field="PAYMENTTIME"
                Activestatus="(23.填写申请单)(3.修改申请单)">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            交款单位<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox type="text" ID="tbPayCorp" runat="server" field="PAYCORP"
                MaxLength="64" req="1" tablename="FM_RECEIPTISSUED" activestatus="(23.填写申请单)(3.修改申请单)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            银行账户
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbBankName" runat="server" type="text" tablename="FM_RECEIPTISSUED"
                field="BANKNAME" content="company" activestatus="(23.填写申请单)(3.修改申请单)" class="kpms-textbox"
                MaxLength="32" />
        </td>
        <td class="td-l">
            银行账号
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbBankAccount" runat="server" type="text" Regex="^\d+$"
                ErrMsg="账号只能填写数字" tablename="FM_RECEIPTISSUED" content="company" field="BANKACCOUNT"
                activestatus="(23.填写申请单)(3.修改申请单)" MaxLength="50" class="kpms-textbox" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            交款金额<br />
            (大写/元)
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtLargePayMent" runat="server" class="kpms-textbox"
                readonly="readonly" Activestatus="(23.填写申请单)(3.修改申请单)" Field="LARGEPAYMENT" TableName="FM_RECEIPTISSUED">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
            交款金额<br />
            (小写/元）<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbSmallPayMent" runat="server" regex="(^[1-9]\d{0,9}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)"
                errmsg="用户输入必填填写数字，并且小数点前最多保留10位，小数点后最多保留2位" MaxLength="13" Style="text-align: right"
                req="1" CssClass="kpms-textbox-money" TableName="FM_RECEIPTISSUED" Field="SMALLPAYMENT"
                Activestatus="(23.填写申请单)(3.修改申请单)">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            收款事由<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="7">
            <zhongsoft:LightTextBox ID="txtReceivAbleReson" TableName="FM_RECEIPTISSUED" Activestatus="(23.填写申请单)(3.修改申请单)"
                req="1" Field="RECEIVABLEREASON" runat="server" CssClass="kpms-textarea" EnableTheming="false"
                Width="94%" maxtext="1024" TextMode="MultiLine">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
    </tr>
</table>
<!---流程主键ID--->
<input type="hidden" runat="server" id="hiReceiptIssuedId" tablename="FM_RECEIPTISSUED"
    field="RECEIPTISSUEDID" />
<script type="text/javascript">
    function initCustomerPlugin() {
        //验证正则表达式
        checkRegex();
        //验证正则表达式
        checkMaxLength();

        //交款金额填写后，转换大写金额
        $("#<%=tbSmallPayMent.ClientID %>").live("blur", function () {
            convertToCHNMoney("<%=tbSmallPayMent.ClientID %>", "<%=txtLargePayMent.ClientID %>");
        })
    }
</script>
