<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_TempRollArrangeForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.Plan.WF_TempRollArrangeForm" %>
<%@ Register Src="../../UI/Project/ProjectCommon.ascx" TagName="ProjectCommon" TagPrefix="uc1" %>
<%@ Register Src="../../UI/Plan/PlanTimeInfo.ascx" TagName="PlanTimeInfo" TagPrefix="uc2" %>
<%@ Register Src="~/EPMS/UI/Plan/AdjustDetailOfRoll.ascx" TagName="AdjustDetailOfRoll"
    TagPrefix="uc3" %>
<%@ Import Namespace="DAL.EPMS" %>
<table class="tz-table" width="100%" id="tbProject">
    <uc2:PlanTimeInfo ID="ucPlanTimeInfo" runat="server" />
    <uc1:ProjectCommon ID="ucProjectCommon" runat="server" />
    <tr>
        <td class="td-l">
            专业<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlSpecialty" runat="server" activestatus="(2.编制计划安排)"
                req="1">
            </zhongsoft:LightDropDownList>
            <input type="hidden" runat="server" id="hiSpecialtyId" field="ParamSpecialtyId" tablename="EPMS_PlanActivityOfProject" />
            <input type="hidden" runat="server" id="hiSpecialtyName" field="SpecialtyName" tablename="EPMS_PlanActivityOfProject" />
        </td>
        <td class="td-l">
            提出人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtWriteUserName" runat="server" activestatus="(2.填写计划调整申请)(2.*)"
                field="PlanUserName" tablename="EPMS_PlanActivityOfProject" class="kpms-textbox"
                readonly="readonly">
            </zhongsoft:XHtmlInputText>
            <!--- 填写（编制\编写）人ID-->
            <input type="hidden" id="hiWriteUserID" name="hiWriteUserID" runat="server" tablename="EPMS_PlanActivityOfProject"
                field="PlanUserID" />
        </td>
        <td class="td-l">
            部门
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtWriteDeptName" activestatus="(2.填写计划调整申请)(2.*)"
                readonly="readonly" class="kpms-textbox" field="WriteDeptName" tablename="EPMS_PlanActivityOfProject" />
            <input type="hidden" runat="server" id="hiWriteDeptID" field="WriteDeptID" tablename="EPMS_PlanActivityOfProject" />
        </td>
    </tr>
    <tr id="rollInfo">
        <td colspan="6">
            <uc3:AdjustDetailOfRoll ID="ucAdjustDetailOfRoll" runat="server" />
        </td>
    </tr>
</table>
<!---项目编号-->
<input type="hidden" id="hiProjectCode" name="hiProjectCode" runat="server" field="ProjectCode"
    tablename="EPMS_PlanActivityOfProject" />
<!---项目名称-->
<input type="hidden" id="hiProjectName" name="hiProjectName" runat="server" field="ProjectName"
    tablename="EPMS_PlanActivityOfProject" />
<!----添加人员ID-->
<input type="hidden" runat="server" id="hiAddUserID" field="AddUserID" tablename="EPMS_PlanActivityOfProject" />
<!----添加人员姓名-->
<input type="hidden" runat="server" id="hiAddUserName" field="AddUserName" tablename="EPMS_PlanActivityOfProject" />
<!---项目类型名称--->
<input type="hidden" runat="server" id="hiProjectType" field="ProjectType" tablename="EPMS_PlanActivityOfProject" />
<!---项目类型Code--->
<input type="hidden" runat="server" id="hiProjectTypeCode" field="ProjectTypeCode"
    tablename="EPMS_PlanActivityOfProject" />
<!---项目类型ID--->
<input type="hidden" runat="server" id="hiParamProjectTypeID" field="ParamProjectTypeID"
    tablename="EPMS_PlanActivityOfProject" />
<input type="hidden" runat="server" id="hiPlanState" field="PlanState" tablename="EPMS_PlanActivityOfProject"
    value="1" />
