<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RiskIdentifyEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Plan.RiskIdentifyEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<%@ Import Namespace="Zhongsoft.Portal.EPMS" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                风险类别<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlRiskCategory" TableName="EPMS_ParamRiskIdentify"
                    Field="RiskCategory" activestatus="(23.*)" req="1">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                风险名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbRiskName" TableName="EPMS_ParamRiskIdentify"
                    Field="RiskName" activestatus="(23.*)" MaxLength="50" req="1">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                风险等级<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlRiskRank" TableName="EPMS_ParamRiskIdentify"
                    Field="RiskRank" activestatus="(23.*)" req="1">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                风险处理方式<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlRiskProcessMode" TableName="EPMS_ParamRiskIdentify"
                    Field="RiskProcessMode" activestatus="(23.*)" req="1">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                预期结果<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlExpectedResult" TableName="EPMS_ParamRiskIdentify"
                    Field="ExpectedResult" activestatus="(23.*)" req="1">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                风险描述<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbRiskDescribe" TableName="EPMS_ParamRiskIdentify"
                    MaxLength="1024" Field="RiskDescribe" activestatus="(23.*)" TextMode="MultiLine"
                    EnableTheming="false" CssClass="kpms-textarea" req="1">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                应对措施<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbCounterMeasure" TableName="EPMS_ParamRiskIdentify"
                    EnableTheming="false" MaxLength="1024" Field="CounterMeasure" activestatus="(23.*)"
                    TextMode="MultiLine" CssClass="kpms-textarea" req="1">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                填写人
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtFillUserName" activestatus="(23.*)"
                    readonly="readonly" class="kpms-textbox" tablename="EPMS_ParamRiskIdentify" field="FillUserName" />
            </td>
            <td class="td-l">
                填写部门
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtFillDeptName" activestatus="(23.*)"
                    readonly="readonly" class="kpms-textbox" tablename="EPMS_ParamRiskIdentify" field="FillDeptName" />
            </td>
            <td class="td-l">
                填写日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtFillDate" activestatus="(23.*)" readonly="readonly"
                    style="width: 70px" class="kpms-textbox-date" tablename="EPMS_ParamRiskIdentify"
                    field="FillDate" />
            </td>
        </tr>
    </table>
    <!--填写人-->
    <input type="hidden" runat="server" id="hiFillUserID" field="FillUserID" tablename="EPMS_ParamRiskIdentify" />
    <input type="hidden" runat="server" id="hiFillUserCode" field="FillUserCode" tablename="EPMS_ParamRiskIdentify" />
    <!--填写部门-->
    <input type="hidden" runat="server" id="hiFillDeptID" field="FillDeptID" tablename="EPMS_ParamRiskIdentify" />
    <input type="hidden" runat="server" id="hiFillDeptCode" field="FillDeptCode" tablename="EPMS_ParamRiskIdentify" />
    <!--主键ID-->
    <input type="hidden" runat="server" id="hiParamRiskIdentifyID" field="ParamRiskIdentifyID"
        tablename="EPMS_ParamRiskIdentify" />
    <input type="hidden" runat="server" id="hiFlag" field="Flag"
        tablename="EPMS_ParamRiskIdentify" />
    <script>
        function initCustomerPlugin() {

        }
    </script>
</asp:Content>
