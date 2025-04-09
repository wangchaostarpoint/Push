<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AllAclMgr.aspx.cs" MasterPageFile="~/UI/Master/ObjectList.Master"
    Inherits="Zhongsoft.Portal.Sys.AllAclMgr" %>

<%@ Import Namespace="Zhongsoft.Organization.Standard" %>
<%@ Import Namespace="Zhongsoft.Framework" %>
<%@ Register Src="~/UI/Controls/OrgTree.ascx" TagName="OrgTree" TagPrefix="uc" %>
<asp:Content ID="Content4" ContentPlaceHolderID="treeView" runat="server">
    <div style="height: 530px !important; overflow: auto; width: 200px">
        <uc:OrgTree ID="orgTree" Flag="1" runat="server" />
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <script type="text/javascript">

        function initCustomerPlugin() {
            var $tab1 = $("#templateTabs").tabs({ activate: function (event, ui) { return checkTabs(ui); } });
            var index = $('#<%=hiOpenPage.ClientID %>').val();
            if (index != "") {
                $tab1.tabs("option", "active", index);
            }
        }

        function checkTabs(ui) {
            $('#<%=hiOpenPage.ClientID %>').val($(ui.newTab).attr("index"));
        }

        function editUserAcl(userId, userName, orgId, orgName) {
            var url = buildQueryUrl("sys/Acl/UserAclMgr.aspx", { UserId: userId, UserName: userName, OrgId: orgId, OrgName: orgName });
            showDivDialog(url, "", 900, 600, null);
            return false;
        }

        function editRoleAcl(roleId, roleName, roleScope) {
            var url = buildQueryUrl("sys/Acl/RoleAclMgr.aspx", { RoleId: roleId, RoleName: roleName, OrgId: "<%=OrgID %>", OrgName: "<%=OrgName %>", RoleScope: roleScope });
            showDivDialog(url, "", 900, 600, null);
            return false;
        }
        function editOrgAcl(orgId, orgName) {
            var url = buildQueryUrl("sys/Acl/OrgAclMgr.aspx", { OrgId: orgId, OrgName: orgName });
            showDivDialog(url, "", 900, 600, null);
            return false;
        }
 
    </script>
    <input type="hidden" runat="server" id="hiOpenPage" />
   
    <table width="100%" cellspacing="3" style="height: 100%">
        <tr>
            <td>
                <div id="templateTabs">
                    <ul>
                        <li index="0"><a href='#user' id='aUser'>人员设置</a></li>
                        <li index="1"><a href='#role' id='aRole'>角色设置</a></li>
                        <li index="2"><a href='#org' id='aOrg'>组织单元设置</a></li>
                    </ul>
                    <div id="user">
                        <asp:UpdatePanel ID="upMenu" runat="server" UpdateMode="Always">
                            <ContentTemplate>
                                <table class="tz-table">
                                    <tr>
                                        <td class="tz-toolbar" valign="top">
                                            工号/姓名/简拼<asp:TextBox ID="tbUser" runat="server" Width="120px"></asp:TextBox>
                                            <asp:LinkButton ID="btnQuery" runat="server" OnClick="btnQuery_Click" EnableTheming="false"
                                                CssClass="searchbtn">
                                                    <span content="searchResult">查找</span>
                                            </asp:LinkButton>
                                            <asp:LinkButton ID="btnReset" OnClick="btnReset_Click" runat="server" EnableTheming="false"
                                                CssClass="searchbtn">
                                                    <span>重置</span>
                                            </asp:LinkButton>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <zhongsoft:LightPowerGridView ID="gvUsers" runat="server" AutoGenerateColumns="false"
                                                UseDefaultDataSource="true" AllowPaging="true" PageSize="12" AllowSorting="true"
                                                BindGridViewMethod="BindUsers" OnRowCommand="gvUsers_RowCommand" DataKeyNames="UserId,UserName,OrgUnitId,OrgUnitName">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                                                        <ItemTemplate>
                                                            <%#Container.DisplayIndex+1 %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <zhongsoft:LightBoundField HeaderText="工号" DataField="LoginId" SortExpression="LoginId">
                                                    </zhongsoft:LightBoundField>
                                                    <zhongsoft:LightBoundField HeaderText="姓名" DataField="UserName" SortExpression="UserName">
                                                    </zhongsoft:LightBoundField>
                                                    <zhongsoft:LightBoundField HeaderText="部室" DataField="OrgUnitName" SortExpression="OrgUnitName">
                                                    </zhongsoft:LightBoundField>
                                                    <asp:TemplateField HeaderText="权限设置" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                                                        <ItemTemplate>
                                                            <a id="lbtnSet" style="text-decoration: underline; color: Blue;" onclick="return editUserAcl('<%#Eval("UserId") %>','<%#Eval("UserName") %>','<%#Eval("OrgUnitId") %>','<%#Eval("OrgUnitName") %>');">
                                                                权限设置</a>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </zhongsoft:LightPowerGridView>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div id="role">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
                            <ContentTemplate>
                                <table class="tz-table">
                                    <tr>
                                        <td class="tz-toolbar" valign="top">
                                            <table>
                                                <tr>
                                                    <td>
                                                        角色名称
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="tbRoleName" runat="server" class="kpms-textboxsearch" EnableTheming="false">
                                                        </asp:TextBox>
                                                    </td>
                                                    <td>
                                                        角色类型
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList runat="server" ID="ddlScope">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton ID="btnQueryRole" runat="server" OnClick="btnQueryRole_Click" EnableTheming="false"
                                                            CssClass="searchbtn">
                                                    <span content="searchResult">查找</span>
                                                        </asp:LinkButton>
                                                        <asp:LinkButton ID="btnResetRole" OnClick="btnResetRole_Click" runat="server" EnableTheming="false"
                                                            CssClass="searchbtn">
                                                    <span>重置</span>
                                                        </asp:LinkButton>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <zhongsoft:LightPowerGridView PageSize="12" ID="RoleTypeView" runat="server" AutoGenerateColumns="false"
                                                AllowPaging="true" OnRowCommand="RoleTypeView_RowCommand" OnRowDeleting="RoleTypeView_RowDeleting"
                                                BindGridViewMethod="BindRoles" UseDefaultDataSource="true" DataKeyNames="roleId">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                                                        <ItemTemplate>
                                                            <%#Container.DisplayIndex+1 %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="RoleName" HeaderText="角色名称" ItemStyle-Width="200px" />
                                                    <asp:TemplateField HeaderText="角色类型" ItemStyle-Width="100px">
                                                        <ItemTemplate>
                                                            <%# ObjectEnum.GetDisplayName(typeof(RoleScope), Int16.Parse(Eval("RoleScope").ToString()))%>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="OrganizationName" HeaderText="角色所属部门" ItemStyle-Width="200px">
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="RoleLevel" HeaderText="级别" HeaderStyle-Width="80px" ItemStyle-HorizontalAlign="Center">
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="权限设置" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                                                        <ItemTemplate>
                                                            <a id="lbtnSet" style="text-decoration: underline; color: Blue;" onclick="return editRoleAcl('<%#Eval("RoleId") %>','<%#Eval("RoleName") %>','<%#Eval("ROLESCOPE") %>');">
                                                                设置权限</a>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </zhongsoft:LightPowerGridView>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div id="org">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">
                            <ContentTemplate>
                                <table class="tz-table">
                                    <tr>
                                        <td class="tz-toolbar" valign="top">
                                            名称
                                            <asp:TextBox ID="tbOrgName" runat="server" Width="120px"></asp:TextBox>
                                            <asp:LinkButton ID="btnQueryOrg" runat="server" OnClick="btnQueryOrg_Click" EnableTheming="false"
                                                CssClass="searchbtn">
                                                    <span content="searchResult">查找</span>
                                            </asp:LinkButton>
                                            <asp:LinkButton ID="btnResetOrg" OnClick="btnResetOrg_Click" runat="server" EnableTheming="false"
                                                CssClass="searchbtn">
                                                    <span>重置</span>
                                            </asp:LinkButton>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <zhongsoft:LightPowerGridView ID="gvOrgs" runat="server" AutoGenerateColumns="false"
                                                UseDefaultDataSource="true" AllowPaging="true" PageSize="12" AllowSorting="true"
                                                BindGridViewMethod="BindOrgs" DataKeyNames="OrgUnitId">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                                                        <ItemTemplate>
                                                            <%#Container.DisplayIndex+1 %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <zhongsoft:LightBoundField HeaderText="名称" DataField="OrgUnitName" SortExpression="OrgUnitName">
                                                    </zhongsoft:LightBoundField>
                                                    <asp:TemplateField HeaderText="权限设置" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                                                        <ItemTemplate>
                                                            <a id="A1" style="text-decoration: underline; color: Blue;" onclick="return editOrgAcl('<%#Eval("OrgUnitId") %>','<%#Eval("OrgUnitName") %>');">
                                                                权限设置</a>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </zhongsoft:LightPowerGridView>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
