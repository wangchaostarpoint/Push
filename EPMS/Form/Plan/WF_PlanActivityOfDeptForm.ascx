<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_PlanActivityOfDeptForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.Plan.WF_PlanActivityOfDeptForm" %>
<%@ Register Src="../../UI/Plan/DeptPlanOfWBS.ascx" TagName="DeptPlanOfWBS" TagPrefix="uc1" %>
<%@ Register Src="../../UI/Plan/PlanProj.ascx" TagName="PlanProj" TagPrefix="uc2" %>
<%@ Register Src="../../UI/Plan/PlanTimeInfo.ascx" TagName="PlanTimeInfo" TagPrefix="uc3" %>
<style type="text/css">
    
</style>
<table class="tz-table" width="100%">
    <uc3:PlanTimeInfo ID="ucPlanTimeInfo" runat="server" />
    <tr>
        <td class="td-l">
            计划专业<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlSpe" activestatus="(2.月度计划安排)"
                req="1">
            </zhongsoft:LightDropDownList>
            <input type="hidden" runat="server" id="hiProjSpe" field="WriteSpecialtys" tablename="EPMS_PlanActivity" />
        </td>
        <td class="td-l">
            编制部门<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtWriteDeptName" activestatus="(23.月度计划安排)"
                readonly="readonly" class="kpms-textbox" req="1" field="WriteDeptName" tablename="EPMS_PlanActivity" />
            <input type="hidden" runat="server" id="hiWriteDeptID" field="WriteDeptID" tablename="EPMS_PlanActivity" />
        </td>
        <td class="td-l">
        </td>
        <td class="td-r">
        </td>
    </tr>
    <tr>
        <td class="td-l">
            计划主题<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbActivityTheme" runat="server" EnableTheming="false"
                CssClass="kpms-textarea" MaxLength="128" tablename="EPMS_PlanActivity" TextMode="MultiLine"
                field="ActivityTheme" activestatus="(0.*)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr runat="server" nodisplaystatus="(2.*)">
        <td class="td-l">
            我担任的角色
        </td>
        <td colspan="4" class="td-m">
            <asp:CheckBoxList runat="server" ID="cblUndertakeRole" RepeatDirection="Horizontal"
                RepeatColumns="8">
            </asp:CheckBoxList>
        </td>
        <td align="right" class="td-l">
            <asp:LinkButton runat="server" ID="lbtnQuery" OnClick="btnQuery_Click">
                      <span content='searchResult'>查询</span>
            </asp:LinkButton>
            <asp:LinkButton runat="server" ID="lbtnReset" OnClick="lbtnReset_Click">
                      <span content='searchResult'>重置</span>
            </asp:LinkButton>
        </td>
    </tr>
    <tr id="Tr1" runat="server" nodisplaystatus="(2.*)">
        <td colspan="6">
            <div id="divCustomBar" style="float: left;" class="subtoolbarbg">
                <asp:LinkButton runat="server" ID="lbtnRollProject" CssClass="subtoolbarlink" EnableTheming="false"
                    OnClientClick="return projectPlan('DeptProjectPlan')" ToolTip="编辑计划" OnClick="lbtnRollProject_Click">
                    <span>
                        <img runat="server" id="img2" src="~/Themes/Images/Project_Icon.bmp" alt="编辑计划" width="16"
                            height="16" />当前年当前月计划</span>
                </asp:LinkButton>
                <a flag="viewPrePlan" class="subtoolbarlink" enabletheming="false"><span>
                    <img runat="server" id="img3" src="~/Themes/Images/btn_chakan.gif" alt="编辑计划" width="16"
                        height="16" />上期计划项目</span></a>
            </div>
        </td>
    </tr>
</table>
<table id="Table1" class="tz-table" flag="thisPlanProj" runat="server" nodisplaystatus="(2.*)">
    <tr>
        <td colspan="6">
            <uc1:DeptPlanOfWBS ID="ucDeptPlanOfWBS" runat="server" nodisplaystatus="(2.*)" />
        </td>
    </tr>
</table>
<!--主键 -->
<input type="hidden" id="hiPlanActivityID" runat="server" field="PlanActivityID"
    tablename="EPMS_PlanActivity" />
<!--流程表单类型--->
<input type="hidden" id="hiFormType" runat="server" field="FormType" tablename="EPMS_PlanActivity" />
<!--计划状态--->
<input type="hidden" id="hiPlanState" runat="server" field="PlanState" tablename="EPMS_PlanActivity"
    value="1" />
