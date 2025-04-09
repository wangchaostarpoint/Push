<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_SupplyProductValidate.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.Form.MBM.WF_SupplyProductValidate" %>
<table class="tz-table">
    <tr>
        <td class="td-l">
            项目名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsProjectCode" field="ProjectEntityName"
                tablename="MM_DelegateProductValidateForm" activestatus="(23.组织产品验证)" PageWidth="800px"
                SelectPageMode="Dialog" SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true"
                req="1" Width="100px" ResultAttr="name" EnableTheming="false" Writeable="false"
                ShowAttrs="name,UserCode" ResultForControls="{'hiProjectEntityID':'id','txtPhaseName':'PhaseName','txtProjectPhaseCode':'ProjectCode'}"
                PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiProjectEntityID" field="ProjectEntityID"
                tablename="MM_DelegateProductValidateForm" />
        </td>
        <td class="td-l">
            项目编号
        </td>
        <td class="kpms-fim-r">
            <zhongsoft:XHtmlInputText type="text" ID="txtProjectPhaseCode" runat="server" maxlength="64"
                activestatus="(23.组织产品验证)" class="kpms-textbox" readonly="readonly" field="ProjectEntityCode"
                tablename="MM_DelegateProductValidateForm" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            供方<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="LightObjectSelector1" field="SupplyEntityName"
                tablename="MM_DelegateProductValidateForm" activestatus="(23.组织产品验证)" PageWidth="800px"
                SelectPageMode="Dialog" SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true"
                Width="100px" ResultAttr="name" EnableTheming="false" Writeable="false" ShowAttrs="name"
                req="1" ResultForControls="{'hiSupplyEntityID':'id'}" PageUrl="~/MM/Obsolete/SupplierSelector.aspx">
            </zhongsoft:LightObjectSelector>
            <input type="hidden" id="hiSupplyEntityID" runat="server" field="SupplyEntityID"
                tablename="MM_DelegateProductValidateForm" />
        </td>
        <td class="td-l">
            设计阶段
        </td>
        <td class="kpms-fim-r">
            <zhongsoft:XHtmlInputText type="text" runat="server" maxlength="64" activestatus="(23.组织产品验证)"
                readonly="readonly" ID="txtPhaseName" class="kpms-textbox" field="PhaseName"
                tablename="MM_DelegateProductValidateForm" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            验证产品清单<br />
            (包括文件、图纸、试验报告等)<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="TextBox1" runat="server" maxtext="256" Field="ValidateProductList"
                req="1" ActiveStatus="(23.组织产品验证)" TableName="MM_DelegateProductValidateForm"
                TextMode="MultiLine" Rows="4" CssClass="kpms-textarea" EnableTheming="false" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            验证内容<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbValidateContent" runat="server" maxtext="256" Field="ValidateContent"
                req="1" ActiveStatus="(23.组织产品验证)" TableName="MM_DelegateProductValidateForm"
                TextMode="MultiLine" Rows="4" CssClass="kpms-textarea" EnableTheming="false" />
            <asp:Label ID="Label1" Text="1、项目内容、范围、进度、满足任务书和合同情况。
                2、验证依据的规定/标准及符合情况。" ForeColor="Red" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            验证方式<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbValidateMode" runat="server" maxtext="256" Field="ValidateMode"
                req="1" ActiveStatus="(23.组织产品验证)" TableName="MM_DelegateProductValidateForm"
                TextMode="MultiLine" Rows="4" CssClass="kpms-textarea" EnableTheming="false" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            验证结论<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbValidateOppion" runat="server" maxtext="256" Field="ValidateOpion"
                req="1" ActiveStatus="(23.组织产品验证)" TableName="MM_DelegateProductValidateForm"
                TextMode="MultiLine" Rows="4" CssClass="kpms-textarea" EnableTheming="false" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            验证部门
        </td>
        <td class="td-m">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsHostDept" PageUrl="~/Sys/OrgUsers/OrgTreeSelector.aspx"
                ResultForControls="{'hiValidateDeptID':'id'}" ResultAttr="att2" ActiveStatus="(23.组织产品验证)"
                PageHeight="560" PageWidth="500" field="ValidateDeptName" tablename="MM_DelegateProductValidateForm"
                req="1" reqmsg="请选择验证部门" SelectPageMode="Dialog" CssClass="kpms-textbox" EnableTheming="false" />
            <input type="hidden" runat="server" id="hiValidateDeptID" field="ValidateDeptID"
                tablename="MM_DelegateProductValidateForm" />
        </td>
        <td class="td-l">
            验证负责人
        </td>
        <td class="td-l">
            <input id="txtValidateResponseUserName" runat="server" field="ValidateResponseUserName"
                tablename="MM_DelegateProductValidateForm" activestatus="(23.验证)" maxlength="32"
                readonly="readonly" class="kpms-textbox" />
            <input type="hidden" runat="server" id="hiValidateResponseUserID" field="ValidateResponseUserID"
                tablename="MM_DelegateProductValidateForm" />
        </td>
        <td class="td-l">
            验证日期<span class="req-star">*</span>
        </td>
        <td class="td-l">
            <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtValidateDate" readonly="readonly"
                class="kpms-textbox-date" req="1" field="ValidateDate" tablename="MM_DelegateProductValidateForm"
                activestatus="(23.验证)" />
        </td>
    </tr>
</table>
<!--流程主键标识-->
<input type="hidden" id="hiMMDelegateProductValidateID" runat="server" field="MMDelegateProductValidateID"
    tablename="MM_DelegateProductValidateForm" />
<script type="text/javascript">

    function initCustomerPlugin() {
        checkMaxLength();
    }
</script>
