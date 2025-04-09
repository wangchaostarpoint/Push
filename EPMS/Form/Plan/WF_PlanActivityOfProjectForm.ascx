<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_PlanActivityOfProjectForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.Plan.WF_PlanActivityOfProjectForm" %>
<%@ Register Src="../../UI/Project/ProjectCommon.ascx" TagName="ProjectCommon" TagPrefix="uc1" %>
<%@ Register Src="../../UI/Plan/ProjOverallPlan.ascx" TagName="ProjOverallPlan" TagPrefix="uc2" %>
<%@ Register Src="../../UI/Plan/ProjPlanSpe.ascx" TagName="ProjPlanSpe" TagPrefix="uc4" %>
<%@ Register Src="../../UI/Plan/PlanTimeInfo.ascx" TagName="PlanTimeInfo" TagPrefix="uc5" %>
<%@ Register Src="~/EPMS/UI/Plan/PlanTimeInfo.ascx" TagName="PlanTimeInfo" TagPrefix="uc6" %>
<%@ Register Src="~/EPMS/UI/Plan/DeptPlanOfWBS.ascx" TagName="DeptPlanOfWBS" TagPrefix="uc7" %>
<%@ Import Namespace="Zhongsoft.Portal.ACL" %>
<%@ Import Namespace="DAL.EPMS" %>
<table class="tz-table" width="100%" id="tbProject">
    <uc1:ProjectCommon ID="ucProjectCommon" runat="server" />
    <uc5:PlanTimeInfo ID="ucPlanTimeInfo" runat="server" OnDDLSelectCompleted="SelectCompleted" />
    <uc4:ProjPlanSpe ID="ucProjPlanSpe" runat="server" />
    <tr id="trDeptProjPlan" runat="server">
        <td colspan="6">
            <div id="divDeptProjPlan" style="height: 100%">
                <asp:UpdatePanel ID="panelDeptProjPlan" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <table class="tz-table" width="100%">
                            <tr>
                                <td class="td-l">
                                    科室
                                </td>
                                <td class="td-r">
                                    <zhongsoft:XHtmlInputText runat="server" ID="txtWriteDeptName" activestatus="(23.*)"
                                        readonly="readonly" class="kpms-textbox" field="WriteDeptName" tablename="EPMS_PlanActivity" />
                                    <input type="hidden" runat="server" id="hiWriteDeptID" field="WriteDeptID" tablename="EPMS_PlanActivity" />
                                </td>
                                <td class="td-l" nowrap>
                                    筛选范围
                                </td>
                                <td colspan="3" class="td-m">
                                    <table width="100%">
                                        <tr>
                                            <td>
                                                <asp:CheckBoxList runat="server" ID="cbTimeQuery" RepeatDirection="Horizontal">
                                                    <asp:ListItem Text="个人出手" Value="PlanHandTime"></asp:ListItem>
                                                    <asp:ListItem Text="校核" Value="PlanCheckTime"></asp:ListItem>
                                                    <asp:ListItem Text="室交出" Value="PlanRecheckTime1"></asp:ListItem>
                                                    <asp:ListItem Text="出图" Value="PlanCompleteTime"></asp:ListItem>
                                                </asp:CheckBoxList>
                                            </td>
                                            <td>
                                                <p>
                                                    <asp:RadioButtonList runat="server" ID="rbTimeQuery" RepeatDirection="Horizontal">
                                                        <asp:ListItem Text="近两周" Value="twoWeek"></asp:ListItem>
                                                        <asp:ListItem Text="近一周" Value="oneWeek"></asp:ListItem>
                                                        <asp:ListItem Text="近三天" Value="neerThreeDay"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </p>
                                            </td>
                                            <td>
                                                <asp:LinkButton runat="server" ID="btnQuery" OnClick="btnQuery_Click">
                      <span content='searchResult'>查询</span>
                                                </asp:LinkButton>
                                                <asp:LinkButton runat="server" ID="btnReset" OnClick="btnReset_Click">
                      <span content='searchResult'>重置</span>
                                                </asp:LinkButton>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <asp:CheckBox ID="cbThisFromModify" runat="server" OnCheckedChanged="cbThisFromModify_Click"
                                                    AutoPostBack="true" Text="本次修改" />
                                                <zhongsoft:XHtmlInputText runat="server" ID="txtStartDate" EnableTheming="false"
                                                    class="kpms-textbox-date" readonly="readonly" />
                                                <zhongsoft:XHtmlInputText runat="server" ID="txtEndDate" EnableTheming="false" class="kpms-textbox-date"
                                                    readonly="readonly" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <uc7:DeptPlanOfWBS ID="ucDeptPlanOfWBS" runat="server" />
                        </table>
                        <script type="text/javascript">
               
                        </script>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </td>
    </tr>
