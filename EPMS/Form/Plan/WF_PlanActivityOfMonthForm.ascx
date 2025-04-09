<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_PlanActivityOfMonthForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.Plan.WF_PlanActivityOfMonthForm" %>
<%@ Register Src="../../UI/Plan/PlanProj.ascx" TagName="PlanProj" TagPrefix="uc1" %>
<%@ Register Src="../../UI/Plan/PlanTimeInfo.ascx" TagName="PlanTimeInfo" TagPrefix="uc2" %>
<%@ Register Src="../../UI/Plan/PlanWBSOfRoll.ascx" TagName="PlanWBSOfRoll" TagPrefix="uc3" %>
<%@ Register Src="../../UI/Plan/HBPlanProj.ascx" TagName="HBPlanProj" TagPrefix="uc4" %>
<table class="tz-table" width="100%">
    <uc2:PlanTimeInfo ID="ucPlanTimeInfo" runat="server" />
    <tr>
        <td class="td-l">
            计划的工程类别<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <asp:CheckBox runat="server" ID="cbAllChecked" Text="全选" displaystatus="(23.编制计划安排)(3.计划工程师编制计划安排)"
                checkFlag="all" AutoPostBack="true" OnCheckedChanged="cbType_CheckedChanged" />
            <asp:CheckBoxList runat="server" ID="cblProjType" RepeatDirection="Horizontal" RepeatColumns="6"
                req="1" activestatus="(23.编制计划安排)(3.计划工程师编制计划安排)" AutoPostBack="true" OnSelectedIndexChanged="cbType_CheckedChanged">
            </asp:CheckBoxList>
            <input type="hidden" runat="server" id="hiProjectTypes" field="ProjectTypes" tablename="EPMS_PlanActivity" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            计划主题<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbActivityTheme" runat="server" EnableTheming="false"
                CssClass="kpms-textarea" MaxLength="128" tablename="EPMS_PlanActivity" field="ActivityTheme"
                TextMode="MultiLine" activestatus="(0.*)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            计划管理岗
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtWriteUserName" activestatus="(23.编制计划安排)"
                readonly="readonly" class="kpms-textbox" field="WriteUserName" tablename="EPMS_PlanActivity" />
        </td>
        <td class="td-l">
            安排部门
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtWriteDeptName" activestatus="(23.编制计划安排)"
                readonly="readonly" class="kpms-textbox" field="WriteDeptName" tablename="EPMS_PlanActivity" />
        </td>
        <td class="td-l">
        </td>
        <td>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            备注
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbMemo" runat="server" EnableTheming="false" CssClass="kpms-textarea"
                MaxLength="512" tablename="EPMS_PlanActivity" field="Memo" TextMode="MultiLine"
                activestatus="(23.*)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr style="color: Red; display: none">
        <td class="td-m" colspan="6">
            为了保证计划统计数据的准确性，此流程请在本月25号之前流转完成
        </td>
    </tr>
