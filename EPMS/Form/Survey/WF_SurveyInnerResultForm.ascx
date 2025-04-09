<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_SurveyInnerResultForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.Survey.WF_SurveyInnerResultForm" %>
<%@ Register Src="../../UI/FileList.ascx" TagName="FileList" TagPrefix="uc1" %>
<table class="tz-table">
    <tr>
        <td class="td-l">
            任务编号<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtTaskCode" SourceMode="SelectorPage"
                IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="TaskCode"
                PageWidth="850" EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/SurveyInnerTaskSelector.aspx"
                ResultForControls="{'hiProjectID':'OrganizationID','txtProjectCode':'ProjectCode','txtProjectName':'name','txtPhaseName':'PhaseName',
                   'txtSendSpecialtyName':'ReceiveSpecialtyName','hiSendSpecialtyID':'ReceiveSpecialtyID','hiSendSpecialtyCode':'ReceiveSpecialtyCode',
                   'txtSendUserName':'ReceiveUserName','hiSendUserID':'ReceiveUserID','txtRollName':'RollName','hiRollID':'RollID','txtRollCode':'RollCode',
                   'txtReceiveSpecialtyName':'SendSpecialtyName','hiReceiveSpecialtyID':'SendSpecialtyID','hiReceiveSpecialtyCode':'SendSpecialtyCode',
                   'txtReceiveUserName':'SendUserName','hiReceiveUserID':'SendUserID'}" TableName="EPMS_SurveyInnerManage"
                Field="TaskCode" activestatus="(23.提交成果)" req="1"></zhongsoft:LightObjectSelector>
        </td>
        <td class="td-l">
            成果提交日期
        </td>
        <td class="td-m" colspan="4">
            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtSubmitDate" runat="server"
                readonly="readonly" TableName="EPMS_SurveyInnerManage" Field="SubmitDate" ActiveStatus="(23.提交成果)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            项目名称
        </td>
        <td class="td-r" colspan="3">
            <zhongsoft:XHtmlInputText ID="txtProjectName" runat="server" field="ProjectName"
                readonly="readonly" tablename="EPMS_SurveyInnerManage" activestatus="(23.提交成果)"
                class="kpms-textbox" />
            <input type="hidden" id="hiProjectID" runat="server" field="OrganizationID" tablename="EPMS_SurveyInnerManage" />
        </td>
        <td class="td-l">
            项目编号
        </td>
        <td>
            <zhongsoft:XHtmlInputText ID="txtProjectCode" runat="server" field="ProjectCode"
                readonly="readonly" tablename="EPMS_SurveyInnerManage" activestatus="(23.提交成果)"
                class="kpms-textbox" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            提资专业
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtSendSpecialtyName" runat="server" field="SendSpecialtyName"
                readonly="readonly" tablename="EPMS_SurveyInnerManage" activestatus="(23.提交成果)"
                class="kpms-textbox" />
            <input type="hidden" id="hiSendSpecialtyID" name="hiSendSpecialtyID" runat="server"
                tablename="EPMS_SurveyInnerManage" field="SendSpecialtyID" />
            <input type="hidden" id="hiSendSpecialtyCode" name="hiSendSpecialtyCode" runat="server"
                tablename="EPMS_SurveyInnerManage" field="SendSpecialtyCode" />
        </td>
        <td class="td-l">
            提资人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtSendUserName" runat="server" field="SendUserName"
                readonly="readonly" tablename="EPMS_SurveyInnerManage" activestatus="(23.提交成果)"
                class="kpms-textbox" />
            <input type="hidden" id="hiSendUserID" name="hiSendUserID" runat="server" tablename="EPMS_SurveyInnerManage"
                field="SendUserID" />
        </td>
        <td class="td-l">
            阶段名称
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtPhaseName" runat="server" field="PhaseName" readonly="readonly"
                tablename="EPMS_SurveyInnerManage" activestatus="(23.提交成果)" class="kpms-textbox" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            卷册名称
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText ID="txtRollName" runat="server" field="RollName" readonly="readonly"
                tablename="EPMS_SurveyInnerManage" activestatus="(23.提交成果)" class="kpms-textbox" />
            <input type="hidden" runat="server" id="hiRollID" tablename="EPMS_SurveyInnerManage"
                field="RollID" />
        </td>
        <td class="td-l">
            卷册编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtRollCode" activestatus="(23.提交成果)"
                readonly="readonly" class="kpms-textbox" TableName="EPMS_SurveyInnerManage" Field="RollCode" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            备注
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbMemo" runat="server" MaxText="1024" TableName="EPMS_SurveyInnerManage"
                Field="Memo" ActiveStatus="(23.提交成果)" EnableTheming="false" CssClass="kpms-textarea"
                TextMode="MultiLine" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            接收专业
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtReceiveSpecialtyName" activestatus="(23.提交成果)"
                readonly="readonly" class="kpms-textbox" TableName="EPMS_SurveyInnerManage" Field="ReceiveSpecialtyName" />
            <input type="hidden" id="hiReceiveSpecialtyID" name="hiReceiveSpecialtyID" runat="server"
                tablename="EPMS_SurveyInnerManage" field="ReceiveSpecialtyID" />
            <input type="hidden" id="hiReceiveSpecialtyCode" name="hiReceiveSpecialtyCode" runat="server"
                tablename="EPMS_SurveyInnerManage" field="ReceiveSpecialtyCode" />
        </td>
        <td class="td-l">
            接收人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox" ID="txtReceiveUserName" runat="server"
                readonly="readonly" TableName="EPMS_SurveyInnerManage" Field="ReceiveUserName"
                ActiveStatus="(23.提交成果)" />
            <input type="hidden" id="hiReceiveUserID" name="hiReceiveUserID" runat="server" tablename="EPMS_SurveyInnerManage"
                field="ReceiveUserID" />
        </td>
        <td class="td-l">
            校核人<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtCheckManName" field="CheckManName"
                tablename="EPMS_SurveyInnerManage" activestatus="(3.主任工校核)" SourceMode="SelectorPage"
                ResultAttr="name" EnableTheming="false" ResultForControls="{'hiCheckManID':'id'}"
                PageWidth="850" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" req="1" FilterFunction="userFilter()">
            </zhongsoft:LightObjectSelector>
            <input type="hidden" id="hiCheckManID" name="hiCheckManID" runat="server" tablename="EPMS_SurveyInnerManage"
                field="CheckManID" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            成品文件信息
        </td>
        <td colspan="5" class="td-m">
            <uc1:FileList ID="fileList" runat="server" FileType="成品文件" DownAllFile="false" />
        </td>
    </tr>
</table>
<input type="hidden" id="hiSurveyInnerID" name="hiSurveyInnerID" runat="server" tablename="EPMS_SurveyInnerManage"
    field="SurveyInnerID" />
<input type="hidden" id="hiFormType" name="hiFormType" runat="server" tablename="EPMS_SurveyInnerManage"
    field="FormType" value="1" />
<script type="text/javascript">
    function initCustomerPlugin() {
        initFileList();
    }

    //选择任务的筛选条件
    function userFilter() {
        var orgId = $('#<%=hiProjectID.ClientID %>').val();
        var specialtyId = $("#<%=hiSendSpecialtyID.ClientID %>").val();
        return { ProjectPhaseID: orgId, SpecialtyID: specialtyId };
    }
</script>
