<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectPlanInfo.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Plan.ProjectPlanInfo" Title="项目计划详细" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <fieldset class="rtm_fds_bd" id="Fieldset1" style="display: block">
        <legend class="rtm_fds_tle" onclick="return showSearch();" style="cursor: pointer">一般查询条件</legend>
        <div style="background-color: #EFF2F7;" id="divQuery">
            <span class="filter-block"><span>
                <zhongsoft:LightDropDownList ID="ddlYear" runat="server" Style="width: 70px; margin: 3px 0px;">
                </zhongsoft:LightDropDownList>
            </span><span>
                <zhongsoft:LightDropDownList ID="ddlMonth" runat="server" Style="width: 70px; margin: 3px 0px;">
                </zhongsoft:LightDropDownList>
            </span></span><span class="filter-block"><span class="filter-block-lb">项目名称/编号</span><span>
                <asp:TextBox ID="tbProjectInfo" search="1" runat="server" MaxLength="64"></asp:TextBox></span>
            </span><span class="filter-block"><span class="filter-block-lb">卷册名称/编号</span><span>
                <asp:TextBox ID="tbRollInfo" search="1" runat="server" MaxLength="64"></asp:TextBox>
            </span></span>
        </div>
    </fieldset>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <style>
        body, html
        {
            /*overflow: hidden;*/
        } 
    </style>
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvPlan" AllowPaging="True"
        PageSize="15" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
        UseDefaultDataSource="true" BindGridViewMethod="BindDataGrid" OnSorting="gvPlan_Sorting"
        OnRowDataBound="gvPlan_RowDataBound">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="PlanYearMonth" HeaderText="计划年月" SortExpression="PlanYearMonth"
                HeaderStyle-Width="10%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="项目编号" SortExpression="ProjectCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectName" HeaderText="项目名称" SortExpression="ProjectName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="BelongDeptName" HeaderText="所属部门" SortExpression="BelongDeptName"
                HeaderStyle-Width="10%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="BelongSpecialtyCode" HeaderText="专业代字" SortExpression="BelongSpecialtyCode"
                HeaderStyle-Width="10%" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="BelongSpecialtyName" HeaderText="专业名称" SortExpression="BelongSpecialtyName"
                HeaderStyle-Width="10%" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="卷册编号" SortExpression="WBSCode"
                HeaderStyle-Width="10%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSName" HeaderText="卷册名称" SortExpression="WBSName"
                HeaderStyle-Width="10%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSOwnerName" HeaderText="卷册负责人" SortExpression="WBSOwnerName"
                HeaderStyle-Width="10%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PlanStartTime" HeaderText="计划开始时间" SortExpression="PlanStartTime"
                HeaderStyle-Width="10%" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PlanHandTime" HeaderText="计划个人出手时间" SortExpression="PlanHandTime"
                HeaderStyle-Width="10%" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PlanRecheckTime1" HeaderText="计划科/室交出时间" SortExpression="PlanRecheckTime1"
                HeaderStyle-Width="8%" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="FactRecheckTime1" HeaderText="实际科/室交出时间" SortExpression="FactRecheckTime1"
                HeaderStyle-Width="8%" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PlanDeliveryTime" HeaderText="计划交付时间" SortExpression="PlanDeliveryTime"
                HeaderStyle-Width="8%" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PublishedDate" HeaderText="实际出版时间" SortExpression="PublishedDate"
                HeaderStyle-Width="8%" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSState" HeaderText="卷册状态" SortExpression="WBSState"
                HeaderStyle-Width="40px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PublishState" HeaderText="出版状态" SortExpression="PublishState"
                HeaderStyle-Width="40px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="DeliveryState" HeaderText="交付状态" SortExpression="DeliveryState"
                HeaderStyle-Width="40px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="IsImportant" HeaderText="关键卷册" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="40px">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
