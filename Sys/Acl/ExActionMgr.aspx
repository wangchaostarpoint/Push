<%@ Page Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true"
    CodeBehind="ExActionMgr.aspx.cs" Inherits="Zhongsoft.Portal.Sys.Acl.ExActionMgr" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    名称<asp:TextBox runat="server" ID="tbName" Width="100px"></asp:TextBox>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" DataKeyNames="ActionId"
        AutoGenerateColumns="False" AllowPaging="True">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkList">
            </zhongsoft:LightCheckField>
            <asp:BoundField DataField="ActionName" HeaderText="名称" HeaderStyle-Width="60%" />
            <asp:BoundField DataField="Sort" HeaderText="序号" HeaderStyle-Width="30%" ItemStyle-HorizontalAlign="Center" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script>

        function checkList(array) {
            //向顶部工具条传入参数
            var json = { "ModuleId": "<%=ModuleId %>", "ModuleName": "<%=ModuleName %>" };
            transParamToToolBar(array, json);
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
