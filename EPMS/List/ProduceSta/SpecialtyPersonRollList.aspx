<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SpecialtyPersonRollList.aspx.cs" Title="按卷册工作量统计"
    Inherits="Zhongsoft.Portal.EPMS.List.ProduceSta.SpecialtyPersonRollList" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="toolBar" runat="server">
<span class="filter-block"><span class="filter-block-lb">日期范围</span> <span>
        <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtSProjectFormDate" runat="server"
            readonly="readonly" compare="1"/>
        <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtFProjectFormDate"
            runat="server" readonly="readonly" compare="1" />
    </span></span>
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
            <zhongsoft:LightBoundField HeaderText="姓名" DataField="WorkerName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="卷册编号" DataField="WBSCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="卷册名称" DataField="WBSName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="岗位" DataField="WorkStation">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="定额工日" DataField="CompleteWorke" ItemStyle-HorizontalAlign="Right">
                <FooterStyle HorizontalAlign="Right" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="计划完成时间" DataField="PlanEndDate" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="实际完成时间" DataField="FactEndDate" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>