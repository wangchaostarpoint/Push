<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_SurveyTaskBookModifyForm.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.Form.Project.WF_SurveyTaskBookModifyForm" %>
<table class="tz-table">
    <tr>
        <td class="td-l">工程名称
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsProjectName" req="1" IsMutiple="false"
                SelectPageMode="Dialog" ResultForControls="{'hiOrganizationID':'id','txtPhaseName':'PhaseName','hiParamPhaseID':'ParamPhaseID'}"
                EnableTheming="false" Text="选择工程" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                PageWidth="850" ShowJsonRowColName="true" ResultAttr="name" OnClick="lbsProjectName_OnClick"
                activestatus="(23.收集相关资料)" field="ProjectName" tablename="EPMS_SurveyTaskBookModify" />
            <input type="hidden" id="hiOrganizationID" name="hiOrganizationID" runat="server" tablename="EPMS_SurveyTaskBookModify" field="OrganizationID" />
        </td>
        <td class="td-l">设计阶段
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtPhaseName" TableName="EPMS_SurveyTaskBookModify" Field="PhaseName" ActiveStatus="(23.收集相关资料)"
                readonly="readonly" class="kpms-textbox" />
            <input type="hidden" id="hiParamPhaseID" name="hiParamPhaseID" runat="server" tablename="EPMS_SurveyTaskBookModify" field="ParamPhaseID" />
        </td>
    </tr>
    <tr>
        <td class="td-l">提出专业</td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlParamSpecialtyID" ActiveStatus="(23.收集相关资料)" tablename="EPMS_SurveyTaskBookModify" field="ParamSpecialtyID" />
            <input type="hidden" id="hiSpecialtyName" name="hiParamSpecialtyID" runat="server" tablename="EPMS_SurveyTaskBookModify" field="SpecialtyName" />
        </td>
        <td class="td-l">提出人</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtPutForwardUserName" TableName="EPMS_SurveyTaskBookModify" Field="PutForwardUserName" ActiveStatus="(23.收集相关资料)"
                readonly="readonly" class="kpms-textbox" />
            <input type="hidden" id="hiPutForwardUserID" name="hiPutForwardUserID" runat="server" tablename="EPMS_SurveyTaskBookModify" field="PutForwardUserID" />
        </td>
        <td class="td-l">提出日期</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtPutForwardDate" runat="server" readonly="readonly" TableName="EPMS_SurveyTaskBookModify" Field="PutForwardDate" ActiveStatus="(23.收集相关资料)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">审核人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtCheckUserName" TableName="EPMS_SurveyTaskBookModify" Field="CheckUserName" ActiveStatus="(3.审核)"
                readonly="readonly" class="kpms-textbox" />
            <input type="hidden" id="hiCheckUserID" name="hiCheckUserID" runat="server" tablename="EPMS_SurveyTaskBookModify" field="CheckUserID" />
        </td>
        <td class="td-l">审核日期</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtCheckDate" runat="server" readonly="readonly"
                TableName="EPMS_SurveyTaskBookModify" Field="CheckDate" ActiveStatus="(3.审核)" />
        </td>
        <td class="td-m" colspan="2"></td>
    </tr>
    <tr>
        <td class="td-l">审定人姓名</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtValidationUserName" runat="server" TableName="EPMS_SurveyTaskBookModify" Field="ValidationUserName" ActiveStatus="(3.审定)"
                readonly="readonly" class="kpms-textbox" />
            <input type="hidden" id="hiValidationUserID" name="hiValidationUserID" runat="server" tablename="EPMS_SurveyTaskBookModify" field="ValidationUserID" />
        </td>
        <td class="td-l">审定日期</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtValidationDate" runat="server" readonly="readonly" TableName="EPMS_SurveyTaskBookModify"
                Field="ValidationDate" ActiveStatus="(3.审定)" />
        </td>
        <td class="td-m" colspan="2"></td>
    </tr>
    <tr>
        <td class="td-l">修改原因<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbModifyReason" runat="server" MaxText="1024" TableName="EPMS_SurveyTaskBookModify" Field="ModifyReason"
                ActiveStatus="(23.收集相关资料)" CssClass="kpms-textarea" TextMode="MultiLine" EnableTheming="False" req="1" />
        </td>
    </tr>
    <tr>
        <td class="td-l">修改内容<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbModifyContent" runat="server" MaxText="1024" TableName="EPMS_SurveyTaskBookModify" Field="ModifyContent"
                ActiveStatus="(23.收集相关资料)" CssClass="kpms-textarea" TextMode="MultiLine" EnableTheming="False" req="1" />
        </td>
    </tr>
    <tr>
        <td class="td-l">勘测室意见<span class="req-star">*</span></td>
        <td class="td-m" colspan="5">
            <table width="100%">
                <tr>
                    <td class="td-m" colspan="4">
                        <zhongsoft:LightTextBox ID="tbSurveyOpinion" runat="server" MaxText="1024" TableName="EPMS_SurveyTaskBookModify" Field="SurveyOpinion"
                            ActiveStatus="(3.勘测室会签)" CssClass="kpms-textarea" TextMode="MultiLine" EnableTheming="False" req="1" />
                    </td>
                </tr>
                <tr>
                    <td class="td-l">勘测室主任或专业工程师</td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtSurveyLeaderName" runat="server" TableName="EPMS_SurveyTaskBookModify" Field="SurveyLeaderName"
                            ActiveStatus="(3.勘测室会签)" readonly="readonly" class="kpms-textbox" style="width: 20%" />
                        <input type="hidden" id="hiSurveyLeaderID" name="hiSurveyLeaderID" runat="server" tablename="EPMS_SurveyTaskBookModify" field="SurveyLeaderID" />
                    </td>
                    <td class="td-l">勘测室意见日期</td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtSurveyOpinionDate" runat="server" readonly="readonly"
                            TableName="EPMS_SurveyTaskBookModify" Field="SurveyOpinionDate" ActiveStatus="(3.勘测室会签)" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="td-l">项目管理岗意见<span class="req-star">*</span></td>
        <td class="td-m" colspan="5">
            <table width="100%">
                <tr>
                    <td class="td-m" colspan="4">
                        <zhongsoft:LightTextBox ID="tbBusinessOpinion" runat="server" MaxText="512" TableName="EPMS_SurveyTaskBookModify" Field="BusinessOpinion"
                            ActiveStatus="(3.项目管理岗会签)" CssClass="kpms-textarea" TextMode="MultiLine" EnableTheming="False" req="1" />
                    </td>
                </tr>
                <tr>
                    <td class="td-l">项目管理岗姓名</td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtBusinessLeaderName" runat="server" TableName="EPMS_SurveyTaskBookModify" Field="BusinessLeaderName"
                            ActiveStatus="(3.项目管理岗会签)" readonly="readonly" class="kpms-textbox" style="width: 20%" />
                        <input type="hidden" id="hiBusinessLeaderID" name="hiBusinessLeaderID" runat="server" tablename="EPMS_SurveyTaskBookModify" field="BusinessLeaderID" />
                    </td>
                    <td class="td-l">项目管理岗意见日期</td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtBusinessOpinionDate" runat="server" readonly="readonly"
                            TableName="EPMS_SurveyTaskBookModify" Field="BusinessOpinionDate" ActiveStatus="(3.项目管理岗会签)" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="td-l">公司主管领导意见<span class="req-star">*</span></td>
        <td class="td-m" colspan="5">
            <table width="100%">
                <tr>
                    <td class="td-m" colspan="4">
                        <zhongsoft:LightTextBox ID="tbMainLeaderOpinion" runat="server" MaxText="512" TableName="EPMS_SurveyTaskBookModify" Field="MainLeaderOpinion"
                            ActiveStatus="(3.批准)" CssClass="kpms-textarea" TextMode="MultiLine" EnableTheming="False" req="1" />
                    </td>
                </tr>
                <tr>
                    <td class="td-l">公司主管领导姓名</td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtMainLeaderName" runat="server" MaxText="16" TableName="EPMS_SurveyTaskBookModify" Field="MainLeaderName"
                            ActiveStatus="(3.批准)" readonly="readonly" class="kpms-textbox" style="width: 20%" />
                        <input type="hidden" id="hiMainLeaderID" name="hiMainLeaderID" runat="server" tablename="EPMS_SurveyTaskBookModify" field="MainLeaderID" />
                    </td>
                    <td class="td-l">公司主管领导意见日期</td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtMainLeaderOpinionDate" runat="server" readonly="readonly"
                            TableName="EPMS_SurveyTaskBookModify" Field="MainLeaderOpinionDate" ActiveStatus="(3.批准)" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<input type="hidden" id="hiSurveyTaskBookModifyID" name="hiSurveyTaskBookModifyID" runat="server" tablename="EPMS_SurveyTaskBookModify" field="SurveyTaskBookModifyID" />

<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
    }

    <%--function checkForm() {
        if ($formAction == "2" && $actName == "收集相关资料") {
            var orgId = $('#<%=hiOrganizationID.ClientID %>').val();
            if (orgId == '' || orgId == undefined) {
                alert('请先选择工程！');
                return false;
            }
        }
        return true;
    }--%>
</script>
