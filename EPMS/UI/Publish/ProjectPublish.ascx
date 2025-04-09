<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProjectPublish.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Publish.ProjectPublish" %>
<table width="98%" border="0" cellspacing="0" cellpadding="0" class="list_borderbottom">
    <tr>
        <td colspan="2" class="list-header publish">
            出版交付情况
        </td>
    </tr>
    <tr>
        <td class="td-plan">
            &nbsp;月份
        </td>
        <td>
            &nbsp;<zhongsoft:LightDropDownList runat="server" ID="ddlYear" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged"
                AutoPostBack="true">
            </zhongsoft:LightDropDownList>
            <zhongsoft:LightDropDownList runat="server" ID="ddlMonth" OnSelectedIndexChanged="ddlMonth_SelectedIndexChanged"
                AutoPostBack="true">
            </zhongsoft:LightDropDownList>
        </td>
    </tr>
    <tr>
        <td class="td-plan">
            &nbsp;计划
        </td>
        <td>
            &nbsp;<a id="plan" onclick="showMorePub('puball')"><asp:Label ID="lbPlan" runat="server"
                Text=""></asp:Label></a>
        </td>
    </tr>
    <tr>
        <td class="td-plan">
            &nbsp;设计完成未出版
        </td>
        <td>
            &nbsp;<a id="actual11" onclick="showMorePub('designnopub')"><asp:Label ID="lbCompleteNoPublish"
                runat="server" Text=""></asp:Label></a>
        </td>
    </tr>
    <tr>
        <td class="td-plan">
            &nbsp;设计完成未交付
        </td>
        <td>
            &nbsp;<a id="a2" onclick="showMorePub('designnodeliver')"><asp:Label ID="lbCompleteNoSend"
                runat="server" Text=""></asp:Label></a>
        </td>
    </tr>
    <tr>
        <td class="td-plan">
            &nbsp;出版完成未交付
        </td>
        <td>
            &nbsp;<a id="a3" onclick="showMorePub('pubnodeliver')"><asp:Label ID="lbPublishNoSend"
                runat="server" Text=""></asp:Label></a>
        </td>
    </tr>
    <tr>
        <td colspan="2" style="height: 6px">
        </td>
    </tr>
</table>
<script type="text/javascript">
    function showMorePub(bindType) {
        var json = { BindType: bindType, year: $('#<%=ddlYear.ClientID %>').val(), month: $('#<%=ddlMonth.ClientID %>').val(), ProjViewType: '<%=ProjViewType %>', OrganizationID: '<%=OrganizationID %>', RoleName: '<%=RoleName %>'};
        var url = buildQueryUrl("/EPMS/List/Plan/ProjectPlanInfo.aspx", json);
        showDivDialog(url, null, 1050, 550);
        return false;
    }
</script>
