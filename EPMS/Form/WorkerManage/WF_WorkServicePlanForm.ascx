<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_WorkServicePlanForm.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.Form.WorkerManage.WF_WorkServicePlanForm" %>
<%@ Register Src="../../../Sys/FileDocument/AttachmentView.ascx" TagName="UpLoadFile"
    TagPrefix="uc3" %>
<table class="tz-table">
    <tr>
        <td class="td-l">填写人<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtFillUserName" runat="server" readonly="readonly"
                activestatus="(23.填写工代服务计划)(3.修改工代服务计划)" class="kpms-textbox" TableName="EPMS_WorkServicePlanForm"
                field="FillUserName" />
        </td>
        <td class="td-l">填写部门<span class="req-star">*</span>
        </td>
        <td class="td-m">
            <zhongsoft:XHtmlInputText ID="txtFillDeptName" runat="server" readonly="readonly"
                activestatus="(23.填写工代服务计划)(3.修改工代服务计划)" class="kpms-textbox" TableName="EPMS_WorkServicePlanForm"
                field="FillDeptName" />
        </td>
        <td class="td-l">填写日期<span class="req-star">*</span>
        </td>
        <td class="td-m">
            <zhongsoft:XHtmlInputText ID="txtFillDate" runat="server" readonly="readonly"
                activestatus="(23.填写工代服务计划)(3.修改工代服务计划)" class="kpms-textbox" TableName="EPMS_WorkServicePlanForm"
                field="FillDate" />
        </td>
    </tr>
    <tr>
        <td class="td-l">项目名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" req="1" IsMutiple="false"
                SelectPageMode="Dialog" ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode','txtProjectPlace':'ProjectPlace','txtDesignSize':'ProjectScale','txtPhaseName':'PhaseName','txtProjectTypeName':'ProjectType'}"
                EnableTheming="false" Text="选择项目" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                PageWidth="850" ShowJsonRowColName="true" ResultAttr="name" activestatus="(23.填写工代服务计划)(3.修改工代服务计划)"
                TableName="EPMS_WorkServicePlanForm" field="ProjectName" />
        </td>
        <td class="td-l">项目编号<span class="req-star">*</span>
        </td>
        <td class="td-m">
            <zhongsoft:XHtmlInputText ID="txtProjectCode" runat="server" readonly="readonly"
                activestatus="(23.填写工代服务计划)(3.修改工代服务计划)" class="kpms-textbox" TableName="EPMS_WorkServicePlanForm"
                field="ProjectCode" />
        </td>
    </tr>
    <tr>
        <td class="td-l">设计规模<span class="req-star">*</span>
        </td>
        <td class="td-m">
            <zhongsoft:XHtmlInputText ID="txtDesignSize" runat="server" readonly="readonly"
                activestatus="(23.填写工代服务计划)(3.修改工代服务计划)" class="kpms-textbox" TableName="EPMS_WorkServicePlanForm"
                field="DesignSize" />
        </td>
        <td class="td-l">工程类别<span class="req-star">*</span>
        </td>
        <td class="td-m">
            <zhongsoft:XHtmlInputText ID="txtProjectTypeName" runat="server" readonly="readonly"
                activestatus="(23.填写工代服务计划)(3.修改工代服务计划)" class="kpms-textbox" TableName="EPMS_WorkServicePlanForm"
                field="ProjectTypeName" />
        </td>
        <td class="td-l">设计阶段<span class="req-star">*</span>
        </td>
        <td class="td-m">
            <zhongsoft:XHtmlInputText ID="txtPhaseName" runat="server" readonly="readonly"
                activestatus="(23.填写工代服务计划)(3.修改工代服务计划)" class="kpms-textbox" TableName="EPMS_WorkServicePlanForm"
                field="PhaseName" />
        </td>
    </tr>
    <tr>
        <td class="td-l">简要内容
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="txtContent" field="Content" tablename="MBO_TaskSettles"
                CssClass="kpms-textarea" EnableTheming="false" Rows="3" activestatus="(23.填写工代服务计划)(23.修改工代服务计划)"
                TextMode="MultiLine" maxtext="256"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">附件
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightFileUploader runat="server" ID="lbtnAttachment" EnableTheming="false"
                DisplayStatus="(3.填写工代服务计划)" OnClick="lbtnAttachment_Click"><img src="../../Themes/Images/btn_upload.gif" />
                        <span>上传附件</span></zhongsoft:LightFileUploader><span class="req-star" style="float: right;"
                            id="Span2" runat="server" displaystatus="(2.*)"> 请先保存再上传附件</span>
            <uc3:UpLoadFile ID="upAttachment" runat="server" />
        </td>
    </tr>

</table>
<%--工代服务计划流程ID,主键--%>
<input id="hiWorkServicePlanFormID" runat="server" field="WorkServicePlanFormID"
    tablename="EPMS_WorkServicePlanForm" type="hidden" />
<%--填写人ID--%>
<input id="hiFillUserID" runat="server" field="FillUserID" tablename="EPMS_WorkServicePlanForm"
    type="hidden" />
<%-- 填写人部门ID--%>
<input id="hiFillDeptID" runat="server" field="FillDeptID" tablename="EPMS_WorkServicePlanForm"
    type="hidden" />
<%--项目ID--%>
<input id="hiOrganizationID" runat="server" field="OrganizationID" tablename="EPMS_WorkServicePlanForm"
    type="hidden" />
<%--传阅角色--%>
<input id="hiNotifyzheshe" runat="server" type="hidden" value="主设人" />
<input id="hiNotifygongdai" runat="server" type="hidden" value="工代" />
<input type="hidden" runat="server" id="hiProjectXML" />

