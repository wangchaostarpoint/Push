<%@ Page Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" Title="程序集管理"
    CodeBehind="AssemblyMgr.aspx.cs" Inherits="Zhongsoft.Portal.BDM.List.AssemblyMgr" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                程序集名称
            </td>
            <td>
                <asp:TextBox ID="tbAssemblyName" runat="server" EnableViewState="true" MaxLength="60"></asp:TextBox>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView runat="server" ID="gvAssembly" DataKeyNames="AssemblyId"
        UseDefaultDataSource="true">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <asp:BoundField HeaderText="程序集名称" DataField="AssemblyName" />
            <asp:BoundField HeaderText="说明" DataField="Memo" />
            <asp:TemplateField HeaderText="启用状态">
                <ItemTemplate>
                    <span>
                        <%# Convert.ToInt16(Eval("Flag"))==1?"启用":"禁用"%></span>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="加载状态">
                <ItemTemplate>
                    <span>
                        <%# Convert.ToBoolean(Eval("IsLoaded"))?"已加载":"未加载"%></span>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script>

        $gridCheckedClientID = "<%=gvAssembly.CheckedClientID %>";

    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
