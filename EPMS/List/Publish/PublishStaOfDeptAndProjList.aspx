<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PublishStaOfDeptAndProjList.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Publish.PublishStaOfDeptAndProjList" Title="出版工作统计表" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">查询年月</span> <span>
        <zhongsoft:LightDropDownList ID="ddlYear" runat="server" Width="150px">
        </zhongsoft:LightDropDownList>年
         <zhongsoft:LightDropDownList ID="ddlMonth" runat="server" Width="150px">
         </zhongsoft:LightDropDownList>月
    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView runat="server" ID="gvDept" ShowExport="True" DataKeyNames="OrganizationID"
        AllowPaging="True" PageSize="10" BindGridViewMethod="BindDept" FooterStyle-HorizontalAlign="Center" OnRowCreated="gvDept_RowCreated"
        UseDefaultDataSource="True" OnBeforeExporting="gvDept_BeforeExporting" ShowFooter="true" OnRowDataBound="gvDept_RowDataBound">
        <Columns>
            <zhongsoft:LightBoundField HeaderText="工程代号及名称" DataField="ProjectName" />
            <zhongsoft:LightBoundField HeaderText="工作量" DataField="WorkLoad" />
            <zhongsoft:LightBoundField HeaderText="合计" DataField="TotalCost" ItemStyle-HorizontalAlign="Right" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <zhongsoft:LightPowerGridView runat="server" ID="gvProject" ShowExport="True" DataKeyNames="OrganizationID"
        AllowPaging="True" PageSize="10" BindGridViewMethod="BindProject" OnRowCreated="gvProject_RowCreated" FooterStyle-HorizontalAlign="Center"
        UseDefaultDataSource="True" OnBeforeExporting="gvProject_BeforeExporting" ShowFooter="true" OnRowDataBound="gvProject_RowDataBound">
        <Columns>
            <zhongsoft:LightBoundField HeaderText="工程代号及名称" DataField="ProjectName" />
            <zhongsoft:LightBoundField HeaderText="工作量" DataField="WorkLoad" />
            <zhongsoft:LightBoundField HeaderText="合计" DataField="TotalCost" ItemStyle-HorizontalAlign="Right" />
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
