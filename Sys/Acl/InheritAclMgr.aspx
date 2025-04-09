<%@ Page Title="查看权限继承对象" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master"
    AutoEventWireup="true" CodeBehind="InheritAclMgr.aspx.cs" Inherits="Zhongsoft.Portal.Sys.InheritAclMgr" %>

<%@ Import Namespace="Zhongsoft.Portal.ACL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <table class="tz-table">
        <tr>
            <td class="tz-title" colspan="2">
                组织单元权限
            </td>
        </tr>
        <tr>
            <td class="td-l">
                组织单元名称
            </td>
            <td>
                <zhongsoft:LightTextBox runat="server" ID="tbOrgUnit" ReadOnly="true"></zhongsoft:LightTextBox>
                <asp:ImageButton runat="server" ID="ibtnShowUnitAcl" ImageUrl="~/Themes/Images/btn_dg_detail.gif"
                    OnClientClick="showUnitAcl();return false;" />
                <input type="hidden" runat="server" id="hiOrgUnit" />
            </td>
        </tr>
    </table>
    <table class="tz-table">
        <tr>
            <td class="tz-title">
               角色权限
            </td>
        </tr>
        <tr>
            <td valign="top">
                <zhongsoft:LightPowerGridView ID="gvRole" runat="server" AllowPaging="true" BindGridViewMethod="BindRole"
                    PageSize="8" AutoGenerateColumns="false" UseDefaultDataSource="true">
                    <Columns>
                        <asp:BoundField DataField="RoleName" HeaderText="角色名称" ItemStyle-Width="170px" ItemStyle-HorizontalAlign="Left" />
                        <asp:BoundField DataField="OrganizationName" HeaderText="部门名称" ItemStyle-Width="170px" ItemStyle-HorizontalAlign="Left" />
                        <asp:TemplateField HeaderText="查看" ItemStyle-Width="30px">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lbtnRoleAcl" ToolTip="查看" EnableTheming="false">
                           <img src="../Themes/Images/btn_dg_detail.gif" alt="查看" onclick='showRoleAcl("<%# Eval("RoleId") %>");return false;'/>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <script>
        function showUnitAcl() {
            showModal(buildQueryUrl("Sys/Acl/OperAclMgr.aspx", { OperatorType: "<%=OperatorType.Unit %>", OperatorId: $("#<%=hiOrgUnit.ClientID %>").val() }), "", 900, 500);
        }
        function showRoleAcl(roleId) {
            showModal(buildQueryUrl("Sys/Acl/OperAclMgr.aspx", { OperatorType: "<%=OperatorType.Role %>", OperatorId: roleId }), "", 900, 500);
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
