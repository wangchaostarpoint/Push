<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_WorkReportForm.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.Form.WorkerManage.WF_WorkReportForm" %>
<%@ Register Src="../../../Sys/FileDocument/AttachmentView.ascx" TagName="UpLoadFile"
    TagPrefix="uc3" %>
<table class="tz-table">
    <tr>
        <td class="td-l">工程名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" req="1" IsMutiple="false"
                SelectPageMode="Dialog" ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode','txtProjectPlace':'ProjectPlace'}"
                EnableTheming="false" Text="选择项目" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx" OnClick="txtProjectName_Click"
                PageWidth="850" ShowJsonRowColName="true" ResultAttr="name" activestatus="(23.填写工代汇报信)"
                TableName="EPMS_WorkReportForm" field="ProjectName" />
        </td>
        <td class="td-l">工程编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtProjectCode" runat="server" readonly="readonly"
                activestatus="(23.填写工代汇报信)" class="kpms-textbox" TableName="EPMS_WorkReportForm"
                field="ProjectCode" />
            <input type="hidden" id="hiOrganizationID" runat="server" tablename="EPMS_WorkReportForm"
                field="OrganizationID" />
        </td>
    </tr>
    <tr>
        <td class="td-l">时间<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtReportDate" readonly="readonly"
                req="1" class="kpms-textbox-date" activestatus="(23.填写工代汇报信)"
                TableName="EPMS_WorkReportForm" field="ReportDate" />
        </td>
        <td class="td-l">工代汇报编号<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbReportCode" field="ReportCode" tablename="EPMS_WorkReportForm"
                req="1" CssClass="kpms-textbox" EnableTheming="false" activestatus="(23.填写工代汇报信)"
                maxtext="64"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">工地<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox runat="server" ID="tbWorkSite" field="WorkSite" tablename="EPMS_WorkReportForm"
                req="1" CssClass="kpms-textbox" EnableTheming="false" activestatus="(23.填写工代汇报信)"
                maxtext="64"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l">工代组长
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtGroupLeaderName" IsMutiple="false"
                SelectPageMode="Dialog" activestatus="(23.填写工代汇报信)"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                ShowAttrs="name,UserCode" ResultForControls="{'hiGroupLeaderID':'id'}"
                PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" tablename="EPMS_WorkReportForm"
                field="GroupLeaderName"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiGroupLeaderID" tablename="EPMS_WorkReportForm"
                field="GroupLeaderID" />
        </td>
    </tr>
    <tr>
        <td class="td-l">汇报人<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText ID="txtReportUserName" runat="server" readonly="readonly"
                activestatus="(23.填写工代汇报信)" class="kpms-textbox" TableName="EPMS_WorkReportForm"
                field="ReportUserName" />
            <input type="hidden" id="hiReportUserID" runat="server" tablename="EPMS_WorkReportForm"
                field="ReportUserID" />
        </td>
        <td class="td-l">专业<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlParamSpecialtyID" field="ParamSpecialtyID"
                tablename="EPMS_WorkReportForm" activestatus="(23.填写工代汇报信)" EnableTheming="True"
                req="1">
            </zhongsoft:LightDropDownList>
            <input type="hidden" runat="server" id="hiSpecialtyName" tablename="EPMS_WorkReportForm"
                field="SpecialtyName" />
        </td>
    </tr>
    <tr>
        <td class="td-l">工地现有工代名单</td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightObjectSelector runat="server" ID="txtWorkerUserNames" IsMutiple="true"
                SelectPageMode="Dialog" activestatus="(23.填写工代汇报信)"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                ShowAttrs="name,UserCode" ResultForControls="{'hiWorkerUserIDs':'id'}"
                PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" tablename="EPMS_WorkReportForm"
                field="WorkerUserNames"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiWorkerUserIDs" tablename="EPMS_WorkReportForm"
                field="WorkerUserIDs" /></td>
    </tr>
    <tr>
        <td class="td-l">一、主要施工情况（项目、进度等）
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbProjectSituation" runat="server" activestatus="(23.填写工代汇报信)"
                CssClass="kpms-textarea" EnableTheming="false" maxtext="1024" Rows="4" TextMode="MultiLine"
                field="ProjectSituation" tablename="EPMS_WorkReportForm"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">二、施工中发现的设计问题及处理情况
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbProjectQuestion" runat="server" activestatus="(23.填写工代汇报信)"
                CssClass="kpms-textarea" EnableTheming="false" maxtext="1024" Rows="4" TextMode="MultiLine"
                field="ProjectQuestion" tablename="EPMS_WorkReportForm"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">截至汇报信发出日期，设计变更通知单编号
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbChangeAllCode" runat="server" activestatus="(23.填写工代汇报信)"
                CssClass="kpms-textarea" EnableTheming="false" maxtext="1024" Rows="4" TextMode="MultiLine"
                field="ChangeAllCode" tablename="EPMS_WorkReportForm"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">三、生产、施工方面的要求和处理意见
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbProjectRequire" runat="server" activestatus="(23.填写工代汇报信)"
                CssClass="kpms-textarea" EnableTheming="false" maxtext="1024" Rows="4" TextMode="MultiLine"
                field="ProjectRequire" tablename="EPMS_WorkReportForm"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">四、需公司内解决的问题
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbCompanyQuestion" runat="server" activestatus="(23.填写工代汇报信)"
                CssClass="kpms-textarea" EnableTheming="false" maxtext="1024" Rows="4" TextMode="MultiLine"
                field="CompanyQuestion" tablename="EPMS_WorkReportForm"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">五、其它（包括对优秀图纸的评价、<br />
            施工中好的经验或其它问题）
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbOtherQuestion" runat="server" activestatus="(23.填写工代汇报信)"
                CssClass="kpms-textarea" EnableTheming="false" maxtext="1024" Rows="4" TextMode="MultiLine"
                field="OtherQuestion" tablename="EPMS_WorkReportForm"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">附件
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightFileUploader runat="server" ID="lbtnAttachment" EnableTheming="false"
                DisplayStatus="(3.填写工代汇报信)" OnClick="lbtnAttachment_Click"><img src="../../Themes/Images/btn_upload.gif" />
                        <span>上传附件</span></zhongsoft:LightFileUploader><span class="req-star" style="float: right;"
                            id="Span2" runat="server" displaystatus="(2.*)"> 请先保存再上传附件</span>
            <uc3:UpLoadFile ID="upAttachment" runat="server" />
            <input type="hidden" runat="server" id="hiAttachmentID" field="AttachmentID"
                tablename="EPMS_WorkReportForm" />
        </td>
    </tr>
</table>
<%--隐藏控件--%>
<input type="hidden" runat="server" id="hiWorkReportFormID" field="WorkReportFormID"
    tablename="EPMS_WorkReportForm" />

