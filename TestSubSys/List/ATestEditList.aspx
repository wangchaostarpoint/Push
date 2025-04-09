<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ATestEditList.aspx.cs"
    Inherits="Zhongsoft.Portal.BDM.List.ATestEditList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table class="tz-table">
            <tr>
                <td class="td-m">
                    <asp:LinkButton runat="server" ID="btnSave" OnClick="btnSave_Click" OnClientClick="return Check();"><span>保存</span></asp:LinkButton>
                    <asp:LinkButton runat="server" ID="btnAdd" OnClick="btnAdd_Click"><span>新建</span></asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td>
                    <zhongsoft:LightPowerGridView runat="server" ID="gvList" OnRowCreated="gvList_RowCreated"
                        ShowAddData="true" OnRowCommand="gvList_RowCommand">
                        <Columns>
                        </Columns>
                    </zhongsoft:LightPowerGridView>
                </td>
            </tr>
        </table>
    </div>
    <asp:Button ID="Button1" runat="server" Text="Button" OnClientClick="show();" />
    </form>
    <script>
        function show() {
            var re = showModal("TestEditor.aspx?actionType=3", window, 500, 500);
            alert(re);
            return false;
        }
    </script>
</body>
</html>
