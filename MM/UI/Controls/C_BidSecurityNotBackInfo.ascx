<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="C_BidSecurityNotBackInfo.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.UI.Controls.C_BidSecurityNotBackInfo" %>
<div class="wp_listleft">
    <div class="wp_main">
        <div class="wp_content">
            <table class="wp_table">
                <tr>
                    <td>
                        <span><a onclick="openProj()">投标保证金未收回（<asp:Label ID="lbProjNum" runat="server"></asp:Label>个项目，共<asp:Label
                            ID="lbMoney" runat="server"></asp:Label>万)</a></span>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
<script>
    function openProj() {
        var url = buildQueryUrl("/MM/List/MBM/C_BidSecurityNotBackList.aspx", "");
        return checkReturn(showModal(url, null, 1080, 600));
    }
</script>
