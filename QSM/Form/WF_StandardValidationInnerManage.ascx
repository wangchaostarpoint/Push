<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_StandardValidationInnerManage.ascx.cs" Inherits="Zhongsoft.Portal.QSM.Form.WF_StandardValidationInnerManage" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">
            编制人
        </td>
        <td class="td-r">
            <input type="hidden" runat="server" id="hiDraftManID" field="DraftManID" tablename="EPMS_StandardValidationInnerManage" />
            <zhongsoft:XHtmlInputText type="text" runat="server" id="txtDraftManName" readonly="readonly" class="kpms-textbox"
                style="width: 80px" field="DraftManName" tablename="EPMS_StandardValidationInnerManage"
                activestatus="(23.编制评审报告)(3.修改评审报告)" />
        </td>
        <td class="td-l">
            编制部门
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText type="text" runat="server" id="txtDraftDeptName" readonly="readonly" class="kpms-textbox"
                field="DraftDeptName" tablename="EPMS_StandardValidationInnerManage" activestatus="(23.编制评审报告)(3.修改评审报告)" />
            <input type="hidden" runat="server" id="hiDraftDeptID" field="DraftDeptID" tablename="EPMS_StandardValidationInnerManage" />
        </td>
        <td class="td-l">
            编制日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText type="text" runat="server" id="txtDraftDate" readonly="readonly" class="kpms-textbox"
                style="width: 70px" field="DraftDate" tablename="EPMS_StandardValidationInnerManage"
                activestatus="(23.编制评审报告)(3.修改评审报告)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            评审类型<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlValidationType" runat="server" field="ValidationType" tablename="EPMS_StandardValidationInnerManage"
                activestatus="(23.编制评审报告)(3.修改评审报告)" req="1">
                <asp:ListItem Value="">请选择</asp:ListItem>
                <asp:ListItem Value="内审">内审</asp:ListItem>
                <asp:ListItem Value="管理评审">管理评审</asp:ListItem>
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l">
            审核年度<span class="req-star">*</span>
        </td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightDropDownList ID="ddlValidationYear" runat="server" field="ValidationYear" tablename="EPMS_StandardValidationInnerManage"
                activestatus="(23.编制评审报告)(3.修改评审报告)" req="1" Width="100px">
            </zhongsoft:LightDropDownList>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            计划名称<span class="req-star">*</span>
        </td>
        <td class="td-r" colspan="5">
            <zhongsoft:XHtmlInputText type="text" id="txtPlanName" runat="server" class="kpms-textbox"  
                field="PlanName" tablename="EPMS_StandardValidationInnerManage" activestatus="(23.编制评审报告)(3.修改评审报告)"
                req="1"  style="width:70%" />
            <input type="hidden" id="hiStandardValidationPlanID" runat="server" field="StandardValidationPlanID"
                tablename="EPMS_StandardValidationInnerManage" />
            <asp:LinkButton runat="server" ID="lbtnPlanProject" DisplayStatus="(23.编制评审报告)(3.修改评审报告)"
                CausesValidation="false" OnClientClick="return selectStandardValidationPlan();"   EnableTheming="false" >
                <img alt="评审计划" src="/Portal/Themes/Images/btn_select.gif" style="cursor:hand; border:0" />
            </asp:LinkButton>
        </td>
    </tr>
    <%--Delete by zhangsk 2013-07-11 需求中没有此项内容------------%>
    <%--<tr runat="server" id="trShow">
        <td class="td-l">
            是否需要院长审批<span class="req-star">*</span>
        </td>
        <td colspan="5" class="td-r">
            <asp:RadioButtonList runat="server" ID="rbNeedHeaderCheck" field="NeedHeaderCheck"
                RepeatDirection="Horizontal" tablename="EPMS_StandardValidationInnerManage">
                <asp:ListItem Text="是" Value="True"></asp:ListItem>
                <asp:ListItem Text="否" Value="False"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>--%>
    <tr>
        <td class="td-l">
            评审报告名称<span class="req-star">*</span>
        </td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbValidationContent" field="ValidationContent" maxtext="512"
                tablename="EPMS_StandardValidationInnerManage" activestatus="(23.编制评审报告)(3.修改评审报告)"
                CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine"  req="1"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            备注
        </td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbRemark" field="Remark" maxtext="512" tablename="EPMS_StandardValidationInnerManage"
                activestatus="(23.编制评审报告)(3.修改评审报告)" CssClass="kpms-textarea" EnableTheming="false"
                TextMode="MultiLine"></zhongsoft:LightTextBox>
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiStandardValidationInnerManageID" field="StandardValidationInnerManageID"
    tablename="EPMS_StandardValidationInnerManage" />
<!--生产技术部部门id-->
<input type="hidden" id="hiJZ" runat="server" value="e1ec4711-bb99-437d-8c19-965e93afdf7e" />

<script type="text/javascript">
    var curr = '<%=CurrentActivityName %>';
    var acType = '<%=ActionType %>';

    function InitCustomerPlugin() {
        checkRegex();
        checkMaxLength();


    }

    $('#<%=ddlValidationType.ClientID %>').live("change", function () {
        $("#<%=hiStandardValidationPlanID.ClientID %>").val("");
        $("#<%=txtPlanName.ClientID %>").val("");
    })

    function selectStandardValidationPlan() {
        var type = $('#<%=ddlValidationType.ClientID %>').val();
        if (type == "") {
            alert("请先选择评审类型！");
            return;
        }

        var param = new InputParamObject("s");
        var reObj = getStandardValidationPlan("", param, type);

        if (null != reObj) {
            $("#<%=hiStandardValidationPlanID.ClientID %>").val(reObj.getAttrVal(0, "o", "id"));
            $("#<%=txtPlanName.ClientID %>").val(reObj.getAttrVal(0, "o", "name"));
        }
        return false;
    }
     

</script>
