<%@ Page Title="陕西水电院产品信息" Language="C#" AutoEventWireup="true"
    CodeBehind="ProductInfo4QR.aspx.cs" Inherits="Zhongsoft.Portal.API.ProductInfo4QR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

    <title></title>
    <style>
        /*标题样式*/
        .title {
            font-weight: bold;
            font-size: 16px;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="width: 90%; margin: 0 auto;">
            <table>
                <thead>
                    <tr>
                        <td colspan="2" class="title">陕西水电院产品信息</td>
                    </tr>
                </thead>
                <asp:Literal runat="server" ID="lrInfo"></asp:Literal>
            </table>
        </div>
        <input type="hidden" runat="server" id="hiNoInfo" value="<tr><td colspan='2' style='color:red;'>非陕西水电院产品信息</td></tr>" />
    </form>
</body>
</html>
