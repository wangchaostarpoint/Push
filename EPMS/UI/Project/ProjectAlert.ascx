<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProjectAlert.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Project.ProjectAlert" %>
<table width="98%" border="0" cellspacing="0" cellpadding="0" class="list_borderbottom">
    <tr>
        <td colspan="5" class="list-header projAlert">
            进度预警<span style="padding-right: 10px; float: right;"><a id="schedule" onclick="showMoreAlert()"><img
                title="更多" src="../../Themes/custom/images/read_more.png" /></a></span>
        </td>
    </tr>
    <tr align="center">
        <th style="text-align: center;" class="td-plan">
            名称
        </th>
        <th style="text-align: center;" class="td-plan">
            预警日期
        </th>
        <th style="text-align: center;" class="td-plan">
            预警原因
        </th>
        <th style="text-align: center;" class="td-plan">
            负责人
        </th>
        <th style="text-align: center;" class="td-plan">
            影响
        </th>
    </tr>
    <asp:Repeater runat="server" ID="metroRepeater" OnItemDataBound="metroRepeater_ItemDataBound">
        <ItemTemplate>
            <tr>
                <td>
                    <a onclick="return viewTask('<%#Eval("WBSID") %>')">&nbsp;<asp:Label ID="lbName"
                        runat="server" Text=""></asp:Label>
                    </a>
                </td>
                <td>
                    &nbsp;<asp:Label ID="lbPlanDate" runat="server" Text=""></asp:Label>
                </td>
                <td>
                    &nbsp;<%#Eval("AlertReason") %>
                </td>
                <td>
                    &nbsp;<%#Eval("UserName")%>
                </td>
                <td>
                    <a>&nbsp;<asp:Label ID="lbNum" runat="server" Text='<%#string.Format("影响设计{0}卷", Eval("RelateRollCount"))%>'></asp:Label></a>
                </td>
            </tr>
        </ItemTemplate>
    </asp:Repeater>
    <asp:Literal runat="server" ID="ltEpmty"></asp:Literal>
</table>
<input type="hidden" runat="server" id="hiCnt" value="6" />
<script type="text/javascript">
    function showMoreAlert() {
        var url = $appCtx.appPath + "/EPMS/List/Project/ProjectAlertList.aspx";
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

    //查看卷册
    function viewDetail(rollID) {
        var url = "/EPMS/List/WBS/C_RollList.aspx";
        var json = { RollIds: rollID, secid: "9dd62921-edc5-4767-b46a-817756ea5ca7" };
        url = buildQueryUrl(url, json);
        showDivDialog(url, "", 1050, 600);
        return false;
    }
</script>
