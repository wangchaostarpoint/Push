<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_GDServicePlan.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.Form.GDManage.WF_GDServicePlan" %>
<%@ Register Src="~/EPMS/UI/Project/ProjectCommon.ascx" TagName="ProjectCommon" TagPrefix="uc1" %>
<table class="tz-table">
    <tr>
        <td class="td-l">填写人</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtWriteUserName" readonly="readonly" class="kpms-textbox" runat="server" MaxText="16" TableName="EPMS_GDServicePlan" Field="WriteUserName" ActiveStatus="(23.编制工代服务策划)" />
            <input type="hidden" id="hiWriteUserID" name="hiWriteUserID" runat="server" tablename="EPMS_GDServicePlan" field="WriteUserID" />
        </td>
        <td class="td-l">填写部门名称</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtWriteDeptName" readonly="readonly" class="kpms-textbox" runat="server" MaxText="128" TableName="EPMS_GDServicePlan" Field="WriteDeptName" ActiveStatus="(23.编制工代服务策划)" />
            <input type="hidden" id="hiWriteDeptID" name="hiWriteDeptID" runat="server" tablename="EPMS_GDServicePlan" field="WriteDeptID" />
        </td>
        <td class="td-l">填写日期</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtWriteDate" runat="server" readonly="readonly" TableName="EPMS_GDServicePlan" Field="WriteDate" ActiveStatus="(23.编制工代服务策划)" />
        </td>
    </tr>
    <uc1:ProjectCommon ID="ucProjectCommon" runat="server" />
    <tr>
        <td class="td-l">
            简要内容<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="6">
            <zhongsoft:LightTextBox ID="tbContent" EnableTheming="False" CssClass="kpms-textarea" TextMode="MultiLine" Height="150px" runat="server" MaxText="1024" TableName="EPMS_GDServicePlan" Field="Content" ActiveStatus="(23.编制工代服务策划)" req="1" />
        </td>
    </tr>
</table>
<input type="hidden" id="hiGDServicePlanID" name="hiGDServicePlanID" runat="server" tablename="EPMS_GDServicePlan" field="GDServicePlanID" />
<input type="hidden" id="hiOrganizationID" name="hiOrganizationID" runat="server" tablename="EPMS_GDServicePlan" field="OrganizationID" />

<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
    }
</script>
