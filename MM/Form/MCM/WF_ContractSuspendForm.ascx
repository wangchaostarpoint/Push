<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ContractSuspendForm.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.Form.MCM.WF_ContractSuspendForm" %>
<%@ Register TagPrefix="uc3" TagName="UCContractRelProjectInfo" Src="../../UI/Controls/UCContractRelProjectInfo.ascx" %>
<%@ Register TagPrefix="uc4" TagName="UCContractRelFile" Src="../../UI/Controls/UCContractRelFile.ascx" %>
<%@ Import Namespace="Zhongsoft.Portal" %>
<table class="tz-table">
    <tr>
        <td class="td-l">
            合同编号
        </td>
        <td class="td-l">
            <zhongsoft:XHtmlInputText ID="txtContractCode" runat="server" type="text" class="kpms-textbox"
                style="width: 120px" tablename="MCM_CONTRACTSUSPENDFORM" field="CONTRACTCODE"
                readonly="readonly" activestatus="(23.填写相关信息)(3.修改相关信息)" />
        </td>
        <td class="td-l">
            合同名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtContractName" field="CONTRACTNAME"
                tablename="MCM_CONTRACTSUSPENDFORM" activestatus="(2.填写相关信息)" SourceMode="SelectorPage"
                ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" EnableTheming="false"
                PageWidth="850" Writeable="false" ShowAttrs="name,UserCode" ResultForControls="{'hiContractID':'id','txtContractCode':'CONTRACTCODE','txtHadCompleteValue':'HADCOMPLETEVALUE','txtHadCharge':'HADCHARGE','txtContractAmount':'CONTRACTVALUE','hiNotBuild':'NOTBUILD'}"
                OnClick="btnSelectContract_OnClick" Filter="{IsReturn:'1'}" PageUrl="~/MM/Obsolete/ContractSelector.aspx"
                req="1"></zhongsoft:LightObjectSelector>
            <input id="hiContractID" type="hidden" field="CONTRACTID" runat="server" tablename="MCM_CONTRACTSUSPENDFORM" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            合同总额(万元)
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtContractAmount" tablename="MCM_CONTRACTSUSPENDFORM"
                readonly="readonly" class="kpms-textbox-money" field="CONTRACTVALUE" activestatus="(23.填写相关信息)(3.修改相关信息)" />
        </td>
        <td class="td-l">
            已收费(万元)
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtHadCharge" field="HADCHARGE" tablename="MCM_CONTRACTSUSPENDFORM"
                class="kpms-textbox-money" readonly="readonly" activestatus="(23.填写相关信息)(3.修改相关信息)">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l" nowrap>
            已完成合同额(万元)
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtHadCompleteValue" tablename="MCM_CONTRACTSUSPENDFORM"
                readonly="readonly" class="kpms-textbox-money" field="HADCOMPLETEVALUE" activestatus="(23.填写相关信息)(3.修改相关信息)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            是否中止合同<span class="req-star">*</span>
        </td>
        <td colspan="5" class="td-m">
            <asp:RadioButtonList runat="server" ID="rbIsSuspension" field="ISSUSPENSION" tablename="MCM_CONTRACTSUSPENDFORM"
                req="1" activestatus="(3.总经理批准)" RepeatDirection="Horizontal">
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr class="trProject">
        <td class="td-m" colspan="6" height="25" style="font-weight: bold; text-align: center">
            合同关联项目
        </td>
    </tr>
    <tr id="Tr1" runat="server" class="trProject">
        <td colspan="6">
            <uc3:UCContractRelProjectInfo ID="ucRelProjectInfo" runat="server"></uc3:UCContractRelProjectInfo>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            中止原因<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbSuspensionReason" CssClass="kpms-textarea" runat="server"
                TextMode="MultiLine" EnableTheming="false" maxtext="512" tablename="MCM_CONTRACTSUSPENDFORM"
                req="1" field="SUSPENSIONRENSON" ActiveStatus="(23.填写相关信息)(3.修改相关信息)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            备注
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbMemo" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                EnableTheming="false" maxtext="512" tablename="MCM_CONTRACTSUSPENDFORM" field="MEMO"
                ActiveStatus="(23.填写相关信息)(3.修改相关信息)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <uc4:UCContractRelFile ID="ucContractRelFile" runat="server"></uc4:UCContractRelFile>
        </td>
    </tr>
</table>
<!---流程主键ID-->
<input type="hidden" runat="server" id="hiContractSuspendFormID" field="CONTRACTSUSPENDFORMID"
    tablename="MCM_CONTRACTSUSPENDFORM" />
<!----记录要中止的合同是否 生产不立项----->
<input type="hidden" runat="server" id="hiNotBuild" field="NOTBUILD" tablename="MCM_CONTRACTSPLITFORM" />
<script>
    function initCustomerPlugin() {
        //验证正则表达式
        checkRegex();
        //验证文本框输入长度
        checkMaxLength();
        accessOfProjectDisplay();
        accessOfAddProDisplay();
        accessOfFileAddDisplay();
    }

    //当合同只是 生产不立项时，不显示关联项目信息
    function accessOfProjectDisplay() {
        var isNotBuild = $("#<%=hiNotBuild.ClientID %>").val();
        if (isNotBuild == "<%=(int)BoolType.是 %>") {
            $('.trProject').hide();
        }
    }
</script>
