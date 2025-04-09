<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_HandleMarginForm.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.Form.MM.WF_HandleMarginForm" %>
<script type="text/javascript" src="<%=WebAppPath %>/UI/Script/dataformat.js"></script>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">
            申请人<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <input id="hiApplyUserID" type="hidden" runat="server" field="APPLYUSERID" tablename="FM_HANDLEMARGIN" />
            <input id="hiApplyUserCode" type="hidden" runat="server" field="APPLYUSERCODE" tablename="FM_HANDLEMARGIN" />
            <zhongsoft:XHtmlInputText ID="txtApplyUserName" runat="server" class="kpms-textbox"
                req="1" Field="APPLYUSERNAME" TableName="FM_HANDLEMARGIN" readonly="readonly"
                Activestatus="(23.填写申请单)">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
            发送部门<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <input id="hiApplyDeptID" type="hidden" runat="server" field="APPLYDEPTID" tablename="FM_HANDLEMARGIN" />
            <zhongsoft:XHtmlInputText ID="txtApplyDept" runat="server" readonly="readonly" req="1"
                Field="APPLYDEPTNAME" TableName="FM_HANDLEMARGIN" class="kpms-textbox" Activestatus="(23.填写申请单)">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
            申请日期<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtApplyDate" runat="server" readonly="readonly" class="kpms-textbox-date"
                req="1" Field="APPLYDATE" TableName="FM_HANDLEMARGIN" Activestatus="(23.填写申请单)(3.修改申请单)">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            保函工程名称<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbGuaranteeProject" runat="server" req="1" Field="GUARANTEEPROJECT"
                TableName="FM_HANDLEMARGIN" CssClass="kpms-textbox" Activestatus="(23.填写申请单)(3.修改申请单)">
            </zhongsoft:LightTextBox>
        </td>
        <td class="td-l">
            保函种类<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlGuaranteeType" runat="server" Activestatus="(23.填写申请单)"
                req="1" Field="GUARANTEETYPEID" TableName="FM_HANDLEMARGIN" RepeatDirection="Horizontal">
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l">
            保函格式<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlGuaranteeForm" runat="server" Activestatus="(23.填写申请单)"
                req="1" Field="GUARANTEEFORMID" TableName="FM_HANDLEMARGIN" RepeatDirection="Horizontal">
            </zhongsoft:LightDropDownList>
        </td>
    </tr>
    <tr>
        <td class="td-l" nowrap>
            保函金额(大写/万元)
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtLargePayMent" runat="server" class="kpms-textbox"
                readonly="readonly" Activestatus="(23.填写申请单)(3.修改申请单)" Field="GUARANTEEVALUE"
                TableName="FM_HANDLEMARGIN">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l" nowrap="nowrap">
            保函金额(小写/万元)
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbSmallPayMent" runat="server" regex="^([1-9]\d{0,7}|[0])(\.\d{1,6})?$"
                errmsg="保函金额请输入正数，最多8位整数，6位小数" MaxLength="13" Style="text-align: right" CssClass="kpms-textbox-money"
                TableName="FM_HANDLEMARGIN" Field="GUARANTEEVALUESMALL" Activestatus="(23.填写申请单)(3.修改申请单)">
            </zhongsoft:LightTextBox>
        </td>
        <td class="td-l">
            保函期限(月)<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbGuaranteeTerm" runat="server" req="1" Field="GUARANTEETERM"
                TableName="FM_HANDLEMARGIN" regex="^\d*$" errmsg="字数只能填写正整数" Style="text-align: right"
                CssClass="kpms-textbox" Activestatus="(23.填写申请单)(3.修改申请单)">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            受益人名称<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbBeneficiaryName" runat="server" req="1" Field="BENEFICIARYNAME"
                TableName="FM_HANDLEMARGIN" CssClass="kpms-textbox" Activestatus="(23.填写申请单)(3.修改申请单)">
            </zhongsoft:LightTextBox>
        </td>
        <td class="td-l">
            受益人联系电话<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbBeneficiaryPhone" runat="server" Field="BENEFICIARYPHONE"
                regex="(^1[3-9]{1}[0-9]{9}$)|(^0[1-9]{2,3}\-[0-9]{7,8}$)" errmsg="输入的联系电话出错！请重新输！"
                TableName="FM_HANDLEMARGIN" CssClass="kpms-textbox" Activestatus="(23.填写申请单)(3.修改申请单)">
            </zhongsoft:LightTextBox>
        </td>
        <td class="td-l">
        </td>
        <td class="td-r">
        </td>
    </tr>
    <tr>
        <td class="td-l">
            受益人地址<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbBeneficiaryAddress" runat="server" req="1" Field="BENEFICIARYADDRESS"
                TableName="FM_HANDLEMARGIN" Width="96.5%" CssClass="kpms-textbox" Activestatus="(23.填写申请单)(3.修改申请单)">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            备注
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbMemo" TableName="FM_HANDLEMARGIN" Activestatus="(23.填写申请单)(3.修改申请单单)"
                Field="MEMO" runat="server" CssClass="kpms-textarea" EnableTheming="false" maxtext="1024"
                Width="96.5%" TextMode="MultiLine">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
</table>
<!---流程主键ID--->
<input runat="server" type="hidden" id="hiHandleMarginID" field="HANDLEMARGINID"
    tablename="FM_HANDLEMARGIN" />
<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();

        //交款金额填写后，转换大写金额
        $("#<%=tbSmallPayMent.ClientID %>").live("blur", function () {
            var small = $("#<%=tbSmallPayMent.ClientID %>").val();
            var all = accMul(small, 10000);
            $("#<%=txtLargePayMent.ClientID %>").val(convertNum(all));
        });

    }
</script>
