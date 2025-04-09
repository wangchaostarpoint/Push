<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DeptTreeListOfPlan.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Plan.DeptTreeListOfPlan" %>
<asp:TreeView ID="tvWBSTree" runat="server" ShowLines="True" Height="100%" OnSelectedNodeChanged="tvWBSTree_SelectedNodeChanged">
    <SelectedNodeStyle BackColor="#F7F7F7" />
</asp:TreeView>
<input type="hidden" runat="server" id="hiOrganizationID" />
