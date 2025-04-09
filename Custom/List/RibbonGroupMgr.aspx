<%@ Page Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true"
    CodeBehind="RibbonGroupMgr.aspx.cs" Inherits="Zhongsoft.Portal.Custom.List.RibbonGroupMgr" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                标签
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbLabel"></asp:TextBox>
            </td>
        </tr>
    </table>
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
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" DataKeyNames="GroupId" AutoGenerateColumns="False"
        BindGridViewMethod="BindListGrid" AllowPaging="True">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全部" OnClientClick="checkList">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightBoundField DataField="Label" HeaderText="标签" HeaderStyle-Width="300px"
                ItemStyle-Width="300px" EditItemClick="editList" DataParamFields="GroupId">
            </zhongsoft:LightBoundField>
            <asp:BoundField DataField="Icon" HeaderText="图标" HeaderStyle-Width="300px" ItemStyle-Width="300px" />
            <asp:BoundField DataField="Sort" HeaderText="排序" HeaderStyle-Width="300px" ItemStyle-Width="300px" />
            <asp:BoundField DataField="CreateUserName" HeaderText="创建人" HeaderStyle-Width="200px"
                ItemStyle-Width="200px" />
            <asp:BoundField DataField="CreateDate" HeaderText="创建时间" DataFormatString="{0:yyyy-MM-dd}"
                HeaderStyle-Width="200px" ItemStyle-Width="200px" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script>




        function checkList(array) {
            //向顶部工具条传入参数
            var json = { "ParentId": "<%=ParentId %>" };
            transParamToToolBar(array, json);
        }

        function transGridParam() {
            //获取列表选中行Id集合  
            var array = buildGirdRowIds("<%=gvList.CheckedClientID %>");
            checkList(array);
        }


        function editList(bizId) {

            var url = buildBizUrl(3, bizId, "/Custom/List/RibbonGroupEditor.aspx", null);
            if (checkReturn(showModal(url, "", 1080, 600))) {
                if (typeof (rebindGridData) == "function") {
                    rebindGridData();
                }
            }
        }</script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
