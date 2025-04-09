<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeptHandTimeStat.aspx.cs" Title="卷册完成情况时间占比"
    Inherits="Zhongsoft.Portal.EPMS.List.ProduceSta.DeptHandTimeStat" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">部门</span><span>
        <zhongsoft:LightDropDownList id="ddlDept" runat="server" class="kpms-ddlsearch" enabletheming="false" >
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block" style="display: none"><span class="filter-block-lb">
        计划周期</span> <span>
            <zhongsoft:LightDropDownList runat="server" ID="ddlPlanCycle" AutoPostBack="true"
                class="kpms-ddlsearch" EnableTheming="false" OnSelectedIndexChanged="lbtnReBindTimeDll_Click">
            </zhongsoft:LightDropDownList>
        </span></span><span class="filter-block">
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
 <span class="filter-block"><span class="filter-block-lb">交出类型</span> <span>
        <zhongsoft:LightDropDownList id="ddlStatisticType" runat="server" class="kpms-ddlsearch"
            enabletheming="false">
            <asp:ListItem Text="室交出时间" Value="FactRecheckTime1">
            </asp:ListItem>
            <asp:ListItem Text="部交出时间" Value="FactRecheckTime2">
            </asp:ListItem>
            <asp:ListItem Text="院交出时间" Value="FactDeliveryTime">
            </asp:ListItem>
        </zhongsoft:LightDropDownList>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">工程阶段</span><span>
        <zhongsoft:LightDropDownList id="ddlProjectPhase" runat="server" class="kpms-ddlsearch"
            enabletheming="false">
        <asp:ListItem Value="0">全部</asp:ListItem>
        <asp:ListItem Value="1">前期工程</asp:ListItem>
        <asp:ListItem Value="2">施工图</asp:ListItem>
        </zhongsoft:LightDropDownList>
    </span></span>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="advSearch" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvProjStatistics" AutoGenerateColumns="false" 
        ShowExport="true" HideFieldOnExport="全部" runat="server" BindGridViewMethod="BindDataGrid"
        ShowPageSizeChange="true" OnRowDataBound="gvProjStatistics_RowDataBound" UseDefaultDataSource="true" 
        FooterStyle-ForeColor="Red" ShowFooter="true" PageSize="10" >
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="所属部门" DataField="DeptNameOrSpecialtyName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="本月完成卷册数" DataField="RollCount" ItemStyle-HorizontalAlign="Right">
                <FooterStyle HorizontalAlign="Right" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="上旬完成情况（26日-5日）" DataField="Pre" ItemStyle-HorizontalAlign="Right">
                <FooterStyle HorizontalAlign="Right" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="上旬完成比率" DataField="RollCount" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:F0}">
                <FooterStyle HorizontalAlign="Right" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="中旬完成情况（6日-15日）" DataField="Mid" ItemStyle-HorizontalAlign="Right">
                <FooterStyle HorizontalAlign="Right" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="中旬完成比率" DataField="RollCount" ItemStyle-HorizontalAlign="Right">
                <FooterStyle HorizontalAlign="Right" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="下旬完成情况（16日-25日）" DataField="Last" ItemStyle-HorizontalAlign="Right">
                <FooterStyle HorizontalAlign="Right" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="下旬完成比率" DataField="RollCount" ItemStyle-HorizontalAlign="Right">
                <FooterStyle HorizontalAlign="Right" />
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>