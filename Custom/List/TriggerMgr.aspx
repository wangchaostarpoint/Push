<%@ Page Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" Title="触发器管理"
    CodeBehind="TriggerMgr.aspx.cs" Inherits="Zhongsoft.Portal.Custom.List.TriggerMgr" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">触发源</span><span>
        <asp:TextBox ID="tbLabel" runat="server" EnableViewState="true" MaxLength="60" CssClass="kpms-textboxsearch" EnableTheming="false"></asp:TextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView runat="server" ID="gvTrigger" 
        DataKeyNames="TriggerFeatureId" onrowdatabound="gvTrigger_RowDataBound">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkList">
            </zhongsoft:LightCheckField>
            <asp:BoundField HeaderText="数据字典" DataField="DictName" />
            <asp:BoundField HeaderText="表单Id" />
            <asp:BoundField HeaderText="包名称" />
            <asp:BoundField HeaderText="流程Id" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script>
        function checkList(array) {
            //向顶部工具条传入参数
            var otherParam = { "sourceId": "<%=SourceId %>" };
            transParamToToolBar(array, otherParam);
        }

        function transGridParam() {
            //获取列表选中行Id集合  
            var array = buildGirdRowIds("<%=gvTrigger.CheckedClientID %>");
            //
            checkList(array);
        }



    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