</table>
<table class="tz-table" width="100%" runat="server" nodisplaystatus="(2.*)">
    <tr id="thisPlanProjHeader" onclick="openDetailInfo('thisPlanProj')">
        <td colspan="6" class="flexible">
            本期计划项目/卷册&nbsp;<img src="../../themes/images/lright.png" />
        </td>
    </tr>
    <%--  <tr flag="thisPlanProj">
        <td colspan="6">
            <div style="width: 100%; float: left; padding-top: 3px;">
                <fieldset class="rtm_fds_bd" id="Fieldset1" style="display: block">
                    <legend class="rtm_fds_tle" onclick="openDetailInfo('search')">
                        <div id="toolbarlay">
                            <span style="font-weight: bold">计划项目/卷册查询<img src="../../themes/images/lright.png" /></span></div>
                    </legend>
                    <div style="background-color: #EFF2F7;" id="divQuery">
                        <table style="width: 100%" flag="search">
                            <tr>
                                <td style="padding-top: 5px !important">
                                    我担任的角色
                                </td>
                                <td>
                                    <div>
                                        <asp:CheckBoxList runat="server" ID="cblUndertakeRole" RepeatDirection="Horizontal"
                                            RepeatColumns="6">
                                        </asp:CheckBoxList>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-top: 5px !important">
                                    设总
                                </td>
                                <td>
                                    <asp:CheckBoxList runat="server" RepeatColumns="9" ID="cblMaster">
                                    </asp:CheckBoxList>
                                </td>
                                <td align="right">
                                    <a class="subtoolbarlink" enabletheming="false" relcontrolid="cblMaster" flag="viewMore"
                                        shouldshowmore="1">更多</a>
                                    <input type="hidden" runat="server" id="hiCblMasterShowMore" value="0" />
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-top: 5px !important">
                                    计划人员
                                </td>
                                <td>
                                    <asp:CheckBoxList runat="server" RepeatColumns="9" ID="cblPlanUser">
                                    </asp:CheckBoxList>
                                </td>
                                <td align="right">
                                    <a class="subtoolbarlink" enabletheming="false" relcontrolid="cblPlanUser" flag="viewMore"
                                        shouldshowmore="1">更多</a>
                                    <input type="hidden" runat="server" id="hiCblPlanShowMore" value="0" />
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr class="list-leader">
                                <td style="padding-top: 5px !important">
                                    专业
                                </td>
                                <td>
                                    <asp:CheckBoxList runat="server" RepeatColumns="6" ID="cbSpecality">
                                    </asp:CheckBoxList>
                                </td>
                                <td align="right">
                                    <a class="subtoolbarlink" enabletheming="false" relcontrolid="cbSpecality" flag="viewMore"
                                        shouldshowmore="1">更多</a>
                                    <input type="hidden" runat="server" id="hiCblSpecality" value="0" />
                                </td>
                                <td align="right" style="width: 150px">
                                    <asp:LinkButton runat="server" ID="btnQuery" OnClick="btnQuery_Click">
                      <span content='searchResult'>查询</span>
                                    </asp:LinkButton>
                                    <asp:LinkButton runat="server" ID="lbtnReset" OnClick="lbtnReset_Click">
                      <span content='searchResult'>重置</span>
                                    </asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                        <div style="float: right; padding-right: 5px; padding-top: 5px;" flag="search">
                        </div>
                    </div>
                </fieldset>
            </div>
        </td>
    </tr>--%>
    <tr runat="server" displaystatus="(23.项目月度计划安排)(3.月度计划调整)" flag="thisPlanProj">
        <td colspan="6">
            <span class="req-star">设总安排室交出时间与院交出时间时，需考虑日期安排合理性，给科室安排工作预留时间</span>
        </td>
    </tr>
    <tr flag="thisPlanProj">
        <td colspan="6">
            <uc4:HBPlanProj ID="ucPlanProj" runat="server" OnAfterAddProjClick="AfterAddProjClick" />
        </td>
    </tr>
</table>
<table class="tz-table" flag="thisPlanProj" runat="server" nodisplaystatus="(2.*)">
    <tr flag="thisPlanProj">
        <td>
            <table class="tz-table">
                <tr>
                    <td nowrap>
                        <span>当前项目</span>
                    </td>
                    <td align="right">
                        <zhongsoft:LightDropDownList runat="server" ID="ddlPlanProj" Width="400px">
                        </zhongsoft:LightDropDownList>
                    </td>
                    <td align="left" nowrap>
                        <span>专业</span>
                        <zhongsoft:LightDropDownList runat="server" ID="ddlSpe" Width="120px">
                        </zhongsoft:LightDropDownList>
                    </td>
                    <td align="left" nowrap>
                        <span>是否设总添加</span>
                        <zhongsoft:LightDropDownList runat="server" ID="ddlIsImportant" Width="120px">
                            <asp:ListItem Text="全部" Value=""></asp:ListItem>
                            <asp:ListItem Text="是" Value="1"></asp:ListItem>
                            <asp:ListItem Text="否" Value="0"></asp:ListItem>
                        </zhongsoft:LightDropDownList>
                    </td>
                    <td nowrap>
                        <asp:LinkButton runat="server" ID="lbtnSearch" OnClick="lbtnSearch_Click">
                      <span content='searchResult'>查询</span>
                        </asp:LinkButton>
                        <asp:LinkButton runat="server" ID="lbtnResetWBSSearch" OnClick="lbtnResetWBSSearch_Click">
                      <span content='searchResult'>重置</span>
                        </asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td align="left" colspan="5">
                        <span>任务类型</span>
                        <zhongsoft:LightDropDownList runat="server" ID="ddlWBSType" Width="200px">
                        </zhongsoft:LightDropDownList>
                        <span>负责人</span>
                        <zhongsoft:LightTextBox runat="server" ID="txtOwnerName" CssClass="kpms-textboxsearch" Width="100px" EnableTheming="False"/>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <uc3:PlanWBSOfRoll ID="ucPlanWBSOfRoll" runat="server" nodisplaystatus="(2.*)" />
        </td>
    </tr>
