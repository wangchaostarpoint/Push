<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="C_PurchaseContractInfo.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.UI.Controls.C_PurchaseContractInfo" %>
<div class="wp_listleft">
    <div class="wp_main">
        <div class="wp_content">
            <table class="wp_table">
                <tr>
                    <td>
                        <span><a onclick="openInfo()">采购合同（<asp:Label ID="lbNum" runat="server"></asp:Label>)</a></span>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript">

    function openInfo() {
        var url = buildQueryUrl("/Custom/List/DispListNew.aspx", { ViewId: 'C278EC3F-61FE-44B9-AC66-47471D9BF2D7', IsView: '1', ListId: '629D5EE3-E43D-4BF8-8A5D-9B8417621D68', secid: '629D5EE3-E43D-4BF8-8A5D-9B8417621D68', IsReturn: '1' });
        return checkReturn(showModal(url, null, 1080, 600));
    }

</script>
