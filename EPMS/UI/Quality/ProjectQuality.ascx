<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProjectQuality.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Quality.ProjectQuality" %>
<table width="98%" border="0" cellspacing="0" cellpadding="0" class="list_borderbottom">
    <tr>
        <td colspan="4" class="list-header proQuality">
            质量预警<span style="padding-right: 10px; float: right;"><a id="quality" onclick="showMoreQuality()"><img
                title="更多" src="../../Themes/custom/images/read_more.png" /></a></span>
        </td>
    </tr>
    <tr align="center">
        <th style="text-align: center;" class="td-plan">
            名称
        </th>
        <th style="text-align: center;" class="td-plan">
            预警原因
        </th>
        <th style="text-align: center;" class="td-plan">
            预警日期
        </th>
        <th style="text-align: center;" class="td-plan">
            负责人
        </th>
    </tr>
    <asp:Repeater runat="server" ID="metroRepeater" OnItemDataBound="metroRepeater_ItemDataBound">
        <ItemTemplate>
            <tr>
                <td style="line-height: 18px;">
                    <a onclick="return viewTask('<%#Eval("WBSID") %>')">&nbsp;<asp:Label ID="lbName"
                        runat="server" Text=""></asp:Label>
                    </a>
                </td>
                <td>
                    &nbsp;<%#Eval("Reason")%>
                </td>
                <td>
                    &nbsp;<asp:Label ID="lbAlertTime" runat="server" Text=""></asp:Label>
                </td>
                <td>
                    &nbsp;<%#Eval("UserName")%>
                </td>
            </tr>
        </ItemTemplate>
    </asp:Repeater>
    <asp:Literal runat="server" ID="ltEpmty"></asp:Literal>
</table>
<input type="hidden" runat="server" id="hiCnt" value="6" />
<script type="text/javascript">
    function showMoreQuality() {
        var url = $appCtx.appPath + "/EPMS/List/Quality/ProjectQualityInfoList.aspx";
        url += "?OrganizationID=" + "<%=OrganizationID %>" + "&ProjViewType=" + "<%=ProjViewType %>" + "&RoleName=" + "<%=RoleName %>";
        showDivDialog(url, "", 1050, 530);
        return false;
    }

    function viewTask(wbsId) {
        var json = { actionType: 1, bizId: wbsId };
        var url = buildQueryUrl('/EPMS/List/WBS/WBSEditor.aspx', json);
        var callBack = null;
        showDivDialog(url, "", 1050, 600, callBack);
    }
</script>
