<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_HBPlanActivityOfProjectForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.Plan.WF_HBPlanActivityOfProjectForm" %>
<%@ Register Src="../../UI/Project/ProjectCommon.ascx" TagName="ProjectCommon" TagPrefix="uc1" %>
<%@ Register Src="../../UI/Plan/PlanTimeInfo.ascx" TagName="PlanTimeInfo" TagPrefix="uc2" %>
<%@ Register Src="../../UI/Plan/HBPlanWBSOfRoll.ascx" TagName="HBPlanWBSOfRoll" TagPrefix="uc3" %>
<table class="tz-table" width="100%" id="tbProject">
    <uc2:PlanTimeInfo ID="ucPlanTimeInfo" runat="server" />
    <uc1:ProjectCommon ID="ucProjectCommon" runat="server" />
</table>
<table class="tz-table" width="100%" runat="server" nodisplaystatus="(2.*)">
    <tr id="tr1" displaystatus="(3.编制计划安排)(3.计划安排审核)" runat="server">
        <td class="td-m" style="text-align: right;" colspan="6">
            <asp:Button runat="server" ID="btnAddAllWBS" Text="将项目所有卷册列入计划" OnClick="btnAddAllWBS_Click" />
            <span class="req-star">将项目所有卷册放入计划，适用于卷册很多或者竣工图阶段项目</span>
        </td>
    </tr>
    <tr id="trFanhuishezongTishi" displaystatus="(3.专业任务评估，配置资源)" runat="server">
        <td class="td-m" style="text-align: right;" colspan="6">
            <span style="color: Red;">若要与工程设总协商进度，必须要填写主任/主任工意见</span>
        </td>
    </tr>
    <tr displaystatus="(3.*)" runat="server">
        <td class="td-m" style="text-align: right;" colspan="6">
            <span style="color: Red;">黄色部分的卷册在本月月度计划中已经安排，如需调整请走【卷册计划调整】流程</span>
        </td>
    </tr>
    <tr>
        <td align="right" colspan="6">
            <span>专业</span>
            <zhongsoft:LightDropDownList runat="server" ID="ddlSpe" Width="120px" OnSelectedIndexChanged="ddlSpe_SelectedIndexChanged"
                AutoPostBack="true">
            </zhongsoft:LightDropDownList>
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <uc3:HBPlanWBSOfRoll ID="ucHBPlanWBSOfRoll" runat="server" />
        </td>
    </tr>
</table>
<!--主键 -->
<input type="hidden" id="hiPlanActivityOfProjectID" name="PlanActivityOfProjectID"
    runat="server" field="PlanActivityOfProjectID" tablename="EPMS_PlanActivityOfProject" />
<!---项目ID-->
<input type="hidden" id="hiOrganizationId" name="hiOrganizationId" runat="server"
    field="OrganizationID" tablename="EPMS_PlanActivityOfProject" />
<!---项目编号-->
<input type="hidden" id="hiProjectCode" name="hiProjectCode" runat="server" field="ProjectCode"
    tablename="EPMS_PlanActivityOfProject" />
<!---项目名称-->
<input type="hidden" id="hiProjectName" name="hiProjectName" runat="server" field="ProjectName"
    tablename="EPMS_PlanActivityOfProject" />
<!----计划人员ID-->
<input type="hidden" runat="server" id="hiPlanUserID" field="PlanUserID" tablename="EPMS_PlanActivityOfProject" />
<!----计划人员姓名-->
<input type="hidden" runat="server" id="hiPlanUserName" field="PlanUserName" tablename="EPMS_PlanActivityOfProject" />
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
<asp:LinkButton runat="server" ID="lbtnRefresh" OnClick="lbtnRefresh_Click" Style="display: none"></asp:LinkButton>
<input type="hidden" runat="server" id="hiHasInitWBS" flag="HasInitWBS" />
<input type="hidden" runat="server" id="hiPlanYear" field="PlanYear" tablename="EPMS_PlanActivityOfProject" />
<input type="hidden" runat="server" id="hiPlanCycle" field="PlanCycle" tablename="EPMS_PlanActivityOfProject" />
<input type="hidden" runat="server" id="hiPlanMonth" field="PlanMonth" tablename="EPMS_PlanActivityOfProject" />
<input type="hidden" runat="server" id="hiPlanQuarter" field="PlanQuarter" tablename="EPMS_PlanActivityOfProject" />
<input type="hidden" runat="server" id="hiPlanWeek" field="PlanWeek" tablename="EPMS_PlanActivityOfProject" />
<input type="hidden" runat="server" id="hiPlanPeriod" />
<input type="hidden" runat="server" id="hiParamSpecialtyIDs" />
<!---表单类型-->
<input type="hidden" id="hiFormType" name="hiFormType" runat="server" field="FormType"
    tablename="EPMS_PlanActivityOfProject" />
