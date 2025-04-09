<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProjOverallPlan.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Plan.ProjOverallPlan" %>
<%@ Import Namespace="Zhongsoft.Portal.ACL" %>
<table class="tz-table">
    <tr>
        <td align="right" colspan="6">
            <div id="divCustomBar" style="float: left;" class="subtoolbarbg" runat="server">
                <asp:LinkButton runat="server" ID="lbtnAllBatchUpdate" CssClass="subtoolbarlink"
                    OnClick="btnAllBatchUpdate_Click" EnableTheming="false" ToolTip="批量更新时间" OnClientClick="return showAllSetInfo()">
                    <span>
                        <img runat="server" id="img1" src="~/Themes/Images/btn_editor.gif" alt="批量更新时间" width="16"
                            height="16" />批量更新时间</span>
                </asp:LinkButton>
            </div>
            <div id="divCustomProjBar" style="float: left;" class="subtoolbarbg" runat="server">
                <asp:LinkButton runat="server" ID="lbtnRollProject" CssClass="subtoolbarlink" EnableTheming="false"
                    flag="projectPlan" OnClientClick="return projectPlan('OverallProjectPlan')" ToolTip="项目计划">
                    <span>
                        <img runat="server" id="img3" src="~/Themes/Images/Project_Icon.bmp" alt="项目计划" width="16"
                            height="16" />项目计划</span>
                </asp:LinkButton>
                <asp:LinkButton runat="server" ID="lbtnProductPlan" CssClass="subtoolbarlink" EnableTheming="false"
                    flag="projectPlan" OnClientClick="return projectPlan('RollAndProductProjectPlan')"
                    ToolTip="成品/出图计划">
                    <span>
                        <img runat="server" id="img4" src="~/Themes/Images/Project_Icon.bmp" alt="成品/出图计划"
                            width="16" height="16" />成品出图计划</span>
                </asp:LinkButton>
                <asp:LinkButton runat="server" ID="lbtnFilePlan" CssClass="subtoolbarlink" EnableTheming="false"
                    flag="projectPlan" OnClientClick="return projectPlan('ProjectFilePlan')" ToolTip="接口资料计划">
                    <span>
                        <img runat="server" id="img5" src="~/Themes/Images/Project_Icon.bmp" alt="接口资料计划"
                            width="16" height="16" />接口资料计划</span>
                </asp:LinkButton>
                <asp:LinkButton runat="server" ID="lbtnEquipmentPlan" CssClass="subtoolbarlink" EnableTheming="false"
                    flag="projectPlan" OnClientClick="return projectPlan('EquipmentBidPlan')" ToolTip="设备招标计划">
                    <span>
                        <img runat="server" id="img6" src="~/Themes/Images/Project_Icon.bmp" alt="设备招标计划"
                            width="16" height="16" />设备招标计划</span>
                </asp:LinkButton>
                <asp:LinkButton runat="server" ID="lbtnAddWBS" CssClass="subtoolbarlink" EnableTheming="false"
                    ToolTip="WBS任务分解" OnClientClick="return addWBS()">
                    <span>
                        <img runat="server" id="img2" src="~/Themes/Images/btn_add.gif" alt="WBS任务分解" width="16"
                            height="16" />WBS任务分解</span>
                </asp:LinkButton>
                <asp:LinkButton runat="server" ID="lbtnAddAlert" CssClass="subtoolbarlink" EnableTheming="false"
                    ToolTip="发送提醒" OnClientClick="return addAlert()">
                    <span>
                        <img runat="server" id="img7" src="~/Themes/Images/btn_add.gif" alt="发送提醒" width="16"
                            height="16" />发送提醒</span>
                </asp:LinkButton>
                <asp:LinkButton runat="server" ID="lbtnExportRoll" CssClass="subtoolbarlink" EnableTheming="false"
                    ToolTip="导出出图计划" OnClick="lbtnExportRoll_Click" OnClientClick="exportRoll()">
                    <span>
                        <img runat="server" id="img8" src="~/Themes/Images/ico_excel.gif" alt="导出出图计划" width="16"
                            height="16" />导出出图计划</span>
                </asp:LinkButton>
                <asp:LinkButton runat="server" ID="lbtnExportEquipment" CssClass="subtoolbarlink"
                    EnableTheming="false" ToolTip="导出设备计划" OnClick="lbtnExportEquipment_Click" OnClientClick="exportEquipment()">
                    <span>
                        <img runat="server" id="img9" src="~/Themes/Images/ico_excel.gif" alt="导出设备计划" width="16"
                            height="16" />导出设备计划</span>
                </asp:LinkButton>
                <asp:LinkButton runat="server" ID="lbtnExportFile" CssClass="subtoolbarlink" EnableTheming="false"
                    ToolTip="导出接口计划" OnClick="lbtnExportFile_Click" OnClientClick="exportFile()">
                    <span>
                        <img runat="server" id="img10" src="~/Themes/Images/ico_excel.gif" alt="导出接口计划" width="16"
                            height="16" />导出接口计划</span>
                </asp:LinkButton>
            </div>
            <div id="divAllBatchUpdate" style="display: none" title="更新计划时间">
                <table class="tz-table" style="width: 100%">
                    <tr>
                        <td class="td-l">
                            计划开始时间
                        </td>
                        <td class="td-r">
                            <zhongsoft:XHtmlInputText ID="txtPlanStartTime" runat="server" activestatus="(23.*)"
                                class="kpms-textbox-date" readonly="readonly">
                            </zhongsoft:XHtmlInputText>
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">
                            计划完成时间
                        </td>
                        <td class="td-r">
                            <zhongsoft:XHtmlInputText ID="txtPlanCompleteTime" runat="server" activestatus="(23.*)"
                                class="kpms-textbox-date" readonly="readonly">
                            </zhongsoft:XHtmlInputText>
                        </td>
                    </tr>
                </table>
            </div>
        </td>
    </tr>
    <tr>
        <td colspan="6" class="td-m" style="vertical-align: top;">
            <zhongsoft:TreeGridView ID="gvProjWBS" runat="server" AutoGenerateColumns="False"
                DataKeyNames="PrimaryKeyID" PowerPageCount="0" PowerPageIndex="0" RecordsCount="0"
                SelfIdColumn="WBSID" IndentSize="5" ParentIdColumn="ParentID" UseDefaultDataSource="true"
                AllowPaging="true" PageSize="500" OnRowDataBound="gvProjWBS_RowDataBound">
                <PagerStyle HorizontalAlign="Right"></PagerStyle>
                <Columns>
                    <zhongsoft:LightCheckField HeaderText="全选" ItemStyle-Width="40px">
                    </zhongsoft:LightCheckField>
                    <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="6%">
                        <ItemTemplate>
                            <%# gvProjWBS.CreateHeader(Container.DataItem)%>
                            <input type="hidden" runat="server" id="hiNodeType" value='<%# Eval("NodeType") %>' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField HeaderText="编号" DataField="WBSCode">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="名称">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbViewChild" speID='<%#Eval("ParamSpecialtyID") %>'
                                EnableTheming="false" paramWBSTypeID='<%#Eval("ParamWBSTypeID") %>' deptID='<%#Eval("DeptID") %>'
                                nodeType='<%#Eval("nodeType") %>' parentID='<%#Eval("WBSID") %>'>
                                 <span><%#Eval("WBSName") %></span></asp:LinkButton>
                            <asp:Label runat="server" ID="lbWBSName" Text='<%#Eval("WBSName") %>'></asp:Label>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField HeaderText="任务类型" DataField="WBSType">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="负责人" DataField="OwnerName">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="计划开始时间" DataField="PlanStartTime" DataFormatString="{0:yyyy-MM-dd}">
                    </zhongsoft:LightBoundField>
                    <%--  <zhongsoft:LightBoundField HeaderText="计划个人出手时间" DataField="PlanHandTime" DataFormatString="{0:yyyy-MM-dd}">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="计划室交出时间" DataField="PlanRecheckTime1">
                    </zhongsoft:LightBoundField>--%>
                    <zhongsoft:LightBoundField HeaderText="计划完成时间" DataField="PlanCompleteTime" DataFormatString="{0:yyyy-MM-dd}">
                    </zhongsoft:LightBoundField>
                </Columns>
            </zhongsoft:TreeGridView>
            <%--导出使用--%>
            <zhongsoft:LightPowerGridView Style="display: none" Width="100%" runat="server" ID="gvList"
                AllowPaging="true" PageSize="50" AutoGenerateColumns="false" ShowExport="true"
                AllowSorting="true" DataKeyNames="WBSID" UseDefaultDataSource="true" OnRowDataBound="gvList_RowDataBound"
                BindGridViewMethod="UserControl.BindWBSList" OnExport="gvList_Export" AllowFrozing="false"
                FrozenColNum="7" ShowPageSizeChange="true">
                <Columns>
                    <zhongsoft:LightBoundField DataField="ProjectName" HeaderText="项目名称（必填）">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="项目编号（必填）">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="父级编号">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbParentCode"></asp:Label>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField DataField="WBSType" HeaderText="任务类型（必填）">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="任务编号（必填）">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="WBSName" HeaderText="任务名称（必填）">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="ExecSpecialtyCode" HeaderText="专业代码（必填）">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="ExecSpecialtyName" HeaderText="专业名称（必填）">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="PlanTerm" HeaderText="预计工天">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="MasterDemandSchedule" HeaderText="目标计划" DataFormatString="{0:yyyy-MM-dd}">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="DelayDays" HeaderText="FCD+T">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="PlanStartTime" HeaderText="计划开始时间" ItemStyle-Width="40px"
                        DataFormatString="{0:yyyy-MM-dd}">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="PlanCompleteTime" HeaderText="计划完成时间（必填）" ItemStyle-Width="40px"
                        DataFormatString="{0:yyyy-MM-dd}">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="FactCompleteTimeOfAdjusted" HeaderText="调整后计划完成时间"
                        ItemStyle-Width="40px" DataFormatString="{0:yyyy-MM-dd}">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="Memo" HeaderText="备注（计划调整原因）">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="FactCompleteTime" HeaderText="实际完成时间" DataFormatString="{0:yyyy-MM-dd}">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="MasterDemandSchedule" HeaderText="技术协议签订时间">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="状态" ItemStyle-Width="40px">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbState"></asp:Label>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="接收专业">
                        <ItemTemplate>
                            <div runat="server" id="divRecSpe" tip="1" style="width: 100px" class="autoskip">
                            </div>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="专业需内部接口资料">
                        <ItemTemplate>
                            <div runat="server" id="divRecSpeFile" tip="1" style="width: 100px" class="autoskip">
                            </div>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="受影响的图纸">
                        <ItemTemplate>
                            <div runat="server" id="divAffectedRoll" tip="1" style="width: 100px" class="autoskip">
                            </div>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="受影响的接口">
                        <ItemTemplate>
                            <div runat="server" id="divAffectedFile" tip="1" style="width: 100px" class="autoskip">
                            </div>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="厂家资料提交情况">
                        <ItemTemplate>
                            <div runat="server" id="divManuFile" tip="1" style="width: 100px" class="autoskip">
                            </div>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiPlanYear" />
