<%@ Page Title="事故隐患排查情况及治理信息" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="SafetyChkTaskEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.Form.Survey.SafetyChkTaskEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" width="100%">
        <tr>
            <td class="td-l">
                隐患排查情况描述
            </td>
            <td colspan="3" class="td-m">
                <zhongsoft:LightTextBox ID="tbDetailContent" CssClass="kpms-textarea" runat="server"
                    TextMode="MultiLine" EnableTheming="false" maxtext="2048" tablename="EPMS_SafetyChkAndFeedback"
                    field="InvestigationContent" ActiveStatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                监查、检查人
            </td>
            <td class="td-r">
                <input runat="server" id="hiInvestigationUserID" type="hidden" field="InvestigationUserID"
                    tablename="EPMS_SafetyChkAndFeedback" />
                <zhongsoft:LightObjectSelector runat="server" ID="tbInvestigationUserName" IsMutiple="false"
                    EnableTheming="false" SourceMode="SelectorPage" ShowJsonRowColName="true" SelectPageMode="Dialog"
                    DoCancel="true" ResultAttr="name" ResultForControls="{'hiInvestigationUserID':'id'}"
                    PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx" activestatus="(23.*)" field="InvestigationUserName"
                    tablename="EPMS_SafetyChkAndFeedback" />
            </td>
            <td class="td-l">
                监查、检查时间
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtSupervisionDate" runat="server"
                    field="InvestigationDate" tablename="EPMS_SafetyChkAndFeedback" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
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
        </tr>
        <tr>
            <td class="td-l">
                责任部门
            </td>
            <td class="td-r">
                <asp:DropDownList ID="ddlDept" runat="server" field="ExcDeptID" tablename="EPMS_SafetyChkAndFeedback"
                    req="1">
                </asp:DropDownList>
                <input type="hidden" runat="server" id="hiExcDeptName" field="ExcDeptName" tablename="EPMS_SafetyChkAndFeedback" />
            </td>
            <td class="td-l">
                责任科室
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtExcUnitName" field="ExcUnitName"
                    req="1" tablename="EPMS_SafetyChkAndFeedback" activestatus="(23.*)" SourceMode="SelectorPage"
                    ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" IsMutiple="true"
                    EnableTheming="false" Writeable="true" ShowAttrs="name" ResultForControls="{'hiExcUnitID':'id'}"
                    PageUrl="~/EPMS/Form/Survey/OrgSelectorJson.aspx" FilterFunction="filterFuc();">
                </zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiExcUnitID" field="ExcUnitID" tablename="EPMS_SafetyChkAndFeedback" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                要求整改完成时间
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtPlanExcDate" runat="server"
                    field="PlanExcDate" tablename="EPMS_SafetyChkAndFeedback" activestatus="(23.*)"
                    req="1" />
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiInvestigationID" field="InvestigationID"
        tablename="EPMS_SafetyChkAndFeedback" />
    <input type="hidden" runat="server" id="hiSupervisionID" field="SupervisionID" tablename="EPMS_SafetyChkAndFeedback" />
    <input type="hidden" runat="server" id="hiFlag" field="Flag" tablename="EPMS_SupervisionDetail"
        value="1" />
    <script type="text/javascript" src="<%=WebAppPath %>/EM/UI/Script/EMGeneralScript.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            // 绑定keyup和change事件
            $("#<%=ddlDept.ClientID %>").bind("keyup change", function () {
                if ($(this).val() != "") {
                    // 这里需要注意，$(this).text()获取的是整个集合的text属性内容，所以需要再过滤下，把选中的项取出来
                    $("#<%=hiExcDeptName.ClientID %>").val($(this).find(":selected").text());
                    $("#<%=txtExcUnitName.ClientID %>").val("");
                    $("#<%=hiExcUnitID.ClientID %>").val("");
                }
                else {
                    $("#<%=txtExcUnitName.ClientID %>").val("");
                    $("#<%=hiExcUnitID.ClientID %>").val("");
                }
            });
        });
    </script>
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }

        //部门id传参

        function filterFuc() {
            var orgId = $("#<%=ddlDept.ClientID %>").val();
            return "{ParentId:'" + orgId + "'}";
        }
    </script>
</asp:Content>
