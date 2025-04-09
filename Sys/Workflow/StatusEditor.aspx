<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StatusEditor.aspx.cs" Inherits="Zhongsoft.Portal.Sys.Workflow.StatusEditor" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager runat="server" ID="ScriptManager1">
    </asp:ScriptManager>
    <asp:UpdatePanel runat="server" ID="UpdatePanel1">
        <ContentTemplate>
            <div>
                <table>
                    <tr>
                        <td valign="top">
                            <asp:TreeView ID="ActsTree" runat="server" Width="300px" Height="400px">
                            </asp:TreeView>
                        </td>
                        <td valign="top">
                            <asp:CheckBoxList runat="server" ID="cbAcls" RepeatDirection="Horizontal">
                            </asp:CheckBoxList>
                            <br />
                            <asp:LinkButton runat="server" ID="btnAdd" OnClick="btnAdd_Click"><span>添加</span></asp:LinkButton>
                            <asp:LinkButton runat="server" ID="btnDelete" OnClick="btnDelete_Click"><span>删除</span></asp:LinkButton>
                            <br />
                            <br />
                            <asp:ListBox runat="server" ID="lbStatus" SelectionMode="Multiple" Width="300px"
                                Height="200px"></asp:ListBox>
                            <input type="hidden" runat="server" id="hiStatus" />
                            <input type="hidden" runat="server" id="hiTexts" />
                        </td>
                    </tr>
                </table>
                <script>
                    function getStatus() {
                        return $("#<%=hiStatus.ClientID %>").val();
                    }

                    function getTexts() {
                        return $("#<%=hiTexts.ClientID %>").val();
                    } 
                </script>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    </form>
</body>
</html>