</table>
<table class="tz-table" width="100%" runat="server" nodisplaystatus="(2.*)">
    <tr id="prePlanProjHeader" onclick="openDetailInfo('prePlanPro')">
        <td class="flexible">
            上期计划项目&nbsp;<img src="../../themes/images/lright.png" />
        </td>
    </tr>
    <tr flag="prePlanPro">
        <td colspan="6" align="right">
            <span>工程类型</span>
            <zhongsoft:LightDropDownList runat="server" ID="ddlPreProjectType" Width="150px">
            </zhongsoft:LightDropDownList>
            <span>项目编号/名称</span>
            <asp:TextBox ID="tbProjectInfo" runat="server" MaxLength="64" CssClass="kpms-textboxsearch"
                EnableTheming="false"></asp:TextBox>
            <asp:LinkButton runat="server" ID="lbtPerSearch" OnClick="lbtPerSearch_Click">
                      <span content='searchResult'>查询</span>
            </asp:LinkButton>
            <asp:LinkButton runat="server" ID="lbtPerReset" OnClick="lbtPerReset_Click">
                      <span content='searchResult'>重置</span>
            </asp:LinkButton>
        </td>
    </tr>
    <tr flag="prePlanPro">
        <td colspan="6">
            <uc1:PlanProj ID="ucPrePlanProj" runat="server" />
        </td>
    </tr>
</table>
<div style="height: 5px">
</div>
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
<!----填写人ID-->
<input type="hidden" runat="server" id="hiWriteUserID" field="WriteUserID" tablename="EPMS_PlanActivity" />
<!----填写人所在部门ID-->
<input type="hidden" runat="server" id="hiWriteDeptID" field="WriteDeptID" tablename="EPMS_PlanActivity" />
<input type="hidden" runat="server" id="hiPlanYear" field="PlanYear" tablename="EPMS_PlanActivity" />
<input type="hidden" runat="server" id="hiPlanCycle" field="PlanCycle" tablename="EPMS_PlanActivity" />
<input type="hidden" runat="server" id="hiPlanMonth" field="PlanMonth" tablename="EPMS_PlanActivity" />
<input type="hidden" runat="server" id="hiPlanQuarter" field="PlanQuarter" tablename="EPMS_PlanActivity" />
<input type="hidden" runat="server" id="hiPlanWeek" field="PlanWeek" tablename="EPMS_PlanActivity" />
<!----活动开始时间-->
<input type="hidden" runat="server" id="hiActivityStartTime" field="ActivityStartTime"
    tablename="EPMS_PlanActivity" />
<!---计划主题-->
<input type="hidden" runat="server" id="hiActivityTheme" tablename="EPMS_PlanActivity"
    field="ActivityTheme" />
<!---项目类型-->
<input type="hidden" runat="server" id="hiProjectTypeIDs" />
<!---计划周期值--->
<input type="hidden" runat="server" id="hiPlanPeriod" />
<!---有权限的岗位名称-->
<input type="hidden" runat="server" id="hiAuthorRoleName" value='计划工程师,计划管理岗' />
<asp:LinkButton runat="server" ID="lbtnRefreshWBS" OnClick="lbtnRefreshWBS_Click"
    Style="display: none"></asp:LinkButton>
