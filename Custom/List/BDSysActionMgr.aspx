<%@ Page Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true"
    CodeBehind="BDSysActionMgr.aspx.cs" Inherits="Zhongsoft.Portal.Custom.List.BDSysActionMgr" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
   <span class="filter-block"><span class="filter-block-lb">标&nbsp;签</span><span>
        <asp:TextBox ID="tbLabel" runat="server" EnableViewState="true" MaxLength="60" CssClass="kpms-textboxsearch" EnableTheming="false"></asp:TextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="treeView" runat="server">
    <asp:TreeView ID="treeGroup" runat="server" Height="100%" Width="100%" ShowLines="true"
        OnSelectedNodeChanged="treeGroup_Change">
        <SelectedNodeStyle BackColor="#F7F7F7" />
    </asp:TreeView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView runat="server" ID="gvAction" DataKeyNames="DictActionId"
        OnRowDataBound="gvAction_RowDataBound">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="gvListCheck">
            </zhongsoft:LightCheckField>
            <asp:BoundField HeaderText="标签" DataField="Label" />
            <asp:BoundField HeaderText="命令" DataField="Command" />
            <asp:BoundField HeaderText="图标" DataField="Icon" />
            <asp:TemplateField HeaderText="类型">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lblType"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="排序" DataField="Sort" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script>


        //获取列表选中值及其他参数
        function gvListCheck(array) {
            var otherParam = { "IsSys": "1" };
            transParamToToolBar(array, otherParam);
        }

        function transGridParam() {
            //获取列表选中行Id集合  
            var array = buildGirdRowIds("<%=gvAction.CheckedClientID %>");
            //
            gvListCheck(array);
        }

    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
