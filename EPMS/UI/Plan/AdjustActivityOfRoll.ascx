<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdjustActivityOfRoll.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Plan.AdjustActivityOfRoll" %>
<%@ Register Src="~/EPMS/UI/Project/ProjectCommon.ascx" TagName="ProjectCommon" TagPrefix="uc1" %>
<%@ Register Src="~/EPMS/UI/Plan/AdjustDetailOfRoll.ascx" TagName="AdjustDetailOfRoll"
    TagPrefix="uc2" %>
<%@ Register Src="~/EPMS/UI/Plan/AdjustDetailOfFile.ascx" TagName="AdjustDetailOfFile"
    TagPrefix="uc3" %>
<%@ Register Src="../../UI/Plan/PlanTimeInfo.ascx" TagName="PlanTimeInfo" TagPrefix="uc4" %>
<%@ Import Namespace="DAL.EPMS" %>
<table class="tz-table" style="width: 100%">
    <uc4:PlanTimeInfo ID="ucPlanTimeInfo" runat="server" />
    <uc1:ProjectCommon ID="ucProjectCommon" runat="server" />
    <tr>
        <td class="td-l">
            拟调整卷册名称<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsSelectRoll" req="1" IsMutiple="false"
                SelectPageMode="Dialog" ResultForControls="{'hiWBSInfoID':'id','txtWBSCode':'WBSCode','txtWBSOwner_hivalue':'WBSOwnerName','txtWBSOwner':'WBSOwnerName','hiWBSOwnerId':'WBSOwnerID','txtBelongSpecialtyName':'ExecSpecialtyName','hiBelongSpecialtyID':'ExecSpecialtyID','hiBelongSpecialtyCode':'ExecSpecialtyCode','txtBelongDeptName':'BelongDeptName','hiBelongDeptID':'BelongDeptID','hiParamWBSTypeID':'ParamWBSTypeID','hiParentID':'ParentID'}"
                BeforeSelect="beforeSelectWbs()" EnableTheming="false" Text="选择卷册" PageUrl="~/EPMS/Obsolete/WBSSelector.aspx"
                PageHeight="550" PageWidth="850" field="WBSName" tablename="EPMS_PlanWBS" ShowJsonRowColName="true"
                FilterFunction="rollFilter()" AfterSelect="afterRollSelect()" ResultAttr="name"
                activestatus="(2.填写计划调整申请)(2.*)" />
            <input type="hidden" runat="server" id="hiWBSInfoID" field="WBSINFOID" tablename="EPMS_PlanWBS" />
            <input type="hidden" runat="server" id="hiParentID" field="ParentID" tablename="EPMS_PlanWBS" />
            <input type="hidden" runat="server" id="hiParamWBSTypeID" field="ParamWBSTypeID"
                tablename="EPMS_PlanWBS" />
        </td>
        <td class="td-l">
            卷册编号<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtWBSCode" activestatus="(2.填写计划调整申请)(2.*)"
                readonly="readonly" class="kpms-textbox" TableName="EPMS_PlanWBS" Field="WBSCode"
                req="1" />
        </td>
        <td class="td-l">
            卷册负责人
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtWBSOwner" IsMutiple="false"
                SelectPageMode="Dialog" activestatus="(23.填写计划调整申请)" SourceMode="SelectorPage"
                ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode"
                ResultForControls="{'hiWBSOwnerId':'id'}" tablename="EPMS_PlanWBS" field="WBSOwnerName"
                FilterFunction="ownerFilter()" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx">
            </zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiWBSOwnerId" tablename="EPMS_PlanWBS" field="WBSOwnerID" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            提出人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtWriteUserName" runat="server" activestatus="(2.填写计划调整申请)(2.*)"
                field="PlanUserName" tablename="EPMS_PlanActivityOfProject" class="kpms-textbox"
                readonly="readonly">
            </zhongsoft:XHtmlInputText>
            <!--- 填写（编制\编写）人ID-->
            <input type="hidden" id="hiWriteUserID" name="hiWriteUserID" runat="server" tablename="EPMS_ProjectPlanBook"
                field="PlanUserName" />
        </td>
        <td class="td-l">
            专业
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtBelongSpecialtyName" activestatus="(2.填写计划调整申请)"
                readonly="readonly" class="kpms-textbox" tablename="EPMS_PlanWBS" field="BelongSpecialtyName" />
            <input type="hidden" runat="server" id="hiBelongSpecialtyID" field="BelongSpecialtyID"
                tablename="EPMS_PlanWBS" />
            <input type="hidden" runat="server" id="hiBelongSpecialtyCode" field="BelongSpecialtyCode"
                tablename="EPMS_PlanWBS" />
        </td>
        <td class="td-l">
            部门
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtBelongDeptName" activestatus="(2.填写计划调整申请)(2.*)"
                readonly="readonly" class="kpms-textbox" field="BelongDeptName" tablename="EPMS_PlanWBS" />
            <input type="hidden" runat="server" id="hiBelongDeptID" field="BelongDeptID" tablename="EPMS_PlanWBS" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            调整原因<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbThisImportance" TextMode="MultiLine"
                CssClass="kpms-textarea" EnableTheming="false" MaxLength="1024" tablename="EPMS_PlanActivityOfProject"
                req="1" field="ThisImportance" activestatus="(2.*)(23.填写计划调整申请)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td colspan="6" class="td-m">
            <span class="req-star">标注*为必填，如果不调整，会保留原来时间</span>
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <table class="tz-table" width="50px">
                <tr>
                    <td class="td-l">
                        时间
                    </td>
                    <td class="td-l">
                        调整前
                    </td>
                    <td class="td-l">
                        调整后
                    </td>
                    <td class="td-l">
                        实际
                    </td>
                    <td class="td-l">
                        时间
                    </td>
                    <td class="td-l">
                        调整前
                    </td>
                    <td class="td-l">
                        调整后
                    </td>
                    <td class="td-l">
                        实际
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        计划设计开始时间
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtOriginalPlanStartTime" runat="server" activestatus="(23.?)"
                            class="kpms-textbox-date" style="width: 70px">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtPlanStartTime" runat="server" activestatus="(2.*)(23.填写计划调整申请)"
                            field="PlanStartTime" tablename="EPMS_PlanWBS" class="kpms-textbox-date" readonly="readonly"
                            style="width: 70px">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtFactStartTime" runat="server" activestatus="(23.?)"
                            class="kpms-textbox-date" style="width: 70px">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-l">
                        计划个人出手时间
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtOriginalPlanHandTime" runat="server" activestatus="(23.?)"
                            class="kpms-textbox" readonly="readonly" style="width: 70px">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtPlanHandTime" runat="server" activestatus="(2.*)(23.填写计划调整申请)"
                            req="1" field="PlanHandTime" tablename="EPMS_PlanWBS" class="kpms-textbox-date"
                            style="width: 70px" readonly="readonly">
                        </zhongsoft:XHtmlInputText>
                        <span class="req-star">*</span>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtFactHandTime" runat="server" activestatus="(23.?)"
                            style="width: 70px" class="kpms-textbox" readonly="readonly">
                        </zhongsoft:XHtmlInputText>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        计划室交出时间
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtOriginalPlanRecheckTime1" runat="server" activestatus="(23.?)"
                            style="width: 70px" class="kpms-textbox" readonly="readonly">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtPlanRecheckTime1" runat="server" activestatus="(23.填写计划调整申请)(2.*)"
                            req="1" field="PlanRecheckTime1" tablename="EPMS_PlanWBS" class="kpms-textbox-date"
                            style="width: 70px" readonly="readonly">
                        </zhongsoft:XHtmlInputText>
                        <span class="req-star">*</span>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtFactRecheckTime1" runat="server" activestatus="(23.?)"
                            style="width: 70px" class="kpms-textbox" readonly="readonly">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-l">
                        计划院交出时间
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtOriginalPlanCompTime" runat="server" activestatus="(23.?)"
                            style="width: 70px" class="kpms-textbox" readonly="readonly">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtPlanCompleteTime" runat="server" activestatus="(23.填写计划调整申请)"
                            style="width: 70px" field="PlanCompleteTime" tablename="EPMS_PlanWBS" class="kpms-textbox-date"
                            readonly="readonly">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtFactCompleteTime" runat="server" activestatus="(23.?)"
                            style="width: 70px" class="kpms-textbox" readonly="readonly">
                        </zhongsoft:XHtmlInputText>
                    </td>
                </tr>
                <tr style="display: none">
                    <td class="td-l" style="display: none">
                        计划校核完成时间
                    </td>
                    <td class="td-r" style="display: none">
                        <zhongsoft:XHtmlInputText ID="txtOriginalPlanCheckTime" runat="server" activestatus="(23.?)"
                            style="width: 70px" class="kpms-textbox" readonly="readonly">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r" style="display: none">
                        <zhongsoft:XHtmlInputText ID="txtPlanCheckTime" runat="server" activestatus="(23.填写计划调整申请)"
                            style="width: 70px" field="PlanCheckTime" tablename="EPMS_PlanWBS" class="kpms-textbox-date"
                            readonly="readonly">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r" style="display: none">
                        <zhongsoft:XHtmlInputText ID="txtFactCheckTime" runat="server" activestatus="(23.?)"
                            style="width: 70px" class="kpms-textbox" readonly="readonly">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-l">
                        计划批准完成时间
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtOriginalPlanApprovalTime" runat="server" activestatus="(23.?)"
                            style="width: 70px" class="kpms-textbox" readonly="readonly">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtPlanApprovalTime" runat="server" activestatus="(23.填写计划调整申请)(2.*)"
                            style="width: 70px" field="PlanApprovalTime" tablename="EPMS_PlanWBS" class="kpms-textbox-date"
                            readonly="readonly">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtFactApprovalTime" runat="server" activestatus="(23.?)"
                            style="width: 70px" class="kpms-textbox-date" readonly="readonly">
                        </zhongsoft:XHtmlInputText>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            提出日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtWriteTime" runat="server" activestatus="(23.填写计划调整申请)(2.*)"
                field="PlanStartTime" tablename="EPMS_PlanActivityOfProject" class="kpms-textbox-date"
                readonly="readonly">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
            是否同意<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3" nowrap>
            <asp:RadioButtonList runat="server" ID="rbIsAgree" field="IsAgree" tablename="EPMS_PlanActivityOfProject"
                req="1" RepeatDirection="Horizontal" activestatus="(3.科室负责人审核)(3.设总审核)(3.部门审核)(3.审批)">
            </asp:RadioButtonList>
            <asp:Label runat="server" ID="agreeInfo" Style="color: Red">如果不同意调整，则流程结束后不更新该卷册的计划时间</asp:Label>
        </td>
    </tr>
    <tr style="display: none">
        <td class="td-l">
            现场施工进度<br />
            可能产生的影响<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbProblemOfNeedInner" TextMode="MultiLine"
                CssClass="kpms-textarea" EnableTheming="false" MaxLength="512" tablename="EPMS_PlanActivityOfProject"
                field="ProblemOfNeedInner" activestatus="(23.填写计划调整申请)(2.*)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            备注
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbMemo" TextMode="MultiLine" CssClass="kpms-textarea"
                EnableTheming="false" MaxLength="512" tablename="EPMS_PlanActivityOfProject"
                field="Memo" activestatus="(23.填写计划调整申请)(2.*)"></zhongsoft:LightTextBox>
        </td>
    </tr>