<!----发起人ID-->
<input type="hidden" runat="server" id="hiStartUserID" field="StartUserID" tablename="EPMS_PlanActivity" />
<!----发起人姓名-->
<input type="hidden" runat="server" id="hiStartUserName" field="StartUserName" tablename="EPMS_PlanActivity" />
<input type="hidden" runat="server" id="hiActivityTheme" field="ActivityTheme" tablename="EPMS_PlanActivity" />
<input type="hidden" runat="server" id="hiPlanYear" field="PlanYear" tablename="EPMS_PlanActivity" />
<input type="hidden" runat="server" id="hiPlanCycle" field="PlanCycle" tablename="EPMS_PlanActivity" />
<input type="hidden" runat="server" id="hiPlanMonth" field="PlanMonth" tablename="EPMS_PlanActivity" />
<input type="hidden" runat="server" id="hiPlanQuarter" field="PlanQuarter" tablename="EPMS_PlanActivity" />
<input type="hidden" runat="server" id="hiPlanWeek" field="PlanWeek" tablename="EPMS_PlanActivity" />
<input type="hidden" runat="server" id="hiPlanPeriod" />
<!----填写人ID-->
<input type="hidden" runat="server" id="hiWriteUserID" field="WriteUserID" tablename="EPMS_PlanActivity" />
<!----填写人姓名-->
<input type="hidden" runat="server" id="hiWriteUserName" field="WriteUserName" tablename="EPMS_PlanActivity" />
<!----记录选择的专业信息--->
<input type="hidden" runat="server" id="hiParamSpecialID" />
<asp:LinkButton runat="server" ID="lbtnOK" OnClick="btnOK_Click" Style="display: none"></asp:LinkButton>
<script>
    var rollXmlDoc = new KPMSXml();
    function initCustomerPlugin() {
        deptPlanOfWBS_Init();
        planTimeInfo_Init();
        $('[flag="viewPrePlan"]').each(function () {
            $(this).bind('click', function () {
                return viewPrePlanProj();
            });
        });

        if (typeof (inExportEvent) == "function")
            inExportEvent();
        if (typeof (initDetailEvent) == "function")
            initDetailEvent();

        rollXmlDoc.loadXML("<root></root>");
        if (typeof (saveChangeWBSInfo) == "function")
            $("[wbsID]").live("blur", function () {
                $("#" + $(this).attr("id")).val($(this).val());
                saveChangeWBSInfo(this)
        });

        if($actName!="计划进度协商"){
           $("[flag=lbPrompt]").show();
        }
    }
    //查询上期项目信息
    function viewPrePlanProj() {
        var planCycle = $("#<%=hiPlanCycle.ClientID %>").val();
        var planYear = $("#<%=hiPlanYear.ClientID %>").val();
        var planPeriod = $("#<%=hiPlanPeriod.ClientID %>").val();
        var json = { PlanYear: planYear, PlanCycle: planCycle, PlanPeriod: planPeriod };
        var url = buildQueryUrl('/EPMS/List/Plan/PreProjPlan.aspx', json);
        window.open(encodeURI(url), "")
        return false;
    }


    //绑定WBS列表
    function refreshDetail() {
        <%=Page.ClientScript.GetPostBackEventReference(this.lbtnRollProject,"")%>;
    }

    //打开Project网页版计划信息
    function projectPlan(projectdataconfig) {
        var enabled = "<%=Enabled %>".toLowerCase() == "true";
        var projectId = $("#<%=hiWriteDeptID.ClientID %>").val();
        var url = "<%=WebAppPath %>/EPMS/List/Plan/WebProjectPlan.aspx?ActionType=" + (enabled ? "1" : "0") + "&UserId=<%=ActualTaskUserId %>&OrganizationID=" + projectId + "&ProjectDataConfig=" + projectdataconfig;
        window.open(encodeURI(url), "");
        if (enabled) {
            refreshDetail();
            return false;
        }
        else {
            return false;
        }
    }

    //发送时的相关提示
    function checkForm() {
        if ($formAction == 0) {
            if ($actName == "月度计划安排" || $actName == "审核") {
                <%=Page.ClientScript.GetPostBackEventReference(this.lbtnOK,"")%>;
                var $l = eval('(' + checkRollMustDate("PlanRecheckTime1,PlanStartTime,PlanHandTime") + ')');
                var planRecheckTime1Empty = $l[0][0];
                var planStartTimeEmpty = $l[0][1];
                var planHandTimEmpty = $l[0][2];
                if (planRecheckTime1Empty != "") {
                    alert("以下项目存在计划室交出时间为空的计划，请填写所有计划室交出时间！\n"+planRecheckTime1Empty);
                    return false;
                }
                if ($actName == "审核") {
                    if (planStartTimeEmpty != "") {
                        alert("以下项目存在计划设计开始时间为空的计划，请填写所有计划设计开始时间\n"+planStartTimeEmpty);
                        return false;
                    }
                    if (planHandTimEmpty != "") {
                        alert("以下项目存在计划个人出手时间为空的计划，请填写所有计划个人出手时间\n"+planHandTimEmpty);
                        return false;
                    }
                   //是否存在卷册负责人为空的卷册
                   var rollOwnernullProj= checkWBSOwnerIsNull();
                   if (rollOwnernullProj!=""){
                       alert("以下项目存在卷册负责人为空的卷册，请选择卷册负责人\n"+rollOwnernullProj);
                       return false;
                   }
                }
                else {
                    if (planStartTimeEmpty != "") {
                        if (!confirm("以下项目存在计划设计开始时间为空的计划，您确认直接发送？\n"+planStartTimeEmpty))
                            return false;
                    }
                    if (planHandTimEmpty != "") {
                        if (!confirm("以下项目存在计划个人出手时间为空的计划，您确认直接发送？\n"+planHandTimEmpty))
                            return false;
                    }
                }
                 //验证计划开始时间必须小于计划设计完成时间、计划审核完成时间、计划完成时间
                //计划设计完成时间必须小于计划审核完成时间、计划完成时间
                //计划审核完成时间必须小于计划完成时间
                var notRightDate = checkFillDateIsRight();
                if (notRightDate != "") {
                    alert("以下项目专业下存在不合理的数据，请修改后再发送！\n"+notRightDate);
                    return false;
                }
            }
            //验证室交出时间必填
            else if ($actName == "计划进度协商") {
                <%=Page.ClientScript.GetPostBackEventReference(this.lbtnOK,"")%>;
                var $l = eval('(' + checkRollMustDate("PlanRecheckTime1") + ')');
                var planRecheckTime1Empty = $l[0][0];
                if (planRecheckTime1Empty != "") {
                    alert("以下项目存在计划室交出时间为空的计划，请填写所有计划室交出时间！\n"+planRecheckTime1Empty);
                    return false;
                }
                   //验证计划开始时间必须小于计划设计完成时间、计划审核完成时间、计划完成时间
                //计划设计完成时间必须小于计划审核完成时间、计划完成时间
                //计划审核完成时间必须小于计划完成时间
                var notRightDate = checkFillDateIsRight();
                if (notRightDate != "") {
                      alert("以下项目专业下的计划数据不合理，请修改后再发送！\n"+notRightDate);
                    return false;
                }
            }
        }
        return true;
    }

    //验证所有的必填数据是否已必填
    function checkRollMustDate(fieldNames) {
        var json = getFilterJson(fieldNames);
        var mustDateResult = formCallback("GetPlanRollNoMustDate", json);
        return mustDateResult;
    }
    //是否存在卷册负责人为空的卷册
    function checkWBSOwnerIsNull(){
        var json = getFilterJson("");
        var ownerIsNull = formCallback("GetPlanWBSOwnerIsNull", json);
        return ownerIsNull;
    }

     //判断日期填写是否正确
    function checkFillDateIsRight(){
        var json = getFilterJson('');
        var dateIsRight = formCallback("CheckDateIsRight", json);
        return dateIsRight;
    }

    //获取json参数信息
    function getFilterJson(fieldNames) {
        //计划年
        var planYear = $("#<%=hiPlanYear.ClientID %>").val();
        //计划周期值
        var planPeriod = $("#<%=hiPlanPeriod.ClientID %>").val();
        //计划周期
        var planCycle = $("#<%=hiPlanCycle.ClientID %>").val();
        var paramSpecialIDs = $("#<%=hiParamSpecialID.ClientID %>").val();
        var planOrMasterUserId = "<%=KPMSUser.UserId %>";
        var isNotFilterUser = $actName != "计划进度协商";
        var json = { "planYear": planYear, "planPeriod": planPeriod, "planCycle": planCycle, "paramSpecialIDs": paramSpecialIDs, "planOrMasterUserId": planOrMasterUserId, "isNotFilterUser": isNotFilterUser, "fieldNames": fieldNames };
        return json;
    }

    //获取当前步骤名称
    function getCurrActName(){
       return $actName;
    }
</script>
