<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExAclMgr.aspx.cs" Inherits="Zhongsoft.Portal.Sys.ExAclMgr" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>模块操作权限控制</title>
</head>
<body>
    <form id="form1" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                访问者类型
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlOperatorType" runat="server" Width="200px" AutoPostBack="true"
                    OnSelectedIndexChanged="ddlOperatorType_Change">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                访问类别
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlType" runat="server" Width="200px">
                    <asp:ListItem Value="1">允许访问</asp:ListItem>
                    <asp:ListItem Value="0">禁止访问</asp:ListItem>
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                扩展动作
            </td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightDropDownList ID="ddlAction" runat="server" Width="200px">
                </zhongsoft:LightDropDownList>
                <asp:LinkButton runat="server" ID="btnEditAction" OnClientClick="return editAction()"
                     OnClick="btnEditAction_Click"><span>设置扩展动作</span></asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td class="td-l" colspan="4" nowrap="nowrap">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsOperator" Writeable="true" SourceMode="SelectorPage"
                    BeforeSelect="beforeAdd();" PageUrl="~/Sys/OrgUsers/UserSelector.aspx" ResultAttr="name"
                    ImageUrl="~/Themes/Images/btn_add.gif" IsMutiple="true" Text=" 添加访问者" OnlyShowButton="true"
                    OnClick="lbsOperator_Click" />
            </td>
        </tr>
        <tr>
            <td class="kpms-haslinetd" colspan="4">
                <asp:GridView DataKeyNames="RuleId" ID="aclList" Width="100%" EmptyDataText="没有权限信息"
                    runat="server" AutoGenerateColumns="false" OnRowDeleting="aclList_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="OperatorName" HeaderText="访问者" />
                        <asp:BoundField DataField="ActionName" HeaderText="操作动作" />
                        <asp:TemplateField HeaderText="访问类别">
                            <ItemTemplate>
                                <%#GetType(int.Parse(Eval("AccessLevel").ToString())) %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                            <ItemTemplate>
                                <asp:ImageButton CommandName="Delete" OnClientClick="return window.confirm('您确定删除吗?')"
                                    ImageUrl="/Portal/Themes/Images/btn_dg_delete.gif" ID="btnDelete" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
    <asp:HiddenField ID="hiOperaotrValue" runat="server" />
    <asp:HiddenField ID="hiOperatorId" runat="server" />
    <script language="javascript">
        function beforeAdd() {
            var act = $("#<%=ddlAction.ClientID %>").val();
            if (act == "") {
                alert("请选扩展作动作再添加扩展权限。");
                return false
            }
            return true;
        }
        function editAction() {
            var moduleId = "<%=ModuleId %>";
            var moduleName = "<%=ModuleName %>";
            var url = "ExActionMgr.aspx?ModuleId=" + moduleId + "&ModuleName=" + escape(moduleName);
            showModal(url, null, 800, 400);
        }
    </script>
    </form>
</body>
</html>
