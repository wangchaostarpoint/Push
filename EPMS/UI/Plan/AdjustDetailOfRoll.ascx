<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdjustDetailOfRoll.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Plan.AdjustDetailOfRoll" %>
<%@ Import Namespace="DAL.EPMS" %>
<table style="width: 100%" class="tz-table">
    <tr runat="server" id="trToolBar">
        <td align="right" colspan="6">
            <div id="divCustomBar" style="float: left;" class="subtoolbarbg" runat="server">
                <asp:LinkButton runat="server" ID="lbtnSelWBS" CssClass="subtoolbarlink" EnableTheming="false"
                    OnClientClick="return selWBS();" ToolTip="选择计划任务" OnClick="btnAddWBS_Click">
                    <span>
                        <img runat="server" id="img5" src="~/Themes/Images/look-up.gif" alt="选择临时安排卷册" width="16"
                            height="16" />选择卷册</span>
                </asp:LinkButton>
                <asp:LinkButton runat="server" ID="lbtnBatchDel" CssClass="subtoolbarlink" EnableTheming="false"
                    OnClientClick="return checkBatchDel();" ToolTip="批量删除" OnClick="lbtnBatchDel_Click">
                    <span>
                        <img runat="server" id="img2" src="~/Themes/Images/btn_delete.gif" alt="批量取消所选卷册"
                            width="16" height="16" />批量取消卷册</span>
                </asp:LinkButton>
                <asp:LinkButton runat="server" ID="lbtnBatchUpdate" CssClass="subtoolbarlink" OnClick="btnBatchUpdate_Click"
                    EnableTheming="false" ToolTip="批量更新时间" OnClientClick="return showUpdateInfo()">
                    <span>
                        <img runat="server" id="img1" src="~/Themes/Images/btn_editor.gif" alt="批量更新时间" width="16"
                            height="16" />批量更新时间</span>
                </asp:LinkButton>
                <asp:LinkButton runat="server" ID="lbtnArrangeUsers" CssClass="subtoolbarlink" EnableTheming="false"
                    ToolTip="安排人员" OnClientClick="return arrangeUsers()" OnClick="lbtnArrangeUsers_Click">
                    <span runat="server" id="spanArrange">
                        <img runat="server" id="imgArrange" src="~/Themes/Images/btn_editor.gif" alt="安排人员"
                            width="16" height="16" />安排人员</span>
                </asp:LinkButton>
            </div>
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvRollList" AllowPaging="true"
                PageSize="200" AutoGenerateColumns="false" ShowExport="true" OnExport="gvRollList_Export"
                UseDefaultDataSource="true" OnRowCommand="gvRollList_RowCommand" DataKeyNames="PlanWBSID"
                AllowFrozing="true" OnRowDataBound="gvRollList_RowDataBound" OnBeforeExporting="gvRollList_BeforeExporting">
                <Columns>
                    <zhongsoft:LightCheckField HeaderText="全选" ItemStyle-Width="40px">
                    </zhongsoft:LightCheckField>
                    <zhongsoft:LightTemplateField ItemStyle-Width="40px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%# Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <asp:TemplateField HeaderText="档案袋" ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnFileBag" runat="server" EnableTheming="false" ToolTip="档案袋">
                                    <img alt="档案袋" src="<%=this.WebAppPath %>/Themes/Images/btn_dg_detail.gif" onclick="fileBagItem('<%# Eval("WBSInfoID") %>','<%# Eval("WBSState") %>');" />
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <zhongsoft:LightBoundField DataField="BelongSpecialtyName" HeaderText="专业">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="卷册编号">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="WBSName" HeaderText="卷册名称">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="负责人">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbWBSOwnerName" content='WBSOwnerName' Text='<%#Eval("WBSOwnerName") %>'></asp:Label>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="卷册状态">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbWBSState"></asp:Label>
                            <input type="hidden" runat="server" id="hiParamWBSTypeID" value='<%#Eval("ParamWBSTypeID") %>' />
                            <input type="hidden" runat="server" id="hiWBSState" value='<%#Eval("WBSState") %>' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="计划设计<br/>开始时间">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtPlanStartTime" runat="server"
                                onchange="return dateChangeControl(this);" content='PlanStartTime' wbsID='<%#Eval("PlanWBSID") %>'
                                readonly="readonly" Value='<%# (Eval("PlanStartTime")==null||string.IsNullOrEmpty(Eval("PlanStartTime").ToString())) ? Eval("PlanStartTime") : Convert.ToDateTime(Eval("PlanStartTime")).ToString("yyyy-MM-dd") %>' />
                            <input type="hidden" runat="server" id="hiBelongSpecialtyID" value='<%#Eval("BelongSpecialtyID") %>' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="计划个人<br/>出手时间">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtPlanHandTime" runat="server"
                                onchange="return dateChangeControl(this);" content='PlanHandTime' wbsID='<%#Eval("PlanWBSID") %>'
                                readonly="readonly" Value='<%# (Eval("PlanHandTime")==null||string.IsNullOrEmpty(Eval("PlanHandTime").ToString())) ? Eval("PlanHandTime") : Convert.ToDateTime(Eval("PlanHandTime")).ToString("yyyy-MM-dd") %>' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="计划校核<br/>完成时间" Visible="false">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtPlanCheckTime" runat="server"
                                wbsID='<%#Eval("PlanWBSID") %>' readonly="readonly" Value='<%# (Eval("PlanCheckTime")==null||string.IsNullOrEmpty(Eval("PlanCheckTime").ToString())) ? Eval("PlanCheckTime") : Convert.ToDateTime(Eval("PlanCheckTime")).ToString("yyyy-MM-dd") %>' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="计划室<br/>交出时间">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtPlanRecheckTime1" runat="server"
                                onchange="return dateChangeControl(this);" content='PlanRecheckTime1' wbsID='<%#Eval("PlanWBSID") %>'
                                readonly="readonly" Value='<%# (Eval("PlanRecheckTime1")==null||string.IsNullOrEmpty(Eval("PlanRecheckTime1").ToString())) ? Eval("PlanRecheckTime1") : Convert.ToDateTime(Eval("PlanRecheckTime1")).ToString("yyyy-MM-dd") %>' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="计划院<br/>交出时间">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtPlanCompleteTime" runat="server"
                                onchange="return dateChangeControl(this);" content='PlanCompleteTime' wbsID='<%#Eval("PlanWBSID") %>'
                                readonly="readonly" Value='<%# (Eval("PlanCompleteTime")==null||string.IsNullOrEmpty(Eval("PlanCompleteTime").ToString())) ? Eval("PlanCompleteTime") : Convert.ToDateTime(Eval("PlanCompleteTime")).ToString("yyyy-MM-dd") %>' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <%--<zhongsoft:LightBoundField DataField="PlanCompleteTime" HeaderText="业主要求进度" DataFormatString="{0:yyyy-MM-dd}">
                    </zhongsoft:LightBoundField>--%>
                    <zhongsoft:LightTemplateField HeaderText="业主要求进度">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtMasterDemandSchedule"
                                runat="server" onchange="return dateChangeControl(this);" content='MasterDemandSchedule'
                                wbsID='<%#Eval("PlanWBSID") %>' readonly="readonly" Value='<%# (Eval("MasterDemandSchedule")==null||string.IsNullOrEmpty(Eval("MasterDemandSchedule").ToString())) ? Eval("MasterDemandSchedule") : Convert.ToDateTime(Eval("MasterDemandSchedule")).ToString("yyyy-MM-dd") %>' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiAdjustRollXml" />
