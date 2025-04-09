<%@ Page Language="C#" MasterPageFile="~/UI/Master/ObjectSelector.Master" AutoEventWireup="true" CodeBehind="StandardValidationPlanSelector.aspx.cs" Inherits="Zhongsoft.Portal.QSM.Obsolete.StandardValidationPlanSelector" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block">
        <span class="filter-block-lb">计划名称</span>
        <span>
            <zhongsoft:LightTextBox ID="tbPlanName" runat="server" Width="100px" CssClass="kpms-textboxsearch" EnableTheming="false">
            </zhongsoft:LightTextBox>
        </span>
    </span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvList" AllowPaging="true"
        PageSize="10" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true"
       OnJsonClick="addObject" JsonClickMode="onclick">
        <Columns>
            <asp:BoundField DataField="PlanName" HeaderText="计划名称"></asp:BoundField>
            <asp:BoundField DataField="ValidationYear" HeaderText="计划评审年度（年）" ItemStyle-HorizontalAlign="Right"></asp:BoundField>
            <asp:BoundField DataField="ValidationType" HeaderText="评审类型" />
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>

