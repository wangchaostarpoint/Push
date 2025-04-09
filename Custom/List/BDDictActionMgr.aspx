<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectList.Master"
    Title="业务实体功能管理" CodeBehind="BDDictActionMgr.aspx.cs" Inherits="Zhongsoft.Portal.Custom.List.BDDictActionMgr" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
     <span class="filter-block"><span class="filter-block-lb">标&nbsp;签</span><span>
        <asp:TextBox ID="tbLabel" runat="server" EnableViewState="true" MaxLength="60" CssClass="kpms-textboxsearch" EnableTheming="false"></asp:TextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="treeView" runat="server">
    <asp:TreeView ID="treeGroup" runat="server" Height="100%" Width="100%" ShowLines="true"
        OnSelectedNodeChanged="treeGroup_Change">
        <SelectedNodeStyle BackColor="#F7F7F7" />
    </asp:TreeView>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView runat="server" ID="gvAction" DataKeyNames="DictActionId" AllowPaging="true"
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
            //获取数据字典参数
            var dictId = "<%=BdDict.Id %>";
            //初始化数据字典Id参数，如果有其他参数可追加到otherParam中
            var otherParam = { "dictId": dictId };
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
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
