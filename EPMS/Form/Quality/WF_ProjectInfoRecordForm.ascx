<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ProjectInfoRecordForm.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.Form.Quality.WF_ProjectInfoRecordForm" %>
<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView" TagPrefix="uc3" %>
<table class="tz-table" width="100%">
     <tr>
        <td class="td-l">项目名称<span class="req-star">*</span></td>
        <td class="td-m" colspan="3">
             <zhongsoft:LightObjectSelector runat="server" ID="tbProjectName" IsMutiple="false" req="1"
                SelectPageMode="Dialog" ResultForControls="{'hiOrganizationID':'id','tbProjectCode':'ProjectCode'}" EnableTheming="false" PageWidth="900px"
                Text="选择子项目" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx" ShowJsonRowColName="true"  
                ResultAttr="name" TableName="EPMS_ProjectInfoRecord" Field="ProjectName" ActiveStatus="(23.填写记录表)" /> 
            <input type="hidden" id="hiOrganizationID"  runat="server" tablename="EPMS_ProjectInfoRecord" field="OrganizationID" />
        </td>
        <td class="td-l">项目编号</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox" ID="tbProjectCode" runat="server" readonly="readonly" TableName="EPMS_ProjectInfoRecord" Field="ProjectCode" ActiveStatus="(23.填写记录表)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">签认/回函单位<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox" ID="tbSignDeptName" runat="server"  req="1"
                TableName="EPMS_ProjectInfoRecord" Field="SignDeptName" ActiveStatus="(23.填写记录表)" />
        </td>
        <td class="td-l">记录人</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox" ID="txtRecordUser" runat="server" readonly="readonly"
                TableName="EPMS_ProjectInfoRecord" Field="RecordUserName" ActiveStatus="(23.填写记录表)" />
            <input type="hidden" id="hiRecordUserID" runat="server" field="RecordUserID" tablename="EPMS_ProjectInfoRecord" />
        </td>
        <td class="td-l">记录时间
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtRecordDate" runat="server" readonly="readonly"
                TableName="EPMS_ProjectInfoRecord" Field="RecordDate" ActiveStatus="(23.填写记录表)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">签认/回函/工地备忘录<br />事项（要求附文件、来函等）<span class="req-star">*</span></td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbItem" runat="server" TextMode="MultiLine" req="1"
                CssClass="kpms-textarea" EnableTheming="false" ActiveStatus="(23.填写记录表)"
                Field="Item" TableName="EPMS_ProjectInfoRecord" />
    </tr>
    <tr>
        <td class="td-l">是否涉及设计变更<span class="req-star">*</span></td>
        <td class="td-r">
            <asp:RadioButtonList runat="server" ID="rbIsDesignChange" RepeatDirection="Horizontal" req="1"
                field="IsDesignChange" tablename="EPMS_ProjectInfoRecord" ActiveStatus="(23.填写记录表)">
                <asp:ListItem Text="是" Value="1"></asp:ListItem>
                <asp:ListItem Text="否" Value="0"></asp:ListItem>
            </asp:RadioButtonList></td>
        <td class="td-l">变更类型<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <asp:RadioButtonList runat="server" ID="rblChangeType" RepeatDirection="Horizontal" req="1" RepeatColumns="3"
                field="ChangeType" tablename="EPMS_ProjectInfoRecord" ActiveStatus="(23.填写记录表)">
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td class="td-l">拟处理意见 
        </td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightTextBox ID="tbOpinions" runat="server" TextMode="MultiLine"
                CssClass="kpms-textarea" EnableTheming="false" ActiveStatus="(23.填写记录表)"
                Field="Opinions" TableName="EPMS_ProjectInfoRecord" />
        </td>
    </tr> 
    <tr>
        <td class="td-l">附件</td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightFileUploader runat="server" ID="lbtnUpload" EnableTheming="false"
                DisplayStatus="(23.填写记录表)" OnClick="upLoadFile_Click">
                <img src="../../Themes/Images/btn_upload.gif" />
            <span>上传附件</span></zhongsoft:LightFileUploader> 
            <uc3:AttachmentView ID="Attachment" runat="server" />
        </td>
    </tr>
</table>
<%--主键ID--%>
<input id="hiProjectInfoRecordID" name="hiProjectInfoRecordID" type="hidden" runat="server" field="ProjectInfoRecordID" tablename="EPMS_ProjectInfoRecord" />
<script type="text/javascript">
    function initCustomerPlugin() {
        //隐藏附件功能
        $("#FormToolBar_LinkAttachment").hide();
        $("#partAttachment").hide();
    }
</script>