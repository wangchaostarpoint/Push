<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="C_MarketProjectNoSignInfo.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.UI.Controls.C_MarketProjectNoSignInfo" %>
<div class="wp_listleft">
    <div class="wp_main">
        <div class="wp_content">
            <table class="wp_table">
                <tr>
                    <td>
                        <span><a onclick="openMarketProjectNoSignInfo()">待签项目（&nbsp;
                            <asp:Label ID="lbNum" runat="server" CssClass="digitalstyle"></asp:Label>&nbsp;个项目,预估&nbsp;<asp:Label
                                ID="lbSum" runat="server" CssClass="digitalstyle"></asp:Label>&nbsp;万合同额）</a></span>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript">
    //打开合同聚合门户待签项目列表页面，secid——合同聚合门户待签项目列表ID（该列表页面，默认筛选的是2014年之后的待签项目信息）
    function openMarketProjectNoSignInfo() {
        var url = buildQueryUrl("/Custom/List/DispListNew.aspx", { secid: 'B46506C3-A5B3-4C2B-A805-45909F65D234'});
        return checkReturn(showModal(url, null, 1080, 600));
    }
</script>
