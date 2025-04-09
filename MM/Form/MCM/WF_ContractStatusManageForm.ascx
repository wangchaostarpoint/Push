<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ContractStatusManageForm.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.Form.MCM.WF_ContractStatusManageForm" %>
<table class="tz-table">
    <tr>
        <td class="td-l">
            合同编号
        </td>
        <td class="td-l">
            <zhongsoft:XHtmlInputText ID="txtContractCode" runat="server" type="text" class="kpms-textbox"
                style="width: 120px" tablename="MCM_CONTRACTSTATEFROM" field="CONTRACTCODE" readonly="readonly"
                activestatus="(23.填写合同状态相关信息)(3.修改合同状态相关信息)" />
        </td>
        <td class="td-l">
            合同名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtContractName" field="CONTRACTNAME"
                tablename="MCM_CONTRACTSTATEFROM" activestatus="(2.填写合同状态相关信息)" SourceMode="SelectorPage"
                ResultAttr="name" ShowAttrs="name,UserCode" ShowJsonRowColName="true" DoCancel="true"
                PageWidth="850" ResultForControls="{'hiContractID':'id','txtContractCode':'CONTRACTCODE','txtHadCompleteValue':'HADCOMPLETEVALUE','txtChangeSettleValue':'CHANGESETTLEVALUE','txtHadCharge':'HADCHARGE','txtContractAmount':'CONTRACTVALUE'}"
                Filter="{IsReturn:'1'}" PageUrl="~/MM/Obsolete/ContractSelector.aspx" EnableTheming="false"
                Writeable="false" OnClick="btnSelectContract_OnClick" req="1"></zhongsoft:LightObjectSelector>
            <input id="hiContractID" type="hidden" field="CONTRACTID" runat="server" tablename="MCM_CONTRACTSTATEFROM" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            合同总额(万元)
        </td>
        <td>
            <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtContractAmount" tablename="MCM_CONTRACTSTATEFROM"
                readonly="readonly" class="kpms-textbox-money" field="CONTRACTVALUE" activestatus="(23.填写合同状态相关信息)(3.修改合同状态相关信息)" />
        </td>
        <td class="td-l">
            已完成合同额(万元)
        </td>
        <td class="td-l">
            <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtHadCompleteValue" tablename="MCM_CONTRACTSTATEFROM"
                readonly="readonly" class="kpms-textbox-money" field="HADCOMPLETEVALUE" activestatus="(23.填写合同状态相关信息)(3.修改合同状态相关信息)" />
        </td>
        <td class="td-l">
            变更/结算/批概合同额（万元）
        </td>
        <td class="td-l">
            <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtChangeSettleValue" tablename="MCM_CONTRACTSTATEFROM"
                readonly="readonly" class="kpms-textbox-money" field="CHANGESETTLEVALUE" activestatus="(23.填写合同状态相关信息)(3.修改合同状态相关信息)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            合同收费额（万元）
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtHadCharge" tablename="MCM_CONTRACTSTATEFROM"
                readonly="readonly" class="kpms-textbox-money" field="HADCHARGE" activestatus="(23.填写合同状态相关信息)(3.修改合同状态相关信息)" />
        </td>
        <td class="td-l">
            合同状态<span class="req-star" id="span1">*</span>
        </td>
        <td class="td-m" colspan="3">
            <asp:RadioButtonList runat="server" ID="rbContractExeState" field="CONTRACTEXESTATE"
                tablename="MCM_CONTRACTSTATEFROM" req="1" RepeatDirection="Horizontal" activestatus="(23.填写合同状态相关信息)(3.修改合同状态相关信息)(3.经营副总经理审批)">
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            状态说明<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbEndReason" CssClass="kpms-textarea" runat="server"
                req="1" TextMode="MultiLine" EnableTheming="false" maxtext="512" tablename="MCM_CONTRACTSTATEFROM"
                field="STATEEXPLAIN" ActiveStatus="(23.填写合同状态相关信息)(3.修改合同状态相关信息)(3.经营副总经理审批)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            备注
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbMemo" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                EnableTheming="false" maxtext="512" tablename="MCM_CONTRACTSTATEFROM" field="MEMO"
                ActiveStatus="(23.填写合同状态相关信息)(3.修改合同状态相关信息)(3.经营副总经理审批)"></zhongsoft:LightTextBox>
        </td>
    </tr>
</table>
<!---流程主键ID--->
<input type="hidden" runat="server" id="hiContractStateFormID" field="CONTRACTSTATEFROMID"
    tablename="MCM_CONTRACTSTATEFROM" />
<script>
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
    }

    function checkForm() {
        return true;
    }

   
</script>
