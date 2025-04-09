<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThreadTest.aspx.cs" Inherits="Zhongsoft.Portal.TestSubSys.List.ThreadTest" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">    
    <div>线程数
        <asp:DropDownList ID="ddlThreadCount" runat="server">
            <asp:ListItem>5</asp:ListItem>
            <asp:ListItem>10</asp:ListItem>
            <asp:ListItem>20</asp:ListItem>
            <asp:ListItem>30</asp:ListItem>
        </asp:DropDownList>
        <asp:Button ID="Button1" runat="server" Text="实例锁多线程访问" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" Text="非实例锁多线程访问" OnClick="Button2_Click" />
        <asp:Button ID="Button3" runat="server" Text="显示结果" OnClick="Button3_Click" />
        <asp:Button ID="Button4" runat="server" Text="清除结果" OnClick="Button4_Click" /><br />
        <asp:Label ID="lbThread" runat="server" Text=""></asp:Label>
    </div>
    </form>
</body>
</html>
