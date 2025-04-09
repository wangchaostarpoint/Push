<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LeadingGroupMemberList.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.List.MBM.LeadingGroupMemberList" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                姓名/工号
                <zhongsoft:LightTextBox ID="tbMember" runat="server" Width="70px" MaxLength="20"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
    <zhongsoft:LightObjectSelector runat="server" ID="lbsSelect" IsMutiple="true" EnableTheming="false"
        Text="添加人员" OnlyShowButton="true" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"
        ShowJsonRowColName="true" ResultAttr="name" OnClick="lbsSelect_Click" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false"
        ShowFooter="true" ShowExport="true" AllowPaging="true" PageSize="12" UseDefaultDataSource="true"
        DataKeyNames="GROUPID" OnRowCommand="gvList_RowCommand">
        <Columns>
            <zhongsoft:LightBoundField HeaderText="姓名" DataField="MEMBERNAME" HeaderStyle-Width="12%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="工号" DataField="MEMBERCODE" HeaderStyle-Width="12%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="部门名称" DataField="DEPTNAME" HeaderStyle-Width="12%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="是否为组长" DataField="ISLEADER" HeaderStyle-Width="40px"
                ItemStyle-HorizontalAlign="Center">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="备注" DataField="MEMO" HeaderStyle-Width="50%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightButtonField HeaderText="查看" EditItemClick="show" DataParamFields="GROUPID"
                ImageUrl="../../../Themes/Images/btn_dg_view.gif" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="40px">
            </zhongsoft:LightButtonField>
            <zhongsoft:LightButtonField HeaderText="编辑" EditItemClick="edit" DataParamFields="GROUPID"
                ImageUrl="../../../Themes/Images/btn_dg_edit.gif" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="40px">
            </zhongsoft:LightButtonField>
            <asp:TemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="40px">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtnDelete" EnableTheming="false" CommandName="DeleteData"
                        OnClientClick='return confirm("确定要删除吗？");' CommandArgument='<%#Eval("GROUPID") %>'>
                                <img alt="删除" title="删除" src="../../../Themes/Images/btn_dg_delete.gif"                                     />
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        //查看详细信息
        function show(id) {
            var url = buildBizUrl(1, id, "MM/List/MBM/LeadingGroupMemberEditor.aspx", null);
            return checkReturn(showModal(url, null, 500, 500));
        }

        //编辑信息
        function edit(id) {
            var url = buildBizUrl(3, id, "MM/List/MBM/LeadingGroupMemberEditor.aspx", null);
            return checkReturn(showModal(url, null, 500, 500));
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
