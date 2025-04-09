<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BatchUpdatePlanTime.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Plan.BatchUpdatePlanTime" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    Title="批量更新计划时间" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table width="100%" class="tz-table">
        <tr>
            <td class="td-m" colspan="2" align="center" style="font-weight: bold">本次批量更新<asp:Label runat="server" ID="lbBatchUpdateNum" flag="batchUpdateAlert">
            </asp:Label>条数据
            </td>
        </tr>
        <tr>
            <td id="tdCommonInfo" valign="top">
                <table style="vertical-align: top; width: 100%;">
                    <tr flag="showNotAdjust" flagtype="rollAndOther">
                        <td class="td-l" style="width: 150px">项目计划开始时间
                        </td>
                        <td class="td-r">
                            <zhongsoft:XHtmlInputText ID="txtProjectPlanStart" runat="server" fieldName="PlanStartDate"
                                class="kpms-textbox-date" readonly="readonly">
                            </zhongsoft:XHtmlInputText>
                        </td>
                    </tr>
                    <tr flagtype="rollAndOther">
                        <td class="td-l">计划开始时间<span class="req-star">*</span>
                        </td>
                        <td class="td-r">
                            <zhongsoft:XHtmlInputText ID="txtPlanStartTime1" runat="server" fieldName="StartTime"
                                shouldCheckFact="true" class="kpms-textbox-date" readonly="readonly">
                            </zhongsoft:XHtmlInputText>
                        </td>
                    </tr>
                    <tr flag="showNotAdjust" flagtype="rollAndOther">
                        <td class="td-l">FCD+T
                            <asp:Button runat="server" ID="btnComputeCompTime" OnClientClick="return compluteCompTime()"
                                Text="计算完成时间" />
                        </td>
                        <td class="td-r">
                            <zhongsoft:LightTextBox runat="server" ID="tbFacT" regex="^[1-9]\d{0,9}$" errmsg="请输入整数"
                                Width="50px" fieldBelong="wbsEntity" fieldName="DelayDays"></zhongsoft:LightTextBox>天
                        </td>
                    </tr>
                    <tr flagtype="rollAndOther">
                        <td class="td-l">预计工期<asp:Button runat="server" ID="btnPlanTerm" OnClientClick="return compluteStartTime()"
                            Text="倒推开始时间" />
                        </td>
                        <td class="td-r">
                            <zhongsoft:LightTextBox runat="server" ID="tbPlanTerm" regex="^[1-9]\d{0,9}$" errmsg="请输入整数"
                                Width="50px" fieldBelong="wbsEntity" fieldName="PlanTerm"></zhongsoft:LightTextBox>天
                        </td>
                    </tr>
                    <tr flag="fileAdjust">
                        <td class="td-l">
                            <asp:Label runat="server" ID="lbCompleteTitle">计划院交出时间</asp:Label><span class="req-star">*</span>
                        </td>
                        <td class="td-r">
                            <zhongsoft:XHtmlInputText ID="txtPlanCompleteTime1" runat="server" fieldName="CompleteTime"
                                shouldCheckFact="true" class="kpms-textbox-date" readonly="readonly">
                            </zhongsoft:XHtmlInputText>
                        </td>
                    </tr>
                    <tr flag="showNotAdjust" flagtype="rollAndOther">
                        <td class="td-l">目标计划
                        </td>
                        <td class="td-r">
                            <zhongsoft:XHtmlInputText ID="txtMasterDemandSchedule" runat="server" fieldName="MasterDemandSchedule"
                                class="kpms-textbox-date" readonly="readonly">
                            </zhongsoft:XHtmlInputText>
                        </td>
                    </tr>
                    <tr flag="showNotAdjust" type="plan">
                        <td class="td-l">调整后计划完成时间
                        </td>
                        <td class="td-r">
                            <zhongsoft:XHtmlInputText ID="txtFactCompleteTimeOfAdjusted" runat="server" fieldName="FactCompleteTimeOfAdjusted"
                                class="kpms-textbox-date" readonly="readonly" >
                            </zhongsoft:XHtmlInputText>
                        </td>
                    </tr>
                    <tr id="trCommonMemo" flag="showNotAdjust">
                        <td class="td-l">备注
                        </td>
                        <td class="td-r">
                            <zhongsoft:LightTextBox runat="server" ID="tbMemo" TextMode="MultiLine" CssClass="kpms-textarea"
                                EnableTheming="false" MaxLength="512" fieldName="Memo"></zhongsoft:LightTextBox>
                        </td>
                    </tr>
                </table>
            </td>
            <td id="tdRollInfo" flagtype="roll" valign="top">
                <table style="width: 100%">
                    <tr>
                        <td class="td-l">计划开始时间
                        </td>
                        <td class="td-r">
                            <zhongsoft:XHtmlInputText ID="txtPlanStartTime" runat="server" fieldName="PlanStartTime"
                                shouldCheckFact="true" class="kpms-textbox-date" readonly="readonly">
                            </zhongsoft:XHtmlInputText>
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">计划完成时间
                        </td>
                        <td class="td-r">
                            <zhongsoft:XHtmlInputText ID="txtPlanCompleteTime" runat="server" fieldName="PlanCompleteTime" 
                                shouldCheckFact="true" class="kpms-textbox-date" readonly="readonly" Onchange="CompareDate(this);">
                            </zhongsoft:XHtmlInputText>
                        </td>
                    </tr>
                    <tr style="display: none">
                        <td class="td-l">计划设计开始时间
                        </td>
                        <td class="td-r">
                            <zhongsoft:XHtmlInputText ID="txtRollPlanStartTime" runat="server" fieldName="StartTime"
                                shouldCheckFact="true" class="kpms-textbox-date" readonly="readonly">
                            </zhongsoft:XHtmlInputText>
                        </td>
                    </tr>
                    <tr style="display: none">
                        <td class="td-l">计划个人出手时间
                        </td>
                        <td class="td-r">
                            <zhongsoft:XHtmlInputText ID="txtPlanHandTime" runat="server" compute="workDayOfDesign"
                                shouldCheckFact="true" fieldName="HandTime" class="kpms-textbox-date" readonly="readonly">
                            </zhongsoft:XHtmlInputText>
                        </td>
                    </tr>
                    <tr style="display: none">
                        <td class="td-l">计划校核完成时间
                        </td>
                        <td class="td-r" nowrap>
                            <zhongsoft:XHtmlInputText ID="txtPlanCheckTime" runat="server" compute="workDayOfCheck"
                                shouldCheckFact="true" fieldName="CheckTime" class="kpms-textbox-date" readonly="readonly">
                            </zhongsoft:XHtmlInputText>
                            <span flag="showNotAdjust">加</span>
                            <zhongsoft:LightTextBox runat="server" ID="tbWorkDayOfDesign" regex="^[1-9]\d{0,9}$"
                                flag="showNotAdjust" Width="50px" compute="workDayOfDesign" fieldName="WorkDayOfDesign"
                                fieldBelong="wbsEntity" errmsg="请输入整数"></zhongsoft:LightTextBox>
                            <span flag="showNotAdjust">天</span>
                        </td>
                    </tr>
                    <tr style="display: none">
                        <td class="td-l">计划室交出时间
                        </td>
                        <td class="td-r" nowrap>
                            <zhongsoft:XHtmlInputText ID="txtPlanRecheckTime1" runat="server" compute="workDayOfRecheck"
                                shouldCheckFact="true" fieldName="RecheckTime1" class="kpms-textbox-date" readonly="readonly">
                            </zhongsoft:XHtmlInputText>
                            <span flag="showNotAdjust">加</span>
                            <zhongsoft:LightTextBox runat="server" ID="tbWorkDayOfCheck" regex="^[1-9]\d{0,9}$"
                                flag="showNotAdjust" Width="50px" compute="workDayOfCheck" fieldName="WorkDayOfCheck"
                                fieldBelong="wbsEntity" errmsg="请输入整数"></zhongsoft:LightTextBox>
                            <span flag="showNotAdjust">天</span>
                        </td>
                    </tr>
                    <tr flag="planComplete" style="display: none">
                        <td class="td-l">计划院交出时间
                        </td>
                        <td class="td-r">
                            <zhongsoft:XHtmlInputText ID="txtRollPlanCompleteTime" runat="server" fieldName="CompleteTime"
                                shouldCheckFact="true" class="kpms-textbox-date" readonly="readonly">
                            </zhongsoft:XHtmlInputText>
                            <span flag="showNotAdjust">加</span>
                            <zhongsoft:LightTextBox runat="server" ID="tbPlanCompleteTime" regex="^[1-9]\d{0,9}$"
                                flag="showNotAdjust" Width="50px" compute="workDayOfCompleteTime" fieldBelong="wbsEntity"
                                errmsg="请输入整数"></zhongsoft:LightTextBox>
                            <span flag="showNotAdjust">天</span>
                        </td>
                    </tr>
                    <tr style="display: none">
                        <td class="td-l">业主要求进度
                        </td>
                        <td class="td-r" nowrap>
                            <zhongsoft:XHtmlInputText ID="txtApprovalTime" runat="server" fieldName="MasterDemandSchedule"
                                shouldCheckFact="true" class="kpms-textbox-date" readonly="readonly">
                            </zhongsoft:XHtmlInputText>
                            <span flag="showNotAdjust">加</span>
                            <zhongsoft:LightTextBox runat="server" ID="tbWorkDayOfRecheck" regex="^[1-9]\d{0,9}$"
                                flag="showNotAdjust" Width="50px" compute="workDayOfRecheck" fieldName="WorkDayOfRecheck"
                                fieldBelong="wbsEntity" errmsg="请输入整数"></zhongsoft:LightTextBox>
                            <span flag="showNotAdjust">天</span>
                        </td>
                    </tr>
                    <tr flagtype="roll" flag="showNotAdjust">
                        <td class="td-l">备注
                        </td>
                        <td class="td-r">
                            <zhongsoft:LightTextBox runat="server" ID="tbMemo2" TextMode="MultiLine" CssClass="kpms-textarea"
                                EnableTheming="false" MaxLength="512" fieldName="Memo"></zhongsoft:LightTextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <%--  
    <table class="tz-table" style="width:100%">--%>
        <%-- </table>--%>
    </table>
    <div style="width: 100%; text-align: center;">
        <asp:LinkButton runat="server" ID="ibtnOK" ToolTip="确定" OnClick="ibtnOK_Click">
            <span>
               确定</span>
        </asp:LinkButton>
        <asp:LinkButton runat="server" ID="lbtnCancel" ToolTip="取消" OnClientClick="return cancelExp();">
            <span>
                取消</span>
        </asp:LinkButton>
    </div>
    <input type="hidden" runat="server" id="hiXML" />
    <script>

        function initCustomerPlugin() {
            //计算卷册的时间，计划审核完成时间、计划校核完成时间、计划批准完成时间
            $("[compute=workDayOfDesign]").live("change", function () {
                var startTime = "<%=txtPlanHandTime.ClientID %>";
                var comDayNum = "<%=tbWorkDayOfDesign.ClientID %>";
                var targetTime = "<%=txtPlanCheckTime.ClientID %>";
                compluteTime(startTime, comDayNum, false, "", "", targetTime, false);
            });
            $("[compute=workDayOfCheck]").live("change", function () {
                var startTime = "<%=txtPlanHandTime.ClientID %>";
                var comDayNum = "<%=tbWorkDayOfCheck.ClientID %>";
                var targetTime = "<%=txtPlanRecheckTime1.ClientID %>";
                compluteTime(startTime, comDayNum, false, "", "", targetTime, false);
            });
            $("[compute=workDayOfRecheck]").live("change", function () {
                var startTime = "<%=txtRollPlanCompleteTime.ClientID %>";
                var comDayNum = "<%=tbWorkDayOfRecheck.ClientID %>";
                var targetTime = "<%=txtApprovalTime.ClientID %>";
                compluteTime(startTime, comDayNum, false, "", "", targetTime, false);
            });
            //计划院交出时间
            $("[compute=workDayOfCompleteTime]").live("change", function () {
                var startTime = "<%=txtPlanRecheckTime1.ClientID %>";
                var comDayNum = "<%=tbPlanCompleteTime.ClientID %>";
                var targetTime = "<%=txtRollPlanCompleteTime.ClientID %>";
                compluteTime(startTime, comDayNum, false, "", "", targetTime, false);
            });
            //资料批量更新，不显示卷册时间信息
            if (parseBool("<%=IsFileUpdate %>")) {
                $("[flagtype=roll]").hide();
                $("#tdCommonInfo").attr("colspan", "2");
                $("[flagType=rollAndOther]").hide();
                $("#trCommonMemo").show();
                $("[type=plan]").hide();
                if (parseBool("<%=IsAdjust %>")) {
                    $("[flag=showNotAdjust]").hide();
                }
            }
            else {
                $("#trCommonMemo").hide();
                $("#tdCommonInfo").hide();
                if (parseBool("<%=IsAdjust %>")) {
                    $("[flag=rollAdjust]").show();
                    $("#tdRollInfo").attr("colspan", "2");
                    $("#tdCommonInfo").hide();
                    $("[flag=showNotAdjust]").hide();
                }
                else {
                    $("[flag=rollAdjust]").hide();
                }
            }

            $("[id$=divToolBtn]").hide();
            if (!parseBool("<%=IsShowPlanComplete %>")) {
                $("[flag=planComplete]").hide();
            }
        }

        function closeExpWindow() {
            parent.returnValue = $("#<%=hiXML.ClientID %>").val();
            closeWindow();
            return false;
        }

        function cancelExp() {
            parent.returnValue = null;
            closeWindow();
        }

        //根据项目计划开始时间和FCD+T时间，计算计划完成时间
        function compluteCompTime() {
            var projStartTime = "<%=txtProjectPlanStart.ClientID %>";
            var fcdtDayNum = "<%=tbFacT.ClientID %>";
            var planCompleteTime = "<%=txtPlanCompleteTime.ClientID %>";
            compluteTime(projStartTime, fcdtDayNum, true, "请输入项目计划开始时间", "请输入FCD+T天数", planCompleteTime, false);
        }

        //根据项目计划开始时间和FCD+T时间，计算计划完成时间
        function compluteStartTime() {
            var planStartTime = "<%=txtPlanStartTime.ClientID %>";
            var planTermDayNum = "<%=tbPlanTerm.ClientID %>";
            var planCompleteTime = "<%=txtPlanCompleteTime.ClientID %>";
            compluteTime(planCompleteTime, planTermDayNum, true, "请输入计划完成时间", "请输入工期", planStartTime, true);
        }

        //计划时间
        ///startTimeControlID 计算的时间数据源控件ID
        ///dayNumControlID   需要计算的天数数据源ID
        ///isEpmtyAlert 时间数据源或者计划的天数为空时，是否需要进行提示 ，（当点击计算完成时间、 倒退计划开始时间时需要提示）
        ///timeEmptyAlert 时间数据源为空时提示的信息
        ///numEmptyAlert 计算的天数数据源伟空时提示的信息
        ///targetTimeControlID 计算时间后需要赋值的控件ID
        //isMiNum 是否倒推日期
        function compluteTime(startTimeControlID, dayNumControlID, isEmptyAlert, timeEmptyAlert, numEmptyAlert, targetTimeControlID, isMiNum) {
            var startTime = $("#" + startTimeControlID).val();
            var dayNum = $("#" + dayNumControlID).val();
            //需要提示时，给出提示
            if (isEmptyAlert) {
                //日期为空
                if (startTime == "") {
                    alert(timeEmptyAlert);
                    $("#" + startTimeControlID).focus();
                    return;
                }
                //计算天数为空
                else if (dayNum == "") {
                    alert(numEmptyAlert);
                    $("#" + dayNumControlID).focus();
                    return;
                }
            }
            //计算时间信息
            if (startTime != "" && dayNum != "") {
                var startDate = new Date(startTime.replace(/-/g, "/"));
                if (isMiNum)
                    startDate.setDate(startDate.getDate() + intParse(-dayNum));
                else
                    startDate.setDate(startDate.getDate() + intParse(dayNum));
                $("#" + targetTimeControlID).val(parseDate(startDate.toDateString(), false));
            }
        }

        //验证时间 计划结束时间不能超过阶段项目计划结束时间
        function CompareDate(planDate) {
            var thisDate = planDate.value;
            var PEDate = '<%=Convert.ToDateTime(PlanFinishDate).ToString("yyyy-MM-dd")%>';
            if (thisDate != "" && PEDate != "") {
                if (new Date(thisDate.replaceAll('-','/')) > new Date(PEDate.replaceAll('-','/'))) {
                    alert("任务或提资计划完成日期不能超过阶段计划完成日期" + PEDate + "，如需修改请联系设总修改项目计划");
                    planDate.value = "";
                }
            }
        }
    </script>
</asp:Content>
