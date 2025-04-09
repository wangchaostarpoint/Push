<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ProjectCommonForm.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.Form.Project.WF_ProjectCommonForm" %>
<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView" TagPrefix="uc1" %>
<table class="tz-table">
    <tr>
        <td class="td-l">项目名称<span class="req-star">*</span></td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsProjectName" IsMutiple="false" req="1"
                SelectPageMode="Dialog" ResultForControls="{'hiOrganizationID':'id','tbProjectCode':'ProjectCode'}"
                EnableTheming="false" PageWidth="900px" Text="选择项目" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                ShowJsonRowColName="true" ResultAttr="name" TableName="EPMS_ProjectCommonForm" Field="ProjectName" ActiveStatus="(23.填写项目月报)" OnClick="lbsProjectName_Click" />
            <input type="hidden" id="hiOrganizationID" runat="server" tablename="EPMS_ProjectCommonForm" field="OrganizationID" />
        </td>
        <td class="td-l">项目编号</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox" ID="txtProjectCode" runat="server" readonly="readonly" TableName="EPMS_ProjectCommonForm" Field="ProjectCode" ActiveStatus="(23.填写项目月报)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">编写人</td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText class="kpms-textbox" ID="txtWriteUserName" runat="server" readonly="readonly" 
                TableName="EPMS_ProjectCommonForm" Field="WriteUserName" ActiveStatus="(23.填写项目月报)" style="width:150px" />
            <input type="hidden" id="hiWriteUserID" name="hiWriteUserID" runat="server" tablename="EPMS_ProjectCommonForm" field="WriteUserID" />
        </td>
        <td class="td-l">编写日期</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtWriteDate" runat="server" readonly="readonly" TableName="EPMS_ProjectCommonForm" Field="WriteDate" ActiveStatus="(23.填写项目月报)" />
        </td> 
    </tr>
    <tr>
        <td class="td-l">备注</td>
        <td colspan="5" class="td-m">
            <zhongsoft:LightTextBox ID="tbMemo" runat="server" CssClass="kpms-textarea" TextMode="MultiLine" EnableTheming="false" TableName="EPMS_ProjectCommonForm" Field="Memo" ActiveStatus="(23.填写项目月报)" />
        </td>
    </tr>

    <tr>
        <td class="td-l">附件</td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightFileUploader runat="server" ID="lbtnUpload" EnableTheming="false"
                DisplayStatus="(23.填写项目月报)" OnClick="lbtnUpload_OnClick"><img src="../../Themes/Images/btn_upload.gif" />
                <span>上传附件</span></zhongsoft:LightFileUploader>
            <uc1:AttachmentView ID="uploadFile" runat="server" />
        </td>
    </tr>
  
</table>
<%--主键--%>
<input type="hidden" id="hiProjectCommonFormID" runat="server" tablename="EPMS_ProjectCommonForm" field="ProjectCommonFormID" />
<input type="hidden" id="hiFormType" runat="server" tablename="EPMS_ProjectCommonForm" value="" field="FormType" />
<%--JS部分--%>
<script type="text/javascript">

    //页面加载执行
    function initCustomerPlugin() {

    }

    //保存、发送调用（进行相关逻辑验证）
    function checkForm() {

        return true;
    }

</script>