<input type="hidden" runat="server" id="hiOperateOrgId" />
<input type="hidden" runat="server" id="hiWBSXml" />
<asp:LinkButton runat="server" ID="lbtnOK" OnClick="btnOK_Click" Style="display: none"></asp:LinkButton>
<script>
    var rollXmlDoc = new KPMSXml();
    function initCustomerPlugin() {
        //隐藏撤回
        $('[key="Rollback"]').hide();

          planTimeInfo_Init();
          if(typeof(initClickEvent<%=ucPlanProj.ClientID %>)=="function") {
             initClickEvent<%=ucPlanProj.ClientID %>();
          }
          if(typeof(initViewProjSpe<%=ucPlanProj.ClientID %>)=="function") {
             initViewProjSpe<%=ucPlanProj.ClientID %>();
          }

          if(typeof(initViewProjSpe<%=ucPrePlanProj.ClientID %>)=="function") {
             initViewProjSpe<%=ucPrePlanProj.ClientID %>();
          }

          $("#<%=cbAllChecked.ClientID %>").live("click",function(){allProjectTypeSelect();});
          $("#<%=cblProjType.ClientID %>").live("click",function(){setAllChecked();})
      
        inExportEvent();
        rollXmlDoc.loadXML("<root></root>");
        $("[wbsID]").live("change", function () {
            $("#" + $(this).attr("id")).val($(this).val());
        });
    }

    function openDetailInfo(mid) {
        $("[flag=" + mid + "]").toggle();
    }

     //设置计划项目类型全选功能
     function allProjectTypeSelect() {
        var $checkAll = $("[checkFlag='all']").find("input");
        $("#<%=cblProjType.ClientID %> input").each(function () { 
            $(this)[0].checked=$checkAll[0].checked ; 
            if($checkAll[0].checked)
               $(this).next().css("font-weight","bold")
            else 
               $(this).next().removeAttr("style");
        });
        if($checkAll[0].checked)
          $checkAll.next().css("font-weight","bold")
        else 
          $checkAll.next().removeAttr("style");
        return false;
    }

     //设置全选是否选中
     function setAllChecked(){
        var isAllChecked = true;
        var $checkAll = $("[checkFlag='all']").find("input");
        $("#<%=cblProjType.ClientID %> input").each(function () { 
           if(!$(this)[0].checked){
              isAllChecked=false;
          }
       });
       $checkAll[0].checked = isAllChecked;
       if(isAllChecked)
        $checkAll.next().css("font-weight","bold")
       else 
        $checkAll.next().removeAttr("style");
    }

    //获取项目类型ID
    function getProjTypeIDs() {
        return $("#<%=hiProjectTypeIDs.ClientID %>").val();
    }

    //发送时的相关提示
    function checkForm() {
        if ($formAction == 0) {
            if ($actName == "计划工程师编制计划安排" || $actName == "编制计划安排") {
                //【计划工程师编制计划安排】、没有选择项目就发送，提示。
                if ($actName == "计划工程师编制计划安排") {
                    if (!checkHasSelProject()) {
                        if(!confirm("-您确定不选择项目直接发送吗？")){
                            return false;
                        }
                    }
                }
                //判断是否有只添加了计划项目，没有添加计划专业的记录
                //判断当前页是否存在没有选择专业的项目
                var currPageSelSpe = checkCurrPageHasSelProjSpe();
                if(!currPageSelSpe)
                {
                   alert("请为添加的项目选择专业后再发送");
                   return false;
                }
                else{
                    var notSetSpePlan = getNotSetSpePlanProj();
                    if (!parseBool(notSetSpePlan)) {
                        alert("-请为其他分页添加的项目选择专业后再发送");
                        return false;
                    }
                }
            }
            else if ($actName == "项目月度计划安排" || $actName == "月度计划调整") {
                //判断是否有只添加了计划项目，没有添加计划专业的记录
                //判断当前页是否存在没有选择专业的项目
                var currPageSelSpe = checkCurrPageHasSelProjSpe();
                if(!currPageSelSpe)
                {
                   alert("请为添加的项目选择专业后再发送");
                   return false;
                }
                else{
                    var notSetSpePlan = getNotSetSpePlanProj();
                    if (!parseBool(notSetSpePlan)) {
                        alert("-请为其他分页添加的项目选择专业后再发送");
                        return false;
                    }
                }
               
                //是否添加了卷册信息
                if (!checkHasChooseWBS()) {
                     if(!confirm("-您确定不需要选择卷册直接发送吗？")){
                        return false;
                     }
                }
                //请填写不出版卷册的计划室交出时间
                if ($actName == "项目月度计划安排") {
                    var isNotFilterUser = parseBool("<%=IsCreateUser %>");
                }
                <%=Page.ClientScript.GetPostBackEventReference(this.lbtnOK,"")%>;
                var publishDate = getPlanRollNoMustDate();
                if (publishDate!= "") {
                    alert("请填写出版卷册的计划院交出时间，非出版卷册的计划室交出时间");
                    return false;
                }

                //验证计划开始时间必须小于计划设计完成时间、计划审核完成时间、计划完成时间
                //计划设计完成时间必须小于计划审核完成时间、计划完成时间
                //计划审核完成时间必须小于计划完成时间
                var notRightDate = checkFillDateIsRight();
                if (notRightDate != ""&&notRightDate!=null) {
                    alert("以下项目专业下的计划数据不合理，请修改后再发送！\n"+notRightDate);
                    return false;
                }
            }
        }
        return true;
    }
     
    //获取只添加了项目，没有添加项目下计划专业的数量
    function getNotSetSpePlanProj() {
        var json = getFilterJson();
        var hasSelProj = formCallback("CheckNotSetSpePlanProj", json);
        return hasSelProj;
    }

    //获取本期添加的计划任务信息
    function checkHasChooseWBS() {
        var hasChooseRoll = false; 
        if (!hasChooseRoll) {
            var json = getFilterJson();
            var chooseRoll = formCallback("CheckHasChooseRoll", json);
            hasChooseRoll = parseBool(chooseRoll);
        }
        return hasChooseRoll;
    }
    //判断日期填写是否正确
    function checkFillDateIsRight(){
        var json = getFilterJson();
        var dateIsRight = formCallback("CheckDateIsRight", json);
        return dateIsRight;
    }

    //是否存在出版卷册，没有编制计划院交出时间的卷册信息
    //是否存在非出版卷册，没有编制计划室交出时间的卷册信息
    function getPlanRollNoMustDate() {
        var json = getFilterJson();
        var dateIsRight = formCallback("CheckPublicDateIsRight", json);
        return dateIsRight;
    }

    //获取json参数信息
    function getFilterJson() {
        //计划年
        var planYear = $("#<%=hiPlanYear.ClientID %>").val();
        //计划周期值
        var planPeriod = $("#<%=hiPlanPeriod.ClientID %>").val();
        //计划周期
        var planCycle = $("#<%=hiPlanCycle.ClientID %>").val();
        var projectTypeIDs = $("#<%=hiProjectTypeIDs.ClientID %>").val();
        var planOrMasterUserId = "<%=KPMSUser.UserId %>";
        var isNotFilterUser = (parseBool("<%=IsCreateUser %>")&& $actName == "项目月度计划安排") || $actName == "编制计划安排";
        var isFiterByPlanUserID = $actName == "计划工程师编制计划安排";
        //增加流程主键的参数，modify by weihc on 2017-05-31
        var planActivityID = $("#<%=hiPlanActivityID.ClientID %>").val();
        var json = { "planYear": planYear, "planPeriod": planPeriod, "planCycle": planCycle, "projectTypeIDs": projectTypeIDs, "planOrMasterUserId": planOrMasterUserId, "isFiterByPlanUserID": isFiterByPlanUserID, "isNotFilterUser": isNotFilterUser, "planActivityID": planActivityID };
        return json;
    }
    
    //刷新卷册列表
    function refreshWBSData(){
       <%=Page.ClientScript.GetPostBackEventReference(this.lbtnRefreshWBS,"")%>;
    }

    function getWBSXml(organizationId){
       $("#<%=hiOperateOrgId.ClientID %>").val(organizationId);
       return "<%=hiWBSXml.ClientID %>";
    }
</script>
