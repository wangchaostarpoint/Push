<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProjectMgrAllCtrls.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Project.ProjectMgrAllCtrls" %>
<%@ Register Src="~/EPMS/UI/Plan/ProjectPlan.ascx" TagName="C_ProjPlan" TagPrefix="uc1" %>
<%@ Register Src="~/EPMS/UI/Publish/ProjectPublish.ascx" TagName="C_ProjPublish"
    TagPrefix="uc2" %>
<%@ Register Src="~/EPMS/UI/Project/ProjectUser.ascx" TagName="C_ProjUser" TagPrefix="uc3" %>
<%@ Register Src="~/EPMS/UI/Project/ProjectAlert.ascx" TagName="C_ProjAlert" TagPrefix="uc4" %>
<%@ Register Src="~/EPMS/UI/Quality/ProjectQuality.ascx" TagName="C_ProjQuality"
    TagPrefix="uc5" %>
<%@ Register Src="~/EPMS/UI/Risk/ProjectRiskAlert.ascx" TagName="C_ProjRisk" TagPrefix="uc6" %>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="list_borderbottom">
    <tr>
        <td class="list-title">
            &nbsp;<asp:Label ID="lbTitle" runat="server" Text="<%=hiFZTxt.Value %>"></asp:Label>
        </td>
    </tr>
</table>
<table width="100%" style="background: #fff;">
    <tr>
        <td valign="top" style="width: 50%;">
            <uc1:C_ProjPlan ID="C_ProjPlan1" runat="server" />
        </td>
        <td valign="top">
            <uc2:C_ProjPublish ID="C_ProjPublish1" runat="server" />
        </td>
    </tr>
    <tr>
        <td colspan="2" valign="top">
            <uc3:C_ProjUser ID="C_ProjUser1" runat="server" />
        </td>
    </tr>
    <tr>
        <td valign="top">
            <uc4:C_ProjAlert ID="C_ProjAlert1" runat="server" />
        </td>
        <td valign="top">
            <uc5:C_ProjQuality ID="C_ProjQuality1" runat="server" />
        </td>
    </tr>
    <tr>
        <td colspan="2" valign="top">
            <uc6:C_ProjRisk ID="C_ProjRisk1" runat="server" />
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiGZTxt" value="当前显示的是我关注的所有项目，请在左侧选择项目" />
<input type="hidden" runat="server" id="hiFZTxt" value="当前显示的是我负责的所有项目，请在左侧选择项目" />
