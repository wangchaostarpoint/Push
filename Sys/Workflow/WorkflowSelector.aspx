<%@ Page Title="选择关联流程" Language="C#" MasterPageFile="~/UI/Master/ObjectSelector.Master"
    AutoEventWireup="true" CodeBehind="WorkflowSelector.aspx.cs" Inherits="Zhongsoft.Portal.Sys.Workflow.WorkflowSelector" %>

<%@ Register Assembly="Zhongsoft.Portal.UI.Controls" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    流程名称
    <asp:TextBox ID="tbProcessInstanceName" runat="server" Width="100px"></asp:TextBox>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="WorkflowList" runat="server" AutoGenerateColumns="false"
        UseDefaultDataSource="true" BindJsonClick="true" OnJsonClick="addObject" AllowPaging="true"
        PageSize="12" OnRowCommand="WorkflowList_RowCommand" JsonClickMode="onclick">
        <Columns>
            <asp:BoundField DataField="ProcessInstanceName" HeaderText="名称" />
            <asp:BoundField DataField="CreatorName" HeaderText="创建人" />
            <asp:BoundField DataField="CreatorOrganizationName" HeaderText="创建部门" />
            <asp:BoundField DataField="StartDateTime" HeaderText="开始时间" />
            <asp:BoundField DataField="FinishDateTime" HeaderText="完成时间" />
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
