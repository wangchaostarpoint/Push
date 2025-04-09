<%@ Page Title="触发器编辑" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="TriggerEditor.aspx.cs" Inherits="Zhongsoft.Portal.Custom.List.TriggerEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <style>
        .kpms-textbox
        {
            padding-left: 0px;
        }
    </style>
    <table class="tz-table">
        <tr>
            <td class="td-l">
                数据字典<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <input type="hidden" runat="server" id="hiFeatureObjectId" field="FeatureObjectId"
                    tablename="PortalTrigger" />
                <zhongsoft:LightTextBox ReadOnly="true" runat="server" ID="tbSourceName"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                流程表单<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <input type="hidden" runat="server" id="hiPackageName" />
                <input type="hidden" runat="server" id="hiXpdlId" />
                <input type="hidden" runat="server" id="hiDataSource" />
                <input type="hidden" runat="server" id="hiFormId" />
                <zhongsoft:LightObjectSelector runat="server" ID="lbsForm" PageUrl="/Portal/Sys/Workflow/WfFormSelector.aspx"
                    ResultAttr="name" ShowJsonRowColName="true" ResultForControls="{'hiFormId':'FormID','hiPackageName':'PackageName','hiXpdlId':'XPDLID'}" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                条件规则
            </td>
            <td class="td-m">
                <input type="hidden" runat="server" id="hiRuleId" />
                <zhongsoft:LightObjectSelector runat="server" ID="lbsRule" PageUrl="/Portal/Sys/Rule/RuleSelector.aspx"
                    ActiveStatus="(23.*)" Filter="TransitionEvent" ResultForControls="{'hiRuleId':'id'}"
                    ResultAttr="name" />
            </td>
        </tr>
        <tr class="trTitle">
            <td class="td-l">
                主题<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsTitle" OnClientClick="buildTitle();return false;" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                新建业务数据
            </td>
            <td class="td-m">
                <asp:CheckBox runat="server" ID="cbNewBussiness" Text="是" />
            </td>
        </tr>
    </table>
    <script>
        function buildTitle() {
            buildExp("<%=lbsTitle.ClientID %>", "<%=lbsTitle.HiddenClientID %>");
            return false;
        }

        function buildExp(ctrlId, hiddenId) {
            var tableCode = $("#<%=hiDataSource.ClientID %>").val()
            if (tableCode == null) {
                alert("表单未配置主数据源!");
                return;
            }

            var url = buildQueryUrl("sys/CommonExpEditor.aspx", { TableCode: tableCode, FieldType: "BDDict" });
            var re = showModal(url, $("#" + hiddenId).val(), 800, 400);
            if (re != null) {
                $("#" + ctrlId).val(re);
                $("#" + hiddenId).val(re);
            }
        }
    </script>
    <input runat="server" id="hiExpression" type="hidden" tablename="PortalTrigger" field="Expression" />
    <input runat="server" id="hiTriggerFeatureId" type="hidden" tablename="PortalTrigger"
        field="TriggerFeatureId" />
    <input type="hidden" runat="server" id="hiFlag" tablename="PortalTrigger" field="Flag"
        value="1" />
    <%-- 本页面只提供业务实体触发发起流程配置功能--%>
    <%--FeatureObjectType=BusinessEntity（1）--%>
    <input type="hidden" runat="server" id="hiFeatureObjectType" field="FeatureObjectType"
        tablename="PortalTrigger" value="1" />
    <%--SOAFeatureType=CreateWorkflow(0)--%>
    <input type="hidden" runat="server" id="hiFeatureType" tablename="PortalTrigger"
        field="FeatureType" value="0" />
</asp:Content>
