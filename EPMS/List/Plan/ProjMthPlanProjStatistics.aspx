<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjMthPlanProjStatistics.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Plan.ProjMthPlanProjStatistics" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block" style="display: none">
        <span class="filter-block-lb">计划周期</span>
        <span>
            <zhongsoft:LightDropDownList runat="server" ID="ddlPlanCycle" AutoPostBack="true"
                class="kpms-ddlsearch" EnableTheming="false" OnSelectedIndexChanged="lbtnReBindTimeDll_Click">
            </zhongsoft:LightDropDownList>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">计划年度</span>
        <span>
            <zhongsoft:LightDropDownList runat="server" ID="ddlPlanYear" class="kpms-ddlsearch"
                EnableTheming="false">
            </zhongsoft:LightDropDownList>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">
            <asp:Label runat="server" ID="lbPlanCycle" secondflag="noYear">计划月度</asp:Label></span>
        <span>
            <zhongsoft:LightDropDownList runat="server" ID="ddlPlanPeriod" class="kpms-ddlsearch"
                EnableTheming="false" secondflag="noYear">
            </zhongsoft:LightDropDownList>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">项目名称/编号</span>
        <span>
            <zhongsoft:LightTextBox ID="tbProjectInfo" search="1" runat="server" MaxLength="64"
                CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>
    
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="advSearch" runat="server">
    <span class="filter-block">
        <span class="filter-block-lb">工程类型</span><span>
            <zhongsoft:LightDropDownList ID="ddlProjectType" runat="server" class="kpms-ddlsearch"
                EnableTheming="false">
            </zhongsoft:LightDropDownList>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">项目设总</span>
        <span>
            <zhongsoft:LightTextBox ID="tbManagerName" search="1" runat="server" MaxLength="64"
                CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvProjStatistics" AutoGenerateColumns="false"
        ShowExport="true" HideFieldOnExport="全部" runat="server" BindGridViewMethod="BindDataGrid"
        ShowPageSizeChange="true" OnRowDataBound="gvProjStatistics_RowDataBound" UseDefaultDataSource="true" PageSize="10">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="工程类型" DataField="ProjectType">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName" >
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目设总" DataField="ManagerUserName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="卷册总数" DataField="WBSCount">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="完成卷册数" DataField="FinishiWBSCount">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="计划卷册数" DataField="PlanWBSCount">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目状态" DataField="ProjectState">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightButtonField HeaderText="执行情况" CommandName="ViewData" DataParamFields="OrganizationID"
                EditItemClick="viewPlanDetail">
            </zhongsoft:LightButtonField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        function viewPlanDetail(organizationID) {
            var planCycle = $("#<%=ddlPlanCycle.ClientID %>").val();
            var planYear = $("#<%=ddlPlanYear.ClientID %>").val();
            var planPeriod = $("#<%=ddlPlanPeriod.ClientID %>").val();
            var json = { queryOrganizationId: organizationID, secid: '7E397DE8-8855-4E67-8BAE-D7671F2F811D', queryPlanCycle: planCycle, queryPlanYear: planYear, queryPlanPeriod: planPeriod };
            var url = buildQueryUrl("/EPMS/List/Plan/ProjMthPlanWBSDetailList.aspx", json);
            showDivDialog(encodeURI(url), "", 1050, 600, null);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
