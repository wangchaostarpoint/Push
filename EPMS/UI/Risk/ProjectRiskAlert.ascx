<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProjectRiskAlert.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Risk.ProjectRiskAlert" %>
<table width="98%" border="0" cellspacing="0" cellpadding="0" class="list_borderbottom">
    <tr>
        <td class="list-header risk" colspan="2">
            项目风险<span style="padding-right: 10px; float: right;"><a id="risk" onclick="showMoreRisk()"><img
                title="更多" src="../../Themes/custom/images/read_more.png" /></a></span>
        </td>
    </tr>
    <tr align="center">
        <th style="text-align: center;" class="td-plan">
            项目
        </th>
        <th style="text-align: center;" class="td-plan2">
            风险
        </th>
    </tr>
    <asp:Repeater runat="server" ID="metroRepeater">
        <ItemTemplate>
            <tr>
                <td>
                    <a onclick="return ViewItem('<%#Eval("OrganizationId") %>')" title='<%# Eval("ProjectName")%>'>
                        <%#Eval("ProjectCode")%>&nbsp;<%#Eval("ProjectName")%>
                    </a>
                </td>
                <td>
                    <%#Eval("RiskDescription")%>
                </td>
            </tr>
        </ItemTemplate>
    </asp:Repeater>
    <asp:Literal runat="server" ID="ltEpmty"></asp:Literal>
</table>
<input type="hidden" runat="server" id="hiCnt" value="6" />
<script type="text/javascript">
    function initCustomerPlugin() {
        //$(window.parent.iFrameHeight(self.frameElement.id, "left"));
    }
    function showMoreRisk() {
        var json = { ProjViewType: '<%=ProjViewType %>', OrganizationID: '<%=OrganizationID %>', RoleName: '<%=RoleName %>' };
        var url = buildQueryUrl("/EPMS/List/Risk/ProjectRiskAlertInfo.aspx", json);
        showDivDialog(url, null, 1250, 550);
        return false;
    }

    function ViewItem(OrganizationID) {
        var url = "/EPMS/List/Project/ProjectEditor.aspx";
        var json = { actionType: 1, bizId: OrganizationID };
        url = buildQueryUrl(url, json);
        showDivDialog(url, "", 1050, 600);
        return false;
    }
</script>
