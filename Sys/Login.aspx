<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Zhongsoft.Portal.Sys.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <link href="../Themes/Styles/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../Themes/Styles/index1.css" rel="stylesheet" type="text/css" />
    <style>
        .btn {
            color: #fff;
            background-color: #f0ad4e;
            border-color: #eea236;
        }

        .btn {
            cursor: pointer;
            border: #eea236 1px solid!important;
            background: #f0ad4e!important;
            height: 30px!important;
            line-height:30px!important;
            text-align: center;
            margin: 0 auto;
            margin-top: 2px;
            vertical-align: middle;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" defaultbutton="btnLogin">
        <div class="container">
            <div class="header">
                <div class="header-logo">
                    <img id="imgLogo" alt="" runat="server" src="../Themes/images/login/logo.png" />
                    <span><%=AppConfig.Instance.PortalTitle%></span>
                </div>
            </div>
        </div>
        <div class="banner">
            <div class="banner-bottom"></div>
            <div class="banner-top"></div>
            <div class="banner-text">
                <p class="text-1">
                    <img src="../Themes/Images/login/qyjs.png" />
                </p>
            </div>
            <div class="login-aside">
                <div class="login-bg"></div>
                <div class="login-form">
                    <div class="form-group">
                        <label for="inputName">工号：</label>
                        <asp:TextBox ID="tbLoginId" EnableTheming="false" runat="server" MaxLength="15" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="InputPassword">密码：</label>
                        <asp:TextBox TextMode="Password" EnableTheming="false" ID="tbPwd" runat="server" req="1" MaxLength="15" CssClass="form-control"></asp:TextBox>
                    </div>
                    <asp:LinkButton runat="server" ID="btnLogin" CssClass="btn btn-warning width-100" OnClick="btnLogin_Click" EnableTheming="false"><span>登录</span></asp:LinkButton>
                    <asp:Label EnableViewState="false" ID="lbErrorLogin" ForeColor="Red" Visible="false" runat="server" Text="登录失败"></asp:Label>
                </div>

            </div>
        </div>
        <div class="banner-shadow"></div>
        <div class="container">
            <div class="footer">
                <p>
                    版权所有@<%=DateTime.Now.Year %> <%=AppConfig.Instance.BaseOrgUnitName %> Corporation. All Rights Reserved
                </p>
            </div>
        </div>

        <script>
            var $tempLoginId = "";
            function initCustomerPlugin() {
                $("#<%=this.tbLoginId.ClientID %>").autocomplete({
                    source: function (request, response) {
                        $.getJSON("<%=WebAppPath %>/JsonSelectorHandler.ashx", {
                            term: request.term + ',user'
                        }, response);
                    },
                    minLength: 1,
                    select: function (event, ui) {
                        if (ui.item) {
                            var split = ui.item.id.split(',');
                            $tempLoginId = split[1];
                            window.setTimeout(setLoginId, 200);
                        }
                    }
                }).focus();
            }
            function setLoginId() {
                $("#<%=this.tbLoginId.ClientID %>").val($tempLoginId);
            }

        </script>
        <script>
            $(document).ready(function () {
                var a = $(window).height();
                $(".banner").css("height", a * 0.7 + "px");
                var b = $(".banner").height();
                $(".login-aside").css("top", (b - 320) / 2 + "px");
                $(".banner-text").css("top", (b - 260) / 2 + "px");
            });
        </script>
    </form>
</body>
</html>
