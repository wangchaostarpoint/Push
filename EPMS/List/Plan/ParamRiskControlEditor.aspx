<%@ Page Title="风险控制和机遇详细" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master" AutoEventWireup="true" CodeBehind="ParamRiskControlEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Plan.ParamRiskControlEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" width="100%">
        <tr>
            <td class="td-l">风险和机遇来源<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:XHtmlInputText ID="txtRiskName" runat="server" MaxText="128" field="RiskName"
                    tablename="EPMS_ParamRiskControl" class="kpms-textbox" ActiveStatus="(23.*)" req="1" />
            </td>
        </tr>
        <tr>
            <td class="td-l">风险和机遇描述<span class="req-star">*</span>
            </td>
            <td colspan="5" class="td-m">
                <zhongsoft:LightTextBox ID="tbRiskDescribe" CssClass="kpms-textarea" runat="server"
                    TextMode="MultiLine" EnableTheming="false" maxtext="1024" tablename="EPMS_ParamRiskControl"
                    field="RiskDescribe" ActiveStatus="(23.*)" req="1"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">发生概率<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlProbability" field="Probability"
                                             tablename="EPMS_ParamRiskControl" req="1" ActiveStatus="(23.*)"/>
            </td>
            <td class="td-l">影响程度<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlExpectedResult" field="ExpectedResult"
                    tablename="EPMS_ParamRiskControl" req="1" ActiveStatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">风险等级<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlRiskRank" field="RiskRank" tablename="EPMS_ParamRiskControl"
                    req="1" ActiveStatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">控制措施<span class="req-star">*</span>
            </td>
            <td colspan="5" class="td-m">
                <zhongsoft:LightTextBox ID="tbCounterMeasure" CssClass="kpms-textarea" runat="server"
                    TextMode="MultiLine" EnableTheming="false" maxtext="1024" tablename="EPMS_ParamRiskControl"
                    field="CounterMeasure" ActiveStatus="(23.*)" req="1"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiRiskControlItemID" field="ParamRiskControlID"
        tablename="EPMS_ParamRiskControl" />
    <input type="hidden" runat="server" id="hiFlag" field="Flag" tablename="EPMS_ParamRiskControl" value="1" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }
    </script>
</asp:Content>
