<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ProjResourceChangeForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.OBS.WF_ProjResourceChangeForm" %>
<%@ Register Src="../../UI/Project/ProjectCommon.ascx" TagName="ProjectCommon" TagPrefix="uc1" %>
<%@ Register Src="../../UI/OBS/ProjectMgrUserChange.ascx" TagName="ProjectMgrUserChange"
    TagPrefix="uc3" %>
<%@ Register Src="../../UI/OBS/ProjectSpeUserChange.ascx" TagName="ProjectSpeUserChange"
    TagPrefix="uc5" %>
<table class="tz-table" width="100%">
    <uc1:ProjectCommon ID="ProjectCommon1" runat="server" IsShowProjectUser="true" />
    <uc3:ProjectMgrUserChange ID="ProjectMgrUserChange1" runat="server" />
    <uc5:ProjectSpeUserChange ID="ProjectSpeUserChange1" runat="server" />
    <tr>
        <td class="td-l" nowrap="nowrap">
            提出人<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtPutUserName" IsMutiple="false"
                req="1" activestatus="(2.*)" SourceMode="SelectorPage" ShowJsonRowColName="true"
                DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode" ResultForControls="{'hiUserId':'id'}"
                PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" field="PutUserName" tablename="EPMS_ProjectResource">
            </zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiPutUserId" field="PutUserID" tablename="EPMS_ProjectResource" />
        </td>
        <td colspan="4" class="td-m">
        </td>
        <td class="td-l" nowrap="nowrap" style="display: none;">
            批准人
        </td>
        <td class="td-r" style="display: none;">
            <zhongsoft:LightObjectSelector runat="server" ID="tbConfirmUserName" IsMutiple="false"
                req="1" activestatus="(23.主任工及主设人变更审核)(23.分项设总变更审核)" SourceMode="SelectorPage"
                ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode"
                ResultForControls="{'hiConfirmUserID':'id'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"
                field="ConfirmUserName" tablename="EPMS_ProjectResource"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiConfirmUserID" field="ConfirmUserID" tablename="EPMS_ProjectResource" />
        </td>
        <td class="td-l" style="display: none;">
            批准时间
        </td>
        <td class="td-r" style="display: none;">
            <zhongsoft:XHtmlInputText runat="server" ID="tbConfirmDate" activestatus="(23.主任工及主设人变更审核)(23.分项设总变更审核)"
                EnableTheming="false" req="1" class="kpms-textbox-date" readonly="readonly" field="ConfirmDate"
                tablename="EPMS_ProjectResource" />
        </td>
    </tr>
    <tr>
        <td class="td-l" nowrap="nowrap">
            变更原因
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbChangeReason" runat="server" TextMode="MultiLine" MaxText="512"
                CssClass="kpms-textarea" Width="96%" EnableTheming="false" ActiveStatus="(23.*)"
                Field="ChangeReason" TableName="EPMS_ProjectResource">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l" nowrap="nowrap">
            配置要求
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbResourceRequire" runat="server" TextMode="MultiLine"
                MaxText="512" CssClass="kpms-textarea" Width="96%" EnableTheming="false" ActiveStatus="(23.*)"
                Field="ResourceRequire" TableName="EPMS_ProjectResource">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
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
    tablename="EPMS_ProjectResource" value="4" />
<input type="hidden" id="hiCheckFlowMes" name="hiCheckFlowMes" runat="server" value="项目组成员配置流程还未发起,不能进行变更！" />
<input type="hidden" id="hiCheckFlowMes1" name="hiCheckFlowMes1" runat="server" value="该项目正在走项目组成员变更流程！" />
