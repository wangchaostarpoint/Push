<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_WBSScheduleForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.WBS.WF_WBSScheduleForm" %>
<%@ Register Src="../../UI/WBS/WBSScheduleGrid.ascx" TagName="WBSScheduleGrid" TagPrefix="uc1" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">
            填报周期<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlStatCycle" runat="server" ActiveStatus="(23.进度填报)(23.双周进度填报)"
                Field="StatCycle" TableName="EPMS_WorkloadOfEmployee" req="1">
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l">
            年<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlYear" runat="server" activestatus="(2.进度填报)(2.双周进度填报)"
                field="StatYear" tablename="EPMS_WorkloadOfEmployee" req="1">
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l">
            月<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlMonth" runat="server" activestatus="(2.进度填报)(2.双周进度填报)"
                field="StatMonth" tablename="EPMS_WorkloadOfEmployee" req="1" AutoPostBack="True"
                OnSelectedIndexChanged="ddlMonth_SelectedIndexChanged">
            </zhongsoft:LightDropDownList>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            周
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlWeek" runat="server" activestatus="(123.*)" AutoPostBack="True"
                OnSelectedIndexChanged="ddlWeek_SelectedIndexChanged">
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l">
            填报人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtEmployeeName" activestatus="(23.进度填报)(23.双周进度填报)"
                field="EmployeeName" tablename="EPMS_WorkloadOfEmployee" class="kpms-textbox"
                EnableTheming="false" readonly="readonly" />
            <input type="hidden" id="hiEmployeeID" runat="server" field="EmployeeID" tablename="EPMS_WorkloadOfEmployee" />
            <input type="hidden" id="hiEmployeeCode" runat="server" field="EmployeeCode" tablename="EPMS_WorkloadOfEmployee" />
        </td>
        <td class="td-l">
            所在部门
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtDeptName" activestatus="(23.进度填报)(23.双周进度填报)"
                field="DeptName" tablename="EPMS_WorkloadOfEmployee" class="kpms-textbox" EnableTheming="false"
                readonly="readonly" />
            <input type="hidden" id="hiDeptID" runat="server" field="DeptID" tablename="EPMS_WorkloadOfEmployee" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            填报日期<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtFillTime" activestatus="(23.进度填报)(23.双周进度填报)"
                class="kpms-textbox-date" EnableTheming="false" readonly="readonly" req="1" />
        </td>
        <td class="td-l">
            进度填报时间段<span class="req-star">*</span>
        </td>
        <td class="td-r" colspan="3">
            <zhongsoft:XHtmlInputText runat="server" ID="txtFillStartDate" activestatus="(23.进度填报)(23.双周进度填报)"
                class="kpms-textbox-date" EnableTheming="false" readonly="readonly" req="1" />
            至
            <zhongsoft:XHtmlInputText runat="server" ID="txtFillEndDate" activestatus="(23.进度填报)(23.双周进度填报)"
                class="kpms-textbox-date" EnableTheming="false" readonly="readonly" req="1" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            月工作天数
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtWorkDay" activestatus="(3.进度填报)(3.双周进度填报)"
                field="WorkDay" tablename="EPMS_WorkloadOfEmployee" class="kpms-textbox-money" EnableTheming="false"
                readonly="readonly" />
        </td>
        <td>
            本期完成工天
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtWorkDayOfComplete" activestatus="(3.进度填报)(3.双周进度填报)"
                field="WorkDayOfComplete" tablename="EPMS_WorkloadOfEmployee" class="kpms-textbox-money"
                EnableTheming="false" readonly="readonly" />
        </td>
        <td class="td-l">
            工作负荷系数
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtWorkload" activestatus="(3.进度填报)(3.双周进度填报)"
                field="Workload" tablename="EPMS_WorkloadOfEmployee" class="kpms-textbox-money" EnableTheming="false"
                readonly="readonly" />
        </td>
    </tr>
    <%--成品设校审工作--%>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <uc1:WBSScheduleGrid ID="ucWBSScheduleGrid" runat="server" OnAfterGridBindEvent="AfterGridBindEvent" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <%--其他非计划工作--%>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <uc1:WBSScheduleGrid ID="ucOtherWork" runat="server" OnAfterGridBindEvent="AfterOhterGridBindEvent" />
        </ContentTemplate>
    </asp:UpdatePanel>
</table>
<input type="hidden" id="hiWorkloadOfEmployeeID" runat="server" field="WorkloadOfEmployeeID"
    tablename="EPMS_WorkloadOfEmployee" />
<input type="hidden" id="hiRoleName" runat="server" field="RoleName" tablename="EPMS_WorkloadOfEmployee" />
<asp:Button ID="btnCreate" runat="server" Visible="false" OnClick="btnCreate_Click" />
<script type="text/javascript">

    function initCustomerPlugin() {
        if (typeof (loadPlanControl) == 'function') {//用户自定义
            loadPlanControl();
        }
    }

</script>
