<%@ Page Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true"
    CodeBehind="RuleList.aspx.cs" Inherits="Zhongsoft.Portal.Sys.Rule.RuleList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">编号/名称</span> <span>
        <asp:TextBox ID="tbTableInfo" runat="server" EnableViewState="true" CssClass="kpms-textboxsearch"
            EnableTheming="false"></asp:TextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">类&nbsp;型</span> <span>
        <asp:DropDownList runat="server" ID="ddlRuleype" class="kpms-ddlsearch"
            EnableTheming="false">
                </asp:DropDownList>
    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="treeView" runat="server">
<div>
    <asp:TreeView ID="treeModule" runat="server" Height="100%" Width="100%" ShowLines="true"
        OnSelectedNodeChanged="treeModule_Change">
        <SelectedNodeStyle BackColor="#F7F7F7" />
    </asp:TreeView>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" DataKeyNames="RuleId" AutoGenerateColumns="False"
        BindGridViewMethod="BindGrid" AllowPaging="True" OnRowCommand="gvList_RowCommand"
        OnRowDataBound="gvList_RowDataBound">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <asp:BoundField DataField="RuleName" HeaderText="规则名称" HeaderStyle-Width="30%" />
            <asp:BoundField DataField="RuleCode" HeaderText="规则编号" HeaderStyle-Width="30%" />
            <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="类型" HeaderStyle-Width="30%">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lblRuleype"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightButtonField CommandName="EditData" EditPageUrl="RuleEditor.aspx"
                Visible="false" HeaderStyle-Width="5%" HeaderText="编辑" EditIdField="RuleId" EditPageWidth="800"
                EditPageHeight="500">
            </zhongsoft:LightButtonField>
            <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" HeaderStyle-Width="5%"
                Visible="false">
            </zhongsoft:LightButtonField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script>
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";
    
    
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
