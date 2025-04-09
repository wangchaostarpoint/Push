<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectWeekPlanList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Plan.ProjectWeekPlanList"
    Title="周计划信息" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
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
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false"
        ShowExport="true" AllowPaging="true" PageSize="15" UseDefaultDataSource="true" AllowFrozing="true" FrozenColNum="4"
        DataKeyNames="OrganizationID" BindGridViewMethod="BindGrid">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号">
                <ItemTemplate>
                    <%#Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="工程包" DataField="ProjectPackage">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="财务流水号" DataField="FinancialSerialNum">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName" ItemStyle-Width="100px" ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="设计阶段" DataField="PhaseName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="设总">
                <ItemTemplate>
                    <%#(string.IsNullOrEmpty(Convert.ToString(Eval("ManagerDeptName")))?"":Eval("ManagerDeptName")+"：" )+Eval("ManagerUserName") %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="工程类型" DataField="ProjectType">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="规模" DataField="ProjectScale" ItemStyle-Width="100px" ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="开始日期" DataField="PlanStartDate" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="计划完成日期" DataField="PlanCompleteDate" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="本工程计划完成卷册数" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <a onclick="return viewItem('<%#Eval("OrganizationId") %>','','')" title='<%# Eval("TotalRollNum")%>'
                        style="color: Blue"><%# Eval("TotalRollNum")%></a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="累计已完成卷册总数" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <a onclick="return viewItem('<%#Eval("OrganizationId") %>','FactCompleteTime','')" title='<%# Eval("TotalFactCompleteRoll")%>'
                        style="color: Blue"><%# Eval("TotalFactCompleteRoll")%></a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="周计划完成卷册数" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <a onclick="return viewItem('<%#Eval("OrganizationId") %>','PlanCompleteTime','1')" title='<%# Eval("WeekPlanNum")%>'
                        style="color: Blue"><%# Eval("WeekPlanNum")%></a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="实际完成卷册数" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <a onclick="return viewItem('<%#Eval("OrganizationId") %>','FactCompleteTime','1')" title='<%# Eval("WeekFactNum")%>'
                        style="color: Blue"><%# Eval("WeekFactNum")%></a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        //打开卷册目录
        function viewItem(orgID, timeField, isWithTime) {
            var json = { OrganizationID: orgID, TimeField: timeField }
            if (isWithTime == "1") {
                json = { OrganizationID: orgID, TimeField: timeField, startDate: "<%=StartDate%>", endDate: "<%=EndDate%>" }
            }
            var url = buildQueryUrl("/EPMS/List/Plan/ProjectWeekPlanWBSList.aspx", json);
            showDivDialog(url, null, 850, 500, null);

            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>


