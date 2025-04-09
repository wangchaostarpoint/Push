<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestTime.aspx.cs" Inherits="Zhongsoft.Portal.WHHelper.LIst.TestTime" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <asp:Button ID="Button1" runat="server" Text="测试WriteLog记录日志事件" OnClick="Button1_Click" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button4" runat="server" Text="测试HandleException记录日志事件" OnClick="Button4_Click" />
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" Text="测试查询事件" OnClick="Button2_Click" />
             <br />
            <br />
            <asp:Button ID="Button3" runat="server" Text="测试查询和WriteLog记录日志事件" OnClick="Button3_Click" />  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="Button5" runat="server" Text="测试查询和HandleException记录日志事件" OnClick="Button5_Click"  />
            <br />
        </div>
         <div>
             <asp:TextBox ID="TextBox1" runat="server" Height="282px" TextMode="MultiLine" Width="684px"></asp:TextBox>
         </div>
    </form>
</body>
</html>
