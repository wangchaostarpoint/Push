<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjProductSta.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.ProduceSta.ProjProductSta" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block" flag="conditionHide"><span class="filter-block-lb">交出类型</span> <span>
        <zhongsoft:LightDropDownList ID="ddlStatisticType" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
            <asp:ListItem Text="室交出时间" Value="FactRecheckTime1">
            </asp:ListItem>
            <asp:ListItem Text="部交出时间" Value="FactRecheckTime2">
            </asp:ListItem>
            <asp:ListItem Text="院交出时间" Value="FactDeliveryTime">
            </asp:ListItem>
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">工程类型</span><span>
        <zhongsoft:LightDropDownList ID="ddlProjectType" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">设计阶段 </span><span>
        <zhongsoft:LightDropDownList ID="ddlPhase" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
    <span class="filter-block" flag="conditionHide"><span class="filter-block-lb">日期范围</span> <span>
        <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtSProjectFormDate"
            runat="server" readonly="readonly" compare="1" />
        <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtFProjectFormDate"
            runat="server" readonly="readonly" compare="1" />
    </span></span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvProjStatistics" AutoGenerateColumns="false" AllowFrozing="true" FrozenColNum="4" FrozenHeight="430px"
        ShowExport="true" HideFieldOnExport="全部" runat="server" BindGridViewMethod="BindDataGrid"
        ShowPageSizeChange="true" OnRowDataBound="gvProjStatistics_RowDataBound" UseDefaultDataSource="false"
        FooterStyle-ForeColor="Red" ShowFooter="true" PageSize="10">
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
            <zhongsoft:LightBoundField HeaderText="设计阶段" DataField="PhaseName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目设总" DataField="ManagerUserName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="任务数" DataField="RollCOUNT" ItemStyle-HorizontalAlign="Right">
                <FooterStyle HorizontalAlign="Right" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="新制图" DataField="NewNatureMapSumCount" ItemStyle-HorizontalAlign="Right">
                <FooterStyle HorizontalAlign="Right" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="活用" DataField="ActiveNatureMapSumCount" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:F0}">
                <FooterStyle HorizontalAlign="Right" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="图纸总张数" DataField="MapALLSumCount" ItemStyle-HorizontalAlign="Right">
                <FooterStyle HorizontalAlign="Right" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="新制标准张" DataField="NewStandardMapSumCount" ItemStyle-HorizontalAlign="Right">
                <FooterStyle HorizontalAlign="Right" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="说明书" DataField="ExplainSumCount" ItemStyle-HorizontalAlign="Right">
                <FooterStyle HorizontalAlign="Right" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="设备材料清册" DataField="LiquidationSumCount" ItemStyle-HorizontalAlign="Right">
                <FooterStyle HorizontalAlign="Right" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="估（概、预）算书" DataField="BudgetSumCount" ItemStyle-HorizontalAlign="Right">
                <FooterStyle HorizontalAlign="Right" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="设备标书" DataField="equipTenderBookPagesCount" ItemStyle-HorizontalAlign="Right">
                <FooterStyle HorizontalAlign="Right" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="专题报告" DataField="TopicReportPagesCount" ItemStyle-HorizontalAlign="Right">
                <FooterStyle HorizontalAlign="Right" />
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">

        function initCustomerPlugin() {
            setConditionHide();
        }

        // 隐藏筛选条件
        function setConditionHide() {
            $('[flag="conditionHide"]').hide();
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