<!---设计总工程师ID--->
<input type="hidden" runat="server" id="hiManagerUserID" field="ManagerUserID" tablename="EPMS_PlanActivityOfProject" />
<!---设计总工程师--->
<input type="hidden" runat="server" id="hiManagerUserName" field="ManagerUserName"
    tablename="EPMS_PlanActivityOfProject" />
<input type="hidden" runat="server" id="hiPlanYear" field="PlanYear" tablename="EPMS_PlanActivityOfProject" />
<input type="hidden" runat="server" id="hiPlanCycle" field="PlanCycle" tablename="EPMS_PlanActivityOfProject" />
<input type="hidden" runat="server" id="hiPlanMonth" field="PlanMonth" tablename="EPMS_PlanActivityOfProject" />
<input type="hidden" runat="server" id="hiPlanQuarter" field="PlanQuarter" tablename="EPMS_PlanActivityOfProject" />
<input type="hidden" runat="server" id="hiPlanWeek" field="PlanWeek" tablename="EPMS_PlanActivityOfProject" />
<!--主键 -->
<input type="hidden" id="hiPlanActivityOfProjectID" name="PlanActivityOfProjectID"
    runat="server" field="PlanActivityOfProjectID" tablename="EPMS_PlanActivityOfProject" />
<!---项目ID-->
<input type="hidden" id="hiOrganizationId" name="hiOrganizationId" runat="server"
    field="OrganizationID" tablename="EPMS_PlanActivityOfProject" />
<!---判断当前人所具有的角色信息--->
<input type="hidden" runat="server" id="hiRoleName" value="主任工程师" />
<!---“科室负责人”"主任工程师"角色信息id--->
<input type="hidden" runat="server" id="hiKeShiFuZeRenId" value="'9F8539E3-B8A9-4846-9BDC-B00724D2B52C','3C9F6863-5D48-4355-B3D7-AC9F651ED638'" />
<input type="hidden" runat="server" id="hiParamSpecialtyIDs" />
<input type="hidden" runat="server" id="hiFormType" field="FormType" tablename="EPMS_PlanActivityOfProject" />
<script>
    function initCustomerPlugin() {
        $("[wbsID]").live("blur", function () {
            $("#" + $(this).attr("id")).val($(this).val());
        });
    }

    //获取选择卷册的筛选条件信息
    function getSelWBSFilter() {
        var organizationID = $("#<%=hiOrganizationId.ClientID %>").val();
        var specialtyIDs = $("#<%=ddlSpecialty.ClientID %>").val();
        //暂时去掉流程类型“项目计划”的筛选（该筛选控制卷册状态为“尚未开展、尚未确定、正在进行”）
        //var formType = '<%=Zhongsoft.Portal.EPMS.Obsolete.WBSFormTypeSelect.项目计划.ToString() %>';
        var filter;
        if (specialtyIDs == "") {
            filter = "";
        }
        else {
            //filter = { OrganizationID: organizationID, WBSType: '<%=(int)WBSMode.任务管理 %>', ExeSpecialtyID: specialtyIDs, IsHavePlaned: 'false', WBSFormTypeSelect: formType, IsFilterSpe: "true" };
            filter = { OrganizationID: organizationID, WBSType: '<%=(int)WBSMode.任务管理 %>', ExeSpecialtyID: specialtyIDs, IsHavePlaned: 'false', IsFilterSpe: "true" };
        }
        return filter;
    }

    function checkForm() {
        if ($formAction == 0) {
            if ($actName == "编制计划安排") {
                if (getNumOfDetailInfo() < 1) {
                    alert("-请选择卷册");
                    return false;
                }
                //时间必填，卷册负责人必填
                if (!checkFillDateIsRight()) {
                    return false;
                }
                if (!checkDateIsFill()) {
                    return false;
                }
            }
        }
        return true;
    }

</script>
