<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ProjectNoticeForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.Project.WF_ProjectNoticeForm" %>
<%@ Register Src="~/EPMS/UI/Project/ProjectGrid.ascx" TagName="ProjectGrid" TagPrefix="uc1" %>
<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"
    TagPrefix="uc2" %>
<script type="text/javascript">
    function initCustomerPlugin() {
        if (typeof (initProjectGrid) == 'function') {
            initProjectGrid();
        }
    }

    function checkForm() {
        if ($formAction == 0) {//0 表示发送
            //必须选定一个主项目
            //            if ($actName == "发起项目通知") {
            //                var json = { "bizid": "<%--<%=BusinessObjectId %>--%>" };
            //                var count = formCallback("MajorProjectNum", json);
            //                if (count > 0) {
            //                    return true;
            //                } else {
            //                    alert("请添加项目并指定一个主项目");
            //                    return false;
            //                }
            //            }
        }
        return true;
    }

    function funcSpeFilter() {
        var projID = $('#<%=hiOrganizationID.ClientID %>').val();

        return { OrganizationID: projID };
    }
</script>
<table class="tz-table" width="100%">
    <tr>
        <td colspan="6" class="td-m flexible">
            通知信息
        </td>
    </tr>
    <tr>
        <td class="td-l">
            项目名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsSelectProject" req="1" IsMutiple="false"
                SelectPageMode="Dialog" ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode'}"
                EnableTheming="false" Text="选择项目" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx" OnClick="lbsSelectProject_OnClick"
                PageWidth="850" ShowJsonRowColName="true" ResultAttr="name" activestatus="(23.发起项目通知)(23.发起项目通知)"
                TableName="EPMS_NotifyForm" field="ProjectName" />
        </td>
        <td class="td-l">
            项目编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtProjectCode" runat="server" readonly="readonly"
                activestatus="(23.发起项目通知)(23.发起项目通知)" maxlength="16" class="kpms-textbox" TableName="EPMS_NotifyForm"
                field="ProjectCode" />
            <input type="hidden" id="hiOrganizationID" runat="server" tablename="EPMS_NotifyForm"
                field="OrganizationID" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            通知主题<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox runat="server" ID="tbNotifyTheme" req="1" MaxLength="256"
                tablename="EPMS_NotifyForm" field="NotifyTheme" activestatus="(23.发起项目通知)(23.发起项目通知)"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l">
            编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtBookCode" tablename="EPMS_NotifyForm"
                readonly="readonly" class="kpms-textbox" field="BookCode" activestatus="(23.发起项目通知)">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            通知类型<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlNotifyType" req="1" tablename="EPMS_NotifyForm"
                field="NotifyType" activestatus="(23.发起项目通知)(23.发起项目通知)" AutoPostBack="true"
                OnSelectedIndexChanged="ddlNotifyType_SelectedIndexChanged">
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l">
            通知发送时间
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtNotifySendTime" runat="server" type="text" class="kpms-textbox-date"
                tablename="EPMS_NotifyForm" field="NotifySendTime" readonly="readonly" activestatus="(23.发起项目通知)(23.发起项目通知)" />
        </td>
        <td class="td-l">
            需办结时间
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtFinishDate" runat="server" type="text" class="kpms-textbox-date"
                tablename="EPMS_NotifyForm" field="FinishDate" readonly="readonly" activestatus="(23.发起项目通知)(23.发起项目通知)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            编制(编写)人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtWriteUserName" runat="server" TableName="EPMS_NotifyForm"
                Field="WriteUserName" activestatus="(23.发起项目通知)(23.发起项目通知)" class="kpms-textbox"
                readonly="readonly">
            </zhongsoft:XHtmlInputText>
            <input id="hiWriteUserCode" type="hidden" runat="server" tablename="EPMS_NotifyForm"
                field="WriteUserCode" />
            <input id="hiWriteUserID" type="hidden" runat="server" tablename="EPMS_NotifyForm"
                field="WriteUserID" />
        </td>
        <td class="td-l">
            编制(编写)部门
        </td>
        <td class="td-r">
            <%--  <zhongsoft:LightObjectSelector runat="server" ID="txtWriteDeptName" req="1" IsMutiple="false"
                SelectPageMode="Dialog" activestatus="(23.发起项目通知)(23.发起项目通知)" SourceMode="SelectorPage"
                ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode"
                ResultForControls="{'hiWriteDeptID':'id'}" PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx"
                tablename="EPMS_NotifyForm" field="WriteDeptName"></zhongsoft:LightObjectSelector>--%>
            <zhongsoft:XHtmlInputText ID="tbWriteDeptName" runat="server" TableName="EPMS_NotifyForm"
                Field="WriteDeptName" activestatus="(23.发起项目通知)(23.发起项目通知)" class="kpms-textbox"
                readonly="readonly">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" runat="server" id="hiWriteDeptID" tablename="EPMS_NotifyForm"
                field="WriteDeptID" />
        </td>
        <td class="td-l">
            联系电话
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtPhone" runat="server" TableName="EPMS_NotifyForm"
                Field="Phone" activestatus="(23.发起项目通知)(23.发起项目通知)" class="kpms-textbox" readonly="readonly">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            通知内容
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbNotifyContent" TextMode="MultiLine"
                CssClass="kpms-textarea" EnableTheming="false" MaxLength="1024" tablename="EPMS_NotifyForm"
                field="NotifyContent" activestatus="(23.发起项目通知)(23.发起项目通知)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            需分发专业<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsSelectSpe" req="1" IsMutiple="true"
                SelectPageMode="Dialog" ResultForControls="{'hiProjectSpeId':'id'}" EnableTheming="false"
                Text="选择专业" FilterFunction="funcSpeFilter()" PageUrl="~/EPMS/Obsolete/SpeSelector.aspx"
                PageWidth="850" ShowJsonRowColName="true" ResultAttr="name" activestatus="(23.发起项目通知)(23.审批)"
                TableName="EPMS_NotifyForm" field="ProjectSpeName" />
            <input type="hidden" runat="server" id="hiProjectSpeId" tablename="EPMS_NotifyForm"
                field="ProjectSpeId" />
        </td>
    </tr>
    <uc1:ProjectGrid runat="server" ID="ucProjectGrid" />
    <tr>
        <td class="td-l">
            备注
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbMemo" TextMode="MultiLine" CssClass="kpms-textarea"
                EnableTheming="false" MaxLength="1024" tablename="EPMS_NotifyForm" field="Memo"
                activestatus="(23.发起项目通知)(23.发起项目通知)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">附件</td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightFileUploader runat="server" ID="lbtnUpload" EnableTheming="false"
                DisplayStatus="(23.发起项目通知)" OnClick="lbtnUpload_OnClick"><img src="../../Themes/Images/btn_upload.gif" />
                <span>上传附件</span></zhongsoft:LightFileUploader>
            <uc2:AttachmentView ID="uploadFile" runat="server" />
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiNotifyFormID" tablename="EPMS_NotifyForm"
    field="NotifyFormID" />
