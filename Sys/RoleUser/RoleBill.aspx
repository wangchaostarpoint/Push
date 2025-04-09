<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoleBill.aspx.cs" Inherits="Zhongsoft.Portal.Sys.RoleList" %>

<%@ Register Assembly="Zhongsoft.Portal.UI.Controls" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>角色成员列表</title>

    <script language="javascript" type="text/javascript">
        function SelectUser() {
            var Dom = new ActiveXObject("Microsoft.XMLDOM");
            Dom.loadXML(document.all("hiXml").value);
            var root = Dom.selectSingleNode("root");
            var node = Dom.selectSingleNode("root/configuration");
            if (node == null) {
                //创建节点
                var newNode = Dom.createNode(1, "configuration", "");
                //填写选择类型，SINGLE=单选，MULTIPLE =多选
                var attribute = Dom.createAttribute("type");
                attribute.value = "MULTIPLE";
                newNode.setAttributeNode(attribute);
                //将该节点添加到根结点中
                root.appendChild(newNode);
            }
            var url = "../../General/Product/SelectUsers.aspx";
            var stringFeatures = "dialogHeight: 600px; dialogWidth: 730px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:no; status: no;";
            var domUser = window.showModalDialog(url, root, stringFeatures);
            if (null != domUser) {
                document.all("hiXml").value = domUser.xml;
                return true;
            }
            return false;
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <table width="100%">
        <tr>
            <td>
                实施授权:<asp:Label ID="lbDeptName" runat="server" Text="角色成员信息"></asp:Label>
            </td>
            <td align="right">
                <asp:ImageButton ID="ibtnNew" OnClientClick="return SelectUser();" runat="server"
                    ImageUrl="~/Themes/Images/btn_add.gif" OnClick="ibtnNew_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <zhongsoft:LightPowerGridView ID="pdgRoleUser" runat="server" Width="100%" CacheRecordCount="False"
                    DataBorderSize="1" DefaultSortColumn="" ExportFilePath="/KPMS/Temp/" ExportSqlCommand=""
                    DataKeyNames="UserId" FlashColor="#C1D2EE" oldValue="oldlace" ShowBorder="True"
                    singleValue="#FFFFFF" OnRowDataBound="pdgRoleUser_RowDataBound" OnRowCommand="pdgRoleUser_ItemCommand"
                    AutoGenerateColumns="False" Title="DataGrid">
                    <SelectedRowStyle BackColor="CornflowerBlue" Font-Bold="True"></SelectedRowStyle>
                    <Columns>
                        <asp:BoundField DataField="UserId" HeaderText="UserId" Visible="false"></asp:BoundField>
                        <asp:BoundField DataField="UserName" HeaderText="姓名"></asp:BoundField>
                        <asp:TemplateField HeaderText="删除">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbDelete" runat="server" CommandName="DeleteData">
												<IMG id="btDelete" alt="删除角色成员" style="CURSOR: hand" onclick='if(!confirm("是否确认要删除\"<%#DataBinder.Eval(Container.DataItem,"UserName")%>\"角色成员?")) return false;'
													 src="/KPMS/Themes/Images/btn_dg_delete.gif" border="0">
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <input id="hiXml" type="hidden" value="<root></root>" runat="server" />
    </form>
</body>
</html>
