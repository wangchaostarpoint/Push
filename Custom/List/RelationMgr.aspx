<%@ Page Title="数据字典关联管理" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master"
    AutoEventWireup="true" CodeBehind="RelationMgr.aspx.cs" Inherits="Zhongsoft.Portal.Custom.List.RelationMgr" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView runat="server" ID="gvRelation" DataKeyNames="RelationId" UseDefaultDataSource="true">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="gvListCheck">
            </zhongsoft:LightCheckField>
            <asp:BoundField HeaderText="名称" DataField="Name" />
            <asp:BoundField HeaderText="排序" DataField="Sort" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script>
        //获取列表选中值及其他参数
        function gvListCheck(array) {
            //获取数据字典参数
            var dictId = "<%=DictId %>";
            //初始化数据字典Id参数，如果有其他参数可追加到otherParam中
            var otherParam = { "DictId": dictId };
            transParamToToolBar(array, otherParam);
        }

        function transGridParam() {
            //获取列表选中行Id集合  
            var array = buildGirdRowIds("<%=gvRelation.CheckedClientID %>");
            gvListCheck(array);
        }
   
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
