<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ProjectFlowDeleteForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.Sys.WF_ProjectFlowDeleteForm" %>
<table class="tz-table">
    <tr>
        <td class="td-l">
            删除类别<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlFormType" TableName="EPMS_ProjectFlowDeleteForm"
                Field="DeleteFormID" activestatus="(2.填写申请)" req="1">
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l">
            申请人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtApplyUserName" runat="server" readonly="readonly"
                tablename="EPMS_ProjectFlowDeleteForm" field="ApplyUserName" activestatus="(23.填写申请)"
                class="kpms-textbox" />
            <input type="hidden" runat="server" id="hiApplyUserID" tablename="EPMS_WBSOutline"
                field="ApplyUserID" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            流程名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <table width="100%">
                <tr>
                    <td>
                        <zhongsoft:LightObjectSelector runat="server" ID="txtFlowName" SourceMode="SelectorPage"
                            IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                            PageWidth="950" EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/Sys/Workflow/WorkflowSelector.aspx"
                            ResultForControls="{'hiFlowID':'id','txtFlowName':'name','hiBusinessID':'att2'}"
                            TableName="EPMS_ProjectFlowDeleteForm" Field="FlowName" activestatus="(2.填写申请)"
                            FilterFunction="flowFilter()" BeforeSelect="beforeSelFlow()" req="1" OnClick="txtFlowName_Click">
                        </zhongsoft:LightObjectSelector>
                        <input type="hidden" id="hiFlowID" runat="server" field="FlowID" tablename="EPMS_ProjectFlowDeleteForm" />
                        <input type="hidden" id="hiBusinessID" runat="server" field="BusinessID" tablename="EPMS_ProjectFlowDeleteForm" />
                    </td>
                    <td style="width: 150px">
                        <a class="aStyle" onclick="ViewFormInfo()">点击查看流程信息</a>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            删除原因<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbDeleteReason" runat="server" MaxText="256" TableName="EPMS_ProjectFlowDeleteForm"
                Field="DeleteReason" ActiveStatus="(23.填写申请)" EnableTheming="false" CssClass="kpms-textarea"
                TextMode="MultiLine" req="1" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            备注
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbMemo" runat="server" MaxText="1024" TableName="EPMS_ProjectFlowDeleteForm"
                Field="Memo" ActiveStatus="(23.填写申请)" EnableTheming="false" CssClass="kpms-textarea"
                TextMode="MultiLine" />
        </td>
    </tr>
</table>
<input type="hidden" id="hiProjectFlowDeleteFormID" runat="server" field="ProjectFlowDeleteFormID"
    tablename="EPMS_ProjectFlowDeleteForm" />
<script>
    function beforeSelFlow() {
        var formId = $('#<%=ddlFormType.ClientID %>').val();
        if (formId == '') {
            alert('请先选择操作类别！');
            $('#<%=ddlFormType.ClientID %>').focus();
            return false;
        }
        return true;
    }

    //选择流程数据筛选
    function flowFilter() {
        var formId = $('#<%=ddlFormType.ClientID %>').val();
        switch (formId) {
            case "231":
            case "224":
            case "223":
            case "225":
                return { FormId: formId };
                break;
            default:
                return { FormId: formId, OnlyFinish: 1 };
                break;
        }
    }

    //查看流程
    function ViewFormInfo() {
        var formId = $('#<%=ddlFormType.ClientID %>').val();
        var processId = $('#<%=hiFlowID.ClientID %>').val();
        if (formId == '' || processId == '') {
            alert('请先选择流程，再查看流程信息！');
            return false;
        }
        url = "<%=WebAppPath %>/Sys/Workflow/FormDetail.aspx?actionType=1&FormID=" + formId + "&prcinstid=" + processId;
        window.open(url, '_blank');
        return false;
    }
</script>