</table>
<table class="tz-table" id="tbPlan">
    <tr id="Tr1" runat="server" nodisplaystatus="(2.*)">
        <td colspan="6">
            <input type="hidden" runat="server" id="hiIndex" value="0" />
            <div id="templateTabs" style="width: 100%">
                <ul id="ulHeader">
                    <li><a href='#ProjAllPlan' id='aProjAllPlan'>项目总体计划 </a></li>
                    <li><a href='#ProjMonthPlan' id='aProjMonthPlan'>按项目时间周期计划展示查看</a></li>
                </ul>
                <div id="ProjAllPlan">
                    <asp:UpdatePanel ID="panelProjOverallPlan" UpdateMode="Conditional" runat="server">
                        <ContentTemplate>
                            <uc2:ProjOverallPlan ID="ucProjOverallPlan" runat="server" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div id="ProjMonthPlan" style="height: 100%">
                    <asp:UpdatePanel ID="panelProjMonthPlan" UpdateMode="Conditional" runat="server">
                        <ContentTemplate>
                            <iframe name="frameProjMonthPlan" frameborder="0" id="frameProjMonthPlan" style="width: 97%;
                                height: 100%"></iframe>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
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
<!---发送到主任/主任工步骤时筛选的角色名称--->
<input type="hidden" runat="server" id="hiRoleName" value="主任工程师,科室负责人" />
<script>
    var rollXmlDoc = new KPMSXml();
    function initCustomerPlugin() {
        planTimeInfo_Init();
        projPlanSpe_Init();
        $('#templateTabs li a').each(function (i) {
            var index = $("#<%=hiIndex.ClientID %>").val();
            if (i == index) {
                $('#templateTabs').tabs({ active: i });
                if (i == 1) {
                    resetTabsActive();
                }
            }
            $(this).click(function () {
                $('#templateTabs').tabs({ active: i });
                if (i == 1) {
                    resetTabsActive();
                }
                $("#<%=hiIndex.ClientID %>").val(i);
                return false;
            });
        })
        if (typeof (projOverallPlan_Init) == "function") {
            projOverallPlan_Init();
        }
        if (typeof (initAllEvent) == "function") {
            initAllEvent();
        }
        if ($actName == "专业任务评估，配置资源") {
            //主任工步骤处理：frameDeptProjPlan加载室主任安排计划页面
            $("#divDeptProjPlan").show();
            $("#tbPlan").hide();
            planTimeInfo_Init();
            if (typeof (inExportEvent) == "function")
                inExportEvent();
            rollXmlDoc.loadXML("<root></root>");
            if (typeof (saveChangeWBSInfo) == "function")
                $("[wbsID]").live("blur", function () {
                    $("#" + $(this).attr("id")).val($(this).val());
                    saveChangeWBSInfo(this);
                });

            if (typeof (getWBSChecker) == "function")
                getWBSChecker();

        } else {
            $("#divDeptProjPlan").hide();
            $("#tbPlan").show();
        }
    }

    //点击页签tab页加载页签内容
    function resetTabsActive() {
        var organizationID = $("#<%=hiOrganizationId.ClientID %>").val();
        var planCycle = $("#<%=hiPlanCycle.ClientID %>").val();
        var oldurl = $("#frameProjMonthPlan").attr("src");
        var enabled = $action == "<%=(int)AccessLevel.Update %>" && ($actName == "编制计划安排" || $actName == "计划安排审核");
        var isEntityData = $("#<%=hiPlanCycle.ClientID %>").val() == "<%=PlanCycle.项目全周期.ToString() %>";
        var url = "<%=WebAppPath %>/EPMS/List/Plan/ProjMonthPlan.aspx?OrganizationID=" + organizationID + "&Enabled=" + enabled + "&IsEntityData=" + isEntityData;
        if (!isEntityData) {
            var planYear = $("#<%=hiPlanYear.ClientID %>").val();
            var planPeriod = $("#<%=hiPlanPeriod.ClientID %>").val();
            url += "&PlanCycle=" + escape(planCycle) + "&PlanYear=" + planYear + "&PlanPeriod=" + planPeriod;
        }
        //判断oldurl是否为空
        if (oldurl == "" || oldurl == undefined) {
            $("#frameProjMonthPlan").attr("src", url);
        }
    }

    //设置Iframe 高度
    function iFrame(iframeId, height) {
        $('#' + iframeId).height(height + 30 + 'px');
    }

    function refreshWbsInfo() {
         <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.lbtnRefresh, "")%>;
    }

    //发送时的相关提示
    function checkForm() {
        if ($formAction == 0) {
            if ($actName == "编制计划安排" || $actName == "计划安排审核" || $actName == "专业任务评估，配置资源" || $actName == "计划进度协商") {
                //判断日期填写是否正确
                //验证计划开始时间必须小于计划设计完成时间、计划审核完成时间、计划完成时间
                //计划设计完成时间必须小于计划审核完成时间、计划完成时间
                //计划审核完成时间必须小于计划完成时间
                var notRightDate = checkDateIsRight();
                if (notRightDate != "") {
                    alert(notRightDate + "计划数据不合理，请修改后再发送！");
                    return false;
                }
            }
        }
        return true;
    }

    //判断日期填写是否正确
    function checkDateIsRight() {
        var json = getFilterJson();
        var dateIsRight = formCallback("CheckDateIsRight", json);
        return dateIsRight;
    }

    //获取json参数信息
    function getFilterJson() {
        //项目ID
        var planYear = $("#<%=hiOrganizationId.ClientID %>").val();
        var paramSpecialtyIDs = $("#<%=hiParamSpecialtyIDs.ClientID %>").val();
        var json = { "organizationID": planYear, "paramSpecialtyIDs": paramSpecialtyIDs,deptID:'' };
        return json;
    }

</script>
