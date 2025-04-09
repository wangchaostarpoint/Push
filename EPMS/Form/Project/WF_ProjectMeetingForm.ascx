<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ProjectMeetingForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.Project.WF_ProjectMeetingForm" %>

<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"
    TagPrefix="uc1" %>
<script type="text/javascript">
    function initCustomerPlugin() {
        if (typeof (initProjectGrid) == 'function') {
            initProjectGrid();
        }
    }

    function checkForm() {
        if ($formAction == 0) {//0 表示发送
            //必须选定一个主项目
            //            if ($actName == "编制会议纪要") {
            //                var json = { "bizid": "<%=BusinessObjectId %>" };
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
</script>
<table class="tz-table" width="100%">
    <tr style="display: none">
        <td colspan="6" class="td-m flexible">会议信息
        </td>
    </tr>
    <tr>
        <td class="td-l">项目名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsSelectProject" req="1" IsMutiple="false"
                SelectPageMode="Dialog" ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode'}"
                EnableTheming="false" Text="选择项目" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                PageWidth="800" ShowJsonRowColName="true" ResultAttr="name" AfterSelect="afterSelect()"
                activestatus="(23.编制会议纪要)" TableName="EPMS_MeetingForm" field="ProjectName"
                OnClick="lbsSelectProject_OnClick" />
        </td>
        <td class="td-l">项目编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtProjectCode" runat="server" readonly="readonly"
                activestatus="(23.编制会议纪要)" maxlength="16" class="kpms-textbox" TableName="EPMS_MeetingForm"
                field="ProjectCode" />
            <input type="hidden" id="hiOrganizationID" runat="server" tablename="EPMS_MeetingForm"
                field="OrganizationID" />
        </td>
    </tr>
    <tr>
        <td class="td-l">会议名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox runat="server" ID="tbMeetingName" req="1" TableName="EPMS_MeetingForm"
                field="MeetingName" activestatus="(23.编制会议纪要)"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l">纪要编号
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox runat="server" ID="tbMeetingCode" TableName="EPMS_MeetingForm"
                ReadOnly="true" field="MeetingCode" activestatus="(23.编制会议纪要)" MaxLength="30"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">会议地点
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox runat="server" ID="tbMeetingPlace" tablename="EPMS_MeetingForm"
                field="MeetingPlace" activestatus="(23.编制会议纪要)"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l" flag="hyjy">会议类型<span class="req-star">*</span>
        </td>
        <td class="td-r" flag="hyjy">
            <zhongsoft:LightDropDownList runat="server" ID="ddlMeetType" TableName="EPMS_MeetingForm"
                field="MeetingType" req="1" activestatus="(23.编制会议纪要)" Width="150px">
                <asp:ListItem Value="111" Text="111"></asp:ListItem>
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-m" colspan="2" flag="kgh" style="display: none"></td>
    </tr>
    <tr>
        <td class="td-l">组织人
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtOrganizeUserName" IsMutiple="false"
                SelectPageMode="Dialog" activestatus="(23.编制会议纪要)" SourceMode="SelectorPage"
                ShowJsonRowColName="true" PageWidth="700px" DoCancel="true" ResultAttr="name"
                ShowAttrs="name,LoginId" ResultForControls="{'hiOrganizeUserID':'id'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"
                FilterFunction="funcUserFilter()" tablename="EPMS_MeetingForm" field="OrganizeUserName"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiOrganizeUserID" tablename="EPMS_MeetingForm"
                field="OrganizeUserID" />
        </td>
        <td class="td-l">主持人
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtEmceeUserName" IsMutiple="false"
                SelectPageMode="Dialog" activestatus="(23.编制会议纪要)" SourceMode="SelectorPage"
                ShowJsonRowColName="true" PageWidth="700px" DoCancel="true" ResultAttr="name"
                ShowAttrs="name,LoginId" ResultForControls="{'hiEmceeUserId':'id'}" FilterFunction="funcUserFilter()"
                PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" tablename="EPMS_MeetingForm" field="EmceeUserName"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiEmceeUserId" tablename="EPMS_MeetingForm"
                field="EmceeUserID" />
        </td>
        <td class="td-l">审定人
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtApproveUserName" IsMutiple="false"
                SelectPageMode="Dialog" activestatus="(23.编制会议纪要)" SourceMode="SelectorPage"
                ShowJsonRowColName="true" PageWidth="700px" DoCancel="true" ResultAttr="name"
                ShowAttrs="name,LoginId" ResultForControls="{'hiApproveUserID':'id'}" FilterFunction="funcUserFilter()"
                PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" tablename="EPMS_MeetingForm" field="ApproveUserName"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiApproveUserID" tablename="EPMS_MeetingForm"
                field="ApproveUserID" />
        </td>
    </tr>
    <tr>
        <td class="td-l">外部参与人
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbOutPartakePerson" tablename="EPMS_MeetingForm"
                field="OutPartakePerson" activestatus="(23.编制会议纪要)" MaxLength="256"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l">编制人<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtWriteUserName" IsMutiple="false"
                SelectPageMode="Dialog" req="1" activestatus="(23.编制会议纪要)" SourceMode="SelectorPage"
                ShowJsonRowColName="true" PageWidth="700px" DoCancel="true" ResultAttr="name"
                ShowAttrs="name,LoginId" ResultForControls="{'hiWriteUserID':'id'}" FilterFunction="funcUserFilter()"
                PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" tablename="EPMS_MeetingForm" field="WriteUserName"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiWriteUserID" tablename="EPMS_MeetingForm"
                field="WriteUserID" />
        </td>
        <td class="td-l">编制时间<span class="req-star">*</span>
        </td>
        <td class="tr-r">
            <zhongsoft:XHtmlInputText ID="txtExpireDate" runat="server" type="text" class="kpms-textbox-date"
                req="1" tablename="EPMS_MeetingForm" field="WriteTime" readonly="readonly" activestatus="(23.编制会议纪要)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">参与人<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightObjectSelector runat="server" ID="txtParter" activestatus="(23.编制会议纪要)"
                SourceMode="SelectorPage" EnableTheming="false" ResultAttr="name" PageUrl="/Sys/OrgUsers/UserSelectorJson.aspx"
                PageHeight="630px" SelectPageMode="Dialog" IsMutiple="true" FilterFunction="userFilter()"
                OnClick="txtParter_Click" req="1"></zhongsoft:LightObjectSelector>
        </td>
    </tr>
    <tr>
        <td class="td-l">会议内容
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbMeetingContent" TextMode="MultiLine"
                CssClass="kpms-textarea" EnableTheming="false" MaxLength="2048" tablename="EPMS_MeetingForm"
                field="MeetingContent" activestatus="(23.编制会议纪要)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">会议纪要文件<br />
            、签到表</td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightFileUploader runat="server" ID="lbtnUpload" EnableTheming="false"
                DisplayStatus="(23.编制会议纪要)" OnClick="lbtnUpload_OnClick"><img src="../../Themes/Images/btn_upload.gif" />
                <span>上传附件</span></zhongsoft:LightFileUploader>
            <uc1:AttachmentView ID="uploadFile" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="td-m" colspan="6">
            <a href="<%=WebAppPath %>/EPMS/Download/206协调与沟通控制程序-01会议纪要.doc" target="_blank" class="aStyle">会议纪要模板</a>
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiMeetingFormID" tablename="EPMS_MeetingForm"
    field="MeetingFormID" />
<input type="hidden" runat="server" id="hiUserXML" />
<asp:LinkButton runat="server" ID="lbtnAfterUpload" Style="display: none" OnClick="lbtnAfterUpload_Click"
    OnClientClick="return uploadUserFile()">
</asp:LinkButton>
<asp:Button runat="server" ID="btnAddUser" OnClick="btnAddUser_Click" Visible="false" />
<script>
    function initCustomerPlugin() {
        var formID = '<%=FormId%>';
        if (formID == "362") {
            $("[flag='kgh']").show();
            $("[flag='hyjy']").hide();
        }
    }
    //添加参与人
    function batchAddUser() {
        var param = new InputParamObject("m");
        var filter = { ProjectPhaseID: $("#<%=hiOrganizationID.ClientID %>").val() };
        getDivUsersNew('<%=hiUserXML.ClientID %>', param, filter, addUser);

        return false;
    }

    function userFilter() {
        return { ProjectPhaseID: $("#<%=hiOrganizationID.ClientID %>").val() };
    }

    function addUser() {
        <%=Page.ClientScript.GetPostBackEventReference(this.btnAddUser,"")%>;
    }

    function afterUpLoad() {
        <%=Page.ClientScript.GetPostBackEventReference(this.lbtnAfterUpload, "")%>;
    }

    function checkBeforeDel(obj) {
        return confirm("您确定要删除吗？");
    }

    function uploadUserFile(fileSourceId) {
        showUploadForm($prcInstId, "Module")
        //$('#FormToolBar_LinkAttachment').click();
        return true;
    }

    function afterSelect() {
        var formID = '<%=FormId%>';
        if (formID == "362") {
            var projName = $("#<%=lbsSelectProject.ClientID%>").val();
            $("#<%=tbMeetingName.ClientID%>").val(projName + "开工会");
        }
    }

    function funcUserFilter() {
        var projID = $('#<%=hiOrganizationID.ClientID %>').val();

        return { ProjectPhaseID: projID };
    }
</script>
