<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master"
    CodeBehind="C_RollList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.WBS.C_RollList"
    Title="专业任务分解" %>

<%@ Import Namespace="Zhongsoft.Portal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block" flag="proj"><span>项目名称 </span><span>
        <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" SourceMode="SelectorPage"
            IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
            EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
            PageWidth="850" ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode'}"
            OnClick="txtProjectName_Click" Style="width: 255px;"></zhongsoft:LightObjectSelector>
        <input type="hidden" runat="server" id="hiOrganizationID" />
    </span></span><span class="filter-block" flag="proj"><span>项目编号 </span><span>
        <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" readonly="readonly"
            class="kpms-textbox" style="width: 75px;" />
    </span></span><span class="filter-block" flag="noproj"><span class="filter-block-lb">项目名称/编号</span> <span>
        <asp:TextBox ID="tbProjectInfo" search="1" runat="server" MaxLength="64" CssClass="kpms-textboxsearch"
            EnableTheming="false"></asp:TextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">任务名称/编号</span>
        <span>
            <asp:TextBox ID="tbWBSInfo" search="1" runat="server" MaxLength="64" CssClass="kpms-textboxsearch"
                EnableTheming="false"></asp:TextBox>
        </span></span>
    <div style="display: none">
        <span class="filter-block"><span class="filter-block-lb">任务类型</span> <span>
            <zhongsoft:LightDropDownList ID="ddlWBSType" runat="server" class="kpms-ddlsearch"
                EnableTheming="false">
            </zhongsoft:LightDropDownList>
        </span></span>
    </div>
    <span class="filter-block" id="spWbsState" runat="server"><span class="filter-block-lb">任务状态</span> <span>
        <zhongsoft:LightDropDownList ID="ddlWBSState" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">专业</span> <span>
        <zhongsoft:LightDropDownList ID="ddlSpe" runat="server" class="kpms-ddlsearch" EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
    <!----->
    <span class="filter-block"><span class="filter-block-lb">任务类别</span> <span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlRollType" Width="70px">
        </zhongsoft:LightDropDownList>
    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="toolBtn" runat="server">
    <table>
        <tr>
            <td>
                <asp:LinkButton ID="btnAdd" runat="server" EnableTheming="false" CssClass="btn-query"
                    OnClientClick="return openEditor('2','2','');"><span>新建</span></asp:LinkButton>
                <asp:LinkButton ID="btnEdit" runat="server" EnableTheming="false" CssClass="btn-query"
                    OnClick="btnEdit_Click"><span>编辑</span></asp:LinkButton>
                <asp:LinkButton ID="btnDel" runat="server" EnableTheming="false" CssClass="btn-query"
                    OnClick="btnDel_Click"><span>删除</span></asp:LinkButton>
                <asp:LinkButton ID="lkbSchedule" runat="server" OnClientClick="return reportSchedule()"
                    EnableTheming="false" CssClass="btn-query"><span>进度填报</span></asp:LinkButton>
                <asp:LinkButton ID="lkbEditRoll" runat="server" OnClientClick="return editRoll()"
                    EnableTheming="false" CssClass="btn-query" Visible="false"><span>安排计划时间</span></asp:LinkButton>
                <asp:LinkButton ID="lkbWorkDay" runat="server" OnClientClick="return workDayConfirm()"
                    EnableTheming="false" CssClass="btn-query" Visible="false"><span>定额工天确认</span></asp:LinkButton>

                <asp:LinkButton ID="lkbwbsTemp" runat="server" OnClientClick="return wbsTemp();"
                    EnableTheming="false" CssClass="btn-query"><span>选择模板</span></asp:LinkButton>
                <asp:LinkButton ID="lkbSetSpecDE" runat="server" OnClientClick="return setHours();"
                    EnableTheming="false" CssClass="btn-query"><span>维护任务定额工日</span></asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <span style="display: none;">
        <asp:LinkButton ID="lbtnApprove" runat="server" OnClientClick="return startApproveFlow()"
            EnableTheming="false" CssClass="btn-query" Visible="false"><span>报批版</span></asp:LinkButton></span>
    <style>
        body, html {
            overflow: hidden;
        }
    </style>
    <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvWBS" AutoGenerateColumns="false"
        DataKeyNames="WBSID,ExecSpecialtyCode,ExecSpecialtyName" ShowExport="true" HideFieldOnExport="全部,序号,校审单,任务任务书,档案袋"
        runat="server" BindGridViewMethod="BindDataGrid" ShowPageSizeChange="true" OnRowCommand="gvWBS_RowCommand"
        OnRowDataBound="gvWBS_RowDataBound" OnSorting="gvWBS_Sorting" AllowSorting="true"
        OnExport="gvWBS_Export" OnBeforeExporting="gvWBS_BeforeExporting" UseDefaultDataSource="false">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全部" OnClientClick="checkGridView" Visible="true">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="发起流程" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="40px">
                <ItemTemplate>
                    <asp:LinkButton ID="lkbFileDispense" runat="server" CssClass="subtoolbarlink" EnableTheming="false" OnClientClick='<%# String.Format("return startWF(\"{0}\",\"{1}\",\"{2}\")",Eval("WBSID"), Eval("WBSOwnerID"), Eval("ExecSpecialtyCode")) %>' ToolTip="发起产品校审"><span><img id="img8" src="<%=WebAppPath %>/Themes/Images/btn_gongzuoliu.gif" alt="发起产品校审流程" width="16" height="16" /></span></asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="校审单" HeaderStyle-Width="50px" ItemStyle-HorizontalAlign="Center" Visible="false">
                <ItemTemplate>
                    <asp:LinkButton ID="lkbWbsVerifyInfo" runat="server" EnableTheming="false" ForeColor="Blue"
                        CommandName="VerifyInfo" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "WBSID") %>'><span> <img alt="查看" src="<%=this.WebAppPath %>/Themes/Images/btn_dg_view.gif" /></span></asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="任务书" HeaderStyle-Width="60px" ItemStyle-HorizontalAlign="Center" Visible="false">
                <ItemTemplate>
                    <asp:LinkButton ID="lkbWbsTaskInfo" runat="server" EnableTheming="false" ForeColor="Blue"
                        CommandName="TaskInfo" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "WBSID") %>'><span> <img alt="查看" src="<%=this.WebAppPath %>/Themes/Images/btn_dg_view.gif" /></span></asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="档案袋" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center" Visible="false">
                <ItemTemplate>
                    <asp:LinkButton ID="lkRollBag" runat="server" OnClientClick='<%# String.Format("return viewFileBagItem(\"{0}\",\"{1}\")", Eval("WBSID"),Eval("WBSState")) %>'
                        EnableTheming="false" ForeColor="Blue">  <img alt="查看" src="<%=this.WebAppPath %>/Themes/Images/btn_dg_detail.gif" /></asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="任务类型" DataField="WBSType" SortExpression="WBSType"
                HeaderStyle-Width="60px" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="专业代字" DataField="ExecSpecialtyCode" SortExpression="ExecSpecialtyCode"
                ItemStyle-Width="40px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="专业名称" DataField="ExecSpecialtyName" SortExpression="ExecSpecialtyName"
                ItemStyle-Width="70px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="所属分院" DataField="BelongDeptName" SortExpression="BelongDeptName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="任务编号" DataField="WBSCode" SortExpression="WBSCode"
                HeaderStyle-Width="60px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="任务名称">
                <ItemTemplate>
                    <asp:LinkButton ID="lkbWbsInfo" runat="server" OnClientClick='<%# String.Format("return openWBSDetail(\"{0}\")", Eval("WBSID")) %>'
                        EnableTheming="false" ForeColor="Blue"><span><%#Eval("WBSName")%></span></asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="定额工日" DataField="WorkDayOfConfirm" SortExpression="WorkDayOfConfirm" Visible="false"
                HeaderStyle-Width="60px" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="任务负责人" DataField="WBSOwnerName" SortExpression="WBSOwnerName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="校核人" HeaderStyle-Width="80px" Visible="false">
                <ItemTemplate>
                    <asp:Label ID="lbjhr" runat="server">
                    <span wbsid='<%#Eval("WBSID") %>'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="任务标识" DataField="WBSFlag" SortExpression="WBSFlag">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="任务状态" DataField="WBSState" SortExpression="WBSState"
                HeaderStyle-Width="60px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="完成%" DataField="CompleteRate" SortExpression="CompleteRate" Visible="false"
                ItemStyle-HorizontalAlign="Right" DataFormatString="{0:f2}" HeaderStyle-Width="60px">
            </zhongsoft:LightBoundField>
            <%-- <zhongsoft:LightBoundField HeaderText="计划开始时间" DataField="PlanStartTime" SortExpression="PlanStartTime"
                DataFormatString="{0:yyyy-MM-dd}" Visible="false">
            </zhongsoft:LightBoundField>--%>
            <zhongsoft:LightBoundField HeaderText="实际开始时间" DataField="FactStartTime" SortExpression="FactStartTime"
                DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="计划室交出时间" DataField="PlanRecheckTime1" SortExpression="PlanRecheckTime1"
                DataFormatString="{0:yyyy-MM-dd}" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="实际室交出时间" DataField="FactRecheckTime1" SortExpression="FactRecheckTime1"
                DataFormatString="{0:yyyy-MM-dd}" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="实际部交出时间" DataField="FactRecheckTime2" SortExpression="FactRecheckTime2"
                DataFormatString="{0:yyyy-MM-dd}" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="计划院交出时间" DataField="PlanCompleteTime" SortExpression="PlanCompleteTime"
                DataFormatString="{0:yyyy-MM-dd}" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="实际院交出时间" DataField="FactCompleteTime" SortExpression="FactCompleteTime"
                DataFormatString="{0:yyyy-MM-dd}" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="计划完成时间" DataField="PlanCompleteTime" SortExpression="PlanStartTime"
                DataFormatString="{0:yyyy-MM-dd}" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="实际完成时间" DataField="FactCompleteTime" SortExpression="FactStartTime"
                DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="实际送出版时间" DataField="VerifyEndDate" SortExpression="VerifyEndDate" Visible="false"
                DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="实际出版完成时间" DataField="PublishedDate" SortExpression="PublishedDate"
                DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="计划设计完成时间" DataField="PlanHandTime" SortExpression="PlanStartTime"
                DataFormatString="{0:yyyy-MM-dd}" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="实际设计完成时间" DataField="FactHandTime" SortExpression="FactStartTime"
                DataFormatString="{0:yyyy-MM-dd}" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="计划校核完成时间" DataField="PlanCompleteTime" SortExpression="PlanStartTime"
                DataFormatString="{0:yyyy-MM-dd}" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="实际校核完成时间" DataField="FactCheckTime" SortExpression="FactStartTime"
                DataFormatString="{0:yyyy-MM-dd}" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="计划审核完成时间" DataField="PlanRecheckTime1" SortExpression="PlanRecheckTime1"
                DataFormatString="{0:yyyy-MM-dd}" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="实际审核完成时间" DataField="FactRecheckTime1" SortExpression="FactRecheckTime1"
                DataFormatString="{0:yyyy-MM-dd}" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="计划批准完成时间" DataField="PlanApprovalTime" SortExpression="PlanRecheckTime1"
                DataFormatString="{0:yyyy-MM-dd}" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="实际批准完成时间" DataField="FactApprovalTime" SortExpression="FactRecheckTime1"
                DataFormatString="{0:yyyy-MM-dd}" Visible="false">
            </zhongsoft:LightBoundField>
            <%-- <zhongsoft:LightBoundField HeaderText="计划交付时间" DataField="PlanDeliveryTime" SortExpression="PlanDeliveryTime"
                DataFormatString="{0:yyyy-MM-dd}" Visible="false">
            </zhongsoft:LightBoundField>--%>
            <zhongsoft:LightBoundField HeaderText="实际交付业主时间" DataField="FactDeliveryTime" SortExpression="FactDeliveryTime"
                DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode" SortExpression="ProjectCode" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName" SortExpression="ProjectName" Visible="false">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <asp:Button ID="btnBindData" runat="server" Visible="false" OnClick="btnBindData_Click" />
    <input type="hidden" runat="server" id="hiKey" />
    <input type="hidden" runat="server" id="hiWBSTypeId" />
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvWBS.CheckedClientID %>";
        function initPagePlugin() {
            getWBSChecker();

        }
        function editRoll() {
            var rollDs = $("#" + $gridCheckedClientID).val();
            if (rollDs.length < 36) {
                alert("请勾选要维护的任务任务");
            } else {
                //打开编辑页面
                var url = buildQueryUrl("/EPMS/List/WBS/WBSCompleteRateEditor.aspx", { bizids: rollDs, actionType: 3, RoleName: "<%=RoleName %>", wbsType: "roll" });
                showDivDialog(url, null, 800, 500, editProjectCallBack);
            }
            return false;
        }

        //填报进度
        function reportSchedule() {
            var url = buildQueryUrl("/EPMS/List/WBS/WBSWorkScheduleReportEditor.aspx", { actionType: 2 });
            showDivDialog(url, null, 1200, 600, editProjectCallBack);
            return false;
        }

        function workDayConfirm() {
            var url = buildQueryUrl("/EPMS/List/WBS/WBSWorkDayConfirmEditor.aspx", { actionType: 2 });
            showDivDialog(url, null, 1200, 600, editProjectCallBack);
            return false;
        }
        function editProjectCallBack(re) {
            <%=Page.ClientScript.GetPostBackEventReference(this.btnBindData,"") %>
            return true;
        }
        //获取任务校核人
        function getWBSChecker() {
            var $ids = "";
            $("#<%=gvWBS.ClientID %> span[wbsid]").each(function () {
                $ids += $(this).attr("wbsid") + "|";
            });
            $.post("C_RollList.aspx",
                { asyfunc: "GetWBSChecker", wbsIdList: $ids },
                function (res) {
                    var $l;
                    if (res == "") {

                    } else {
                        $l = eval('(' + res + ')');
                    }
                    $("#<%=gvWBS.ClientID %> span[wbsid]").each(function () {
                        var $wbsid = $(this).attr("wbsid");
                        for (var i = 0; i < $l.length; i++) {
                            var $id = $l[i][0];
                            var $name = $l[i][1];
                            if ($wbsid == $id) {
                                if ($name == "")
                                    $(this).html("");
                                else {
                                    $(this).html($name);
                                }
                            }
                        }
                    });
                }
            );
        }

        function openWBSDetail(wbsid) {
            var url = buildQueryUrl("/EPMS/List/WBS/WBSEditor.aspx", { actionType: 1, bizid: wbsid });
            showDivDialog(url, null, 900, 600, null);
            return false;
        }

        //发起报批版流程
        function startApproveFlow() {
            var url = "<%=WebAppPath %>/Sys/Workflow/FormDetail.aspx?actionType=2&packageName=EPMSWBSApproveUpgrade.xpdl&xpdlId=EPMSWBSApproveUpgrade_wp1&formId=151&OrganizationID=<%=QueryOrgID %>&ver=";
            window.open(url);
            return false;
        }

        function checkGridView(array) {
            transParamToToolBar(array, null);
        }

        function controlBtn() {
            $("#<%=btnEdit.ClientID %>").hide();
            $("#<%=btnDel.ClientID %>").hide();
        }

        function openEditor(actionType, type, bizId) {
            var json;
            if (actionType == "2") {
                var speId ='<%=QuerySpecialtyID %>';
                //综合专业
                if (speId == '49') {
                    if (!parseBool('<% =IsProDirector%>')) {
                        alert('您不是项目设总，不能新建综合专业的任务！');
                        return false;
                    }
                }

                var value = $("#<%=hiWBSTypeId.ClientID %>").val();
                json = { actionType: 2, ParamWBSTypeID: value, OrganizationID: '<%=QueryOrgID %>', ExecSpecialtyID: speId };
                var url = buildQueryUrl('/EPMS/List/WBS/WBSEditor.aspx', json);
                showDivDialog(url, "", 850, 550, rebindGridData);
                return false;
            }
            else if (actionType == "3") {
                json = { actionType: actionType, bizId: bizId, ParamWBSTypeID: type };
                var url = buildQueryUrl('/EPMS/List/WBS/WBSEditor.aspx', json);
                showDivDialog(url, "", 850, 550, rebindGridData);
                return false;
            }
            else if (actionType == "1") {
                json = { actionType: actionType, bizId: bizId, ParamWBSTypeID: type };
                var url = buildQueryUrl('/EPMS/List/WBS/WBSEditor.aspx', json);
                showDivDialog(url, "", 850, 550, rebindGridData);
                return false;
            }
        }

        function viewForm(bizId, extendedAttribute) {
            var url = '/Custom/List/C_FormDetailLoading.aspx';
            var json = { bizId: bizId, IsOld: 2, ExtendedAttribute: extendedAttribute };
            url = buildQueryUrl(url, json);
            window.open(url);
            return false;
        }

        function viewFileBagItem(wbsid, wBSState) {
            var actionType = 1;
            //任务档案袋中任务状态为“尚未确定”“尚未开展”“正在进行”，对应的值应该为0,1,2，任务相关信息可以修改，如果不是这三个状态，任务的信息不可修改
            if (wBSState == 0 || wBSState == 1 || wBSState == 2) {
                actionType = 3;
            }
            var url = buildQueryUrl("/Custom/List/Dashboard.aspx", {
                ListId: '494CE4A3-A401-4B85-A97D-3247C6D2F439',
                ViewId: '3B413684-1588-4B7D-A3F7-D9307C23CE7B', secid: "3B413684-1588-4B7D-A3F7-D9307C23CE7B", WBSID: wbsid, IsDashboard: 1, ShowToolbar: 0, IsShowHeader: 2, ActionType: actionType
            });
            window.open(url);
            //showDivDialog(url, null, 900, 600, null);
            return false;
        }

        //选择wbs任务模板
        function wbsTemp() {
            var speId = "<%=QuerySpecialtyID %>";
            //  任务所属部门
            var deptId = "";
            //项目模板
            var projTemplateID = "<%=ProjectTemplateID %>";
            if (!checkSpe(speId)) {
                return false;
            }
            var json = { OrganizationID: '<%=QueryOrgID %>', ExecSpecialtyID: speId, DeptID: deptId, ProjectTemplateID: projTemplateID, WBSModeID: '<% =DAL.EPMS.WBSMode.任务管理.GetHashCode()%>', WbsType: '<%=DAL.EPMS.WBSType.册 %>' };
            var url = buildQueryUrl('/EPMS/List/Sys/RelateWBSTemplate.aspx', json);
            showDivDialog(url, "", 1020, 600, editProjectCallBack);
            return false;
        }

        //统一提示信息
        function checkSpe(speId) {
            if (speId == '' || speId == undefined) {
                alert('请先从左侧树形结构选择专业！');
                return false;
            }
            return checkLimit(speId);
            return true;
        }

        //操作权限控制，设总、专业主设人主任工才可以进行操作
        function checkLimit(speId) {
            if (parseBool("<%=IsProDirector %>") || parseBool("<%=IsPlanEngineer %>")) {
                return true;
            }
            else {
                if (parseBool("<%=IsMainSet %>") || parseBool("<%=IsDirector %>")) {
                    var curSpeId = '<%=CurSpeID %>';
                    if (curSpeId.indexOf(speId) < 0) {

                        alert('您不是该专业的专业负责人或者分管所领导，请选择其他专业操作！');
                        return false;
                    }
                    return true;
                }
                else {
                    alert('您没有权限！');
                    return false;
                }
            }
        }

        function setHours() {
            var speId = "<%=QuerySpecialtyID %>";
            if (speId == '' || speId == undefined) {
                alert('请先从左侧树形结构选择专业！');
                return false;
            }
            if (!checkHoursLimit(speId)) {
                return false;
            }
            var json = { OrganizationID: '<%=QueryOrgID %>', SpecialtyId: speId, actionType: 3 };
            var url = buildQueryUrl('/EPMS/List/WBS/WorkDaysConfirmEditor.aspx', json);
            showDivDialog(url, "", 1020, 600, null);
            return false;
        }
        //判断是否有权限进行专业定额工日确认
        function checkHoursLimit(speId) {
            //设总
            if (parseBool("<%=IsProDirector %>")) {
                return true;
            }
            else {
                //科室主任（科室负责人）角色的人员可选择本科室的专业进修确认
                if (parseBool("<%=IsDeptCur %>") || parseBool("<%=IsZREngineer %>")) {
                    var curSpeId = '<%=DeptSpeID %>';
                    if (curSpeId.indexOf(speId) < 0) {

                        alert('您不是该专业的科室负责人或者主任工程师，请选择其他专业操作！');
                        return false;
                    }
                    return true;
                } else {
                    alert('您没有权限！');
                    return false;
                }
            }
        }

        function initPagePlugin() {
            //根据是否在项目网站展示，显隐一些信息
            $('[flag="proj"]').hide();
            $('[flag="noproj"]').hide();
            if ('<%=QueryOrgID %>' != '') {
                //$('[flag="proj"]').hide();
            }
            else {
                //$('[flag="noproj"]').hide();
            }

            //如果当前登录人不是设总/主设人/主任工/管理员/不允许发起wbs分解流程(隐藏按钮) modify by duxk on 2022-6-10
            var zrg = parseBool('<%=IsDirector%>');
            var zsr = parseBool('<%=IsMainSet%>');
            var sz = parseBool('<%=IsProDirector%>');
            var mgr = parseBool('<%=KPMSUser.IsAdmin%>');
            if (zrg == false && zsr == false && sz == false && mgr == false) {
                $("#ctl00_subToolBar_dlListPage_ctl00_dlButtons_ctl01_btn").hide();
            }

        }

        //modified by biye 20210219 发起产品校审流程
        function startWF(wbsID, wbsOwnerID, specialtyCode) {
            //modified by biye 20210222 通过任务列表发起校审流程权限控制，只能是任务负责人才可以发起，对于综合专业卷册不做控制
            if (specialtyCode != 'A' && wbsOwnerID.toUpperCase() != '<%=KPMSUser.UserId.ToUpper() %>') {
                alert('您不是该任务的任务负责人，不能发起产品校审流程');
                return false;
            }
            var url = encodeURI("<%=WebAppPath%>/Sys/Workflow/FormDetail.aspx?actionType=2&packageName=EPMSProductVerify.xpdl&xpdlId=EPMSProductVerify_wp1&formId=" + '<%=FormHelper.GetFormIdByPackage("EPMSProductVerify.xpdl")%>' + "&ver=|&OrganizationID=" + '<%=QueryOrgID%>' + "&WBSID=" + wbsID + "&ProjectSpecialtyID=" + '<%=QuerySpecialtyID%>');

            window.open(url, "workspace");
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
