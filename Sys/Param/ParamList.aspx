<%@ Page Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true"
    CodeBehind="ParamList.aspx.cs" Inherits="Zhongsoft.Portal.Sys.ParamList" %>

<%@ Register Assembly="Zhongsoft.Portal.UI.Controls" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                参数名称
            </td>
            <td>
                <asp:TextBox ID="tbParamName" runat="server"></asp:TextBox>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="treeView" runat="server">
    <asp:TreeView ID="treeView" runat="server" Height="100%" Width="100%" ShowLines="true"
        OnSelectedNodeChanged="treeView_Change">
        <SelectedNodeStyle BackColor="#F7F7F7" />
    </asp:TreeView>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" DataKeyNames="ParamId" AutoGenerateColumns="False"
        AllowPaging="True" BindGridViewMethod="BindListGrid">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <asp:BoundField DataField="ParamName" HeaderText="参数名称" />
            <asp:BoundField DataField="ParamScope" HeaderText="参数分类" HeaderStyle-Width="100px" />
            <asp:BoundField DataField="ModuleName" HeaderText="所属模块" HeaderStyle-Width="200px" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">

        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";


  
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
