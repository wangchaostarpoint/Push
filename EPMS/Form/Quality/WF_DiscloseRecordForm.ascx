<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_DiscloseRecordForm.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.Form.Quality.WF_DiscloseRecordForm" %>
<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView" TagPrefix="uc1" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">项目名称<span class="req-star">*</span></td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="tbProjectName" IsMutiple="false" req="1"
                SelectPageMode="Dialog" EnableTheming="false" PageWidth="900px"
                ResultForControls="{'hiOrganizationID':'id','tbProjectCode':'ProjectCode','txtDiscloseUserName':'ManagerUserName','hiDiscloseUserID':'ManagerUserID'}"
                Text="选择项目" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx" ShowJsonRowColName="true"
                ResultAttr="name" ActiveStatus="(23.填写交底记录表)" field="ProjectName" tablename="EPMS_DiscloseRecord" />
            <input type="hidden" id="hiOrganizationID" runat="server" field="OrganizationID" tablename="EPMS_DiscloseRecord" />
        </td>
        <td class="td-l">项目编号</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox" ID="tbProjectCode" runat="server" readonly="readonly"
                ActiveStatus="(23.填写交底记录表)" field="ProjectCode" tablename="EPMS_DiscloseRecord" />
        </td>
    </tr>
    <tr>
        <td class="td-l">记录人<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox" ID="txtRecordUserName" runat="server" readonly="readonly"
                ActiveStatus="(2.填写交底记录表)" field="RecordUserName" tablename="EPMS_DiscloseRecord" />
            <input type="hidden" id="hiRecordUserID" runat="server" field="RecordUserID" tablename="EPMS_DiscloseRecord" />
        </td>
        <td class="td-l">交底人<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector ID="txtDiscloseUserName" runat="server" ActiveStatus="(23.填写交底记录表)"
                TableName="EPMS_DiscloseRecord" Field="DiscloseUserName" class="kpms-textbox"
                IsMutiple="false" SourceMode="SelectorPage" ShowJsonRowColName="true" ResultAttr="name"
                PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" ResultForControls="{'hiDiscloseUserID':'id'}"
                SelectPageMode="Dialog" req="1" />
            <input type="hidden" runat="server" id="hiDiscloseUserID" field="DiscloseUserID" tablename="EPMS_DiscloseRecord" />
        </td>
        <td class="td-l">时间
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtRecordDate" runat="server" readonly="readonly"
                ActiveStatus="(23.填写交底记录表)" field="RecordDate" tablename="EPMS_DiscloseRecord" />
        </td>
    </tr>
    <tr>
        <td class="td-l">记录编号</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbRecordCode" runat="server" CssClass="kpms-textbox"
                ActiveStatus="(23.填写交底记录表)" EnableTheming="false" field="RecordCode" tablename="EPMS_DiscloseRecord" />

        </td>
        <td class="td-l">地点</td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox ID="tbRecordPlace" runat="server" MaxLength="1024" CssClass="kpms-textarea" TextMode="MultiLine"
                ActiveStatus="(23.填写交底记录表)" EnableTheming="false" field="RecordPlace" tablename="EPMS_DiscloseRecord" />

        </td>
    </tr>
    <tr>
        <td class="td-l">参加人员</td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightObjectSelector ID="lbsJoinUserName" runat="server" ActiveStatus="(23.填写交底记录表)"
                TableName="EPMS_DiscloseRecord" Field="JoinUserName" class="kpms-textbox"
                IsMutiple="True" SourceMode="SelectorPage" ShowJsonRowColName="true" ResultAttr="name"
                PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" ResultForControls="{'hiJoinUserID':'id'}"
                SelectPageMode="Dialog" />
            <input type="hidden" runat="server" id="hiJoinUserID" field="JoinUserID" tablename="EPMS_DiscloseRecord" />
        </td>
    </tr>
    <tr>
        <td class="td-l">主要内容<br />
            （重要环安因素<br />
            及控制措施、<br />
            其他安全环保<br />
            注意事项等）<span class="req-star">*</span></td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbMainContent" runat="server" CssClass="kpms-textarea" TextMode="MultiLine"
                ActiveStatus="(23.填写交底记录表)" EnableTheming="false" field="MainContent" tablename="EPMS_DiscloseRecord" />
        </td>
    </tr>
    <tr>
        <td class="td-l">安全环保交底记录清单</td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightFileUploader ID="upLoadFile" runat="server" ActiveStatus="(23.填写交底记录表)" DisplayStatus="(23.填写交底记录表)" OnClick="upLoadFile_Click">
                <span>
                    <img id="imgFile" src="../../Themes/Images/btn_upload.gif" alt="上传文件" width="16"  height="16" />上传文件</span>
            </zhongsoft:LightFileUploader>
            <uc1:AttachmentView ID="Attachment" runat="server" RepeatColumns="3" />
        </td>
    </tr>
</table>
<input id="hiDiscloseRecordID" runat="server" type="hidden" field="DiscloseRecordID" tablename="EPMS_DiscloseRecord" />
