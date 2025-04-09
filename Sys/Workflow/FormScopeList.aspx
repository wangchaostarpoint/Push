<%@ Page Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" Title="表单分类管理"
    CodeBehind="FormScopeList.aspx.cs" Inherits="Zhongsoft.Portal.Sys.Workflow.FormScopeList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">标&nbsp;签</span> <span>
        <asp:TextBox runat="server" ID="tbLabel" MaxLength="60" CssClass="kpms-textboxsearch"
            EnableTheming="false"></asp:TextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="treeView" runat="server">
<div>
    <asp:TreeView ID="treeModule" runat="server" Height="100%" Width="100%" ShowLines="true"
        OnSelectedNodeChanged="treeModule_Change">
        <SelectedNodeStyle BackColor="#F7F7F7" />
    </asp:TreeView>
</div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <input runat="server" id="hiParentId" type="hidden" />
    <zhongsoft:TreeGridView ID="gvList" runat="server" DataKeyNames="ScopeId" AutoGenerateColumns="False"
        SelfIdColumn="ScopeId" ParentIdColumn="Label" UseDefaultDataSource="true" AllowPaging="True"
        BindGridViewMethod="BindGrid">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkList">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="6%">
                <ItemTemplate>
                    <%# gvList.CreateHeader(Container.DataItem)%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <asp:BoundField DataField="ScopeName" HeaderText="分类名称" />
            <asp:BoundField DataField="LabelName" HeaderText="标签" />
            <asp:BoundField DataField="Sort" HeaderText="排序" />
        </Columns>
    </zhongsoft:TreeGridView>
    <script>
        function checkList(array) {

            var parentId = $("#<%=hiParentId.ClientID %>").val();
            //向顶部工具条传入参数
            var otherParam = { "parentId": parentId };

            transParamToToolBar(array, otherParam);
        }

        function transGridParam() {
            //获取列表选中行Id集合  
            var array = buildGirdRowIds("<%=gvList.CheckedClientID %>");
            //
            checkList(array);
        }
    
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
