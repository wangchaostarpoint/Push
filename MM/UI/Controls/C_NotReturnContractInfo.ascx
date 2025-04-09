<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="C_NotReturnContractInfo.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.UI.Controls.C_NotReturnContractInfo" %>
<div class="wp_listleft">
    <div class="wp_main">
        <div class="wp_content">
            <table class="wp_table">
                <tr>
                    <td>
                        <span><a onclick="openContract()">未返回合同（<asp:Label ID="lbContractNum" runat="server"></asp:Label>)</a></span>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript">

    function openContract() {
        var url = buildQueryUrl("/Custom/List/DispListNew.aspx", { ViewId: 'AC6A97C1-94D9-4132-9948-7830914AFA7A', IsView: '1', ListId: '6091CC26-DDFD-417D-9E01-4BB836B07F57', secid: '6091CC26-DDFD-417D-9E01-4BB836B07F57', IsReturn: '0' });
        return checkReturn(showModal(url, null, 1080, 600));
    }

</script>
