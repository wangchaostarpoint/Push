<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="C_BiddingProjInfo.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.UI.Controls.C_BiddingProjInfo" %>
<div class="wp_listleft">
    <div class="wp_main">
        <div class="wp_content">
            <table class="wp_table">
                <tr>
                    <td>
                        <span><a onclick="openBiddingProj()">正在投标的项目（<asp:Label ID="lbBiddingProjNum" runat="server"></asp:Label>)</a></span>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript">

    function openBiddingProj() {
        var url = buildQueryUrl("/Custom/List/DispListNew.aspx", { ViewId: '02C8C664-5956-44AA-9975-11376270EC71', IsView: '1', ListId: 'AE35002E-906A-4EF2-BBAE-AE350763E224', secid: 'AE35002E-906A-4EF2-BBAE-AE350763E224', flag: '1', id: '20' });
        return checkReturn(showModal(url, null, 1080, 600));
    }

</script>
