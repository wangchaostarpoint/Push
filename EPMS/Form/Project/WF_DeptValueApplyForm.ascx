<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_DeptValueApplyForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.Project.WF_DeptValueApplyForm" %>
<%@ Register Src="../../UI/Project/DeptValueProjectDetail.ascx" TagName="DeptValueProjectDetail"
    TagPrefix="uc1" %>
<%@ Register Src="../../UI/Project/DeptValueOtherDetail.ascx" TagName="DeptValueOtherDetail"
    TagPrefix="uc2" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">
            申报周期<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlPlanCycle" runat="server" AutoPostBack="false"
                req="1" OnSelectedIndexChanged="ddlPlanCycle_SelectedIndexChanged" tablename="EPMS_ThisDeptValue"
                field="PlanCycle" activestatus="(23.申报产值)">
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l">
            申报时间段<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText runat="server" ID="txtStarDate" class="kpms-textbox-date"
                EnableTheming="false" readonly="readonly" activestatus="(23.申报产值)" tablename="EPMS_ThisDeptValue"
                field="ApplyStartDate" req="1" />
            至
            <zhongsoft:XHtmlInputText runat="server" ID="txtEndDate" class="kpms-textbox-date"
                EnableTheming="false" readonly="readonly" activestatus="(23.申报产值)" tablename="EPMS_ThisDeptValue"
                field="ApplyEndDate" req="1" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            年份<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlYear" runat="server" req="1" tablename="EPMS_ThisDeptValue"
                field="PlanYear" activestatus="(23.申报产值)">
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l">
            季度
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlQuarter" runat="server" tablename="EPMS_ThisDeptValue"
                field="PlanQuarter" activestatus="(23.申报产值)">
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l">
            月
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlMonth" runat="server" tablename="EPMS_ThisDeptValue"
                field="PlanMonth" activestatus="(23.申报产值)">
            </zhongsoft:LightDropDownList>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            申报人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtApplyUserName" readonly="readonly"
                class="kpms-textbox" tablename="EPMS_ThisDeptValue" field="CreateUserName" activestatus="(23.申报产值)">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
            部门
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtApplyDept" readonly="readonly" class="kpms-textbox"
                tablename="EPMS_ThisDeptValue" field="DeptName" activestatus="(23.申报产值)">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" runat="server" id="hiDeptID" tablename="EPMS_ThisDeptValue"
                field="DeptID" />
        </td>
        <td class="td-l">
            申报日期<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtCreateDate" runat="server" type="text" class="kpms-textbox-date"
                req="1" tablename="EPMS_ThisDeptValue" field="CreateDate" readonly="readonly"
                activestatus="(23.申报产值)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            分配总产值
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtTotalValue" class="kpms-textbox-money"
                EnableTheming="false" readonly="readonly" activestatus="(23.申报产值)" />
        </td>
        <td class="td-l">
            已核发产值
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtCheckValue" class="kpms-textbox-money"
                EnableTheming="false" readonly="readonly" activestatus="(23.申报产值)" />
        </td>
        <td class="td-l">
            剩余产值
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtRestValue" class="kpms-textbox-money"
                EnableTheming="false" readonly="readonly" activestatus="(23.申报产值)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            上期核发产值
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtLaseCheckValue" class="kpms-textbox-money"
                EnableTheming="false" readonly="readonly" tablename="EPMS_ThisDeptValue" field="LastTotalCompleteValue"
                activestatus="(23.申报产值)" />
        </td>
        <td class="td-l">
            本期申报产值
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtApplyValue" class="kpms-textbox-money"
                EnableTheming="false" readonly="readonly" tablename="EPMS_ThisDeptValue" field="ThisApplyValue"
                activestatus="(23.申报产值)" />
            <%--<zhongsoft:LightTextBox runat="server" ID="tbApplyValue" CssClass="kpms-textbox-money"
                EnableTheming="false" tablename="EPMS_ThisDeptValue" field="ThisApplyValue" activestatus="(23.申报产值)"
                Regex="^([1-9]\d{0,11}|[0])(\.\d{1,2})?$" errmsg="请输入正数，最多12位整数，2位小数">
            </zhongsoft:LightTextBox>--%>
        </td>
        <td class="td-l">
            是否项目构成
        </td>
        <td class="td-r">
            <asp:CheckBox ID="cbIsProject" runat="server" AutoPostBack="true" OnCheckedChanged="cbIsProject_CheckedChanged"
                activestatus="(23.申报产值)" tablename="EPMS_ThisDeptValue" field="IsProject" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            本期项目产值
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProjectValue" class="kpms-textbox-money"
                EnableTheming="false" readonly="readonly" activestatus="(123.*)" />
        </td>
        <td class="td-l">
            本期非项目产值
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtOtherValye" class="kpms-textbox-money"
                EnableTheming="false" readonly="readonly" activestatus="(123.*)" />
        </td>
        <td class="td-m" colspan="2">
        </td>
    </tr>
    <tr>
        <td class="td-l">
            备注
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbMemo" CssClass="kpms-textarea" EnableTheming="false"
                TextMode="MultiLine" maxtext="1024" Rows="3" tablename="EPMS_ThisDeptValue" field="Memo"
                activestatus="(23.申报产值)">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr id="trUcDeptValueProjectDetail">
        <td colspan="6">
            <table width="100%">
                <uc1:DeptValueProjectDetail ID="ucDeptValueProjectDetail" runat="server" OnAfterSaveData="AfterSaveData" />
            </table>
        </td>
    </tr>
    <uc2:DeptValueOtherDetail ID="ucDeptValueOtherDetail" runat="server"  OnAfterSaveData="AfterSaveData"/>
</table>
<input type="hidden" id="hiThisDeptValueID" runat="server" tablename="EPMS_ThisDeptValue"
    field="ThisDeptValueID" />
<script type="text/javascript">
    function initCustomerPlugin() {
        if (typeof (loadFormControl) == 'function') {
            loadFormControl();
        }


        setUcValueProjectDetail();
    }
    $("#<%=cbIsProject.ClientID %>").click(function () {

        setUcValueProjectDetail();
    });
    function setUcValueProjectDetail() {
        if ($("#<%=cbIsProject.ClientID %>").attr("checked") == "checked") {
            $("#trUcDeptValueProjectDetail").show();
        } else {
            $("#trUcDeptValueProjectDetail").hide();
        }
    }
</script>