</table>
<div style="height: 5px">
</div>
<table id="rollAndFileInfo" class="tz-table" style="display: none">
    <tr>
        <td colspan="6" class="flexible" onclick="openDetail('rollInfo')">
            影响的相关卷册计划&nbsp;<img src="../../themes/images/lright.png" />
        </td>
    </tr>
    <tr id="rollInfo">
        <td colspan="6">
            <uc2:AdjustDetailOfRoll ID="ucAdjustDetailOfRoll" runat="server" OnAfterAddRollClick="AfterAddRollClick" />
        </td>
    </tr>
</table>
<div style="height: 5px">
</div>
<table class="tz-table" style="width: 100%">
    <tr>
        <td colspan="6" class="flexible" onclick="openDetail('fileInfo')">
            影响的相关接口资料计划&nbsp;<img src="../../themes/images/lright.png" />
        </td>
    </tr>
    <tr id="fileInfo">
        <td colspan="6">
            <uc3:AdjustDetailOfFile ID="ucAdjustDetailOfFile" runat="server" />
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiExeSpecialtyID" />
<!--项目计划活动表主键 -->
<input type="hidden" id="hiPlanActivityOfProjectID" name="PlanActivityOfProjectID"
    runat="server" field="PlanActivityOfProjectID" tablename="EPMS_PlanActivityOfProject" />
