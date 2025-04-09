<%@ Page Language="C#" AutoEventWireup="true" Title="项目组成员编辑" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    CodeBehind="ProjectTeamMemberEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.ProjectTeamMemberEditor" %>

<%@ Register Src="../../UI/Project/ProjectCommon.ascx" TagName="ProjectCommon" TagPrefix="uc1" %>
<%@ Register Src="../../UI/OBS/ProjectMgrUser.ascx" TagName="ProjectMgrUser" TagPrefix="uc2" %>
<%@ Register Src="../../UI/OBS/ProjectSpeUser.ascx" TagName="ProjectSpeUser" TagPrefix="uc3" %>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" width="100%">
        <uc1:ProjectCommon ID="ProjectCommon1" runat="server" />
        <tr>
            <td class="td-l" nowrap="nowrap">
                提出人<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtPutUserName" IsMutiple="false"
                    req="1" activestatus="(2.*)" SourceMode="SelectorPage" ShowJsonRowColName="true"
                    DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode" ResultForControls="{'hiPutUserId':'id'}"
                    PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" field="PutUserName" tablename="EPMS_ProjectResource">
                </zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiPutUserId" field="PutUserID" tablename="EPMS_ProjectResource" />
            </td>
            <td class="td-l" nowrap="nowrap">
                关联项目立项通知单
            </td>
            <td class="td-r">
                <a runat="server" id="aProjectTask" title="点击查看项目立项通知单流程" style="text-decoration: underline;
                    color: #0033FF;"></a>
                <asp:Label runat="server" ID="lbNoTaskMsg" Text="该项目没有项目立项通知单" ForeColor="Red" Visible="false"></asp:Label>
            </td>
            <td class="td-l" nowrap="nowrap">
                关联工程项目启动通知单
            </td>
            <td class="td-m" colspan="3">
                <a runat="server" id="aProjectStart" title="点击查看工程项目启动通知单流程" style="text-decoration: underline;
                    color: #0033FF;"></a>
                <asp:Label runat="server" ID="lbNoProjectStartMsg" Text="该项目没有工程项目启动通知单" ForeColor="Red"
                    Visible="false"></asp:Label>
            </td>
        </tr>
        <uc2:ProjectMgrUser ID="ProjectMgrUser1" runat="server" />
        <uc3:ProjectSpeUser ID="ProjectSpeUser1" runat="server" />
    </table>
    <!--主键 -->
    <input type="hidden" id="hiProjectResourceID" name="hiProjectResourceID" runat="server"
        field="ProjectResourceID" tablename="EPMS_ProjectResource" />
    <input type="hidden" id="hiOrganizationId" name="hiOrganizationId" runat="server"
        field="OrganizationID" tablename="EPMS_ProjectResource" />
    <input type="hidden" id="hiProjectCode" name="hiProjectCode" runat="server" field="ProjectCode"
        tablename="EPMS_ProjectResource" />
    <input type="hidden" id="hiProjectName" name="hiProjectName" runat="server" field="ProjectName"
        tablename="EPMS_ProjectResource" />
    <input type="hidden" id="hiResourceType" name="hiResourceType" runat="server" field="ResourceType"
        tablename="EPMS_ProjectResource" value="3" />
    <input type="hidden" id="hiCheckFlowMes" name="hiCheckFlowMes" runat="server" value="已经存在发起的项目组成员配置流程,不能重复发起！" />
    <script>
        function initCustomerPlugin() {
        }
    </script>
</asp:Content>
