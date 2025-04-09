<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WorkTypeTree.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Publish.WorkTypeTree" %>
<asp:TreeView ID="treeWorkType" runat="server" OnSelectedNodeChanged="treeWorkType_SelectedNodeChanged"
    Height="100%" ShowLines="True">
    <SelectedNodeStyle BackColor="#F7F7F7" />
</asp:TreeView>
