<%@ Page Title="未签订合同的工程列表" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" CodeBehind="ProjectsOfNoSignContractList.aspx.cs" Inherits="Zhongsoft.Portal.MM.List.MM.ProjectsOfNoSignContractList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">所属工程包</span><span>
        <zhongsoft:LightTextBox runat="server" ID="tbProjectPackage" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">工程编号/名称</span><span>
        <zhongsoft:LightTextBox runat="server" ID="tbProject" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView runat="server" ID="gvList" AllowPaging="True" PageSize="15" ShowExport="True" UseDefaultDataSource="True" BindGridViewMethod="BindData" OnRowDataBound="gvList_OnRowDataBound"
        AllowFrozing="True" FrozenColNum="5" AllowSorting="true">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="40px">
                <ItemTemplate>
                    <%#Container.DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightButtonField HeaderText="查看" EditItemClick="viewDetail" ToolTip="查看" DataParamFields="MarketProjectID"
                ImageUrl="../../../Themes/Images/btn_dg_view.gif" />
            <zhongsoft:LightBoundField HeaderText="所属工程包" DataField="ProjectPackage" Width="200px" ShowToolTip="True" SortExpression="ProjectPackage" />
            <zhongsoft:LightBoundField HeaderText="财务流水号" DataField="FinancialSerialNum" SortExpression="FinancialSerialNum" />
            <zhongsoft:LightBoundField HeaderText="工程编号" DataField="MarketProjectCode" SortExpression="MarketProjectCode" />
            <zhongsoft:LightBoundField HeaderText="工程名称" DataField="MarketProjectName" SortExpression="MarketProjectName" />
            <zhongsoft:LightBoundField HeaderText="建设地点" DataField="BuildPlace" SortExpression="BuildPlace" />
            <zhongsoft:LightBoundField HeaderText="合同产值（万元）" DataField="ContractValue" ItemStyle-HorizontalAlign="Right" SortExpression="ContractValue" />
            <zhongsoft:LightBoundField HeaderText="估算产值（万元）" DataField="EstimateContractVal" ItemStyle-HorizontalAlign="Right" SortExpression="EstimateContractVal" />
            <zhongsoft:LightBoundField HeaderText="差值（万元）" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="设总" />
            <zhongsoft:LightBoundField HeaderText="工程类别" DataField="ProjectType" SortExpression="ProjectType" />
            <zhongsoft:LightBoundField HeaderText="电压等级（kV）" DataField="VoltageGrade" ItemStyle-HorizontalAlign="Right" SortExpression="VoltageGrade" />
            <zhongsoft:LightBoundField HeaderText="设计阶段" DataField="ProjectPhaseNames" SortExpression="ProjectPhaseNames" />
            <zhongsoft:LightBoundField HeaderText="工程情况说明" DataField="ProjectDescription" ShowToolTip="True" Width="300px" SortExpression="ProjectDescription" />
            <zhongsoft:LightBoundField HeaderText="工程规模" DataField="ProjectScale" ShowToolTip="True" Width="300px" SortExpression="ProjectScale" />
            <zhongsoft:LightBoundField HeaderText="预计开始日期" DataField="PlanStartTime" DataFormatString="{0:yyyy-MM-dd}" SortExpression="PlanStartTime" />
            <zhongsoft:LightBoundField HeaderText="计划完成日期" DataField="PlanFinishTime" DataFormatString="{0:yyyy-MM-dd}" SortExpression="PlanFinishTime" />
            <zhongsoft:LightBoundField HeaderText="委托单位" DataField="EntrustUnitName" SortExpression="EntrustUnitName" />
            <zhongsoft:LightBoundField HeaderText="工程状态" DataField="ProjectState" SortExpression="ProjectState" />
            <zhongsoft:LightBoundField HeaderText="工程投产日期" DataField="ProductionDate" DataFormatString="{0:yyyy-MM-dd}" SortExpression="ProductionDate" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        //查看详细信息
        function viewDetail(id) {
            var url = buildBizUrl(1, id, "MM/List/MM/AddToFormalProject.aspx", null);
            showDivDialog(url, null, 850, 550, null);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
