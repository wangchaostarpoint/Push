<%@ Page Title="人员信息编辑" Language="C#" MasterPageFile="~/UI/Master/ObjectEditorNew.Master"
    AutoEventWireup="true" CodeBehind="UserEditor.aspx.cs" Inherits="Zhongsoft.Portal.TestSubSys.List.UserEditor" %>

<%@ Import Namespace="Zhongsoft.Portal.ACL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
    <table>
        <tr>
            <td>
                <asp:LinkButton runat="server" ID="btnReuse" CssClass="function-btn" displaystatus="(3.*)"
                    OnClientClick="return showAcl();" EnableTheming="false"><img src="../../Themes/Images/btn_dg_detail.gif"  height="24" width="24"/><br /><span>权限</span></asp:LinkButton>
                <asp:LinkButton runat="server" ID="LinkButton1" CssClass="function-btn" displaystatus="(3.*)"
                    OnClientClick="return showUserConfig();" EnableTheming="false"><img src="../../Themes/Images/btn_dg_detail.gif"  height="24" width="24"/><br /><span>个性化</span></asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td align="center" style="line-height: 20px">
                其他
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="information">
        <ul>
            <li><a href="#userInformation">基本信息</a></li><li><a href="#roleInformation">角色信息</a></li>
        </ul>
        <div id="userInformation">
            <table class="tz-table">
                <tr>
                    <td class="td-l">
                        工号
                    </td>
                    <td class="td-r">
                        <asp:TextBox ID="tbLoginId" field="LoginId" tablename="OrganizationUsers" ActiveStatus="(2.*)"
                            req="1" Width="150px" runat="server"></asp:TextBox>
                    </td>
                    <td class="td-l">
                        姓名
                    </td>
                    <td class="td-r">
                        <asp:TextBox ID="tUserName" field="UserName" tablename="OrganizationUsers" ActiveStatus="(23.*)"
                            req="1" Width="150px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        性别
                    </td>
                    <td class="td-r">
                        <asp:RadioButtonList ID="rblSex" runat="server" field="Sex" tablename="OrganizationUsers"
                            ActiveStatus="(23.*)" RepeatDirection="Horizontal">
                            <asp:ListItem Value="男">男</asp:ListItem>
                            <asp:ListItem Value="女">女</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td class="td-l">
                        拼音简写
                    </td>
                    <td class="td-r">
                        <asp:TextBox ID="tbAbbrName" field="AbbrName" tablename="OrganizationUsers" ActiveStatus="(23.*)"
                            Width="150px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        部门
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightObjectSelector runat="server" ID="lbsDept" PageUrl="/Portal/Sys/OrgUsers/OrgSelector.aspx"
                            ResultForControls="{'hiOrganizationId':'id'}" ResultAttr="name" ActiveStatus="(23.*)"
                            req="1" />
                        <input type="hidden" runat="server" id="hiOrganizationId" tablename="OrganizationUsers"
                            field="OrganizationId" />
                    </td>
                    <td class="td-l">
                        是否在职
                    </td>
                    <td class="td-r">
                        <asp:RadioButtonList ID="rbIsActivated" runat="server" field="Flag" tablename="OrganizationUsers"
                            RepeatDirection="Horizontal" ActiveStatus="(23.*)">
                            <asp:ListItem Value="1">是</asp:ListItem>
                            <asp:ListItem Value="0">否</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        工作电话
                    </td>
                    <td class="td-r">
                        <asp:TextBox ID="tbPhone" runat="server" field="Phone" ActiveStatus="(23.*)" MaxLength="16"
                            Width="150px" tablename="OrganizationUsers"></asp:TextBox>
                    </td>
                    <td class="td-l">
                        手机
                    </td>
                    <td class="td-r">
                        <asp:TextBox ID="tbMobilePhone" runat="server" field="MobilePhone" ActiveStatus="(23.*)"
                            Width="150px" MaxLength="11" tablename="OrganizationUsers"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="tbMobilePhone"
                            ErrorMessage="请填写正确的手机号码" ValidationExpression="([0-9]{1,11})">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        邮箱
                    </td>
                    <td class="td-r">
                        <asp:TextBox ID="tbEmail" runat="server" field="Email" ActiveStatus="(23.*)" MaxLength="32"
                            Width="150px" tablename="OrganizationUsers"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbEmail"
                            ErrorMessage="请填写正确的邮箱" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                    </td>
                    <td class="td-l">
                        排序
                    </td>
                    <td class="td-r">
                        <asp:TextBox ID="tbSort" MaxLength="3" ActiveStatus="(23.*)" Field="Sort" tablename="OrganizationUsers"
                            Width="150px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                </tr>
                <tr>
                    <td class="td-l">
                        扩展部门
                    </td>
                    <td class="td-m" colspan="3">
                        <zhongsoft:LightObjectSelector runat="server" ID="lbsExtendDept" PageUrl="/Portal/Sys/OrgUsers/OrgSelector.aspx"
                            IsMutiple="true" ResultForControls="{'hiUnitId':'id'}" ResultAttr="name" Filter="2"
                            ActiveStatus="(23.*)" />
                        <input type="hidden" runat="server" id="hiUnitId" />
                    </td>
                </tr>
            </table>
        </div>
        <div id="roleInformation">
            <asp:UpdatePanel runat="server" ID="roleUpdate" UpdateMode="Conditional">
                <ContentTemplate>
                    <zhongsoft:LightPowerGridView ID="roleNameView" runat="server" AllowPaging="true"
                        PageSize="8" AutoGenerateColumns="false" UseDefaultDataSource="true" OnRowCommand="roleNameView_RowCommand"
                        DataKeyNames="OrganizationUsersInRolesID" OnRowDeleting="roleNameView_RowDeleting">
                        <Columns>
                            <asp:BoundField DataField="RoleName" HeaderText="角色名称" ItemStyle-Width="170px" ItemStyle-HorizontalAlign="Left" />
                            <asp:BoundField DataField="OrganizationName" HeaderText="所属部门" ItemStyle-HorizontalAlign="Left" />
                            <asp:TemplateField HeaderText="删除" ItemStyle-Width="80px" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:ImageButton ID="IbtnButton" runat="server" ImageUrl="~/Themes/Images/btn_dg_delete.gif"
                                        CommandName="Delete" OnClientClick="return window.confirm('您确定删除吗？')" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </zhongsoft:LightPowerGridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <input runat="server" type="hidden" id="hiUserID" field="UserId" tablename="OrganizationUsers" />
    <script>
        $(function () {
            $('#information').tabs();
        });
        function showAcl() {
            var url = buildQueryUrl("Sys/Acl/OperAclMgr.aspx", { OperatorId: $bizCtx.bizId, OperatorType: "<%=OperatorType.User %>" });
            showModal(url, "", 900, 500);
            return false;
        }

        function showUserConfig() {
            showModal(buildBizUrl("3", "", "Sys/OrgUsers/UserConfigEditor.aspx", { UserId: $bizCtx.bizId }), "", 500, 500);
        }
    </script>
</asp:Content>
