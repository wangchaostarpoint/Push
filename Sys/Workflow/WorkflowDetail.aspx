<%@ Page Title="流程详细" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" CodeBehind="WorkflowDetail.aspx.cs" Inherits="Zhongsoft.Portal.Sys.Workflow.WorkflowDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="pdgWorkflowDetail" runat="server" Width="100%"
        AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True"
        OnRowDataBound="pdgWorkflowDetail_RowDataBound">
        <Columns>
            <asp:BoundField DataField="FormName" FooterStyle-Font-Bold="true" HeaderText="流程名称"></asp:BoundField>
            <asp:BoundField DataField="Num" HeaderText="发起数量" FooterStyle-Font-Bold="true"></asp:BoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
