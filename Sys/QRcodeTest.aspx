<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QRcodeTest.aspx.cs" Inherits="Zhongsoft.Portal.Sys.QRcodeTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>二维码生成测试页</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="tz-table" style="width: 30%">
                <tr>
                    <td colspan="2" class="td-m">
                        <asp:Image runat="server" ID="imgTest" Width="200px" Height="200px" />
                    </td>
                </tr>
                <tr>
                    <td class="td-l">消息内容</td>
                    <td class="td-l">
                        <zhongsoft:LightTextBox runat="server" EnableTheming="False" ID="tbMsg" CssClass="kpms-textarea" TextMode="MultiLine" Rows="3" />
                    </td>
                </tr>
                <tr>
                    <td class="td-l">容错率</td>
                    <td class="td-l">
                        <zhongsoft:LightDropDownList runat="server" ID="ddleccLevel">
                            <asp:ListItem Text="L(7%)" Value="L" />
                            <asp:ListItem Text="M(15%)" Value="M" />
                            <asp:ListItem Text="Q(25%)" Value="Q" />
                            <asp:ListItem Text="H(30%)" Value="H" />
                        </zhongsoft:LightDropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">型号</td>
                    <td class="td-l">
                        <zhongsoft:LightDropDownList runat="server" ID="ddlVersion" />
                    </td>
                </tr>
                <tr>
                    <td class="td-l">像素大小</td>
                    <td class="td-l">
                        <zhongsoft:LightTextBox runat="server" ID="tbPixed" DataType="Integer" EnableTheming="False" CssClass="kpms-textbox-money" />
                    </td>
                </tr>
                <tr>
                    <td class="td-l">图标路径(图片格式文件,如:D:/111.jpg)</td>
                    <td class="td-l">
                        <zhongsoft:LightTextBox runat="server" ID="tbIconPath" />
                    </td>
                </tr>
                <tr>
                    <td class="td-l">图标尺寸</td>
                    <td class="td-l">
                        <zhongsoft:LightTextBox runat="server" ID="tbIconSize" DataType="Integer" EnableTheming="False" CssClass="kpms-textbox-money" />
                    </td>
                </tr>
                <tr>
                    <td class="td-l">图标边框厚度</td>
                    <td class="td-l">
                        <zhongsoft:LightTextBox runat="server" ID="tbIconBorder" DataType="Integer" EnableTheming="False" CssClass="kpms-textbox-money" />
                    </td>
                </tr>
                <tr>
                    <td class="td-l">二维码边框是否留白</td>
                    <td class="td-l">
                        <asp:RadioButtonList runat="server" ID="rblIsWhiteEdge" RepeatDirection="Horizontal">
                            <asp:ListItem Text="是" Value="1" />
                            <asp:ListItem Text="否" Value="0" />
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button runat="server" ID="btnCreate" Text="生成二维码" OnClick="btnCreate_OnClick" />
                    </td>
                    <td>
                        <asp:Button runat="server" ID="btnDownload" Text="生成并下载二维码" OnClick="btnDownload_OnClick" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