<!--项目计划活动表主键 -->
<input type="hidden" id="hiPlanWBSID" name="hiPlanWBSID" runat="server" field="PlanWBSID"
    tablename="EPMS_PlanWBS" />
<!---项目ID-->
<input type="hidden" id="hiOrganizationID" name="hiOrganizationID" runat="server"
    field="OrganizationID" tablename="EPMS_PlanActivityOfProject" />
<!---项目编号-->
<input type="hidden" id="hiProjectCode" name="hiProjectCode" runat="server" field="ProjectCode"
    tablename="EPMS_PlanActivityOfProject" />
<!---项目名称-->
<input type="hidden" id="hiProjectName" name="hiProjectName" runat="server" field="ProjectName"
    tablename="EPMS_PlanActivityOfProject" />
<!---项目ID-->
<input type="hidden" id="hiWBSOrganizationID" name="hiWBSOrganizationID" runat="server"
    field="OrganizationID" tablename="EPMS_PlanWBS" />
<input type="hidden" runat="server" id="hiPlanState" field="PlanState" tablename="EPMS_PlanActivityOfProject"
    value="1" />
<!---项目类型名称--->
<input type="hidden" runat="server" id="hiProjectType" field="ProjectType" tablename="EPMS_PlanActivityOfProject" />
<!---项目类型Code--->
<input type="hidden" runat="server" id="hiProjectTypeCode" field="ProjectTypeCode"
    tablename="EPMS_PlanActivityOfProject" />
