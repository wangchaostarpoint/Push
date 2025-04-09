<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_WorkSummaryForm.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.Form.Project.WF_WorkSummaryForm" %>
<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView" TagPrefix="uc1" %>
<table class="tz-table">
    <tr>
        <td class="td-l">项目名称<span class="req-star">*</span></td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="tbProjectName" IsMutiple="false" req="1"
                SelectPageMode="Dialog" ResultForControls="{'hiProjectID':'id','tbProjectCode':'ProjectCode','hiPhaseID':'ParamPhaseID'}"
                EnableTheming="false" PageWidth="900px"
                Text="选择项目" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx" ShowJsonRowColName="true" OnClick="tbProjectName_Click"
                ResultAttr="name" TableName="EPMS_WorkSummary" Field="ProjectName" ActiveStatus="(23.编写工作总结)" />
            <input type="hidden" id="hiProjectID" name="hiProjectID" runat="server" tablename="EPMS_WorkSummary" field="ProjectID" />
        </td>
        <td class="td-l">项目编号</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox" ID="tbProjectCode" runat="server" readonly="readonly" TableName="EPMS_WorkSummary" Field="ProjectCode" ActiveStatus="(23.编写工作总结)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">设计阶段</td>
        <td class="td-m" colspan="5">
            <asp:CheckBoxList runat="server" ID="cblProjectPhases" activestatus="(23.N)" RepeatDirection="Horizontal" />
            <input type="hidden" id="hiPhaseID" name="hiPhaseID" runat="server" tablename="EPMS_WorkSummary" field="PhaseID" />
            <input type="hidden" id="hiPhaseName" name="hiPhaseID" runat="server" tablename="EPMS_WorkSummary" field="PhaseName" />
        </td>
    </tr>
     <tr>
        <td class="td-l">主管总工</td>
        <td class="td-r">
            <zhongsoft:LightTextBox class="kpms-textbox" ID="tbZGZGUser" runat="server" readonly="true" TableName="EPMS_WorkSummary" Field="ZGZGUserName" ActiveStatus="(3.审查)" />
            <input type="hidden" id="hiZGZGUserID" name="hiZGZGUserID" runat="server" tablename="EPMS_WorkSummary" field="ZGZGUserID" />
        </td>
        <td class="td-l">主办分院部门负责人</td>
        <td class="td-r">
            <zhongsoft:LightTextBox class="kpms-textbox" ID="tbZBFYDeptUser" runat="server" readonly="true" TableName="EPMS_WorkSummary" Field="ZBFYDeptUserName" ActiveStatus="(3.审查)" />
            <input type="hidden" id="hiZBFYDeptUserID" name="hiZBFYDeptUserID" runat="server" tablename="EPMS_WorkSummary" field="ZBFYDeptUserID" />
        </td>
        <td class="td-l">院主管领导</td>
        <td class="td-r">
            <zhongsoft:LightTextBox class="kpms-textbox" ID="tbYZGLDUser" runat="server" readonly="true" TableName="EPMS_WorkSummary" Field="YZGLDUserName" ActiveStatus="(3.批准)" />
            <input type="hidden" id="hiYZGLDUserID" name="hiYZGLDUserID" runat="server" tablename="EPMS_WorkSummary" field="YZGLDUserID" />
        </td>
    </tr>
    <tr>
        <td class="td-l">编写人</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox" ID="txtWriteUserName" runat="server" readonly="readonly" TableName="EPMS_WorkSummary" Field="WriteUserName" ActiveStatus="(2.编写工作总结)" />
            <input type="hidden" id="hiWriteUserID" name="hiWriteUserID" runat="server" tablename="EPMS_WorkSummary" field="WriteUserID" />
        </td>
        <td class="td-l">编写日期</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtWriteDate" runat="server" readonly="readonly" TableName="EPMS_WorkSummary" Field="WriteDate" ActiveStatus="(2.编写工作总结)" />
        </td>
        <td class="td-l">所属部门</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox" ID="txtDeptName" runat="server" readonly="readonly" TableName="EPMS_WorkSummary" Field="DeptName" ActiveStatus="(2.编写工作总结)" />
            <input type="hidden" id="hiDeptID" name="hiDeptID" runat="server" tablename="EPMS_WorkSummary" field="DeptID" />

        </td>
    </tr>
    <tr>
        <td class="td-l">编写说明</td>
        <td colspan="5" class="td-m">
            <zhongsoft:LightTextBox ID="tbWriteExplain" runat="server" CssClass="kpms-textarea" TextMode="MultiLine" EnableTheming="false" TableName="EPMS_WorkSummary" Field="WriteExplain" ActiveStatus="(23.编写工作总结)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">备注</td>
        <td colspan="5" class="td-m">
            <zhongsoft:LightTextBox ID="tbMemo" runat="server" CssClass="kpms-textarea" TextMode="MultiLine" EnableTheming="false" TableName="EPMS_WorkSummary" Field="Memo" ActiveStatus="(23.编写工作总结)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">工作总结文件</td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightFileUploader ID="upLoadFile" runat="server"  DisplayStatus="(23.编写工作总结)"  ActiveStatus="(23.编写工作总结)" OnClick="upLoadFile_Click">
                <span>
                    <img id="imgFile" src="<%=WebAppPath %>/Themes/Images/btn_upload.gif" alt="上传文件" width="16"  height="16" />上传文件</span>
            </zhongsoft:LightFileUploader> 
            <uc1:AttachmentView ID="Attachment" runat="server" RepeatColumns="1" />
        </td>
    </tr>
</table>
<input type="hidden" id="hiWorkSummaryID" name="hiWorkSummaryID" runat="server" tablename="EPMS_WorkSummary" field="WorkSummaryID" />
<script type="text/javascript">
    function initCustomerPlugin() {
        //隐藏附件功能
        $("#FormToolBar_LinkAttachment").hide();
        $("#partAttachment").hide();
    }
</script>
