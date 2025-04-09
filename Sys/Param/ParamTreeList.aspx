<%@ Page Title="联动参数列表 " Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" CodeBehind="ParamTreeList.aspx.cs" Inherits="Zhongsoft.Portal.Sys.Param.ParamTreeList" %>

<%@ Register Assembly="Zhongsoft.Portal.UI.Controls" Namespace="Zhongsoft.Portal.UI.Controls" TagPrefix="zhongsoft" %>

<asp:Content ID="Content4" ContentPlaceHolderID="treeView" runat="server">
    <asp:TreeView ID="treeView" runat="server" Height="100%" Width="100%" ShowLines="true" OnSelectedNodeChanged="treeView_Change">
        <SelectedNodeStyle BackColor="#F7F7F7" />
    </asp:TreeView>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">参数名称</span> <span>
        <asp:TextBox ID="tbParamName" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></asp:TextBox></span>
    </span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <div class="subtoolbarbg">
        <asp:LinkButton runat="server" ID="lbtnAddUser" EnableTheming="false" CssClass="subtoolbarlink" OnClick="btnAddUser_Click" AccessLevel="2"
            OnClientClick="return paramEditor('2')"> <span> <img  src="../../Themes/Images/btn_add.gif" width="16" height="16"/>添加参数</span></asp:LinkButton>
    </div>
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" DataKeyNames="ParamLevelId" AutoGenerateColumns="False"
        AllowPaging="True" BindGridViewMethod="BindListGrid" OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand">
        <Columns>
            <asp:TemplateField HeaderText="编辑">
                <ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                <ItemTemplate>
                    <asp:LinkButton ID="lbEdit" runat="server" CommandName="editdata" EnableTheming="false">
						        <img alt=""  onclick='return editParam("<%#Eval("ParamLevelId")%>",3);'  src="../../Themes/Images/btn_dg_edit.gif" />
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Name" HeaderText="参数名称" HeaderStyle-Width="18%" />
            <asp:BoundField DataField="Code" HeaderText="编号" HeaderStyle-Width="10%" />
            <asp:BoundField DataField="Sort" HeaderText="顺序号" HeaderStyle-Width="10%" />
            <asp:BoundField DataField="Memo" HeaderText="备注" HeaderStyle-Width="38%" />
            <asp:BoundField DataField="CreateDate" HeaderText="创建时间" HeaderStyle-Width="10%" DataFormatString="{0:yyyy-MM-dd}" />
            <asp:TemplateField HeaderText="删除">
                <ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                <ItemTemplate>
                    <asp:LinkButton ID="lbDelete" runat="server" CommandName="deletedata" OnClientClick="return window.confirm('删除后数据将无法恢复，您确定删除数据吗？')" CommandArgument='<%#Eval("ParamLevelId")%>' EnableTheming="false">
						        <img alt=""   src="../../Themes/Images/btn_dg_delete.gif" />
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <asp:Button ID="btnLoad" runat="server"  OnClick="btnLoad_Click" Visible="false" /> 
    <script type="text/javascript">  
        function editParam(menuId) {
            var url = buildBizUrl(3, menuId, "Sys/Param/ParamTreeEditor.aspx", null);
            showDivDialog(url, null, 600, 430, callBack);
            return false;
        }
        function addParam(parentId) {  
            var url = buildBizUrl(2, null, "Sys/Param/ParamTreeEditor.aspx", { ParentId: parentId });
            showDivDialog(url, null, 600, 430, callBack);
            return false;
        }  
       function callBack(){  
           <%=Page.ClientScript.GetPostBackEventReference(this.btnLoad,"") %>;
       }
   </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>