<!---项目类型ID--->
<input type="hidden" runat="server" id="hiParamProjectTypeID" field="ParamProjectTypeID"
    tablename="EPMS_PlanActivityOfProject" />
<!---项目编号-->
<input type="hidden" id="hiWBSProjectCode" name="hiProjectCode" runat="server" field="ProjectCode"
    tablename="EPMS_PlanWBS" />
<!---项目名称-->
<input type="hidden" id="hiWBSProjectName" name="hiProjectName" runat="server" field="ProjectName"
    tablename="EPMS_PlanWBS" />
<!---添加人ID-->
<input type="hidden" id="hiWBSAddUserID" name="hiWBSAddUserID" runat="server" field="AddUserID"
    tablename="EPMS_PlanWBS" />
<!---项目编号-->
<input type="hidden" id="hiWBSAddUserName" name="hiWBSAddUserName" runat="server"
    field="AddUserName" tablename="EPMS_PlanWBS" />
<!---添加人ID-->
<input type="hidden" id="hiAddUserID" name="hiAddUserID" runat="server" field="AddUserID"
    tablename="EPMS_PlanActivityOfProject" />
<!---项目编号-->
<input type="hidden" id="hiAddUserName" name="AddUserName" runat="server" field="AddUserName"
    tablename="EPMS_PlanActivityOfProject" />
<!---设计总工程师ID--->
<input type="hidden" runat="server" id="hiManagerUserID" field="ManagerUserID" tablename="EPMS_PlanActivityOfProject" />
<!---设计总工程师--->
<input type="hidden" runat="server" id="hiManagerUserName" field="ManagerUserName"
    tablename="EPMS_PlanActivityOfProject" />
<!---是否重要计划-->
<input type="hidden" id="hiIsImportant" name="hiIsImportant" runat="server" field="IsImportant"
    tablename="EPMS_PlanWBS" />
<!---表单类型-->
<input type="hidden" id="hiFormType" name="hiFormType" runat="server" field="FormType"
    tablename="EPMS_PlanActivityOfProject" />
<!---年-->
<input type="hidden" id="hiWBSPlanYear" name="hiWBSPlanYear" runat="server" field="PlanYear"
    tablename="EPMS_PlanWBS" />
<!---月-->
<input type="hidden" id="hiWBSPlanMonth" name="hiWBSPlanMonth" runat="server" field="PlanMonth"
    tablename="EPMS_PlanWBS" />
<!---年-->
<input type="hidden" id="hiPlanYear" name="hiPlanYear" runat="server" field="PlanYear"
    tablename="EPMS_PlanActivityOfProject" />
<!---月-->
<input type="hidden" id="hiPlanMonth" name="hiPlanMonth" runat="server" field="PlanMonth"
    tablename="EPMS_PlanActivityOfProject" />
