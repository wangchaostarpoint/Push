<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="C_ContractChargeInfo.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.UI.Controls.C_ContractChargeInfo" %>
<div class="wp_listleft">
    <div class="wp_main">
        <div class="wp_content">
            <table class="wp_table">
                <tr>
                    <td>
                        <span><a onclick="openContractChargeInfo()">本月合同收费（&nbsp;<asp:Label ID="lbNum" runat="server"
                            CssClass="digitalstyle"></asp:Label>&nbsp;笔，合同额&nbsp;<asp:Label ID="lbSum" runat="server"
                                CssClass="digitalstyle"></asp:Label>&nbsp;万元）</a></span>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript">
    var myDate = new Date();
    var startDate = myDate.getFullYear() + "-" + (myDate.getMonth() + 1) + "-01 00:00:00";
    var endDate = myDate.getFullYear() + "-" + (myDate.getMonth() + 1) + "-" + myDate.getDate() + " 23:23:59";
    //打开本月合同收费的详细列表，secid——合同聚合门户合同收费明细列表ID；参数传值：flag(流程标识)、startDate、endDate(到款日期)
    function openContractChargeInfo() {
        var url = buildQueryUrl("/Custom/List/DispListNew.aspx", { secid: '2D36BDD9-FF8C-46C0-B150-67C6DBCE390E', startDate: startDate, endDate: endDate, flag: 1 });
        return checkReturn(showModal(url, null, 1080, 600));
    }
</script>
