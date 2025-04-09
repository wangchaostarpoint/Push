<%@ Page Title="事故隐患排查情况反馈" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="SafetyChkFeedbackEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.Form.Survey.SafetyChkFeedbackEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" width="100%">
        <tr>
            <td class="td-l">
                隐患排查情况描述
            </td>
            <td colspan="5" class="td-m">
                <zhongsoft:LightTextBox ID="tbInvestigationContent" CssClass="kpms-textarea" runat="server"
                    TextMode="MultiLine" EnableTheming="false" maxtext="2048" tablename="EPMS_SafetyMgrFeedback"
                    field="InvestigationContent" ActiveStatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr runat="server" id="trExtendInfo">
            <td class="td-l">
                类别
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlInvestigationType" field="InvestigationType"
                    tablename="EPMS_SafetyChkAndFeedback" req="1" ActiveStatus="(23.*)">
                    <asp:ListItem Value="管理缺失" Text="管理缺失"></asp:ListItem>
                    <asp:ListItem Value="人的不安全行为" Text="人的不安全行为"></asp:ListItem>
                    <asp:ListItem Value="物的不安全行为" Text="物的不安全行为"></asp:ListItem>
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                风险等级
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlRiskLevel" field="RiskLevel" tablename="EPMS_SafetyChkAndFeedback"
                    req="1" ActiveStatus="(23.*)">
                    <asp:ListItem Value="一般" Text="一般"></asp:ListItem>
                    <asp:ListItem Value="重大" Text="重大"></asp:ListItem>
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                要求整改完成时间
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtPlanExcDate" runat="server"
                    field="PlanExcDate" tablename="EPMS_SafetyMgrFeedback" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                监查、检查人
            </td>
            <td class="td-r">
                <input runat="server" id="hiReformUserID" type="hidden" field="ReformUserID" tablename="EPMS_SafetyChkAndFeedback" />
                <zhongsoft:LightObjectSelector runat="server" ID="tbReformUserName" IsMutiple="false"
                    EnableTheming="false" SourceMode="SelectorPage" ShowJsonRowColName="true" SelectPageMode="Dialog"
                    DoCancel="true" ResultAttr="name" ResultForControls="{'hiInvestigationUserID':'id'}"
                    PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx" activestatus="(23.*)" field="ReformUserName"
                    tablename="EPMS_SafetyMgrFeedback" req="1" />
            </td>
            <td class="td-l">
                监查、检查时间
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtReformDate" runat="server"
                    field="ReformDate" tablename="EPMS_SafetyMgrFeedback" activestatus="(23.*)" req="1" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                整改措施
            </td>
            <td colspan="5" class="td-m">
                <zhongsoft:LightTextBox ID="tbReformMeasure" CssClass="kpms-textarea" runat="server"
                    TextMode="MultiLine" EnableTheming="false" maxtext="2048" tablename="EPMS_SafetyMgrFeedback"
                    field="ReformMeasure" ActiveStatus="(23.*)" req="1"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <!-----整改反馈意见主键---->
    <input type="hidden" runat="server" id="hiInFeedbackID" field="InFeedbackID" tablename="EPMS_SafetyMgrFeedback" />
    <!-----反馈流程主键---->
    <input type="hidden" runat="server" id="hiSafetyChkFeedbackID" field="SafetyChkFeedbackID"
        tablename="EPMS_SafetyMgrFeedback" />
    <!-----监管流程主键---->
    <input type="hidden" runat="server" id="hiSupervisionID" field="SupervisionID" tablename="EPMS_SafetyMgrFeedback" />
    <input type="hidden" runat="server" id="hiFlag" field="Flag" tablename="EPMS_SafetyMgrFeedback"
        value="1" />
    <script type="text/javascript" src="<%=WebAppPath %>/EM/UI/Script/EMGeneralScript.js"></script>
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }
    </script>
</asp:Content>
