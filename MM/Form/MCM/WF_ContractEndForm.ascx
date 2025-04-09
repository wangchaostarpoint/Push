<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ContractEndForm.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.Form.MCM.WF_ContractEndForm" %>
<%@ Register TagPrefix="uc1" TagName="UCContractRelFile" Src="../../UI/Controls/UCContractRelFile.ascx" %>
<%@ Register TagPrefix="uc3" TagName="UCContractRelProjectInfo" Src="../../UI/Controls/UCContractRelProjectInfo.ascx" %>
<script type="text/javascript" src="<%=WebAppPath %>/FM/UI/Script/FMGeneralScript.js"></script>
<%@ Import Namespace="EDPortal.BLL.MM" %>
<%@ Import Namespace="Zhongsoft.Portal.ACL" %>
<%@ Import Namespace="Zhongsoft.Portal" %>
<table class="tz-table">
    <tr>
        <td class="td-l">
            合同名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtContractName" field="CONTRACTNAME"
                tablename="MCM_CONTRACTENDFORM" activestatus="(2.拟定合同草稿)" SourceMode="SelectorPage"
                ResultAttr="name" ShowAttrs="name,UserCode" ShowJsonRowColName="true" DoCancel="true"
                SelectPageMode="Dialog" ResultForControls="{'hiContractID':'id','txtContractCode':'CONTRACTCODE','txtHadCompleteValue':'HADCOMPLETEVALUE','txtChangeSettleValue':'CHANGESETTLEVALUE','txtHadCharge':'HADCHARGE','txtContractAmount':'CONTRACTVALUE','hiNotBuild':'NOTBUILD','txtCONTRACTPROJTYPE':'CONTRACTPROJTYPE'}"
                PageUrl="~/MM/Obsolete/ContractSelector.aspx" EnableTheming="false" PageWidth="850"
                Writeable="false" OnClick="btnSelectContract_OnClick" req="1"></zhongsoft:LightObjectSelector>
            <input id="hiContractID" type="hidden" field="CONTRACTID" runat="server" tablename="MCM_CONTRACTENDFORM" />
        </td>
        <td class="td-l">
            合同编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtContractCode" runat="server" type="text" class="kpms-textbox"
                tablename="MCM_CONTRACTENDFORM" field="CONTRACTCODE" readonly="readonly" activestatus="(23.拟定合同草稿)(3.修改合同草稿)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            合同总额(万元)
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtContractAmount" tablename="MCM_CONTRACTENDFORM"
                readonly="readonly" class="kpms-textbox-money" field="CONTRACTVALUE" activestatus="(23.拟定合同草稿)(3.修改合同草稿)" />
        </td>
        <td class="td-l">
            已完成合同额(万元)
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtHadCompleteValue" tablename="MCM_CONTRACTENDFORM"
                readonly="readonly" class="kpms-textbox-money" field="HADCOMPLETEVALUE" activestatus="(23.拟定合同草稿)(3.修改合同草稿)" />
        </td>
        <td class="td-l">
            变更/结算/批概合同额（万元）
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtChangeSettleValue" tablename="MCM_CONTRACTENDFORM"
                readonly="readonly" class="kpms-textbox-money" field="CHANGESETTLEVALUE" activestatus="(23.拟定合同草稿)(3.修改合同草稿)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            合同收费额（万元）
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtHadCharge" tablename="MCM_CONTRACTENDFORM"
                readonly="readonly" class="kpms-textbox-money" field="HADCHARGE" activestatus="(23.拟定合同草稿)(3.修改合同草稿)" />
        </td>
        <td class="td-l">
            收费是否结清<span class="req-star" id="span1">*</span>
        </td>
        <td class="td-r">
            <asp:RadioButtonList runat="server" ID="rbChargeState" field="CHARGESTATE" tablename="MCM_CONTRACTENDFORM"
                req="1" RepeatDirection="Horizontal" activestatus="(23.拟定合同草稿)(3.修改合同草稿)">
            </asp:RadioButtonList>
        </td>
        <td class="td-l">
            终止日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtEndDate" field="ENDDATE" tabelname="MCM_CONTRACTENDFORM"
                activestatus="(23.拟定合同草稿)(3.修改合同草稿)" class="kpms-textbox-date" readonly="readonly">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            收费总额（万元）<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbChargeAmount" runat="server" class="kpms-textbox-money"
                field="CHARGEAMOUNT" tablename="MCM_CONTRACTENDFORM" req="1" EnableTheming="false"
                Regex="^([1-9]\d{0,7}|[0])(\.\d{1,6})?$" activestatus="(23.拟定合同草稿)(3.修改合同草稿)"
                Style="text-align: right; width: 120px" errmsg="收费总额请输入正数，最多8位整数，6位小数"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l">
            评审方式<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlCheckMode" runat="server" field="CHECKMODE" tablename="MCM_CONTRACTENDFORM"
                req="1" activestatus="(3.审核)">
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l">
            评审时间
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtCheckDate" tablename="MCM_CONTRACTENDFORM"
                readonly="readonly" class="kpms-textbox-date" field="CHECKDATE" compare="1" activestatus="(3.审核)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">合同项目类型</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtCONTRACTPROJTYPE" tablename="MCM_CONTRACTENDFORM"
                readonly="readonly" class="kpms-textbox" field="CONTRACTPROJTYPE" compare="1" activestatus="(23.拟定合同草稿)(3.修改合同草稿)" />
        </td>
        <td class="td-m" colspan="4">
        </td>
    </tr>
    <tr id="trClearDate">
        <td class="td-l">
            结清日期<span class="req-star" id="span2">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:XHtmlInputText runat="server" ID="txtClearDate" field="CLEARDATE" tabelname="MCM_CONTRACTENDFORM"
                activestatus="(23.拟定合同草稿)(3.修改合同草稿)" class="kpms-textbox-date" readonly="readonly">
            </zhongsoft:XHtmlInputText>
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
            终止原因<span class="req-star" id="spanReason">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbEndReason" CssClass="kpms-textarea" runat="server"
                TextMode="MultiLine" EnableTheming="false" maxtext="512" tablename="MCM_CONTRACTENDFORM"
                field="ENDREASON" ActiveStatus="(23.拟定合同草稿)(3.修改合同草稿)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            备注
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbMemo" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                EnableTheming="false" maxtext="512" tablename="MCM_CONTRACTENDFORM" field="MEMO"
                ActiveStatus="(23.拟定合同草稿)(3.修改合同草稿)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <uc1:UCContractRelFile ID="ucContractRelFile" runat="server"></uc1:UCContractRelFile>
        </td>
    </tr>
