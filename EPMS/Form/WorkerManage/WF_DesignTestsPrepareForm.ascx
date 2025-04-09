<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_DesignTestsPrepareForm.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.Form.WorkerManage.WF_DesignTestsPrepareForm" %>
<table class="tz-table">
    <tr>
        <td class="td-l">工程名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" req="1" IsMutiple="false"
                SelectPageMode="Dialog" ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode'}"
                EnableTheming="false" Text="选择项目" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                PageWidth="850" ShowJsonRowColName="true" ResultAttr="name" activestatus="(23.填写设计交底准备记录)"
                TableName="EPMS_DesignTestsPrepareForm" field="ProjectName" />
        </td>
        <td class="td-l">工程编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtProjectCode" runat="server" readonly="readonly"
                activestatus="(23.填写设计交底准备记录)" class="kpms-textbox" TableName="EPMS_DesignTestsPrepareForm"
                field="ProjectCode" />
            <input type="hidden" id="hiOrganizationID" runat="server" tablename="EPMS_DesignTestsPrepareForm"
                field="OrganizationID" />
        </td>
    </tr>
    <tr>
        <td class="td-l">预计交底时间<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtExpectDate" readonly="readonly"
                req="1" class="kpms-textbox-date" activestatus="(23.填写设计交底准备记录)"
                TableName="EPMS_DesignTestsPrepareForm" field="ExpectDate" />
        </td>
        <td class="td-l">编号<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbDesignTestsCode" field="DesignTestsCode" tablename="EPMS_DesignTestsPrepareForm"
                req="1" CssClass="kpms-textbox" EnableTheming="false" activestatus="(23.填写设计交底准备记录)"
                maxtext="64"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">填写人<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtFillUserName" runat="server" readonly="readonly"
                activestatus="(23.填写设计交底准备记录)" class="kpms-textbox" TableName="EPMS_DesignTestsPrepareForm"
                field="FillUserName" />
            <input type="hidden" id="hiFillUserID" runat="server" tablename="EPMS_DesignTestsPrepareForm"
                field="FillUserID" />
        </td>
        <td class="td-l">专工
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtProfessionalEngineer" IsMutiple="false"
                SelectPageMode="Dialog" activestatus="(23.填写设计交底准备记录)"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                ShowAttrs="name,UserCode" ResultForControls="{'hiProfessionalEngineerID':'id'}"
                PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" tablename="EPMS_DesignTestsPrepareForm"
                field="ProfessionalEngineer"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiProfessionalEngineerID" tablename="EPMS_DesignTestsPrepareForm"
                field="ProfessionalEngineerID" />
        </td>
        <td class="td-l">批准日期<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtApproveDate" readonly="readonly"
                req="1" class="kpms-textbox-date" activestatus="(23.批准)"
                TableName="EPMS_DesignTestsPrepareForm" field="ApproveDate" />
        </td>
    </tr>
    <tr>
        <td class="td-l">交底主要内容
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbDesignTestsContent" runat="server" activestatus="(23.填写设计交底准备记录)"
                CssClass="kpms-textarea" EnableTheming="false" maxtext="1024" Rows="4" TextMode="MultiLine"
                field="DesignTestsContent" tablename="EPMS_DesignTestsPrepareForm"></zhongsoft:LightTextBox>
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiDesignTestsPrepareFormID" field="DesignTestsPrepareFormID"
    tablename="EPMS_DesignTestsPrepareForm" />


