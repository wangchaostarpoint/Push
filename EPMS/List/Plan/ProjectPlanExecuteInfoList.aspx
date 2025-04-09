<%@ Page Language="C#" Title="项目计划执行情况" AutoEventWireup="true" CodeBehind="ProjectPlanExecuteInfoList.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Plan.ProjectPlanExecuteInfoList" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb" style="width: 40px">年份</span>
        <span>
            <zhongsoft:LightDropDownList ID="ddlYear" runat="server" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged"
                AutoPostBack="true " class="kpms-ddlsearch" EnableTheming="false">
            </zhongsoft:LightDropDownList>
        </span></span><span class="filter-block"><span class="filter-block-lb" style="width: 40px">
            专业</span> <span>
                <zhongsoft:LightDropDownList ID="ddlSpecialty" runat="server" class="kpms-ddlsearch"
                    EnableTheming="false">
                </zhongsoft:LightDropDownList>
            </span></span><span class="filter-block"><span class="filter-block-lb" style="width: 40px">
                部门</span> <span>
                    <zhongsoft:LightDropDownList ID="ddlDept" runat="server" class="kpms-ddlsearch" EnableTheming="false">
                    </zhongsoft:LightDropDownList>
                </span></span><span class="filter-block"><span class="filter-block-lb" style="width: 40px">
                </span><span>
                    <asp:RadioButtonList ID="rblMonth" runat="server" RepeatDirection="Horizontal" AutoPostBack="true"
                        OnSelectedIndexChanged="rblMonth_SelectedIndexChanged">
                    </asp:RadioButtonList>
                </span></span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" AllowPaging="true" ID="gvProj" AutoGenerateColumns="false"
        runat="server" ShowPageSizeChange="true" DataKeyNames="OrganizationID" UseDefaultDataSource="true"
        AllowSorting="true" OnSorting="gvProj_Sorting" PageSize="15" ShowExport="true"
        BindGridViewMethod="BindDataGrid" HideFieldOnExport="序号">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="工程类型" DataField="ProjectType" SortExpression="ProjectType">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode" SortExpression="ProjectCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName" SortExpression="ProjectName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="设计阶段" DataField="PhaseName" SortExpression="PhaseName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="卷册数" DataField="RollsNumber" SortExpression="RollsNumber"
                ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="本月安排" DataField="PlanNumber" SortExpression="PlanNumber"
                ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="计划进行" DataField="PlanningNumber" SortExpression="PlanningNumber"
                ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="计划完成" DataField="PlanCompleteNumber" SortExpression="PlanCompleteNumber"
                ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="提前交出" DataField="BeforeCompleteNumber" SortExpression="BeforeCompleteNumber"
                ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="按期交出" DataField="NormalCompleteNumber" SortExpression="NormalCompleteNumber"
                ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="拖期交出" DataField="AfterCompleteNumber" SortExpression="AfterCompleteNumber"
                ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="未交出" DataField="NotCompleteNumber" SortExpression="NotCompleteNumber"
                ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="升版卷册安排" DataField="VersionPlanNumber" SortExpression="OutPlanCompleteNumber"
                ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="升版卷册交出" DataField="VersionCompleteNumber" SortExpression="OutPlanCompleteNumber"
                ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="计划外交出" DataField="OutPlanCompleteNumber" SortExpression="OutPlanCompleteNumber"
                ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="计划保证率(%)" DataField="PlanEnsurePercent" SortExpression="PlanEnsurePercent"
                ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="计划完成率(%)" DataField="PlanCompletePercent"
                SortExpression="PlanCompletePercent" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="计划调整" DataField="PlanAdjust" SortExpression="PlanAdjust"
                ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="计划调整率(%)" DataField="PlanAdjustPercent" SortExpression="PlanAdjustPercent"
                ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
        PageSize="15" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
        DataKeyNames="OrganizationId,RollAlertInfo" UseDefaultDataSource="true" BindGridViewMethod="BindDataGrid"
        EmptyDataText="没有要查找的数据">
        <PagerStyle HorizontalAlign="Right"></PagerStyle>
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="项目编号" ItemStyle-Width="100px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectName" HeaderText="项目名称" ItemStyle-Width="100px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="预警提醒">
                <ItemTemplate>
                    <asp:LinkButton ID="lkbAlertInfo" runat="server" OnClientClick='<%# String.Format("return openRollList(\"{0}\",\"1\")", Eval("OrganizationID")) %>'
                        Text='<%#Eval("RollAlertInfo").ToString().Length > 5 ? Eval("RollAlertInfo").ToString().Substring(0, 5) + "..." : Eval("RollAlertInfo") %>'
                        ToolTip='<%#Eval("RollAlertInfo") %>' EnableTheming="false" ForeColor="Blue"></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="ManagerUserName" HeaderText="设总" ItemStyle-Width="100px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="RollsNumber" HeaderText="卷册总数" ItemStyle-Width="100px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="LestMonthCompleteNumber" HeaderText="上期累计完成"
                ItemStyle-Width="100px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PlanNumber" HeaderText="本月安排" ItemStyle-Width="100px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PlanningNumber" HeaderText="计划进行" ItemStyle-Width="100px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PlanCompleteNumber" HeaderText="计划完成" ItemStyle-Width="100px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="FactCompleteNumber" HeaderText="实际完成" ItemStyle-Width="100px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PlanCompleteNumberPercent" HeaderText="计划累计完成%"
                ItemStyle-Width="100px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="FactCompleteNumberPercent" HeaderText="实际累计完成%"
                ItemStyle-Width="100px">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">

        function initPagePlugin() {
            $("#trleader").hide();
        }

        function openRollList(orgID, showWaringRow) {
            var roleName = "<%= RoleName%>";
            if (roleName == 'Szr') {
                roleName = "Bmfzr";
            }
            var url = buildQueryUrl("/EPMS/List/WBS/C_RollList.aspx", { OrganizationID: orgID, secid: '9dd62921-edc5-4767-b46a-817756ea5ca7', RoleName: roleName, IsShowAllButn: 'false', ShowWaringRow: showWaringRow });
            showDivDialog(url, null, 1200, 600, null);

            return false;
        }
    </script>
</asp:Content>