</table>
<!---流程主键ID--->
<input type="hidden" runat="server" id="hiContractEndFormID" field="CONTRACTENDFORMID"
    tablename="MCM_CONTRACTENDFORM" />
<!----记录要中止的合同是否 生产不立项----->
<input type="hidden" runat="server" id="hiNotBuild" />
<script>
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
        accessOfFileAddDisplay();
        accessOfProjectDisplay();
        accessOfAddProDisplay();
        accessOfClearDate();
        $("#<%=rbChargeState.ClientID %>").live("change", function () { changeDisplayOfReasonReq(); accessOfClearDate() });
        //如果选中 结清，则结清日期必填
    }

    //收费未结清，终止原因必填
    function changeDisplayOfReasonReq() {
        var state = $("#<%=rbChargeState.ClientID %> input:checked").val();
        if (state == "<%=MMEnum.ChargeState.已清.ToString() %>") {
            $("#spanReason").hide();
            $("#<%=tbEndReason.ClientID %>").removeAttr("req");

        }
        else {
            $("#spanReason").show();
            $("#<%=tbEndReason.ClientID %>").attr("req", "1");
        }
    }

    function accessOfClearDate() {
        var state = $("#<%=rbChargeState.ClientID %> input:checked").val();
        if (state == "<%=MMEnum.ChargeState.已清.ToString() %>") {
            //结清日期必填
            $("#trClearDate").show();
            $("#<%=txtClearDate.ClientID %>").attr("req", "1");
        }
        else {
            $("#trClearDate").hide();
            $("#<%=txtClearDate.ClientID %>").removeAttr("req");
            $("#<%=txtClearDate.ClientID %>").val("");
        }
    }

    //当合同只是 生产不立项时，不显示关联项目信息
    function accessOfProjectDisplay() {
        var isNotBuild = $("#<%=hiNotBuild.ClientID %>").val();
        if (isNotBuild == "<%=(int)BoolType.是 %>") {
            $('.trProject').hide();
        }
    }

</script>
