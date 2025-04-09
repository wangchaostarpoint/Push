<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    CodeBehind="ProjectEditor.aspx.cs" Title="项目信息" Inherits="Zhongsoft.Portal.EPMS.List.Project.ProjectEditor"
    Debug="true" %>

<%@ Register Src="../../UI/Project/ProjectCommon.ascx" TagName="ProjectCommon" TagPrefix="uc7" %>

<%@ Register Src="../../UI/Project/ProjectInfo.ascx" TagName="ProjectInfo" TagPrefix="uc1" %>
<%@ Register Src="../../UI/Project/ProjectSpecialty.ascx" TagName="ProjectSpecialty"
    TagPrefix="uc5" %>
<%@ Register Src="../../UI/Project/ProjectModule.ascx" TagName="ProjectModule" TagPrefix="uc6" %>
<%@ Register Src="../../UI/OBS/ProjectMgrUser.ascx" TagName="ProjectMgrUser" TagPrefix="uc2" %>
<%@ Register Src="../../UI/OBS/ProjectSpeUser.ascx" TagName="ProjectSpeUser" TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <uc1:ProjectInfo ID="ProjectInfo1" runat="server" Visible="false" />
        <uc7:ProjectCommon ID="ProjectCommon" runat="server" />
        <div style="height: 5px">
        </div>
        <table class="tz-table" width="100%">
            <tr>
                <td colspan="6" class="flexible" onclick="openDetail('userInfo')">人员信息&nbsp;<img src="<%=WebAppPath %>/themes/images/lright.png" />
                </td>
            </tr>
            <tr>
                <td colspan="6">
                    <table id="userInfo" width="100%">
                        <uc2:ProjectMgrUser ID="ucProjectMgrUser" runat="server" />
                        <uc3:ProjectSpeUser ID="ProjectSpeUser1" runat="server" />
                    </table>
                </td>
            </tr>
        </table>
        <uc5:ProjectSpecialty ID="ProjectSpecialty1" runat="server" Visible="false" />
        <uc6:ProjectModule ID="ProjectModule1" runat="server" />
    </table>
    <!--主键-->
    <input type="hidden" id="hiOrganizationId" name="hiOrganizationId" runat="server"
        field="OrganizationID" tablename="EPMS_ProjectEntity" />
    <script type="text/javascript">
        function InitCustomerPlugin() {
            checkMaxLength();
            projectInfo_init();
        }

        function KPMSCheckSubmit() {
            if (!CompareDate())
                return false;
            return true;
        }

    </script>
</asp:Content>
