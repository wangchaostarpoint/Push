<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectMonthPlanList.aspx.cs" Title="项目月度计划"
    Inherits="Zhongsoft.Portal.EPMS.List.Plan.ProjectMonthPlanList" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">填报月份</span> <span>
        <zhongsoft:LightDropDownList ID="ddlYear" runat="server" Width="80px">
        </zhongsoft:LightDropDownList>年
         <zhongsoft:LightDropDownList ID="ddlMonth" runat="server" Width="60px">
         </zhongsoft:LightDropDownList>月
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">工程名称/工程编号</span> <span>
        <zhongsoft:LightTextBox ID="tbName" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">所属工程包</span> <span>
        <zhongsoft:LightTextBox ID="tbPackage" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">项目类型</span> <span>
        <zhongsoft:LightDropDownList ID="ddlProjectType" runat="server" Width="150px">
        </zhongsoft:LightDropDownList>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">设计阶段</span> <span>
        <zhongsoft:LightDropDownList ID="ddlProjectPhase" runat="server" Width="150px">
        </zhongsoft:LightDropDownList>
    </span></span>
    <span class="filter-block" flag="ddlDept"><span class="filter-block-lb">部门</span> <span>
        <zhongsoft:LightDropDownList ID="ddlDept" runat="server" Width="150px">
        </zhongsoft:LightDropDownList>
    </span></span>
    <span class="filter-block" flag="isCanEdit"><span class="filter-block-lb">
        <asp:LinkButton runat="server" ID="lbtnInport" EnableTheming="false"
            flag="import" OnClientClick="return inExport()">
                        <span>
                            <img runat="server" src="~/Themes/Images/ico_excel.gif" alt="从Excel导入" width="16" height="16" />导入项目卷册数量</span>
        </asp:LinkButton>
    </span></span><span class="filter-block" flag="isCanEdit"><span class="filter-block-lb">
        <a href="<%=WebAppPath%>/EPMS/Download/项目卷册数量导入.xlsx" style="color: blue"><span>下载项目卷册数量导入模板</span></a></span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">

    <div class="subtoolbarbg">
        <asp:LinkButton ID="lbtnCreatePlan" runat="server" EnableTheming="false" CssClass="subtoolbarlink"
            OnClientClick="return false;" flag="isCanEdit">
            <span>
                <img runat="server" id="img1" src="~/Themes/Images/btn_new.gif" alt="生成月计划数据" height="16" />生成月计划数据</span>
        </asp:LinkButton>
        <asp:LinkButton ID="lbtnSendNotice" runat="server" EnableTheming="false" CssClass="subtoolbarlink"
            OnClientClick="return false;" flag="isCanEdit">
            <span>
                <img runat="server" id="img2" src="~/Themes/Images/btn_editor.gif" alt="通知设总填报月计划" height="16" />通知设总填报月计划</span>
        </asp:LinkButton>
        <asp:LinkButton ID="lbtnCompare" runat="server" EnableTheming="false" CssClass="subtoolbarlink"
            OnClientClick="return viewCompare();">
            <span>
                <img runat="server" id="img3" src="~/Themes/Images/btn_dg_detail.gif" alt="与上月数据对比" height="16" />与上月数据对比</span>
        </asp:LinkButton>
        <asp:LinkButton ID="lbtnViewTask" runat="server" EnableTheming="false" CssClass="subtoolbarlink"
            OnClientClick="return viewTaskInfo();">
            <span>
                <img runat="server" id="img7" src="~/Themes/Images/btn_dg_detail.gif" alt="生产任务完成情况" height="16" />生产任务完成情况</span>
        </asp:LinkButton>
        <asp:LinkButton ID="lbtnProduction" runat="server" EnableTheming="false" CssClass="subtoolbarlink"
            OnClientClick="return viewProduction();">
            <span>
                <img runat="server" id="img4" src="~/Themes/Images/btn_dg_detail.gif" alt="月计划报表" height="16" />月计划报表</span>
        </asp:LinkButton>
        <asp:LinkButton ID="lbtnLastWeek" runat="server" EnableTheming="false" CssClass="subtoolbarlink"
            OnClientClick="return viewWeekInfo('lastWeek');">
            <span>
                <img runat="server" id="img5" src="~/Themes/Images/btn_dg_detail.gif" alt="上周实际完成情况" height="16" />上周实际完成情况</span>
        </asp:LinkButton>
        <asp:LinkButton ID="lbtnThisWeek" runat="server" EnableTheming="false" CssClass="subtoolbarlink"
            OnClientClick="return viewWeekInfo('thisWeek');">
            <span>
                <img runat="server" id="img6" src="~/Themes/Images/btn_dg_detail.gif" alt="本周项目计划提醒" height="16" />本周项目计划提醒</span>
        </asp:LinkButton>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false"
        ShowExport="true" AllowPaging="true" PageSize="15" UseDefaultDataSource="true" AllowFrozing="true" FrozenColNum="4"
        DataKeyNames="PlanActivityOfProjectID" BindGridViewMethod="BindGrid" OnRowDataBound="gvList_RowDataBound"
        OnRowCommand="gvList_RowCommand" HideFieldOnExport="全选,项目暂停">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightBoundField HeaderText="通知状态" DataField="PlanState">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="工程名称" DataField="ProjectName" ItemStyle-Width="100px" ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="所属工程包" DataField="ProjectPackage" ItemStyle-Width="100px" ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="设总">
                <ItemTemplate>
                    <%#(string.IsNullOrEmpty(Convert.ToString(Eval("ManagerDeptName")))?"":Eval("ManagerDeptName")+"：" )+Eval("ManagerUserName") %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="财务流水号" DataField="FinancialSerialNum">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="建设性质" DataField="ProjectNature">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="设计阶段" DataField="PhaseName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="电压等级（kV）" DataField="VoltageGrade" HeaderStyle-Width="70px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="工程涉及专业" DataField="RelateMajors">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="工程规模" DataField="ProjectScale" ItemStyle-Width="100px" ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="工程类别" DataField="ProjectType">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="阶段估算产值(万元)" DataField="EstimateContractVal" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="阶段合同产值(万元)" DataField="ContractValue" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="计划开始日期" DataField="PlanStartDate" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="计划完成日期" DataField="PlanCompleteDate" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="项目状态">
                <ItemTemplate>
                    <asp:Label ID="lbProjectState" runat="server" Text='<%# Eval("ProjectState") %>'></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="估工总工日" DataField="EstimateWorkday" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="本月实际完成累计工日" DataField="ThisFactTotalWorkday" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="本月实际完成累计工作量" DataField="ThisFactTotalRate" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="本月实际完成工日" DataField="ThisFactFinishWorkday" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="本月实际完成工作量">
                <ItemTemplate>
                    <zhongsoft:LightTextBox runat="server" ID="tbThisFactFinishRate" field="ThisFactFinishRate" flag="changeRate" keyID='<%#Eval("PlanActivityOfProjectID") %>'
                        Text='<%# Eval("ThisFactFinishRate")==DBNull.Value?"": (Convert.ToDecimal(Eval("ThisFactFinishRate") )).ToString("F2") %>'
                        CssClass="kpms-textbox-money" EnableTheming="false" activestatus="(23.*)"></zhongsoft:LightTextBox>
                    <input type="hidden" runat="server" id="hiPlanActivityOfProjectID" value='<%#Eval("PlanActivityOfProjectID") %>' />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="本月计划完成工作量" DataField="ThisPlanFinishRate" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="下月计划完成工日" DataField="NextPlanFinishWorkday" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="下月计划完成工作量">
                <ItemTemplate>
                    <zhongsoft:LightTextBox runat="server" ID="tbNextPlanFinishRate" field="NextPlanFinishRate" flag="changeRate" keyID='<%#Eval("PlanActivityOfProjectID") %>'
                        Text='<%# Eval("NextPlanFinishRate")==DBNull.Value?"": (Convert.ToDecimal(Eval("NextPlanFinishRate") )).ToString("F2") %>'
                        CssClass="kpms-textbox-money" EnableTheming="false"></zhongsoft:LightTextBox>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="下月计划完成累计工作量" DataField="NextPlanTotalRate" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="上月实际完成累计工作量" DataField="PreFactTotalRate" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="总卷册" DataField="TotalRollNum" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="上月实际出版" DataField="PreFactPublishRollNum" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="本月计划出版" DataField="ThisPlanPublishRollNum" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="已出版卷册" DataField="PublishedRollNum" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="项目暂停" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnClose" runat="server" CommandName="CloseProject" EnableTheming="false" ToolTip="暂停"
                        CommandArgument='<%#DataBinder.Eval(Container.DataItem,"OrganizationID") %>' Visible="false"> 
                                             <img alt="暂停" id="ImgClose"  border="0" onclick="return confirm('确定暂停？');" src="../../../Themes/Images/btn-ban.gif" style="cursor: grabbing" />
                    </asp:LinkButton>
                    <asp:LinkButton ID="lbtnStart" runat="server" CommandName="StartProject" EnableTheming="false" ToolTip="启动"
                        CommandArgument='<%#DataBinder.Eval(Container.DataItem,"OrganizationID") %>' Visible="false">
                                             <img alt="启动" id="ImgStart"  border="0" onclick="return confirm('确定启动？');" src="../../../Themes/Images/btn_empty.gif" style="cursor:grabbing" />
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="备注">
                <ItemTemplate>
                    <zhongsoft:LightTextBox runat="server" ID="tbMemo" Width="100px" flag="changeMemo" keyID='<%#Eval("PlanActivityOfProjectID") %>'
                        Text='<%# Eval("Memo") %>' CssClass="kpms-textbox" EnableTheming="false "></zhongsoft:LightTextBox>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="进度及协议办理情况" DataField="ScheduleAndRequire" ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="存在问题及解决措施" DataField="ThisImportance" ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="需要业主协调的问题" DataField="ProblemOfNeedOuter" ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="需要我院协调的问题" DataField="ProblemOfNeedInner" ShowToolTip="true">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>

    <%--    <asp:Button runat="server" ID="btnImport" OnClick="btnImport_Click" Style="display: none" />--%>

    <asp:Button runat="server" ID="btnSave" OnClick="btnSave_Click" Style="display: none" />
    <asp:Button runat="server" ID="btnSaveMemo" OnClick="btnSaveMemo_Click" Style="display: none" />
    <asp:Button runat="server" ID="btnCreatePlan" OnClick="btnCreatePlan_Click" Style="display: none" />
    <asp:Button runat="server" ID="btnSendNotice" OnClick="btnSendNotice_Click" Style="display: none" />
    <asp:Button runat="server" ID="btnBindGrid" OnClick="btnBindGrid_Click" Style="display: none" />

    <input type="hidden" runat="server" id="hiKeyID" />
    <input type="hidden" runat="server" id="hiChangeValue" />
    <input type="hidden" runat="server" id="hiChangeField" />
    <input type="hidden" runat="server" id="hiTotalChangeField" />
    <input type="hidden" runat="server" id="hiNextTotalChangeField" />

    <%--  <link href="../../../Themes/Styles/superTable.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="../../../UI/Script/superTable.js"></script>
    <script type="text/javascript" src="../../../UI/Script/jquery.superTable.js"></script>--%>
    <script type="text/javascript">
        $nextMonth = null;
        $nextYear = null;
        $thisMonth = null;
        $thisYear = null;
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";
        function initCustomerPlugin() {
            var isOnlyRead ="<%=IsOnlyRead%>";

            if (isOnlyRead != "1") {
                $('[flag="changeRate"]').each(function () {
                    $(this).bind('blur', function () {
                        var changeValue = $(this).val();
                        var keyID = $(this).attr("keyID");
                        var changeField = $(this).attr("field");
                        if (changeField == "ThisFactFinishRate") {
                            $('#<%=hiTotalChangeField.ClientID %>').val("ThisFactTotalRate");
                            $('#<%=hiNextTotalChangeField.ClientID %>').val("NextPlanTotalRate");
                        }
                        else if (changeField == "NextPlanFinishRate") {
                            $('#<%=hiTotalChangeField.ClientID %>').val("");
                            $('#<%=hiNextTotalChangeField.ClientID %>').val("NextPlanTotalRate");
                        }
                        $('#<%=hiKeyID.ClientID %>').val(keyID);
                        $('#<%=hiChangeValue.ClientID %>').val(changeValue);
                        $('#<%=hiChangeField.ClientID %>').val(changeField);
                        $('#<%=btnSave.ClientID %>').click();
                    });
                });

                $('[flag="changeMemo"]').each(function () {
                    $(this).bind('blur', function () {
                        var changeValue = $(this).val();
                        var keyID = $(this).attr("keyID");
                        $('#<%=hiKeyID.ClientID %>').val(keyID);
                        $('#<%=hiChangeValue.ClientID %>').val(changeValue);
                        $('#<%=btnSaveMemo.ClientID %>').click();
                    });
                });
            }
            //手动调用superTable进行列表冻结
            //$('#<%=gvList.ClientID%>').toSuperTable({ width: 'auto', height: 'auto', fixedCols: 3, headerRows: 1 });

            //initImportDiv();
            var rowFilter = "<%=RowFilter%>";
            if (rowFilter == "" || parseBool('<%=KPMSUser.IsAdmin%>')) {
                $('[flag="ddlDept"]').show();
            }
            else {
                $('[flag="ddlDept"]').hide();
            }

            //只能查看隐藏生成月计划等按钮
            if (isOnlyRead == "1") {
                $('[flag="isCanEdit"]').hide();
            }
        }

        $('#<%=lbtnCreatePlan.ClientID %>').bind('click', function () {
            createMonthPlan();
        });

        $('#<%=lbtnSendNotice.ClientID %>').bind('click', function () {
            sendNotice();
        });

        function createMonthPlan() {
            //确认是否选择了年月
            if (getFactMonth()) {
               <%-- //确认是否选择了项目类型
                var selProjectType = $('#<%=ddlProjectType.ClientID %>').val();
                if (selProjectType == "") {
                    alert("请先选择项目类型");
                    return false;
                }--%>
            }
            else {
                return false;
            }
            $('#<%=btnCreatePlan.ClientID %>').click();
        }

        //发送设总填报流程
        function sendNotice() {
            if (getFactMonth()) {
                var confirmInfo = "";
                var array = buildGirdRowIds($gridCheckedClientID);
                if (array.length > 0) {
                    confirmInfo = "确定向勾选项目设总发送" + $nextYear + "年" + $nextMonth + "月生产月计划填报通知？"
                }
                else {
                    confirmInfo = "确定向所有设总发送" + $nextYear + "年" + $nextMonth + "月生产月计划填报通知？"
                    //confirmInfo = "请先勾选要发送月计划填报通知的项目"
                    //alert(confirmInfo);
                    //return false;
                }
                if (confirm(confirmInfo)) {
                    //if (confirm("请确认是否已经完成了月度计划填报")) {
                    $('#<%=btnSendNotice.ClientID %>').click();
                    //}
                }
            }
        }

        //与上月数据对比
        function viewCompare() {
            if (getFactMonth()) {
                var json = { compareMonth: $nextMonth, compareYear: $nextYear, thisMonth: $thisMonth, thisYear: $thisYear };
                var url = buildQueryUrl('/EPMS/List/Plan/ProjectMonthPlanCompareList.aspx', json);
                showDivDialog(url, "", 1000, 500, null);
                return false;
            }
            return false;
        }

        //月计划报表
        function viewProduction() {
            if (getFactMonth()) {
                var json = { DataMonth: $nextMonth, DataYear: $nextYear, thisMonth: $thisMonth, thisYear: $thisYear, isHidePlanTime: 1 };
                var url = buildQueryUrl('/EPMS/List/Plan/ProjProductionPlanList.aspx', json);
                showDivDialog(url, "", 1000, 550, null);
                return false;
            }
            return false;
        }

        //查看周计划信息
        function viewWeekInfo(week) {
            var startDate = new Date();
            var endDate = new Date();
            if (week == 'lastWeek') {
                startDate = "<%= LastMonday%>";
                endDate = "<%= LastSunday%>";
            }
            else {
                startDate = "<%= Monday%>";
                endDate = "<%= Sunday%>";
            }
            var json = { startDate: parseDate(startDate), endDate: parseDate(endDate), weekType: week };
            var url = buildQueryUrl('/EPMS/List/Plan/ProjectWeekPlanList.aspx', json);
            showDivDialog(url, "", 1000, 550, null);
            return false;
        }

        //生产任务完成情况
        function viewTaskInfo() {
            if (getFactMonth()) {
                var json = { DataMonth: $nextMonth, DataYear: $nextYear, thisMonth: $thisMonth, thisYear: $thisYear };
                var url = buildQueryUrl('/EPMS/List/Plan/ProjProductionTaskList.aspx', json);
                showDivDialog(url, "", 850, 550, null);
                return false;
            }
            return false;
        }

        //获取实际数据月，选择11月，则计划存储为Month=12
        function getFactMonth() {
            var selYear = $('#<%=ddlYear.ClientID %>').val();
            var selMonth = $('#<%=ddlMonth.ClientID %>').val();
            if (selYear == "" || selMonth == "") {
                alert("请先选择填报年月");
                return false;
            }
            else {
                $nextYear = selYear;
                $nextMonth = selMonth;
                $thisYear = selYear;
                $thisMonth = selMonth;
                if (selMonth == "12") {
                    $nextYear = parseInt($nextYear) + 1;
                    $nextMonth = 1;
                }
                else {
                    $nextMonth = parseInt($nextMonth) + 1;
                }
            }
            return true;
        }

       <%-- function initImportDiv() {
            var width = 150;
            var height = 200;
            $("#divImport :ui-dialog").dialog("destroy");
            $("#divImport").dialog({
                title: "导入项目卷册数量",
                resizable: true,
                autoOpen: false,
                minHeight: height,
                minWidth: width,
                modal: true,
                buttons: {
                    "确定导入": function () {
                        $('#<%=btnImport.ClientID %>').click();
                    },
                    "关闭": function () {
                        $(this).dialog("close");
                    }
                }
            });
        }--%>

        <%--//下载
        function openImportDiv() {
            $("#divImport").dialog('open');
            $("#divImport").parent().appendTo("#<%=this.Page.Form.ClientID%>");
            return false;
        }--%>
        function inExport() {
            if (getFactMonth()) {
                var json = { DataMonth: $nextMonth, DataYear: $nextYear }
                var url = buildQueryUrl("EPMS/List/Plan/ProjectMonthPlanImport.aspx", json);
                showDivDialog(url, null, 300, 250, bindGrid);
            }
            return false;
        }

        function bindGrid() {
            $('#<%=btnBindGrid.ClientID %>').click();
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
    <%--    <div id="divImport" style="display: none; text-align: center">
        <table width="100%">
            <tr style="height: 30px;">
                <td align="center" style="font-weight: bold"></td>
            </tr>
            <tr>
                <td align="center" style="font-weight: bold"></td>
            </tr>
            <tr>
                <td align="center" style="font-weight: bold">
                    <asp:FileUpload ID="fileUploadWbs" runat="server" />
                </td>
            </tr>
        </table>
    </div>--%>
</asp:Content>

