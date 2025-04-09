<%@ Page Title="插件管理" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master"
    AutoEventWireup="true" CodeBehind="PluginMgr.aspx.cs" Inherits="Zhongsoft.Portal.BDM.List.PluginMgr" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                插件名称
            </td>
            <td>
                <asp:TextBox ID="tbPluginName" runat="server" EnableViewState="true" MaxLength="60"></asp:TextBox>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView runat="server" ID="gvPlugin" DataKeyNames="PluginId" BindGridViewMethod="BindGrid"
        BDDictCode="PortalPlugin" AllowPaging="true" UseDefaultDataSource="true" OnRowDataBound="gvPlugin_RowDataBound">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightBoundField HeaderText="插件名称" DataField="PluginName" EditItemClick="editList"
                DataParamFields="PluginId">
            </zhongsoft:LightBoundField>
            <asp:BoundField HeaderText="程序集名称" DataField="AssemblyName" />
            <asp:BoundField HeaderText="类型名称" DataField="ClassName" />
            <asp:BoundField HeaderText="说明" DataField="Memo" />
            <asp:TemplateField HeaderText="全局插件">
                <ItemTemplate>
                    <span>
                        <%# Convert.ToBoolean(Eval("IsGlobal"))? "是" : "否"%></span>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="插件类型">
                <ItemTemplate>
                    <span>
                        <%# GetPluginType(Eval("PluginType").ToString())%></span>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script>

        $gridCheckedClientID = "<%=gvPlugin.CheckedClientID %>";
        function editList(bizId) {
            var url = buildBizUrl(3, bizId, "sys/Plugins/PluginEditor.aspx", null);
            showDivDialog(url, null, 700, 400, rebindGridData);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