<!----批量更新时间或安排人员页面返回的信息----->
<input type="hidden" runat="server" id="hiUpdateTimeXml" />
<input type="hidden" runat="server" id="hiExeSpecialtyID" />
<input type="hidden" runat="server" id="hiRollNum" />
<script>
    $gridCheckedClientIDRoll = "<%=this.gvRollList.CheckedClientID %>";

    //选择卷册事件
    function refreshRollInfo() {
          <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.lbtnSelWBS, "")%>;
        return false;
    }

    //卷册档案袋
    function fileBagItem(wbsid, wbsState) {
       var actionType = 1;
       var url = buildQueryUrl("/Custom/List/Dashboard.aspx", { ListId: '494CE4A3-A401-4B85-A97D-3247C6D2F439', 
       ViewId: '3B413684-1588-4B7D-A3F7-D9307C23CE7B', secid: "3B413684-1588-4B7D-A3F7-D9307C23CE7B", WBSID: wbsid, IsDashboard: 1, ShowToolbar: 0, IsShowHeader: 2, ActionType: actionType });
       window.open(url);
       return false;
     }

    function selWBS() {
        var param = new InputParamObject("m");
        var filter = getSelWBSFilter();
        if(filter==""){
            alert("请选择专业！");
        }
        else{
            getWBS("<%=hiAdjustRollXml.ClientID %>", param, filter, refreshRollInfo);
        }
        return false;
    }
    //批量删除
    function checkBatchDel() {
        var updateNum = getCheckNum();
        if (updateNum < 1) {
            alert("请勾选任务信息");
            return false;
        }
        if (confirm("您确认要取消吗？")) {
               <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.lbtnBatchDel, "")%>;
        }

        return false;
    }


    //获取选中的任务数量
    function getCheckNum() {
        var checkedValue = $("#" + $gridCheckedClientIDRoll).val().length;
        var updateNum = 0;
        if (checkedValue > 1) {
            checkedValue = $("#" + $gridCheckedClientIDRoll).val().substring(1, checkedValue - 1);
            if (checkedValue != "")
                updateNum = checkedValue.split(",").length;
        }
        return updateNum;
    }

    function showUpdateInfo() {
        var updateNum = getCheckNum();
        if (updateNum < 1) {
            alert("请勾选任务信息");
            return false;
        }
        var xml = $("#<%=hiUpdateTimeXml.ClientID %>").val();
        var wbsTypeShowInfo = "roll";
        var json = { WBSTypeShowInfo: wbsTypeShowInfo, UpdateWBSNum: updateNum, IsAdjust: true };
        var url = buildQueryUrl("EPMS/List/Plan/BatchUpdatePlanTime.aspx", json);
        showDivDialog(encodeURI(url), xml, 350, 400, batchRefreshInfo);
        return false;
    }

    //更新
    function batchRefreshInfo(re) {
        $("#<%=hiUpdateTimeXml.ClientID %>").val(re);
         <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.lbtnBatchUpdate, "")%>;
    }

    //日期控件改变后的控制
    function dateChangeControl(obj) {
        var dateValue = $(obj).val();
        var begin = "<%=CycleStartTime %>";
        var re = /-/g;
        if(begin!=""){
            if (new Date(dateValue.replace(re, '/')) < new Date(begin.replace(re, '/'))) {
                $(obj).val("");
                return false;
            }
        }
    }

    //判断填写的日期数据是否正确
    function checkFillDateIsRight() {
        var $planStart = $("[content='PlanStartTime']");
        var $planDesigned = $("[content='PlanHandTime']");
        var $planOutRoom = $("[content='PlanRecheckTime1']");
        var $planOutCollege = $("[content='PlanCompleteTime']");
        var $planApprovalTime = $("[content='MasterDemandSchedule']");
        var $wbsOwnerName = $("[content='WBSOwnerName']");
        var rollCount = $planStart.length;
        //计划开始时间不能晚于计划设计完成时间、计划审核完成时间、计划完成时间
        for (var i = 0; i < rollCount; i++) {
            var eplanStart = $planStart.eq(i).val();
            var eplanDesigned = $planDesigned.eq(i).val();
            var eoutRoom = $planOutRoom.eq(i).val();
            var eoutCollege = $planOutCollege.eq(i).val();
            var eApprovalTime = $planApprovalTime.eq(i).val();
            var eplanStartDisabled = $planStart.eq(i).attr("isDisabled");
            var eplanDesignedDisabled = $planDesigned.eq(i).attr("isDisabled");
            var eoutRoomDisabled = $planOutRoom.eq(i).attr("isDisabled");
            var eoutCollegeDisabled = $planOutCollege.eq(i).attr("isDisabled");
            var eApprovalTimeDisabled = $planApprovalTime.eq(i).attr("isDisabled");
            if (!parseBool(eplanStartDisabled) && !parseBool(eplanDesignedDisabled)) {
                if (eplanStart != "" && eplanDesigned != "") {
                    if (!compareDate(eplanStart, eplanDesigned)) {
                        alert("第"+(i+1)+"行，计划个人出手时间不能小于计划开始时间");
                        return false;
                    }
                }
            }
            if (!parseBool(eoutRoomDisabled) && !parseBool(eplanDesignedDisabled)) {
                if (eoutRoom != "" && eplanDesigned != "") {
                    if (!compareDate(eplanDesigned, eoutRoom)) {
                        alert("第"+(i+1)+"行，计划室交出时间不能小于计划个人出手时间");
                        return false;
                    }
                }
            }
            if (!parseBool(eoutRoomDisabled) && !parseBool(eoutCollegeDisabled)) {
                if (eoutRoom != "" && eoutCollege != "") {
                    if (!compareDate(eoutRoom, eoutCollege)) {
                        alert("第"+(i+1)+"行，计划院交出时间不能小于计划室交出时间");
                        return false;
                    }
                }
            }

            if (!parseBool(eoutRoomDisabled) && !parseBool(eApprovalTimeDisabled)) {
                if (eoutRoom != "" && eApprovalTime != "") {
                    if (!compareDate(eoutRoom, eApprovalTime)) {
                        alert("第"+(i+1)+"行，业主要求进度不能小于计划室交出时间");
                        return false;
                    }
                }
            }
            if (!parseBool(eoutCollegeDisabled) && !parseBool(eApprovalTimeDisabled)) {
                if (eoutCollege != "" && eApprovalTime != "") {
                    if (!compareDate(eoutCollege, eApprovalTime)) {
                        alert("第"+(i+1)+"行，业主要求进度不能小于计划院交出时间");
                        return false;
                    }
                }
            }
        }
        return true;
    }

    //判断日期是否已经填完整
    function checkDateIsFill() {
        var $planStart = $("[content='PlanStartTime']");
        var $planDesigned = $("[content='PlanHandTime']");
        var $planOutRoom = $("[content='PlanRecheckTime1']");
        var $planOutCollege = $("[content='PlanCompleteTime']");
        var $wbsOwnerName = $("[content='WBSOwnerName']");
        if (!checkDateIsEmpty($planStart, "计划开始时间")) return false;
        if (!checkDateIsEmpty($planDesigned, "计划设计完成时间")) return false;
        if (!checkDateIsEmpty($planOutRoom, "计划审核时间")) return false;
        if (!checkDateIsEmpty($planOutCollege, "计划完成时间")) return false;
        if (!checkLableIsEmpty($wbsOwnerName, "卷册负责人")) return false;
        return true;
    }

    //判断日期是否已经填写完整
    function checkDateIsEmpty($checkDate, alterMsg) {
        for (var i = 0; i < $checkDate.length; i++) {
            var disabled = $($checkDate[i]).attr("isDisabled");
            if (!parseBool(disabled)) {
                if ($($checkDate[i]).val() == "") {
                    alert("-请填写第"+(i+1)+"行卷册的" + alterMsg);
                    return false;
                }
            }
        }
        return true;
    }

     //判断日期是否已经填写完整
    function checkLableIsEmpty($checkLable, alterMsg) {
        for (var i = 0; i < $checkLable.length; i++) {
            if ($($checkLable[i]).text() == "") {
                alert("-请填写第"+(i+1)+"行卷册的" + alterMsg);
                return false;
            }
         }
        return true;
    }

    //获取调整卷册数量信息
    function getNumOfDetailInfo() {
        var num=$("#<%=hiRollNum.ClientID %>").val();
        return intParse(num);
    } 

    //安排人员
    function arrangeUsers() {
        var updateNum = getCheckNum();
        if (updateNum < 1) {
            alert("请勾选任务信息");
            return false;
        }
        var xml = $("#<%=hiUpdateTimeXml.ClientID %>").val();
        var url = buildQueryUrl("EPMS/List/WBS/RollPartakerEditor.aspx", null);
        showDivDialog(encodeURI(url), xml, 350, 250, batchArrangeInfo);
        return false;
    }

     //更新
    function batchArrangeInfo(re) {
        $("#<%=hiUpdateTimeXml.ClientID %>").val(re);
        <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.lbtnArrangeUsers, "")%>;
        return false;
    }

</script>