<input type="hidden" runat="server" id="hiWBSPlanCycle" field="PlanCycle" tablename="EPMS_PlanWBS" />
<input type="hidden" runat="server" id="hiWBSPlanQuarter" field="PlanQuarter" tablename="EPMS_PlanWBS" />
<input type="hidden" runat="server" id="hiWBSPlanWeek" field="PlanWeek" tablename="EPMS_PlanWBS" />
<input type="hidden" runat="server" id="hiPlanCycle" field="PlanCycle" tablename="EPMS_PlanActivityOfProject" />
<input type="hidden" runat="server" id="hiPlanQuarter" field="PlanQuarter" tablename="EPMS_PlanActivityOfProject" />
<input type="hidden" runat="server" id="hiPlanWeek" field="PlanWeek" tablename="EPMS_PlanActivityOfProject" />
<asp:LinkButton runat="server" ID="lbtnAfterSelectWBS" OnClick="lbtnAfterSelectWBS_Click"
    Style="display: none"></asp:LinkButton>
<input type="hidden" runat="server" id="hiParamSpeciatyID" value="1" />
<input type="hidden" runat="server" id="hiIsPublish" />
<input type="hidden" runat="server" id="hiSourceFrom" field="SourceFrom" tablename="EPMS_PlanWBS" />
<script>
    //获取选择卷册的筛选条件信息
    function getSelWBSFilter() {
        var organizationID = $("#<%=hiOrganizationID.ClientID %>").val();
        var filter = { OrganizationID: organizationID, WBSType: '<%=(int)WBSMode.任务管理 %>' };
        return filter;
    }

    function adjustActivityOfRoll_init() {
        $("[wbsID]").live("blur", function () {
            $("#" + $(this).attr("id")).val($(this).val());
        });
    }

    //选择主卷/册 筛选条件
    function rollFilter() {
        var orgID = $("#<%=hiOrganizationID.ClientID %>").val();
        return "{OrganizationID:'" + orgID + "',WBSType:'<%=(int)WBSMode.任务管理 %>'}";
    }

    function afterRollSelect() {
         <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.lbtnAfterSelectWBS, "")%>;
    }

    //选择任务之前的逻辑判断
    function beforeSelectWbs() {
        var orgId = $('#<%=hiOrganizationID.ClientID %>').val();
        if (orgId == '' || orgId == undefined) {
            alert('请先选择项目，再选择卷册！');
            return false;
        }
        return true;
    }

    //判断填写的日期是否正确
    function checkDateIsRight() {
        var startTime = $("#<%=txtPlanStartTime.ClientID %>").val();
        var handleTime = $("#<%=txtPlanHandTime.ClientID %>").val();
        var planRecheckTime1 = $("#<%=txtPlanRecheckTime1.ClientID %>").val();
        var planCompleteTime = $("#<%=txtPlanCompleteTime.ClientID %>").val();
        //计划开始时间要小于 计划个人交出时间 计划室交出时间、计划院交出时间
        if (!compareDate(startTime, handleTime)) {
            alert("【计划个人出手时间】不能早于【计划开始时间】，请重新选择。");
            return false;
        }
        //计划开始时间要小于 计划个人交出时间 计划室交出时间、计划院交出时间
        if (!compareDate(startTime, handleTime)) {
            alert("【计划室交出时间】不能早于【计划开始时间】，请重新选择。");
            return false;
        }
        //计划开始时间要小于 计划个人交出时间 计划室交出时间、计划院交出时间
        if (!compareDate(handleTime, planRecheckTime1)) {
            alert("【计划室交出时间】不能早于【计划个人出手时间】，请重新选择。");
            return false;
        }
        //计划开始时间要小于 计划个人交出时间 计划室交出时间、计划院交出时间
        if (!compareDate(handleTime, planCompleteTime)) {
            alert("【计划院交出时间】不能早于【计划个人出手时间】，请重新选择。");
            return false;
        }
        if (!compareDate(planRecheckTime1, planCompleteTime)) {
            alert("【计划院交出时间】不能早于【室交出时间】，请重新选择。");
            return false;
        }
        //出版卷册需要填写计划院交出时间
        var isPublish = $("#<%=hiIsPublish.ClientID %>").val();
        if (isPublish == "1" && planCompleteTime == "") {
            alert("院交出时间不能为空!");
            return false;
        }
        return true;
    }

    //选择卷册负责人筛选条件
    function ownerFilter() {
        var deptID = $('#<%=hiBelongDeptID.ClientID %>').val();
        return "{DeptID:'" + deptID + "'}";
    }
</script>
