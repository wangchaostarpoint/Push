<%@ Page Title="角色类型管理" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="RoleTypeEditor.aspx.cs" Inherits="Zhongsoft.Portal.Sys.RoleTypeEditor" %>

<%@ Register Assembly="Zhongsoft.Portal.UI.Controls" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<%@ Import Namespace="Zhongsoft.Organization.Standard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
    <div class="subtoolbarbg">
        <asp:LinkButton runat="server" ID="btnAddUser" EnableTheming="false" DisplayStatus="(3.*)"
            CssClass="subtoolbarlink" OnClientClick="return showRoleMgr();" OnClick="btnAddUser_Click"><span>
            角色成员
        </span>
        </asp:LinkButton>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
         <tr>
            <td class="tz-title" colspan="2">
              角色信息
            </td>
        </tr>
        <tr>
            <td class="td-l">
                角色编号(小写)  
            </td>
            <td class="td-m">
                <asp:TextBox ID="txtRoleCode" runat="server" CssClass="kpms-textbox" MaxLength="30" Width="150"
                    ActiveStatus="(23.*)" Field="RoleCode" TableName="OrganizationRoles"></asp:TextBox> 
            </td>
        </tr>
        <tr>
            <td class="td-l">
                角色名称 <span class="req-star">*</span>
            </td>
            <td class="td-m">
                <asp:TextBox ID="tbRoleName" runat="server" CssClass="kpms-textbox" MaxLength="30"
                    ActiveStatus="(23.*)" Field="RoleName" TableName="OrganizationRoles"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbRoleName"
                    ErrorMessage="请填写角色名称">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                级别
            </td>
            <td class="td-m">
                <asp:TextBox TableName="OrganizationRoles" Field="RoleLevel" ID="tbLevel" ActiveStatus="(23.*)"
                    runat="server" MaxLength="2" Width="30px" EnableTheming="false" CssClass="kpms-textbox-money"></asp:TextBox>
                <span class="req-star">数值越高级别越高</span>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                角色类型<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <asp:RadioButtonList ID="rblScope" runat="server" RepeatDirection="Horizontal" req="1"
                    ActiveStatus="(23.*)" field="RoleScope" tablename="OrganizationRoles" onclick="scopeChange()">
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr class="trDept">
            <td class="td-l">
                所属部门<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsOrgs" deptreq="1" PageUrl="/Portal/Sys/OrgUsers/OrgSelector.aspx"
                    ResultAttr="name" ResultForControls="{'hiOrganizationId':'id'}" />
                <input type="hidden" runat="server" id="hiOrganizationId" name="hiOrganizationId"
                    field="UnitId" tablename="OrganizationRoles" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                角色描述
            </td>
            <td class="td-m">
                <asp:TextBox ID="tbRoleMemo" runat="server" MaxLength="256" ActiveStatus="(23.*)"
                    Field="RoleMemo"  Height="80px" TableName="OrganizationRoles" TextMode="MultiLine" Rows="4"></asp:TextBox>
            </td>
        </tr>
    </table>
    <table class="tz-table" runat="server" displaystatus="(3.*)">
        <tr>
            <td class="tz-title">
               用户信息
            </td>
        </tr>
        <tr>
            <td>
                <zhongsoft:LightPowerGridView PageSize="8" ID="UserNameView" runat="server" AutoGenerateColumns="false"
                    AllowPaging="true" OnRowCommand="UserNameView_RowCommand" UseDefaultDataSource="true"
                    DataKeyNames="OrganizationUsersInRolesID" OnRowDeleting="UserNameView_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="UserName" HeaderText="用户名" ItemStyle-HorizontalAlign="Left"
                            HeaderStyle-Width="100px" />
                        <asp:BoundField DataField="OrganizationName" HeaderText="所属部门" HeaderStyle-Width="200px"
                            ItemStyle-HorizontalAlign="Left" />
                        <asp:BoundField DataField="MobilePhone" HeaderText="手机号码" HeaderStyle-Width="200px"
                            ItemStyle-HorizontalAlign="Right" />
                        <asp:BoundField DataField="Email" HeaderText="电子邮件" ItemStyle-HorizontalAlign="Left" />
                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="删除" ItemStyle-Width="50px">
                            <ItemTemplate>
                                <asp:ImageButton CommandName="Delete" OnClientClick="return window.confirm('您确定删除吗?')"
                                    ImageUrl="/Portal/Themes/Images/btn_dg_delete.gif" ID="IbtnButton" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiRoleId" name="hiRoleId" field="RoleId"
        tablename="OrganizationRoles" />
    <script language="javascript" type="text/javascript">
        var $deptRoleScope = "<%=(int)RoleScope.DepartmentRole %>";
        function initCustomerPlugin() {
            scopeChange();
            $("#<%=rblScope.ClientID %>").change(scopeChange);
        }

        function scopeChange() {
            var trDept = $(".trDept");
            var deptReq = $("[deptreq]");
            if ($("#<%=rblScope.ClientID %>").find("input:checked").val() == $deptRoleScope) {
                trDept.show();
                deptReq.attr("req", "1");
            }
            else {
                trDept.hide();
                deptReq.removeAttr("req");
                $("#<%=hiOrganizationId.ClientID %>").val("");
            }
        }
        function showRoleMgr() {
            var params = { RoleId: $bizCtx.bizId };
            var orgId = $("#<%=hiOrganizationId.ClientID %>").val();
            var roleId = $("#<%=hiRoleId.ClientID %>").val();
            if (orgId != "") {
                params = $.extend(params, { OrgId: orgId, RoleId: roleId });
            }
            var url = buildQueryUrl("/Sys/RoleUser/RoleMgr.aspx", params);
            var re = showModal(url, "", 800, 500);
            if (checkReturn(re)) {
                return true;
            }
            return false;
        }
    </script>
</asp:Content>
