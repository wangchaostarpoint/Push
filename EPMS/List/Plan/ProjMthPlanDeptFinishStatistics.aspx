<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjMthPlanDeptFinishStatistics.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Plan.ProjMthPlanDeptFinishStatistics" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">计划周期</span> <span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlPlanCycle" AutoPostBack="true"
            class="kpms-ddlsearch" EnableTheming="false" OnSelectedIndexChanged="lbtnReBindTimeDll_Click">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">计划年</span> <span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlPlanYear" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">
        <asp:Label runat="server" ID="lbPlanCycle" secondflag="noYear"></asp:Label></span>
        <span>
            <zhongsoft:LightDropDownList runat="server" ID="ddlPlanPeriod" class="kpms-ddlsearch"
                EnableTheming="false" secondflag="noYear">
            </zhongsoft:LightDropDownList>
        </span></span><span class="filter-block"><span class="filter-block-lb">项目名称/编号</span>
            <span>
                <zhongsoft:LightTextBox ID="tbProjectInfo" search="1" runat="server" MaxLength="64"
                    CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
            </span></span><span class="filter-block"><span class="filter-block-lb">项目设总</span> <span>
                <zhongsoft:LightTextBox ID="tbManagerName" search="1" runat="server" MaxLength="64"
                    CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
            </span></span><span class="filter-block"><span class="filter-block-lb">工程类型</span><span>
                <zhongsoft:LightDropDownList ID="ddlProjectType" runat="server" OnSelectedIndexChanged="ddlProjectType_SelectedIndexChanged"
                    class="kpms-ddlsearch" EnableTheming="false" AutoPostBack="true">
                </zhongsoft:LightDropDownList>
            </span></span><span class="filter-block"><span class="filter-block-lb">交出类别</span><span>
                <zhongsoft:LightDropDownList ID="ddlStatisticType" runat="server" class="kpms-ddlsearch"
                    EnableTheming="false">
                    <asp:ListItem Text="室交出时间" Value="FactRecheckTime1,PlanRecheckTime1"></asp:ListItem>
                    <asp:ListItem Text="部交出时间" Value="FactRecheckTime2,PlanRecheckTime1"></asp:ListItem>
                    <asp:ListItem Text="院交出时间" Value="FactDeliveryTime,PlanCompleteTime"></asp:ListItem>
                </zhongsoft:LightDropDownList>
            </span></span>
    <br />
    <span class="filter-block"><span class="filter-block-lb">设计阶段</span><span>
        <zhongsoft:LightDropDownList ID="ddlPhase" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvDeptStatistics" AutoGenerateColumns="false"
        ShowExport="true" HideFieldOnExport="全部" runat="server" BindGridViewMethod="BindDataGrid"
        UseDefaultDataSource="true" ShowPageSizeChange="true" OnRowDataBound="gvDeptStatistics_RowDataBound">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目设总" DataField="ManagerUserName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="部门" DataField="OrgUnitName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="卷册总数" DataField="WBSCount">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="上期累计完成" DataField="PreCycleFinishCount">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="本月安排" DataField="ThisCyclePlan">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="计划进行" DataField="PlanExe">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="计划完成" DataField="PlanFinish">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="计划累计完成">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbPlanFinishRate"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