<input type="hidden" runat="server" id="hiRoleName" value="主任工程师,科室负责人" />
<asp:LinkButton runat="server" ID="lbtnOK" OnClick="btnOK_Click" Style="display: none"></asp:LinkButton>
<input type="hidden" runat="server" id="hiWBSXml" />
<script>
    var rollXmlDoc = new KPMSXml();
    function initCustomerPlugin() {
       planTimeInfo_Init();
       inExportEvent();
       rollXmlDoc.loadXML("<root></root>");
       $("[wbsID]").live("change", function () {
            $("#" + $(this).attr("id")).val($(this).val());
       });
       initDetailEvent();
    }
 
    function refreshWbsInfo() {
         <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.lbtnRefresh, "")%>;
    }

    //发送时的相关提示
    function checkForm() {
        if ($formAction == 0) {
            if ($actName == "编制计划安排" || $actName == "计划安排审核" || $actName == "专业任务评估，配置资源" || $actName == "计划进度协商") {
               <%=Page.ClientScript.GetPostBackEventReference(this.lbtnOK,"")%>;
                if ($actName == "编制计划安排" || $actName == "计划安排审核"){
                     //是否添加了卷册信息
                    if (!checkHasChooseWBS()) {
                         alert("请选择卷册");
                         return false;
                    }
                }
                if($actName == "计划安排审核"){
                    var hasFill =checkRollMustDate("StartTime") ;
                    if (!parseBool(hasFill)) {
                        alert("必须填写计划设计开始时间");
                        return false;
                    }
                    var publishRollState=checkPublishDateIsFill();
                    if(publishRollState!=""){
                        alert(publishRollState);
                        return false;
                    }
                }
                else if($actName == "专业任务评估，配置资源"){
                   var handTimehasFill =checkRollMustDate("HandTime") ;
                   if (!parseBool(handTimehasFill)) {
                        alert("必须填写个人计划出手时间");
                        return false;
                   }
                   var handRecheckTime1Fill =checkRollMustDate("RecheckTime1") ;
                   if (!parseBool(handRecheckTime1Fill)) {
                        alert("必须填写计划室交出时间");
                        return false;
                   }
                }

                //判断日期填写是否正确
                //验证计划开始时间必须小于计划设计完成时间、计划审核完成时间、计划完成时间
                //计划设计完成时间必须小于计划审核完成时间、计划完成时间
                //计划审核完成时间必须小于计划完成时间
                var notRightDate = checkDateIsRight();
                if (notRightDate != "") {
                    alert(notRightDate + "存在计划数据不合理的数据，请修改后再发送！");
                    return false;
                }
            }
        }
        return true;
    }

    //判断日期填写是否正确
    function checkDateIsRight() {
        var json = getFilterJson("");
        var dateIsRight = formCallback("CheckDateIsRight", json);
        return dateIsRight;
    }
    //出版卷册必须填写计划院交出时间，非出版卷册必须填写计划室交出时间
    function checkPublishDateIsFill(){
        var json = getFilterJson("");
        var publishDateIsRight = formCallback("CheckPublicDateIsRight", json);
        return publishDateIsRight;
    }
 
       //获取json参数信息
    function getFilterJson(fieldNames) {
        var isFilterBySpe = $actName == "专业任务评估，配置资源";
        var planActivityOfProjectID = $bizCtx.bizId ;
        var paramSpecialtyIDs = $("#<%=hiParamSpecialtyIDs.ClientID %>").val();
        var json = {"paramSpecialIDs": paramSpecialtyIDs, "isFilterBySpe": isFilterBySpe, "fieldNames": fieldNames,"planActivityOfProjectID": planActivityOfProjectID};
        return json;
    }
    
    //验证所有的必填数据是否已必填
    function checkRollMustDate(fieldNames) {
        var json = getFilterJson(fieldNames);
        var mustDateResult = formCallback("CheckMustDateIsFill", json);
        return mustDateResult;
    }

    //选择要列入本期计划的WBS信息
    function selWBSInfo() {
        var organizationID = $("#<%=hiOrganizationId.ClientID %>").val();
        var param = new InputParamObject("m"); 
        //var filter ={ OrganizationID:organizationID,WBSState:"<%=(int)DAL.EPMS.WBSState.尚未开展 %>"};
        var filter ={ OrganizationID:organizationID};
        getWBS("<%=hiWBSXml.ClientID %>", param, filter, refreshWbsInfo);
    }
    
</script>
