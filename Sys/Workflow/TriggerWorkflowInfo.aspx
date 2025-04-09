<%@ Page Title="运行工作流信息" Language="C#" MasterPageFile="~/UI/Master/ObjectCfg.Master"
    AutoEventWireup="true" CodeBehind="TriggerWorkflowInfo.aspx.cs" Inherits="Zhongsoft.Portal.Sys.Workflow.TriggerWorkflowInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolTip" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="topBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                流程表单
            </td>
            <td class="td-m">
                <a runat="server" id="aForm" href="#" target="_blank"></a>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                规则名称
            </td>
            <td class="td-m">
                <asp:Label ID="lbRule" runat="server" Text="无"></asp:Label>
                <input runat="server" id="hiRule" type="hidden" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                规则说明
            </td>
            <td class="td-m">
                <asp:Label ID="lbMemo" runat="server" Text="无"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                待办主题
            </td>
            <td class="td-m">
                <asp:Label ID="lbTitle" runat="server" Text=""></asp:Label>
            </td>
        </tr>
    </table>
    <input runat="server" type="hidden" id="hiTriggerId" />
    <script>
        function showRuleDialog() {
            var ruleId = $("#<%=hiRule.ClientID %>").val();
            if (ruleId == "") {
                return false;
            }

            var url = buildBizUrl(1, ruleId, "Sys/Rule/RuleEditor.aspx", null);
            showModal(url, "", 500, 500);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="bottomBar" runat="server">
    <asp:LinkButton runat="server" ID="btnOk" OnClick="btnOk_Click">
                      <span >确定</span>
    </asp:LinkButton>
    <asp:LinkButton runat="server" ID="btnCancle" OnClientClick="window.close();">
                      <span >取消</span>
    </asp:LinkButton>
</asp:Content>
