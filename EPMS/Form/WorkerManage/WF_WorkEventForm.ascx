<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_WorkEventForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.WorkerManage.WF_WorkEventForm" %>
<table class="tz-table">
    <tr>
        <td class="td-l">工程名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" req="1" IsMutiple="false"
                SelectPageMode="Dialog" ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode','txtProjectPlace':'ProjectPlace'}"
                EnableTheming="false" Text="选择项目" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx" OnClick="txtProjectName_Click"
                PageWidth="850" ShowJsonRowColName="true" ResultAttr="name" activestatus="(23.填写工程服务记录)"
                TableName="EPMS_WorkEventForm" field="ProjectName" />
        </td>
        <td class="td-l">工程编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtProjectCode" runat="server" readonly="readonly"
                activestatus="(23.填写工程服务记录)" class="kpms-textbox" TableName="EPMS_WorkEventForm"
                field="ProjectCode" />
            <input type="hidden" id="hiOrganizationID" runat="server" tablename="EPMS_WorkEventForm"
                field="OrganizationID" />
        </td>
    </tr>
    <tr>
        <td class="td-l">工程所在地
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText ID="txtProjectPlace" runat="server" readonly="readonly"
                activestatus="(23.填写工程服务记录)" class="kpms-textbox" TableName="EPMS_WorkEventForm"
                field="ProjectPlace" />
        </td>
        <td class="td-l">服务日期<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtStartDate" readonly="readonly"
                req="1" class="kpms-textbox-comparedate" compare="1" activestatus="(23.填写工程服务记录)"
                TableName="EPMS_WorkEventForm" field="StartDate" />
            ~ 
            <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtEndDate" readonly="readonly"
                req="1" class="kpms-textbox-comparedate" compare="1" activestatus="(23.填写工程服务记录)"
                TableName="EPMS_WorkEventForm" field="EndDate" />
        </td>
    </tr>
    <tr>
        <td class="td-l">工代
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtWorkerUserName" IsMutiple="false"
                SelectPageMode="Dialog" activestatus="(23.填写工程服务记录)"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                ShowAttrs="name,UserCode" ResultForControls="{'hiWorkerUserID':'id'}"
                PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" tablename="EPMS_WorkEventForm"
                field="WorkerUserName"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiWorkerUserID" tablename="EPMS_WorkEventForm"
                field="WorkerUserID" />
        </td>
        <td class="td-l">专业<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlParamSpecialtyID" field="ParamSpecialtyID"
                tablename="EPMS_WorkEventForm" activestatus="(23.填写工程服务记录)" EnableTheming="True"
                req="1">
            </zhongsoft:LightDropDownList>
            <input type="hidden" runat="server" id="hiSpecialtyName" tablename="EPMS_WorkEventForm"
                field="SpecialtyName" />
        </td>
        <td class="td-l">服务记录编号<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbServiceCode" field="ServiceCode" tablename="EPMS_WorkEventForm"
                req="1" CssClass="kpms-textbox" EnableTheming="false" activestatus="(23.填写工程服务记录)"
                maxtext="64"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">服务内容<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbServiceContent" field="ServiceContent" tablename="EPMS_WorkEventForm"
                req="1" CssClass="kpms-textarea" EnableTheming="false" Rows="4" activestatus="(23.填写工程服务记录)"
                TextMode="MultiLine" maxtext="1024"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">本次服务发出的“设计变更单”<br />
            和“设计联系单”编号
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbReleCode" field="ReleCode" tablename="EPMS_WorkEventForm"
                CssClass="kpms-textarea" EnableTheming="false" Rows="4" activestatus="(23.填写工程服务记录)"
                TextMode="MultiLine" maxtext="256"></zhongsoft:LightTextBox>
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiWorkEventFormID" field="WorkEventFormID"
    tablename="EPMS_WorkEventForm" />
