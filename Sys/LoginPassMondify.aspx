<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPassMondify.aspx.cs"
    Inherits="Zhongsoft.Portal.Sys.LoginPassMondify" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>系统密码修改、重置</title>
</head>
<body>
    <form id="form1" runat="server">
        <div runat="server" id="divReset" style="margin: 50px auto; width: 350px; height: 300px;">
            <table>
                <tr>
                    <td></td>
                    <td style="font-size: large;">密码修改重置
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>原密码
                    </td>
                    <td>
                        <asp:TextBox TextMode="Password" EnableTheming="false" ID="tbOldPwd" runat="server"
                            req="1"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>新密码
                    </td>
                    <td>
                        <asp:TextBox TextMode="Password" EnableTheming="false" ID="tbNewPwd" runat="server"
                            req="1" MaxLength="15"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>新密码确认
                    </td>
                    <td>
                        <asp:TextBox TextMode="Password" EnableTheming="false" ID="tbConfirmNewPW" runat="server"
                            req="1" MaxLength="15"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <asp:Button ID="btnConfirm" runat="server" EnableTheming="false" Text="确认修改" OnClick="btnConfirm_Click" />
                        &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnReset" runat="server" EnableTheming="false" Text="重  置" OnClick="btnReset_Click" />
                        <br />
                        <span class="req-star">重置后密码默认为：123456</span>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Label EnableViewState="false" ID="lbErrorLogin" ForeColor="Red" Visible="false"
                            runat="server" Text="修改失败"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
        <div runat="server" id="divAdminReset" visible="false" style="margin: 50px auto; width: 350px; height: 300px;">
            <table>
                <tr>
                    <td>姓名
                    </td>
                    <td>
                        <input type="hidden" runat="server" id="hiPersonnelInfoID" field="USERID" />
                        <zhongsoft:LightObjectSelector runat="server" ID="txtPersonnelName" SelectPageMode="Dialog"
                            SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                            EnableTheming="false" Writeable="false" ShowAttrs="name,LoginId" ResultForControls="{'hiPersonnelInfoID':'id','txtPersonnelCode':'LoginId'}"
                            PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
                    </td>
                </tr>
                <tr>
                    <td>工号
                    </td>
                    <td>
                        <zhongsoft:XHtmlInputText runat="server" ID="txtPersonnelCode" readonly="readonly" class="kpms-textbox" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" align="center">
                        <asp:Button ID="btnAdminReset" runat="server" Text="重置"
                            OnClick="btnAdminReset_Click" />
                        <span class="req-star">重置后密码默认为：123456</span>
                    </td>
                </tr>
            </table>
        </div>
        <input type="hidden" runat="server" id="hiDefaultPwd" value="123456" />
    </form>
</body>
</html>
