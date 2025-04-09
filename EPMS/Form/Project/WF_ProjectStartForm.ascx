<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ProjectStartForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.Project.WF_ProjectStartForm" %>
<%@ Register Src="../../UI/Project/ProjectInfo.ascx" TagName="ProjectInfo" TagPrefix="uc1" %>
<%@ Register Src="../../UI/Project/ProjectSpecialty.ascx" TagName="ProjectSpecialty"
    TagPrefix="uc5" %>
<%@ Register Src="../../UI/Project/ProjectModule.ascx" TagName="ProjectModule" TagPrefix="uc6" %>
<%@ Register Src="../../UI/OBS/ProjectMgrUser.ascx" TagName="ProjectMgrUser" TagPrefix="uc2" %>
<table class="tz-table" width="100%">
    <uc1:ProjectInfo ID="ProjectInfo1" runat="server" />
    <div style="height: 5px">
    </div>
    <table class="tz-table" width="100%">
        <tr>
            <td colspan="6" class="flexible" onclick="openDetail('userInfo')">
                人员信息&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <table id="userInfo" width="100%">
                    <uc2:ProjectMgrUser ID="ucProjectMgrUser" runat="server" />
                </table>
            </td>
        </tr>
    </table>
    <div style="height: 5px">
    </div>
    <uc5:ProjectSpecialty ID="ProjectSpecialty1" runat="server" Visible="false" />
    <uc6:ProjectModule ID="ProjectModule1" runat="server" Visible="false" />
</table>
<!--主键-->
<input type="hidden" id="hiOrganizationId" name="hiOrganizationId" runat="server"
    field="OrganizationId" tablename="EPMS_ProjectEntity" />
<script>
    function initCustomerPlugin() { projectInfo_init(); }
     
</script>
