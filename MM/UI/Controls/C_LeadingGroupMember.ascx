<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="C_LeadingGroupMember.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.UI.Controls.C_LeadingGroupMember" %>
<div class="wp_listleft">
    <div class="wp_main">
        <div class="wp_content">
            <table class="wp_table">
                <tr>
                    <td>
                        <span><a onclick="openMember()">招标领导小组成员（<asp:Label ID="lbNum" runat="server"></asp:Label>)</a></span>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript">

    function openMember() {
        var url = buildQueryUrl("/Custom/List/DispListNew.aspx", { ViewId: 'CBEC8C18-B623-4221-AD5D-D3FF7C97044D', IsView: '1', ListId: '5BFB6F5C-2F79-4E19-B8BB-F0660E428243', secid: '5BFB6F5C-2F79-4E19-B8BB-F0660E428243' });
        return checkReturn(showModal(url, null, 1080, 600));
    }

</script>
