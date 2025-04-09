<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectList.Master" CodeBehind="ParamListSingleModule.aspx.cs" Inherits="Zhongsoft.Portal.Sys.Param.ParamListSingleModule" %>

<asp:Content ID="Content4" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
     <span class="filter-block">
        <span class="filter-block-lb">参数名称</span>
        <span>
            <zhongsoft:LightTextBox ID="tbParamName" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="toolBtn" runat="server">
     <asp:LinkButton runat="server" ID="btnNewSave" CssClass="subtoolbarlink" AccessLevel="2" OnClientClick="return viewEditor(2);" EnableTheming="false">
         <span> <img  title="新建" src="<%=WebAppPath %>/Themes/Images/btn_new.gif" width="15" height="15" />新建</span>
    </asp:LinkButton>
    <asp:LinkButton runat="server" ID="btnEdit" CssClass="subtoolbarlink" AccessLevel="3" EnableTheming="false" OnClientClick="return viewEditor(3);">
          <span> <img  title="编辑" src="<%=WebAppPath %>/Themes/Images/btn_editor.gif" width="15" height="15" />编辑</span>
    </asp:LinkButton>
    <asp:LinkButton runat="server" ID="btnView" CssClass="subtoolbarlink" AccessLevel="1" EnableTheming="false" OnClientClick="return viewEditor(1);">
           <span> <img  title="查看" src="<%=WebAppPath %>/Themes/Images/btn_chakan.gif" width="15" height="15" />查看</span>
    </asp:LinkButton>
    <asp:LinkButton runat="server" ID="btnDelete" AccessLevel="4" CssClass="subtoolbarlink" EnableTheming="false" OnClick="btnDelete_Click" OnClientClick=" return deleteData();">
            <span> <img  title="删除" src="<%=WebAppPath %>/Themes/Images/btn_delete.gif" width="15" height="15" />删除</span>
    </asp:LinkButton>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" DataKeyNames="ParamId" AutoGenerateColumns="False"
        AllowPaging="false" BindGridViewMethod="BindListGrid">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
             <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <asp:BoundField DataField="ParamName" HeaderText="参数名称" />
            <asp:BoundField DataField="ParamScope" HeaderText="参数分类" HeaderStyle-Width="100px" />
            <asp:BoundField DataField="ModuleName" HeaderText="所属模块" HeaderStyle-Width="200px" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">

        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";

    </script>
    <script type="text/javascript">
        function viewEditor(actiontype) {
            var array = buildGirdRowIds($gridCheckedClientID);           
            if (array.length == 0 && actiontype != 2) { alert("请先选择一条记录！"); return; }
            var Id = array[0]; 
            var url = buildQueryUrl("<%=WebAppPath %>/Sys/Param/ParamEditorSingleModule.aspx", { actiontype: actiontype, ModuleId: "<%=ModuleId %>", bizId: Id });
            showDivDialog(encodeURI(url), null, 600, 800, null);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
