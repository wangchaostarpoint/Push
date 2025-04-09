<%@ Page Title="人员权限设置" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master"
    AutoEventWireup="true" CodeBehind="UserAclMgr.aspx.cs" Inherits="Zhongsoft.Portal.Sys.Acl.UserAclMgr" %>

<%@ Import Namespace="Zhongsoft.Organization.Standard" %>
<%@ Import Namespace="Zhongsoft.Framework" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <table width="100%" cellspacing="3" style="height: 100%">
                <tr>
                    <td class="tz-title">
                        页面权限
                    </td>
                </tr>
                <tr>
                    <td class="tz-toolbar">
                        <table>
                            <tr>
                                <td>
                                    【<asp:Label ID="lbMenu" runat="server"></asp:Label>】页面权限&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </td>
                                <td>
                                    访问级别:
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlUserAccess" runat="server" Width="150px">
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    &nbsp&nbsp<asp:LinkButton ID="btnSelMenu" runat="server" OnClick="btnSelMenu_Click"
                                        CssClass="searchbtn" EnableTheming="false" OnClientClick="return selMenu();">
                                <span>新增页面</span>
                                    </asp:LinkButton>
                                    <input type="hidden" id="hiMenu" runat="server" />
                                    <asp:LinkButton ID="btnSaveMenu" runat="server" OnClick="btnSaveMenu_Click" EnableTheming="false"
                                        CssClass="searchbtn">
                                <span>保存</span>
                                    </asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <zhongsoft:LightPowerGridView ID="gvMenu" runat="server" AutoGenerateColumns="false"
                            UseDefaultDataSource="true" AllowPaging="true" PageSize="10" AllowSorting="true"
                            OnRowDataBound="gvMenu_RowDataBound" OnRowCommand="gvMenu_RowCommand" OnRowDeleting="gvMenu_RowDeleting"
                            BindGridViewMethod="BindMenu" DataKeyNames="RuleId">
                            <Columns>
                                <asp:TemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                                    <ItemTemplate>
                                        <%#Container.DisplayIndex+1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="PageName" HeaderText="台帐名称" SortExpression="PageName">
                                </asp:BoundField>
                                <asp:BoundField DataField="PageUrl" HeaderText="台帐路径" SortExpression="PageUrl"></asp:BoundField>
                                <asp:BoundField DataField="ParentPageName" HeaderText="父级台帐" SortExpression="ParentPageName">
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="权限" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:DropDownList runat="server" ID="ddlAuthority" Width="100px">
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="保存" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnSave" runat="server" CommandName="Save" EnableTheming="false"
                                            CommandArgument="<%#Container.DisplayIndex %>">
                                      <img alt=""  src="../../Themes/Images/btn_save.gif"  border='0' />
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnDelete" EnableTheming="false" runat="server" CommandName="Delete">
                                      <img alt="" src="../../Themes/Images/btn_dg_delete.gif" onclick="if(!confirm('确认要删除吗？')) return false;" border='0' />
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </zhongsoft:LightPowerGridView>
                    </td>
                </tr>
            </table>
            <table width="100%" cellspacing="3" style="height: 100%">
                <tr>
                    <td class="tz-title">
                        角色管理
                    </td>
                </tr>
                <tr>
                    <td class="tz-toolbar">
                        <table>
                            <tr>
                                <td>
                                    【<asp:Label ID="lbRole" runat="server"></asp:Label>】所属角色&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </td>
                                <td>
                                    角色部门:
                                </td>
                                <td>
                                    <input type="hidden" runat="server" id="hiUnitId" />
                                    <zhongsoft:LightObjectSelector runat="server" ID="lbsOrgs" deptreq="1" PageUrl="/Portal/Sys/OrgUsers/OrgSelector.aspx"
                                        Width="150px" ResultAttr="name" ResultForControls="{'hiUnitId':'id'}" />
                                </td>
                                <td>
                                    &nbsp&nbsp
                                    <asp:LinkButton ID="btnSelRole" OnClientClick="return selRole();" OnClick="btnSelRole_Click"
                                        EnableTheming="false" runat="server" CssClass="searchbtn">
                                <span>新增角色</span>
                                    </asp:LinkButton>
                                    <input type="hidden" id="hiRole" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <zhongsoft:LightPowerGridView ID="gvRole" runat="server" AutoGenerateColumns="false"
                            UseDefaultDataSource="true" AllowPaging="true" PageSize="10" AllowSorting="true"
                            BindGridViewMethod="BindRole" OnRowDeleting="gvRole_RowDeleting" DataKeyNames="OrganizationUsersInRolesID">
                            <Columns>
                                <asp:TemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                                    <ItemTemplate>
                                        <%#Container.DisplayIndex+1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <zhongsoft:LightBoundField HeaderText="角色名称" DataField="RoleName" SortExpression="RoleName"
                                    ItemStyle-Width="100px">
                                </zhongsoft:LightBoundField>
                                <asp:TemplateField HeaderText="角色类型" ItemStyle-Width="100px">
                                    <ItemTemplate>
                                        <%# ObjectEnum.GetDisplayName(typeof(RoleScope), Int16.Parse(Eval("RoleScope").ToString()))%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <zhongsoft:LightBoundField HeaderText="所属部门" DataField="UnitName" SortExpression="UnitName"
                                    ItemStyle-Width="100px">
                                </zhongsoft:LightBoundField>
                                <asp:TemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40px">
                                    <ItemTemplate>
                                        <asp:ImageButton OnClientClick="return window.confirm('您确定删除吗？')" runat="server"
                                            EnableTheming="false" ID="btnDelete" CommandName="Delete" ImageUrl="../../Themes/Images/btn_dg_delete.gif" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </zhongsoft:LightPowerGridView>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script>
        function selRole() {
            var orgId = $("#<%=hiUnitId.ClientID %>").val();
            if (orgId == "") {
                alert("请选择角色部门！");
                return false;
            }
            var param = new InputParamObject("m");
            var re = getRoles("<%=hiRole.ClientID %>", param, "0,1,3,4|" + orgId);
            if (re != null) {
                return true;
            }
            return false;
        }
        function selMenu() {
            var access = $("#<%=ddlUserAccess.ClientID %>").val();
            if (access == "") {
                alert("请先选择访问级别");
                return false;
            }
            var param = new InputParamObject("m");
            var re = getPage("<%=hiMenu.ClientID %>", param, null);
            if (re != null) {
                return true;
            }
        }
    
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
