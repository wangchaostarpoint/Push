<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImportUsers.aspx.cs" Inherits="Zhongsoft.Portal.Sys.OrgUsers.ImportUsers" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td>
                    选择excel文件<span style="color: Red;">*</span>
                </td>
                <td>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                    <asp:RequiredFieldValidator ID="refExcelFile" runat="server" ControlToValidate="FileUpload1" ErrorMessage="请选择要导入的excel文件">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    工作表名称（如：sheet1）<span style="color: Red;">*</span>
                </td>
                <td>
                    <asp:TextBox ID="tbSheetName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="refSheetName" ControlToValidate="tbSheetName" runat="server" ErrorMessage="请填写工作表名称">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <asp:Button ID="btnExport" runat="server" Text="导入" onclick="btnExport_Click" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
