<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ProjMgrUserChangeForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.OBS.WF_ProjMgrUserChangeForm" %>
<%@ Register Src="../../UI/Project/ProjectCommon.ascx" TagName="ProjectCommon" TagPrefix="uc1" %>
<%@ Register Src="../../UI/OBS/ProjectMgrUserChange.ascx" TagName="ProjectMgrUserChange"
    TagPrefix="uc3" %>
<table class="tz-table" width="100%">
    <uc1:ProjectCommon ID="ProjectCommon1" runat="server" />
    <tr>
        <td class="td-l">
            是否重要项目<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <asp:RadioButtonList ID="rdblIsImportantProject" runat="server" ActiveStatus="(23.?)"
                RepeatColumns="2">
                <asp:ListItem Text="是" Value="1"></asp:ListItem>
                <asp:ListItem Text="否" Value="0"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
        <td colspan="4" class="td-m">
        </td>
    </tr>
    <uc3:ProjectMgrUserChange ID="ProjectMgrUserChange1" runat="server" />
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
        <td class="td-l" nowrap="nowrap">
            批准人
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="tbConfirmUserName" IsMutiple="false"
                req="1" activestatus="(23.审批)(23.批准)" SourceMode="SelectorPage" ShowJsonRowColName="true"
                DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode" ResultForControls="{'hiConfirmUserID':'id'}"
                PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" field="ConfirmUserName" tablename="EPMS_ProjectResource"
                ShowSelectBtn="false"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiConfirmUserID" field="ConfirmUserID" tablename="EPMS_ProjectResource" />
        </td>
        <td class="td-l">
            批准时间
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="tbConfirmDate" activestatus="(23.审批)(23.批准)"
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
                Field="ChangeReason" TableName="EPMS_ProjectResource"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l" nowrap="nowrap">
            任命要求
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbResourceRequire" runat="server" TextMode="MultiLine"
                MaxText="512" CssClass="kpms-textarea" Width="96%" EnableTheming="false" ActiveStatus="(23.*)"
                Field="ResourceRequire" TableName="EPMS_ProjectResource"></zhongsoft:LightTextBox>
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
    tablename="EPMS_ProjectResource" value="2" />
<input type="hidden" id="hiCheckFlowMes" name="hiCheckFlowMes" runat="server" value="《项目设总任命》流程未完成，不能进行设总或者总工的变更！" />
