<%@ Page Title="项目大事记详细页" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master" AutoEventWireup="true" CodeBehind="ProjectMemorabiliaEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Project.ProjectMemorabiliaEditor" %>
<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"
TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">项目名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsProjectName" req="1" IsMutiple="false"
                    SelectPageMode="Dialog" ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode'}"
                    EnableTheming="false" Text="选择项目" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                    PageWidth="850" ShowJsonRowColName="true" ResultAttr="name"
                    activestatus="(23.*)" TableName="EPMS_ProjectMemorabilia" Field="ProjectName" />
                <input type="hidden" id="hiOrganizationID" name="hiOrganizationID" runat="server" tablename="EPMS_ProjectMemorabilia" field="OrganizationID" />
            </td>
            <td class="td-l">项目编号</td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtProjectCode" runat="server" readonly="readonly" class="kpms-textbox" TableName="EPMS_ProjectMemorabilia" Field="ProjectCode" ActiveStatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">填写人</td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtWriteUserName" readonly="readonly" class="kpms-textbox" runat="server" TableName="EPMS_ProjectMemorabilia" Field="WriteUserName" ActiveStatus="(23.*)" />
                <input type="hidden" id="hiWriteUserID" name="hiWriteUserID" runat="server" tablename="EPMS_ProjectMemorabilia" field="WriteUserID" />
            </td>
            <td class="td-l">填写时间</td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtWriteDate" runat="server" readonly="readonly" TableName="EPMS_ProjectMemorabilia" Field="WriteDate" ActiveStatus="(23.*)" />
            </td>
            <td class="td-m" colspan="2"></td>
        </tr>
        <tr>
            <td class="td-l">项目大事记<span class="req-star">*</span></td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbProjectMemorabilia" runat="server" MaxText="1024" TableName="EPMS_ProjectMemorabilia" Field="ProjectMemorabilia" ActiveStatus="(23.*)"
                    CssClass="kpms-textarea" EnableTheming="False" TextMode="MultiLine" req="1" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                相关附件
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightFileUploader runat="server" ID="lbtnUpload" EnableTheming="false"
                                             DisplayStatus="(3.*)" OnClick="lbtnUpload_OnClick"><img src="../../../Themes/Images/btn_upload.gif" />
                    <span>上传附件</span></zhongsoft:LightFileUploader><span class="req-star" style="float: right;"
                                                                         runat="server" displaystatus="(2.*)"> 请先保存再上传附件</span>
                <uc1:AttachmentView ID="uploadFile" runat="server" />
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiFlag" tablename="EPMS_ProjectMemorabilia" field="Flag" value="1" />
    <input type="hidden" id="hiProjectMemorabiliaID" name="hiProjectMemorabiliaID" runat="server" tablename="EPMS_ProjectMemorabilia" field="ProjectMemorabiliaID" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }
    </script>
</asp:Content>
