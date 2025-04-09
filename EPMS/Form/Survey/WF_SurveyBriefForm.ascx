<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_SurveyBriefForm.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.Form.Survey.WF_SurveyBriefForm" %>
<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView" TagPrefix="uc1" %>
<table class="tz-table">
    <tr>
        <td class="td-l">项目名称<span class="req-star">*</span></td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="tbProjectName" IsMutiple="false" req="1"
                SelectPageMode="Dialog" ResultForControls="{'hiProjectID':'id','tbProjectCode':'ProjectCode'}"
                EnableTheming="false" PageWidth="900px" Text="选择项目" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                ShowJsonRowColName="true" ResultAttr="name" TableName="EPMS_SurveyBrief" Field="ProjectName" ActiveStatus="(23.填写勘测任务书)(23.编制大纲)(23.编制)(23.修改)" OnClick="tbProjectName_Click" />
            <input type="hidden" id="hiProjectID" name="hiProjectID" runat="server" tablename="EPMS_SurveyBrief" field="ProjectID" />
        </td>
        <td class="td-l">项目编号</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox" ID="tbProjectCode" runat="server" readonly="readonly" TableName="EPMS_SurveyBrief" Field="ProjectCode" ActiveStatus="(23.填写勘测任务书)(23.编制大纲)(23.编制)(23.修改)" />
        </td>
    </tr>
    <tr runat="server" id="trSpecialty">
        <td class="td-l">专业</td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightDropDownList ID="ddlSpecialty" Width="200px" runat="server" TableName="EPMS_SurveyBrief" Field="SpecialtyID" ActiveStatus="(23.编制大纲)"/>
            <input type="hidden" id="hiSpecialtyCode" name="hiSpecialtyCode" runat="server" tablename="EPMS_SurveyBrief" field="SpecialtyCode" />
            <input type="hidden" id="hiSpecialtyName" name="hiSpecialtyName" runat="server" tablename="EPMS_SurveyBrief" field="SpecialtyName" />
        </td>
    </tr>
    <tr runat="server" id="trSurveyBriefType">
        <td class="td-l">任务书类型<span class="req-star">*</span></td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightDropDownList ID="ddlSurveyBriefType" Width="200px" runat="server" TableName="EPMS_SurveyBrief" Field="SurveyBriefType" ActiveStatus="(23.填写勘测任务书)" req="1"/>
        </td>
    </tr>
    <tr>
        <td class="td-l">编写人</td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText class="kpms-textbox" ID="txtWriteUserName" runat="server" readonly="readonly" 
                TableName="EPMS_SurveyBrief" Field="WriteUserName" ActiveStatus="(2.填写勘测任务书)(2.编制大纲)(2.编制)(2.修改)" style="width:150px" />
            <input type="hidden" id="hiWriteUserID" name="hiWriteUserID" runat="server" tablename="EPMS_SurveyBrief" field="WriteUserID" />
        </td>
        <td class="td-l">编写日期</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtWriteDate" runat="server" readonly="readonly" TableName="EPMS_SurveyBrief" Field="WriteDate" ActiveStatus="(2.填写勘测任务书)(2.编制大纲)(2.编制)(2.修改)" />
        </td> 
    </tr>
    <tr>
        <td class="td-l">备注</td>
        <td colspan="5" class="td-m">
            <zhongsoft:LightTextBox ID="tbMemo" runat="server" CssClass="kpms-textarea" TextMode="MultiLine" EnableTheming="false" TableName="EPMS_SurveyBrief" Field="Memo" ActiveStatus="(23.填写勘测任务书)(23.编制大纲)(23.编制)(23.修改)" />
        </td>
    </tr>

    <tr>
        <td class="td-l">文件</td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightFileUploader ID="upLoadFile" displaystatus="(23.填写勘测任务书)(23.编制)(23.修改)"  runat="server" ActiveStatus="(23.填写勘测任务书)(23.编制大纲)(23.编制)(23.修改)" OnClick="upLoadFile_Click">
                <span>
                    <img id="imgFile" src="<%=WebAppPath %>/Themes/Images/btn_upload.gif" alt="上传文件" width="16"  height="16" />上传文件</span>
            </zhongsoft:LightFileUploader>
             <uc1:AttachmentView ID="Attachment" runat="server" RepeatColumns="1" />
        </td>
    </tr>
  
</table>
<input type="hidden" id="hiSurveyBriefID" name="hiSurveyBriefID" runat="server" tablename="EPMS_SurveyBrief" field="SurveyBriefID" />
<input type="hidden" id="hiFormType" name="hiFormType" runat="server" tablename="EPMS_SurveyBrief" field="FormType" />
<%--签收的角色--%>
<input id="hiRoleA" runat="server" type="hidden" value="分管院长,分管总工,专业总工,专业负责人,分管所领导" /> 
<%--勘测专业大纲--%>
<input type="hidden" id="hiSpecial" runat="server" value="EPMSSurveySpecialBrief.xpdl" />
<%--勘测工作计划--%>
<input type="hidden" id="hiPlan" runat="server" value="EPMSSurveyWorkPlan.xpdl" />
<%--勘测设计大纲--%>
<input type="hidden" id="hiDesign" runat="server" value="EPMSSurveyDesignBrief.xpdl" />
<%--设计专业大纲--%>
<input type="hidden" id="hiDesignSpecial" runat="server" value="EPMSDesignSpecialBrief.xpdl" />  
<%--作业计划--%>
<input type="hidden" id="hiWorkPlan" runat="server" value="EPMSWorkPlan.xpdl" />  
<%--项目质量计划--%>
<input type="hidden" id="hiQualityPlan" runat="server" value="EPMSProjectQualityPlan.xpdl" />  
<%--外业策划文件--%>
<input type="hidden" id="hiForeignPlan" runat="server" value="EPMSForeignPlanDocument.xpdl" />  
<script type="text/javascript">
    function initCustomerPlugin() {
        //隐藏附件功能
        $("#FormToolBar_LinkAttachment").hide();
        $("#partAttachment").hide();
    }
</script>