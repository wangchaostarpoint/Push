<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProjectPlan.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Plan.ProjectPlan" %>
<table width="98%" border="0" cellspacing="0" cellpadding="0" class="list_borderbottom">
    <tr>
        <td colspan="2" class="list-header plan">
            生产计划<span style="padding-right: 10px; float: right;"><a onclick="showMorePlan('plan')"
                id="production_plan"><img title="详细" src="../../Themes/custom/images/read_more.png" /></a></span>
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
            &nbsp;<a id="plan" onclick="showMorePlan('plan')"><asp:Label ID="lbPlan" runat="server"
                Text=""></asp:Label></a>
        </td>
    </tr>
    <tr>
        <td class="td-plan">
            &nbsp;实际
        </td>
        <td>
            &nbsp;<a id="actual" onclick="showMorePlan('fact')"><asp:Label ID="lbFact" runat="server"
                Text=""></asp:Label></a>
        </td>
    </tr>
    <tr>
        <td class="td-plan">
            &nbsp;完成情况
        </td>
        <td>
            <div id="box" class="box">
                &nbsp;<a id="aComplete" onclick="showMorePlan('fact')"><asp:Label ID="lbComplateMes"
                    runat="server" Text=""></asp:Label></a></div>
        </td>
    </tr>
    <tr>
        <td class="td-plan">
            &nbsp;关键卷册
        </td>
        <td>
            &nbsp;<a id="actual11" onclick="showMorePlan('key')"><asp:Label ID="lbKeyRoll" runat="server"
                Text=""></asp:Label></a>
        </td>
    </tr>
    <tr>
        <td colspan="2" style="height: 6px;">
        </td>
    </tr>
</table>
<script type="text/javascript">

    function showMorePlan(bindType) {
        var json = { BindType: bindType, year: $('#<%=ddlYear.ClientID %>').val(), month: $('#<%=ddlMonth.ClientID %>').val(), ProjViewType: '<%=ProjViewType %>', OrganizationID: '<%=OrganizationID %>', RoleName: '<%=RoleName %>' };
        var url = buildQueryUrl("/EPMS/List/Plan/ProjectPlanInfo.aspx", json);
        showDivDialog(url, "", 1050, 600);
        return false;
    }

</script>
