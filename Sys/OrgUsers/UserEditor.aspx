<%@ Page Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master" AutoEventWireup="true"
    CodeBehind="UserEditor.aspx.cs" Inherits="Zhongsoft.Portal.Sys.OrgUsers.UserEditor"
    Title="人员信息编辑" %>

<%@ Import Namespace="Zhongsoft.Portal.ACL" %>
<%@ Register Src="~/Sys/FileDocument/CustomerUpLoadFile.ascx" TagName="UpLoadFile"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
    <div class="subtoolbarbg">
        <asp:LinkButton runat="server" ID="btnReuse" CssClass="subtoolbarlink" displaystatus="(3.*)"
            OnClientClick="return showAcl();" EnableTheming="false"><span>权限</span></asp:LinkButton>
        <asp:LinkButton runat="server" ID="LinkButton1" CssClass="subtoolbarlink" displaystatus="(3.*)"
            OnClientClick="return showUserConfig();" EnableTheming="false"><span>个性化</span></asp:LinkButton>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="information">
        <ul>
            <li><a href="#userInformation">基本信息</a></li>
            <li><a href="#roleInformation">角色信息</a></li>
            <li style="display: none;"><a href="#dwgInformation">图纸签名文件信息</a></li>
            <li style="display: none;"><a href="#imgInformation">图片签名文件信息</a></li>
        </ul>
        <div id="userInformation">
            <table class="tz-table">
                <tr>
                    <td class="td-l">工号
                    </td>
                    <td class="td-r">
                        <asp:TextBox ID="tbLoginId" field="LoginId" tablename="OrganizationUsers" ActiveStatus="(23.*)"
                            req="1" Width="150px" runat="server"></asp:TextBox>
                    </td>
                    <td class="td-l">姓名
                    </td>
                    <td class="td-r">
                        <asp:TextBox ID="tUserName" field="UserName" tablename="OrganizationUsers" ActiveStatus="(23.*)"
                            req="1" Width="150px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">性别
                    </td>
                    <td class="td-r">
                        <asp:RadioButtonList ID="rblSex" runat="server" field="Sex" tablename="OrganizationUsers"
                            ActiveStatus="(23.*)" RepeatDirection="Horizontal">
                            <asp:ListItem Value="男">男</asp:ListItem>
                            <asp:ListItem Value="女">女</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td class="td-l">拼音简写
                    </td>
                    <td class="td-r">
                        <asp:TextBox ID="tbAbbrName" field="AbbrName" tablename="OrganizationUsers" ActiveStatus="(23.*)"
                            Width="150px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">部门
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightObjectSelector runat="server" ID="lbsDept" PageUrl="/Portal/Sys/OrgUsers/OrgSelector.aspx?showTree=1"
                            ResultForControls="{'hiOrganizationId':'id'}" SelectPageMode="Dialog" ResultAttr="name" ActiveStatus="(23.*)"
                            req="1" />
                        <input type="hidden" runat="server" id="hiOrganizationId" tablename="OrganizationUsers"
                            field="OrganizationId" />
                    </td>
                    <td class="td-l">是否在岗
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
                    <td class="td-l">开始工作日期
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtStartWorkDate" runat="server" field="StartWorkDate" tablename="OrganizationUsers" readonly="readonly" ActiveStatus="(23.*)" />
                    </td>
                    <td class="td-l">入职日期
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtEntryDate" runat="server" field="EntryDate" tablename="OrganizationUsers" readonly="readonly" ActiveStatus="(23.*)" />
                    </td>
                </tr>
                <tr>
                    <td class="td-l">工作电话
                    </td>
                    <td class="td-r">
                        <asp:TextBox ID="tbPhone" runat="server" field="Phone" ActiveStatus="(23.*)" MaxLength="16"
                            Width="150px" tablename="OrganizationUsers"></asp:TextBox>
                    </td>
                    <td class="td-l">手机
                    </td>
                    <td class="td-r">
                        <asp:TextBox ID="tbMobilePhone" runat="server" field="MobilePhone" ActiveStatus="(23.*)"
                            Width="150px" MaxLength="11" tablename="OrganizationUsers"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="tbMobilePhone"
                            ErrorMessage="请填写正确的手机号码" ValidationExpression="([0-9]{1,11})">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">邮箱
                    </td>
                    <td class="td-r">
                        <asp:TextBox ID="tbEmail" runat="server" field="Email" ActiveStatus="(23.*)" MaxLength="32"
                            Width="150px" tablename="OrganizationUsers"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbEmail"
                            ErrorMessage="请填写正确的邮箱" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                    </td>
                    <td class="td-l">排序
                    </td>
                    <td class="td-r">
                        <asp:TextBox ID="tbSort" MaxLength="3" ActiveStatus="(23.*)" Field="Sort" tablename="OrganizationUsers"
                            Width="150px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                </tr>
                <tr>
                    <td class="td-l">扩展部门
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
        <div id="dwgInformation">
            <asp:UpdatePanel runat="server" ID="dwgUpdate" UpdateMode="conditional">
                <ContentTemplate>
                    <table class="tz-table">
                        <tr>
                            <td class="td-l">图纸签名验证状态
                            </td>
                            <td class="td-r">
                                <asp:RadioButtonList ID="rblDwgSignState" runat="server" RepeatDirection="Horizontal"
                                    ActiveStatus="(23.*)" OnSelectedIndexChanged="rblDwgSignState_SelectedIndexChanged"
                                    AutoPostBack="true">
                                    <asp:ListItem Value="1">已验证</asp:ListItem>
                                    <asp:ListItem Value="0" Selected="True">未验证</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr id="trDwg" runat="server">
                            <td class="td-l">上传图纸签名
                            </td>
                            <td class="td-r">
                                <uc1:UpLoadFile ID="uploadDwg" runat="server" />
                                <asp:Button runat="server" ID="btnDwgUpload" DisplayStatus="(3.*)" Text="上传照片" OnClick="btnDwgUpload_Click" />
                                <asp:Button runat="server" ID="btnDwgDelete" DisplayStatus="(3.*)" Text="删除" OnClick="btnDwgDelete_Click" />
                                <span style="right" class="req-star">注意：文件名必须是“工号.dwg”</span>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="imgInformation">
            <asp:UpdatePanel runat="server" ID="jpgUpdate" UpdateMode="Conditional">
                <ContentTemplate>
                    <table class="tz-table">
                        <tr>
                            <td class="td-l">图片签名验证状态
                            </td>
                            <td class="td-r">
                                <asp:RadioButtonList ID="rblImgSignState" runat="server" RepeatDirection="Horizontal"
                                    ActiveStatus="(23.*)" OnSelectedIndexChanged="rblImgSignState_SelectedIndexChanged"
                                    AutoPostBack="true">
                                    <asp:ListItem Value="1">已验证</asp:ListItem>
                                    <asp:ListItem Value="0" Selected="True">未验证</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr id="trImg" runat="server" visible="false">
                            <td class="td-l">上传图片签名
                            </td>
                            <td>
                                <uc1:UpLoadFile ID="upLoadImg" runat="server" />
                                <asp:Button runat="server" ID="btnImgUpload" DisplayStatus="(3.*)" Text="上传照片" OnClick="btnImgUpload_Click" />
                                <asp:Button runat="server" ID="btnImgDelete" DisplayStatus="(3.*)" Text="删除" OnClick="btnImgDelete_Click" />
                                <span style="right" class="req-star">注意：文件名必须是“工号.jpg”</span>
                            </td>
                        </tr>
                    </table>
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

        //上传照片
        function uploadFile(flag) {
            if (flag == "") {
                flag = "Module";
            }
            showUploadForm($bizCtx.bizId, flag);
            return true;
        }
    </script>
</asp:Content>
