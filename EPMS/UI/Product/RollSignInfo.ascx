<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RollSignInfo.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Controls.RollSignInfo" %>
<table class="tz-table" width="100%">
    <!-- 强制服务器隐藏批签批转切换-->
    <tr style="display: none;" runat="server" visible="false">
        <td class="td-l">图纸批签批转
        </td>
        <td class="td-m">
            <table>
                <tr>
                    <td>
                        <asp:RadioButtonList runat="server" ID="rblConvertType" AutoPostBack="true" OnSelectedIndexChanged="rblConvertType_SelectedIndexChanged">
                            <asp:ListItem Value="0" Selected="True">服务器自动批签批转</asp:ListItem>
                            <asp:ListItem Value="1">客户端手动批签批转</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td>
                        <span class="req-star">选择服务器处理批签批转，设计人无需做其他处理，耐心等待，服务器会自动在图纸文件中添加签名，并转换成PLT、PDF文件<br />
                            选择客户端处理批签批转，请设计人启动协同校审工具，手动操作批签、批转</span>
                    </td>
                </tr>
            </table>
            <span style="color: Blue; font-weight: bold; font-size: large;">当前服务器有
                <asp:Label ID="lbProductCount" runat="server" Text="1000" />个成品待处理，处理本卷册成品预计等待时间：<asp:Label
                    ID="lbTime" runat="server" Text="100" /></span>
            <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" CssClass="kpms-buttonfree"
                EnableTheming="false" Text="刷新服务器状态" />
        </td>
    </tr>
    <tr>
        <td class="td-l">图纸批签批转
        </td>
        <td class="td-m">
            <asp:Label runat="server" ID="lbSignState" Text="批签状态："></asp:Label>&nbsp;&nbsp;&nbsp;
            <asp:Label runat="server" ID="lbSignPltState" Visible="false" Text="批转Plt状态："></asp:Label>&nbsp;&nbsp;&nbsp;
            <asp:Label runat="server" ID="lbSignPdfState" Text="批转Pdf状态："></asp:Label>&nbsp;&nbsp;&nbsp;
            <asp:Label runat="server" ID="lbSignTifState" Visible="false" Text="批转Tif状态："></asp:Label>&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnUpdate2" runat="server" OnClick="btnUpdate_Click" CssClass="kpms-buttonfree"
                EnableTheming="false" Text="刷新批签批转状态" />
            <asp:Button ID="btnViewSignInfo" runat="server" OnClientClick="return viewSignInfo()"
                CssClass="kpms-buttonfree" EnableTheming="false" Text="查看批签错误信息" Visible="false" />
        </td>
    </tr>
</table>
<script>
    function viewSignInfo() {
        var wbsId = '<%=WBSID %>';
        var url = '/EPMS/List/Product/ProductConvertError.aspx';
        url = buildQueryUrl(url, { RollID: wbsId });
        showDivDialog(url, null, 900, 600, null);
        return false;
    }

    //获取批签状态
    function GetSignState() {
        return $("#<%=lbSignState.ClientID %>").text();
    }
</script>
