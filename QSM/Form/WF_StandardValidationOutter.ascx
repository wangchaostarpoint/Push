<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_StandardValidationOutter.ascx.cs" Inherits="Zhongsoft.Portal.QSM.Form.WF_StandardValidationOutter" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">
            编制人 
        </td>
        <td class="td-r">
            <input type="hidden" runat="server" id="hiDraftManID" field="DraftManID" tablename="EPMS_StandardValidationOutter" />
            <zhongsoft:XHtmlInputText type="text" runat="server" id="txtDraftManName" readonly="readonly" class="kpms-textbox"
                style="width: 80px" field="DraftManName" tablename="EPMS_StandardValidationOutter"
                activestatus="(23.编制外审报告)" />
        </td>
        <td class="td-l">
            编制部门
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText type="text" runat="server" id="txtDraftDeptName" readonly="readonly" class="kpms-textbox"
                field="DraftDeptName" tablename="EPMS_StandardValidationOutter" activestatus="(23.编制外审报告)" />
            <input type="hidden" runat="server" id="hiDraftDeptID" field="DraftDeptID" tablename="EPMS_StandardValidationOutter" />
        </td>
        <td class="td-l">
            编制日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText type="text" runat="server" id="txtDraftDate" readonly="readonly" class="kpms-textbox"
                style="width: 70px" field="DraftDate" tablename="EPMS_StandardValidationOutter"
                activestatus="(23.编制外审报告)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            审核年度<span class="req-star">*</span>
        </td>
        <td class="td-r"  >
            <zhongsoft:LightDropDownList ID="ddlValidationYear" runat="server" field="ValidationYear" tablename="EPMS_StandardValidationOutter"
                activestatus="(23.编制外审报告)" req="1">
            </zhongsoft:LightDropDownList>
        </td>
    
        <td class="td-l">
            计划名称<span class="req-star">*</span>
        </td>
        <td class="td-r"  colspan="3" >
            <zhongsoft:XHtmlInputText type="text" id="txtPlanName" runat="server" class="kpms-textbox" readonly="readonly"
                field="PlanName" tablename="EPMS_StandardValidationOutter" activestatus="(23.编制外审报告)"
                req="1" style="width:70%" />
            <input type="hidden" id="hiStandardValidationPlanID" runat="server" field="StandardValidationPlanID"
                tablename="EPMS_StandardValidationOutter" />
            <asp:LinkButton runat="server" ID="lbtnPlanProject" DisplayStatus="(23.编制外审报告)"
                CausesValidation="false" OnClientClick="return selectStandardValidationPlan();"  EnableTheming="false" >
                <img alt="评审计划" src="/Portal/Themes/Images/btn_select.gif" style="cursor:hand; border:0" />
            </asp:LinkButton>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            评审报告主要内容<span class="req-star">*</span>
        </td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbValidationContent" field="ValidationContent" maxtext="512"
                tablename="EPMS_StandardValidationOutter" activestatus="(23.编制外审报告)"
                CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine" req="1"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            备注
        </td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbRemark" field="Remark" maxtext="512" tablename="EPMS_StandardValidationOutter"
                activestatus="(23.编制外审报告)" CssClass="kpms-textarea" EnableTheming="false"
                TextMode="MultiLine"></zhongsoft:LightTextBox>
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiStandardValidationOutterID" field="StandardValidationOutterID"
    tablename="EPMS_StandardValidationOutter" />

<script type="text/javascript">
    var curr = '<%=CurrentActivityName %>';
    var acType = '<%=ActionType %>';

    function InitCustomerPlugin() {
        checkRegex();
        checkMaxLength();
    }

    function selectStandardValidationPlan() {
        var param = new InputParamObject("s");
        var reObj = getStandardValidationPlan("", param, "外审");

        if (null != reObj) {
            $("#<%=hiStandardValidationPlanID.ClientID %>").val(reObj.getAttrVal(0, "o", "id"));
            $("#<%=txtPlanName.ClientID %>").val(reObj.getAttrVal(0, "o", "name"));
        }
        return false;
    }

</script>