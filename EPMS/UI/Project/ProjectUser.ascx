<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProjectUser.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Project.ProjectUser" %>
<table width="98%" border="0" cellspacing="0" cellpadding="0" class="list_borderbottom">
    <tr>
        <td colspan="7" class="list-header user">
            项目人员负荷预警<span style="padding-right: 10px; float: right;"><a id="staff" onclick="viewUserMore('')"><img
                title="更多" src="../../Themes/custom/images/read_more.png" /></a></span>
        </td>
    </tr>
    <tr align="center">
        <th style="text-align: center;" class="td-plan">
            工号/姓名
        </th>
        <th style="text-align: center;" class="td-plan">
            部门
        </th>
        <th style="text-align: center;" class="td-plan">
            座机
        </th>
        <th style="text-align: center;" colspan="2" class="td-plan2">
            当前工作
        </th>
    </tr>
    <asp:Repeater runat="server" ID="metroRepeater" OnItemDataBound="metroRepeater_ItemDataBound">
        <ItemTemplate>
            <tr>
                <td>
                    &nbsp;<%#Eval("LoginId")%>/<%#Eval("UserName")%>
                </td>
                <td>
                    <asp:Label ID="lbDept" runat="server" Text=""></asp:Label>
                </td>
                <td>
                    &nbsp;<%#Eval("Phone")%>
                </td>
                <td style="line-height: 18px;">
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a id="work" onclick="viewUserState('<%#Eval("UserId")%>')">
                        <asp:Label ID="lbTask" runat="server" Text=""></asp:Label>
                    </a><a>
                        <asp:Label ID="lbMyPlan" runat="server"></asp:Label></a> <a>
                            <asp:Label ID="lbOtherPlan" runat="server"></asp:Label></a>
                </td>
            </tr>
        </ItemTemplate>
    </asp:Repeater>
    <asp:Literal runat="server" ID="ltEpmty"></asp:Literal>
</table>
<input type="hidden" runat="server" id="hiCnt" value="6" />
<script type="text/javascript">
    //查看更多
    function viewUserMore(userID) {
        var url = $appCtx.appPath + "/EPMS/List/Project/ProjectUserList.aspx";
        url += "?UserID=" + userID + "&OrganizationID=" + "<%=OrganizationID %>" + "&ProjViewType=" + "<%=ProjViewType %>" + "&RoleName=" + "<%=RoleName %>";
        showDivDialog(url, "", 1050, 550);
        return false;
    }
    //查看人员状态
    function viewUserState(userID) {
        var url = "/EPMS/List/OBS/CurrentTaskDetailList.aspx";
        var json = { userid: userID, secid: "C3455630-E393-4F75-B471-0E9151C39A6B" };
        url = buildQueryUrl(url, json);
        showDivDialog(url, "", 1050, 600);
        return false;
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
