<%@ Page Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master" AutoEventWireup="true"
    CodeBehind="UserEditor.aspx.cs" Inherits="Zhongsoft.Portal.Sys.OrgUsers.UserEditor"
    Title="��Ա��Ϣ�༭" %>

<%@ Import Namespace="Zhongsoft.Portal.ACL" %>
<%@ Register Src="~/Sys/FileDocument/CustomerUpLoadFile.ascx" TagName="UpLoadFile"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
    <div class="subtoolbarbg">
        <asp:LinkButton runat="server" ID="btnReuse" CssClass="subtoolbarlink" displaystatus="(3.*)"
            OnClientClick="return showAcl();" EnableTheming="false"><span>Ȩ��</span></asp:LinkButton>
        <asp:LinkButton runat="server" ID="LinkButton1" CssClass="subtoolbarlink" displaystatus="(3.*)"
            OnClientClick="return showUserConfig();" EnableTheming="false"><span>���Ի�</span></asp:LinkButton>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="information">
        <ul>
            <li><a href="#userInformation">������Ϣ</a></li>
            <li><a href="#roleInformation">��ɫ��Ϣ</a></li>
            <li style="display: none;"><a href="#dwgInformation">ͼֽǩ���ļ���Ϣ</a></li>
            <li style="display: none;"><a href="#imgInformation">ͼƬǩ���ļ���Ϣ</a></li>
        </ul>
        <div id="userInformation">
            <table class="tz-table">
                <tr>
                    <td class="td-l">����
                    </td>
                    <td class="td-r">
                        <asp:TextBox ID="tbLoginId" field="LoginId" tablename="OrganizationUsers" ActiveStatus="(23.*)"
                            req="1" Width="150px" runat="server"></asp:TextBox>
                    </td>
                    <td class="td-l">����
                    </td>
                    <td class="td-r">
                        <asp:TextBox ID="tUserName" field="UserName" tablename="OrganizationUsers" ActiveStatus="(23.*)"
                            req="1" Width="150px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">�Ա�
                    </td>
                    <td class="td-r">
                        <asp:RadioButtonList ID="rblSex" runat="server" field="Sex" tablename="OrganizationUsers"
                            ActiveStatus="(23.*)" RepeatDirection="Horizontal">
                            <asp:ListItem Value="��">��</asp:ListItem>
                            <asp:ListItem Value="Ů">Ů</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td class="td-l">ƴ����д
                    </td>
                    <td class="td-r">
                        <asp:TextBox ID="tbAbbrName" field="AbbrName" tablename="OrganizationUsers" ActiveStatus="(23.*)"
                            Width="150px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">����
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightObjectSelector runat="server" ID="lbsDept" PageUrl="/Portal/Sys/OrgUsers/OrgSelector.aspx?showTree=1"
                            ResultForControls="{'hiOrganizationId':'id'}" SelectPageMode="Dialog" ResultAttr="name" ActiveStatus="(23.*)"
                            req="1" />
                        <input type="hidden" runat="server" id="hiOrganizationId" tablename="OrganizationUsers"
                            field="OrganizationId" />
                    </td>
                    <td class="td-l">�Ƿ��ڸ�
                    </td>
                    <td class="td-r">
                        <asp:RadioButtonList ID="rbIsActivated" runat="server" field="Flag" tablename="OrganizationUsers"
                            RepeatDirection="Horizontal" ActiveStatus="(23.*)">
                            <asp:ListItem Value="1">��</asp:ListItem>
                            <asp:ListItem Value="0">��</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">��ʼ��������
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtStartWorkDate" runat="server" field="StartWorkDate" tablename="OrganizationUsers" readonly="readonly" ActiveStatus="(23.*)" />
                    </td>
                    <td class="td-l">��ְ����
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtEntryDate" runat="server" field="EntryDate" tablename="OrganizationUsers" readonly="readonly" ActiveStatus="(23.*)" />
                    </td>
                </tr>
                <tr>
                    <td class="td-l">�����绰
                    </td>
                    <td class="td-r">
                        <asp:TextBox ID="tbPhone" runat="server" field="Phone" ActiveStatus="(23.*)" MaxLength="16"
                            Width="150px" tablename="OrganizationUsers"></asp:TextBox>
                    </td>
                    <td class="td-l">�ֻ�
                    </td>
                    <td class="td-r">
                        <asp:TextBox ID="tbMobilePhone" runat="server" field="MobilePhone" ActiveStatus="(23.*)"
                            Width="150px" MaxLength="11" tablename="OrganizationUsers"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="tbMobilePhone"
                            ErrorMessage="����д��ȷ���ֻ�����" ValidationExpression="([0-9]{1,11})">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">����
                    </td>
                    <td class="td-r">
                        <asp:TextBox ID="tbEmail" runat="server" field="Email" ActiveStatus="(23.*)" MaxLength="32"
                            Width="150px" tablename="OrganizationUsers"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbEmail"
                            ErrorMessage="����д��ȷ������" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                    </td>
                    <td class="td-l">����
                    </td>
                    <td class="td-r">
                        <asp:TextBox ID="tbSort" MaxLength="3" ActiveStatus="(23.*)" Field="Sort" tablename="OrganizationUsers"
                            Width="150px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                </tr>
                <tr>
                    <td class="td-l">��չ����
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
                            <asp:BoundField DataField="RoleName" HeaderText="��ɫ����" ItemStyle-Width="170px" ItemStyle-HorizontalAlign="Left" />
                            <asp:BoundField DataField="OrganizationName" HeaderText="��������" ItemStyle-HorizontalAlign="Left" />
                            <asp:TemplateField HeaderText="ɾ��" ItemStyle-Width="80px" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:ImageButton ID="IbtnButton" runat="server" ImageUrl="~/Themes/Images/btn_dg_delete.gif"
                                        CommandName="Delete" OnClientClick="return window.confirm('��ȷ��ɾ����')" />
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
                            <td class="td-l">ͼֽǩ����֤״̬
                            </td>
                            <td class="td-r">
                                <asp:RadioButtonList ID="rblDwgSignState" runat="server" RepeatDirection="Horizontal"
                                    ActiveStatus="(23.*)" OnSelectedIndexChanged="rblDwgSignState_SelectedIndexChanged"
                                    AutoPostBack="true">
                                    <asp:ListItem Value="1">����֤</asp:ListItem>
                                    <asp:ListItem Value="0" Selected="True">δ��֤</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr id="trDwg" runat="server">
                            <td class="td-l">�ϴ�ͼֽǩ��
                            </td>
                            <td class="td-r">
                                <uc1:UpLoadFile ID="uploadDwg" runat="server" />
                                <asp:Button runat="server" ID="btnDwgUpload" DisplayStatus="(3.*)" Text="�ϴ���Ƭ" OnClick="btnDwgUpload_Click" />
                                <asp:Button runat="server" ID="btnDwgDelete" DisplayStatus="(3.*)" Text="ɾ��" OnClick="btnDwgDelete_Click" />
                                <span style="right" class="req-star">ע�⣺�ļ��������ǡ�����.dwg��</span>
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
                            <td class="td-l">ͼƬǩ����֤״̬
                            </td>
                            <td class="td-r">
                                <asp:RadioButtonList ID="rblImgSignState" runat="server" RepeatDirection="Horizontal"
                                    ActiveStatus="(23.*)" OnSelectedIndexChanged="rblImgSignState_SelectedIndexChanged"
                                    AutoPostBack="true">
                                    <asp:ListItem Value="1">����֤</asp:ListItem>
                                    <asp:ListItem Value="0" Selected="True">δ��֤</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr id="trImg" runat="server" visible="false">
                            <td class="td-l">�ϴ�ͼƬǩ��
                            </td>
                            <td>
                                <uc1:UpLoadFile ID="upLoadImg" runat="server" />
                                <asp:Button runat="server" ID="btnImgUpload" DisplayStatus="(3.*)" Text="�ϴ���Ƭ" OnClick="btnImgUpload_Click" />
                                <asp:Button runat="server" ID="btnImgDelete" DisplayStatus="(3.*)" Text="ɾ��" OnClick="btnImgDelete_Click" />
                                <span style="right" class="req-star">ע�⣺�ļ��������ǡ�����.jpg��</span>
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

        //�ϴ���Ƭ
        function uploadFile(flag) {
            if (flag == "") {
                flag = "Module";
            }
            showUploadForm($bizCtx.bizId, flag);
            return true;
        }
    </script>
</asp:Content>
