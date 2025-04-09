<%@ Page Language="C#" AutoEventWireup="true" Title="项目经费使用记录详细" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    CodeBehind="ProjectFundsEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.ProjectData.ProjectFundsEditor" %>

<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"
    TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">项目编号
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbProjectCode" TableName="EPMS_ProjectFunds"
                    Field="ProjectCode" activestatus="(23.*)" ReadOnly="true"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">项目名称
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbProjectName" TableName="EPMS_ProjectFunds"
                    Field="ProjectName" activestatus="(23.*)" ReadOnly="true"></zhongsoft:LightTextBox>
                <input id="hiOrganizationId" type="hidden" runat="server" tablename="EPMS_ProjectModifyInfo"
                    field="OrganizationId" />
            </td>
        </tr>
        <tr>
            <td class="td-l">填写人
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbWriteUserName" TableName="EPMS_ProjectFunds"
                    Field="WriteUserName" activestatus="(23.*)" ReadOnly="true"></zhongsoft:LightTextBox>
                <input id="hiWriteUserID" type="hidden" runat="server" tablename="EPMS_ProjectModifyInfo"
                    field="WriteUserID" />
            </td>
            <td class="td-l">填写日期<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtWriteDate" readonly="readonly" field="WriteDate" tablename="EPMS_ProjectModifyInfo"
                    class="kpms-textbox-date" activestatus="(23.*)" req="1" />
            </td>
        </tr>
        <tr>
            <td class="td-l">花销金额（元）<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="1">
                <zhongsoft:LightTextBox runat="server" ID="tbProjectFunds" EnableTheming="false" req="1"
                    CssClass="kpms-textbox-money" DataType="Decimal2" activestatus="(23.*)" TableName="EPMS_ProjectFunds"
                    Field="ProjectFunds"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l"></td>
            <td class="td-m" colspan="1"></td>
        </tr>
        <tr>
            <td class="td-l">花销说明
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbProjectFundsDec" runat="server" TextMode="MultiLine" MaxLength="1024"
                    field="ProjectFundsDec" tablename="EPMS_ProjectFunds" activestatus="(23.*)" CssClass="kpms-textarea"
                    EnableTheming="false"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">附件
            </td>
            <td class="td-m" colspan="3">
                <asp:LinkButton runat="server" ID="lbtnUploadNew"  EnableTheming="False" OnClientClick="return uploadFile('Module','项目经费');">
                        <img src="../../../Themes/Images/btn_upload.gif">
                        <span>上传附件</span>
                </asp:LinkButton>
                <uc1:AttachmentView ID="AttaListFile" runat="server" />
            </td>
        </tr>
    </table>
    <input id="hiProjectFundsID" type="hidden" tablename="EPMS_ProjectFunds" field="ProjectFundsID"
        runat="server" />
    <input id="hiFlag" type="hidden" tablename="EPMS_ProjectFunds" field="Flag" value="1"
        runat="server" />
    <asp:Button ID="btnUploadFileCallBack" runat="server" Visible="false" OnClick="btnUploadFileCallBack_Click" />
    <%--相关脚本引用--%>
    <script src="<%=WebAppPath%>/UI/Script/EPMSGeneralScript.js" type="text/javascript"></script>

    <script type="text/javascript">

        //页面加载执行
        function initCustomerPlugin() {
            $('[flag="view"]').css("display", "none");
        }
        //上传附件
        function uploadFile(flag, fileType) {
            var fileSrcId = '<%=BusinessObjectId%>';
            showUploadFormAndType(fileSrcId, flag, fileType, uploadFileCallBack);
            return false;
        }
        //新建、编辑申请设备弹出层callback方法
        function uploadFileCallBack() {
            <%=Page.ClientScript.GetPostBackEventReference(this.btnUploadFileCallBack,"") %>
        }
    </script>
</asp:Content>
