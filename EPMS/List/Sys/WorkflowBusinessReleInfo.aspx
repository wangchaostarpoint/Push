<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkflowBusinessReleInfo.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Sys.WorkflowBusinessReleInfo" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" width="100%" runat="server" id="Table1">
        <tr>
            <td class="td-l">
                流程名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtFormName" SourceMode="SelectorPage"
                    IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                    EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/Sys/Workflow/WfFormSelector.aspx"
                    OnClick="txtFormName_Click" ResultForControls="{'hiFormID':'FormID'}" activestatus="(23.*)"
                    tablename="EPMS_WorkflowBusinessInfo" field="FormName" req="1"></zhongsoft:LightObjectSelector>
                <input id="hiFormID" type="hidden" runat="server" tablename="EPMS_WorkflowBusinessInfo"
                    field="FormID" />
            </td>
            <td class="td-l">
                业务表名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlBusinessTableName" runat="server" req="1" activestatus="(23.*)"
                    field="BusinessTableName" tablename="EPMS_WorkflowBusinessInfo" OnSelectedIndexChanged="ddlFormName_SelectedIndexChanged"
                    AutoPostBack="true" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                业务表主键
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtBusinessKeyId" activestatus="(23.*)"
                    class="kpms-textbox" EnableTheming="false" field="BusinessKeyId" tablename="EPMS_WorkflowBusinessInfo"
                    readonly="readonly" />
            </td>
            <td class="td-l">
                与项目相关的字段名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlOrganizationID" runat="server" req="1" activestatus="(23.*)" />
                <input type="hidden" runat="server" id="hiOrganizationID" field="OrganizationID"
                    tablename="EPMS_WorkflowBusinessInfo" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                排序号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbSort" TableName="EPMS_WorkflowBusinessInfo" Field="Sort"
                    req="1" CssClass="kpms-textbox-money" MaxLength="2" EnableTheming="false" activestatus="(23.*)"
                    Regex="^[1-9]\d*$" errmsg="请输入整数" runat="server"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                是否与其他流程共用业务表
            </td>
            <td class="td-r">
                <asp:CheckBox ID="ckbIsSaveTable" runat="server" EnableTheming="false" field="IsSaveTable"
                    AutoPostBack="true" OnCheckedChanged="ckbIsSaveTable_CheckedChanged" tablename="EPMS_WorkflowBusinessInfo"
                    Text="是" activestatus="(23.*)" />
            </td>
        </tr>
        <tr id="same" runat="server">
            <td class="td-l">
                业务表中区分流程类型字段<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlFlowTypeColumn" runat="server" activestatus="(23.*)" />
                <input type="hidden" runat="server" id="hiFlowTypeColumn" field="FlowTypeColumn"
                    tablename="EPMS_WorkflowBusinessInfo" />
            </td>
            <td class="td-l">
                流程类型值<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtFlowTypeValue" activestatus="(23.*)"
                    class="kpms-textbox" EnableTheming="false" MaxLength="64" field="FlowTypeValue"
                    tablename="EPMS_WorkflowBusinessInfo" />
            </td>
        </tr>
    </table>
    <%-- 主键--%>
    <input id="hiKeyId" type="hidden" tablename="EPMS_WorkflowBusinessInfo" field="KeyId"
        runat="server" />
    <input id="hiFlag" type="hidden" tablename="EPMS_WorkflowBusinessInfo" field="Flag"
        runat="server" value="1" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkForm();
        }

        function checkForm() {
            var aa = $("#<%=ckbIsSaveTable.ClientID %>").attr("checked");
            if (aa == "checked") {
                $("#<%=ddlFlowTypeColumn.ClientID %>").attr("req", "1");
                $("#<%=txtFlowTypeValue.ClientID %>").attr("req", "1");
            }
            else {
                $("#<%=ddlFlowTypeColumn.ClientID %>").removeAttr("req");
                $("#<%=txtFlowTypeValue.ClientID %>").removeAttr("req");
            }
            return true;
        }
    </script>
</asp:Content>