<input type="hidden" runat="server" id="hiPlanPeriod" />
<input type="hidden" runat="server" id="hiPlanCycle" />
<input type="hidden" runat="server" id="hiCeWBSType" />
<input type="hidden" runat="server" id="hiPcWBSType" />
<input type="hidden" runat="server" id="hiExport" />
<asp:Button runat="server" ID="btnBindWbs" OnClick="btnBindWbs_Click" Style="display: none" />
<input runat="server" id="hiZHSpeCode" type="hidden" value="A" />
<input runat="server" id="hiZHSpeName" type="hidden" value="综合" />
<script type="text/javascript">
    $gridCheckedClientID1 = "<%=this.gvProjWBS.CheckedClientID %>";
    //初始化按钮事件
    function projOverallPlan_Init() {
    }
    // 点击树节点中的任务名称，弹出详细页面
    function viewChildPlan(obj,enabled,isSpe) {
        var nodeType = $(obj).attr("nodeType");
        var speID = $(obj).attr("speID");
        var paramWBSTypeID = $(obj).attr("paramWBSTypeID");
        var parentID = $(obj).attr("parentID");
        var deptID = $(obj).attr("deptID");
        return editChildPlanDate(parentID, paramWBSTypeID, nodeType, speID, deptID,enabled,isSpe);
    }

    //编辑自己任务计划时间信息
    function editChildPlanDate(wbsID, wbsType, nodeType, speID, deptID,enabled,isSpe) {
        var actType = enabled.toLowerCase() == "true" ? "<%=(int)AccessLevel.Update %>" : "<%=(int)AccessLevel.Read %>";
        var planYear=$("#<%=hiPlanYear.ClientID %>").val();
        var planPeriod=$("#<%=hiPlanPeriod.ClientID %>").val();
        //计划周期数
        var planCycle = $("#<%=hiPlanCycle.ClientID %>").val();
        //如果是卷层，如：第1卷，第2卷。打开第1卷下的册信息，传递卷主键作为ParentID
        if (nodeType.indexOf("roll") > -1) {
            var specialWBSTypeID=$("#<%=hiCeWBSType.ClientID %>").val();
            var json = { ParentID: wbsID,WbsType:specialWBSTypeID, PlanCycle: escape(planCycle), OrganizationID: "<%=OrganizationID %>", IsEntityData: true, SpeID: speID, DeptID: deptID,IsSpeWBS:isSpe,PlanYear:planYear,PlanPeriod:planPeriod };
        }else if(nodeType.indexOf("sbpc") > -1){
        //如果是设备批次，如第一批，第二批。打开第一批下的设备技术规范书，传递卷主键作为ParentID
            var specialWBSTypeID=$("#<%=hiPcWBSType.ClientID %>").val();
            var json = { ParentID: wbsID,WbsType:specialWBSTypeID, PlanCycle: escape(planCycle), OrganizationID: "<%=OrganizationID %>", IsEntityData: true, SpeID: speID, DeptID: deptID,IsSpeWBS:isSpe,PlanYear:planYear,PlanPeriod:planPeriod  };
        }
        else {
            var json = { WbsType: wbsType, PlanCycle: escape(planCycle), OrganizationID: "<%=OrganizationID %>", IsEntityData: true, SpeID: speID, DeptID: deptID,IsSpeWBS:isSpe,PlanYear:planYear,PlanPeriod:planPeriod  };
        }
        var url = buildBizUrl(actType, wbsID, "EPMS/List/Plan/PlanWBSList.aspx", json);
        var callBack = null;
        if (actType == "<%=(int)AccessLevel.Update %>") {
            callBack = bindWbs;
        }
        showDivDialog(url, null, 850, 550, callBack);
        return false;
    }

    //绑定WBS列表
    function bindWbs() {
         <%=Page.ClientScript.GetPostBackEventReference(this.btnBindWbs,"")%>;
    }
    
    //弹出批量更新时间的div层
    function showAllSetInfo() {
        if (checkRollUpdateNumInfo()) {
            $("#divAllBatchUpdate").dialog('open');
            $("#divAllBatchUpdate").parent().appendTo("#<%=this.Page.Form.ClientID%>");
        }
        return false;
    }

    //更新
    function overallRefreshInfo() {
         <%=Page.ClientScript.GetPostBackEventReference(this.lbtnAllBatchUpdate,"")%>;
         return false;
    }

    //判断是否已经勾选了要批量更新时间的任务信息
    function checkRollUpdateNumInfo() {
        var rollDs = $("#" + $gridCheckedClientID1).val();
        if (rollDs.length < 3) {
            alert("请勾选任务信息");
            return false;
        }
      if(typeof(saveChildData)=="function"){
        saveChildData();
       }
        return true;
    }

    //添加任务信息
    function addWBS(){
        if("<%=Enabled %>".toLowerCase() == "true") {
            //传递已存在的WBS任务分解流程ID，从而可以进行编辑操作
            var bizId = '<%=WBSBizID %>';
            var json = {OrganizationID: '<%=OrganizationID %>'};
            var url = buildBizUrl(3, bizId,"/EPMS/List/WBS/WBSSplitEditor.aspx", json);
            showDivDialog(encodeURI(url), "", 1050, 600, bindWbs);
            return false;
        }
    }

    //加载div默认事件
    function initAllEvent() {
        $("#divAllBatchUpdate :ui-dialog").dialog("destroy");
        $("#divAllBatchUpdate").dialog({
            title: "批量更新计划时间",
            resizable: false,
            autoOpen: false,
            minHeight: 250,
            minWidth: 200,
            modal: true,
            buttons: {
                "确定": function () {
                    overallRefreshInfo()
                    $(this).dialog("close");
                    return false;
                },
                "取消": function () {
                    $(this).dialog("close");
                    return false;
                }
            }
        });
    }

     //打开Project网页版计划信息
    function projectPlan(projectdataconfig) {
        var enabled="<%=Enabled %>".toLowerCase()=="true";
        var projectId = "<%=OrganizationID %>";
        var url = "<%=WebAppPath %>/EPMS/List/Plan/WebProjectPlan.aspx?ActionType="+(enabled?"1":"0")+"&UserId=<%=KPMSUser.UserId %>&OrganizationID=" + projectId + "&ProjectDataConfig=" + projectdataconfig;
        window.open(encodeURI(url),"");
        if (enabled) {
             bindWbs();
             return false;
        }
        else {
             return false;
        }
    }

    //添加项目提醒
    function addAlert(){
        var aterType= 0;
        var json = {OrganizationID: '<%=OrganizationID %>',DefaultAlterType:aterType};
        var url = buildBizUrl(2,$bizCtx.bizId, "/EPMS/List/Sys/PortalAlertEditor.aspx", json);
        showDivDialog(encodeURI(url), "", 850, 600, null);
        return false;
    }

    function exportRoll(){
      var exportType='roll';
      $('#<%=hiExport.ClientID %>').val(exportType);
      $("[name*='gvList'][name*='BtnExcel']").click();
    }

    function exportEquipment(){
      var exportType='equipment';
      $('#<%=hiExport.ClientID %>').val(exportType);
      $("[name*='gvList'][name*='BtnExcel']").click();
    }

    function exportFile(){
      var exportType='file';
      $('#<%=hiExport.ClientID %>').val(exportType);
      $("[name*='gvList'][name*='BtnExcel']").click();
    }

</script>
