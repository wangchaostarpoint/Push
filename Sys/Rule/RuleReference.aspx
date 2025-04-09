<%@ Page Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true"
    CodeBehind="RuleReference.aspx.cs" Inherits="Zhongsoft.Portal.Sys.Rule.RuleReference" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <asp:Label runat="server" ID="lblType"></asp:Label><br />
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="False"
        AllowPaging="True">
        <Columns>
            <asp:BoundField DataField="ObjectType" HeaderText="应用场景" HeaderStyle-Width="20%" />
            <asp:BoundField DataField="ObjectName" HeaderText="主对象" HeaderStyle-Width="40%" />
            <asp:BoundField DataField="DetailName" HeaderText="子对象" HeaderStyle-Width="40%" />
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
