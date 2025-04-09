<%@ Page Title="角色权限设置" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master"
    AutoEventWireup="true" CodeBehind="RoleAclMgr.aspx.cs" Inherits="Zhongsoft.Portal.Sys.Acl.RoleAclMgr" %>

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
            <table class="tz-table">
                <tr>
                    <td class="tz-title">
                        页面权限
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="tz-toolbar">
                            【<asp:Label ID="lbRole" runat="server"></asp:Label>】页面权限 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            访问级别:<asp:DropDownList ID="ddlRoleAccess" runat="server" Width="150px">
                            </asp:DropDownList>
                            &nbsp;&nbsp;<asp:LinkButton ID="btnSelMenu" runat="server" EnableTheming="false"
                                OnClick="btnSelMenu_Click" CssClass="searchbtn" OnClientClick="return selMenu();">
                        <span>新增页面</span>
                            </asp:LinkButton>
                            <input type="hidden" id="hiMenu" runat="server" />
                            <asp:LinkButton ID="btnSaveMenu" runat="server" OnClick="btnSaveMenu_Click" EnableTheming="false"
                                CssClass="searchbtn">
                        <span>保存</span>
                            </asp:LinkButton>
                        </div>
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
                                <asp:BoundField DataField="PageName" HeaderText="页面名称" SortExpression="PageName">
                                </asp:BoundField>
                                <asp:BoundField DataField="PageUrl" HeaderText="页面路径" SortExpression="PageUrl"></asp:BoundField>
                                <asp:BoundField DataField="ParentPageName" HeaderText="父级页面" SortExpression="ParentPageName">
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
                                      <img alt="" src="../../Themes/Images/btn_save.gif" border='0' />
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnDelete" runat="server" EnableTheming="false" CommandName="Delete">
                                      <img alt="" src="/portal/Themes/Images/btn_dg_delete.gif" onclick="if(!confirm('确认要删除吗？')) return false;" border='0' />
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </zhongsoft:LightPowerGridView>
                    </td>
                </tr>
                <tr>
                    <td class="tz-title">
                        角色人员
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="tz-toolbar">
                            <table>
                                <tr>
                                    <td>
                                        【<asp:Label ID="lbRole2" runat="server"></asp:Label>】角色人员 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
                                        &nbsp;&nbsp;<asp:LinkButton ID="btnSelUser" runat="server" OnClick="btnSelUser_Click"
                                            CssClass="searchbtn" EnableTheming="false" OnClientClick="return selUser();">
                                    <span>新增人员</span>
                                        </asp:LinkButton>
                                        <input type="hidden" id="hiUser" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <zhongsoft:LightPowerGridView ID="pdgRoleUser" runat="server" AutoGenerateColumns="False"
                            AllowPaging="true" PageSize="10" UseDefaultDataSource="true" DataKeyNames="OrganizationUsersInRolesID"
                            OnRowCommand="pdgRoleUser_ItemCommand">
                            <Columns>
                                <asp:TemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                                    <ItemTemplate>
                                        <%#Container.DisplayIndex+1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="UserName" HeaderText="用户名" ItemStyle-HorizontalAlign="Left"
                                    HeaderStyle-Width="100px" />
                                <asp:BoundField DataField="OrganizationName" HeaderText="所属部门" HeaderStyle-Width="200px"
                                    ItemStyle-HorizontalAlign="Left" />
                                <asp:BoundField DataField="MobilePhone" HeaderText="手机号码" HeaderStyle-Width="200px"
                                    ItemStyle-HorizontalAlign="Right" />
                                <asp:BoundField DataField="Email" HeaderText="电子邮件" ItemStyle-HorizontalAlign="Left" />
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="删除" ItemStyle-Width="50px">
                                    <ItemTemplate>
                                        <asp:ImageButton CommandName="DeleteData" CommandArgument="<%#Container.DisplayIndex %>"
                                            OnClientClick="return window.confirm('您确定删除吗?')" ImageUrl="/Portal/Themes/Images/btn_dg_delete.gif"
                                            ID="IbtnButton" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </zhongsoft:LightPowerGridView>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script type="text/javascript">
        function selMenu() {
            var access = $("#<%=ddlRoleAccess.ClientID %>").val();
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
        function selUser() {
            var id = $("#<%=hiUnitId.ClientID %>").val();
            if (id == "") {
                alert("请选择角色部门！");
                return false;
            }
            var param = new InputParamObject("m");
            var re = getUsers("<%=hiUser.ClientID %>", param, "|" + id + "||||||||");
            if (re != null) {
                return true;
            }
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
