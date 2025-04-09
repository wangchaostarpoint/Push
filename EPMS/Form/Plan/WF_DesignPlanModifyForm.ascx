<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_DesignPlanModifyForm.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.Form.Plan.WF_DesignPlanModifyForm" %>
<table class="tz-table">
    <tr>
        <td class="td-l">工程名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsProjectName" req="1" IsMutiple="false" SelectPageMode="Dialog"
                ResultForControls="{'hiOrganizationID':'id','hiProjectCode':'ProjectCode','txtPhaseName':'PhaseName','hiParamPhaseID':'ParamPhaseID','hiPhaseCode':'PhaseCode'}"
                EnableTheming="false" Text="选择项目" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx" AfterSelect="afterSelect()"
                PageWidth="850" ShowJsonRowColName="true" ResultAttr="name" TableName="EPMS_DesignPlanModify" Field="ProjectName"
                activestatus="(23.提出修改申请)" />
            <input type="hidden" runat="server" id="hiProjectCode" tablename="EPMS_DesignPlanModify" field="ProjectCode" />
            <input type="hidden" id="hiOrganizationID" name="hiOrganizationID" runat="server" tablename="EPMS_DesignPlanModify" field="OrganizationID" />
            <asp:LinkButton runat="server" ID="btnBind" OnClick="btnBind_OnClick" Visible="false"></asp:LinkButton>
        </td>
        <td class="td-l">设计阶段
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtPhaseName" tablename="EPMS_DesignPlanModify" field="PhaseName" class="kpms-textbox"
                activestatus="(23.提出修改申请)" readonly="readonly" />
            <input type="hidden" runat="server" id="hiParamPhaseID" tablename="EPMS_DesignPlanModify" field="ParamPhaseID" />
            <input type="hidden" runat="server" id="hiPhaseCode" tablename="EPMS_DesignPlanModify" field="PhaseCode" />
        </td>
    </tr>

    <tr>
        <td class="td-l">提出专业
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlSpecialtyID" ActiveStatus="(23.提出修改申请)" />
            <input type="hidden" runat="server" id="hiParamSpecialtyID" tablename="EPMS_DesignPlanModify" field="ParamSpecialtyID" />
            <input type="hidden" runat="server" id="hiSpecialtyCode" tablename="EPMS_DesignPlanModify" field="SpecialtyCode" />
            <input type="hidden" runat="server" id="hiSpecialtyName" tablename="EPMS_DesignPlanModify" field="SpecialtyName" />
        </td>
        <td class="td-l">提出人
        </td>
        <td class="td-l">
            <zhongsoft:XHtmlInputText runat="server" ID="txtPutUserName" readonly="readonly" class="kpms-textbox" TableName="EPMS_DesignPlanModify" Field="PutUserName" ActiveStatus="(23.提出修改申请)" />
            <input type="hidden" id="hiPutUserID" name="hiPutUserID" runat="server" tablename="EPMS_DesignPlanModify" field="PutUserID" />
        </td>
        <td class="td-l">审核
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsAuditUserName" IsMutiple="false" SelectPageMode="Dialog" activestatus="(23.提出修改申请)"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" FilterFunction="userFilter()"
                BeforeSelect="beforeSelectUser()" PageWidth="800px" ShowAttrs="name,UserCode" ResultForControls="{'hiAuditUserID':'id'}"
                PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" field="AuditUserName" tablename="EPMS_DesignPlanModify" />
            <input type="hidden" id="hiAuditUserID" name="hiAuditUserID" runat="server" tablename="EPMS_DesignPlanModify" field="AuditUserID" />
        </td>
    </tr>
    <tr>
        <td class="td-l">会签
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsCountersignUserName" IsMutiple="false" SelectPageMode="Dialog" activestatus="(23.提出修改申请)"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" FilterFunction="userFilter()"
                BeforeSelect="beforeSelectUser()" PageWidth="800px" ShowAttrs="name,UserCode" ResultForControls="{'hiCountersignUserID':'id'}"
                PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" field="CountersignUserName" tablename="EPMS_DesignPlanModify" />
            <input type="hidden" id="hiCountersignUserID" name="hiCountersignUserID" runat="server" tablename="EPMS_DesignPlanModify" field="CountersignUserID" />
        </td>
        <td class="td-l">审批
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsApproveUserName" IsMutiple="false" SelectPageMode="Dialog" activestatus="(23.提出修改申请)"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" FilterFunction="userFilter()"
                BeforeSelect="beforeSelectUser()" PageWidth="800px" ShowAttrs="name,UserCode" ResultForControls="{'hiApproveUserID':'id'}"
                PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" field="ApproveUserName" tablename="EPMS_DesignPlanModify" />
            <input type="hidden" id="hiApproveUserID" name="hiApproveUserID" runat="server" tablename="EPMS_DesignPlanModify" field="ApproveUserID" />
        </td>
        <td class="td-l">审批日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox" ID="txtApproveDate" runat="server" readonly="readonly" ActiveStatus="(23.提出修改申请)" />
            <input type="hidden" runat="server" id="hiApproveDate" tablename="EPMS_DesignPlanModify" field="ApproveDate" />
        </td>
    </tr>
    <tr>
        <td class="td-l">是否涉及设计进度变化
        </td>
        <td class="td-r">
            <asp:CheckBox runat="server" ID="ckbIsDesignScheduleModify" tablename="EPMS_DesignPlanModify" field="IsDesignScheduleModify"
                activestatus="(23.提出修改申请)" />
        </td>
        <td class="td-l">是否涉及设计原则变化
        </td>
        <td class="td-r">
            <asp:CheckBox runat="server" ID="ckbIsDesignTenetModify" activestatus="(23.提出修改申请)" tablename="EPMS_DesignPlanModify"
                field="IsDesignTenetModify" />
        </td>
        <td class="td-m" colspan="2">
            <asp:LinkButton ID="lbtnDeptPlan" runat="server" EnableTheming="false" CssClass="btn-query"
                OnClientClick="return viewDeptProjPlan()" flag="Arrange" ActiveStatus="(23.提出修改申请)(3.设总审批)(3.专工审核)" displaystatus="(23.提出修改申请)(3.设总审批)(3.专工审核)">
                <span>
                    <img runat="server" id="img8" src="~/Themes/Images/process.GIF" alt="安排计划" width="16"
                        height="16" />安排计划</span>
            </asp:LinkButton>
        </td>
    </tr>
    <tr>
        <td class="td-l">修改原因
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbModifyReason" runat="server" MaxText="1024" TableName="EPMS_DesignPlanModify" Field="ModifyReason" ActiveStatus="(23.提出修改申请)"
                EnableTheming="False" CssClass="kpms-textarea" Rows="3" TextMode="MultiLine" />
        </td>
    </tr>
    <tr>
        <td class="td-l">修改内容</td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbModifyContent" runat="server" MaxText="1024" TableName="EPMS_DesignPlanModify" Field="ModifyContent" ActiveStatus="(23.提出修改申请)"
                EnableTheming="False" CssClass="kpms-textarea" Rows="3" TextMode="MultiLine" />
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiDesignPlanModifyID" tablename="EPMS_DesignPlanModify" field="DesignPlanModifyID" />
<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
    }

    function afterSelect() {
        <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.btnBind, "")%>;
    }

    //选择人员之前的逻辑判断
    function beforeSelectUser() {
        var orgId = $('#<%=hiOrganizationID.ClientID %>').val();
        if (orgId == '' || orgId == undefined) {
            alert('请先选择项目，再选择人员！');
            return false;
        }
        return true;
    }

    //选择人员的筛选条件
    function userFilter() {
        var orgId = $('#<%=hiOrganizationID.ClientID %>').val();
        return { ProjectPhaseID: orgId };
    }

    //统一提示信息
    function checkSpe(speId) {
        if (speId == '' || speId == undefined) {
            alert('请先选择项目或专业！');
            return false;
        }
        return true;
    }

    //安排计划
    function viewDeptProjPlan() {
        var state = "false";
        var speId = $("#<%=ddlSpecialtyID.ClientID %>").val();
        var orgId = $("#<%=hiOrganizationID.ClientID%>").val();
        if ((speId == '' || speId == undefined) && (orgId == '' || orgId == undefined)) {
            alert('请先选择项目！');
            return false;
        }

        var method = "IsUserInRolesSZ";
        $.ajax({
            type: 'POST',
            url: buildQueryUrl("/EPMS/List/WBS/WBSSplitEditor.aspx", null),
            data: { asyfunc: method, orgId: orgId, speId: speId, userId:'<%=KPMSUser.UserId %>' },
            async: false,
            dataType: "json",
            success: function (res) {
                state = res;
            },
            error: function (err) {
            }
        });
        if (state == "false" || state == false) {
            alert("您不是该项目的主设人或者专工或者设总！");
            return false;
        }
        else {
            var actionType = 1;
            var curStep = '<%=CurrentActivityName %>';
            if (curStep == "提出修改申请") {
                var isChecked = $("#<%=ckbIsDesignScheduleModify.ClientID  %> ").attr('checked');
                if (isChecked == "checked") {
                    actionType = 3;
                }
            }
            var json = { actionType: actionType, OrganizationID: orgId, speId: speId };
            var url = buildQueryUrl("EPMS/List/Plan/ProjectMonthPlanWBSEditor.aspx", json);
            showDivDialog(url, null, 1000, 600, null);
            return false;
        }
    }
</script>
