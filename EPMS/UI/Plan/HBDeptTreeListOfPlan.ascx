<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HBDeptTreeListOfPlan.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Plan.HBDeptTreeListOfPlan" %>
<asp:TreeView ID="tvWBSTree" runat="server" ShowLines="True" Height="100%" OnSelectedNodeChanged="tvWBSTree_SelectedNodeChanged">
    <SelectedNodeStyle BackColor="#F7F7F7" />
</asp:TreeView>
<input type="hidden" runat="server" id="hiOrganizationID" />