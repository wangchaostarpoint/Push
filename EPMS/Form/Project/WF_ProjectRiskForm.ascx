<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ProjectRiskForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.Project.WF_ProjectRiskForm" %>
<%@ Register Src="~/EPMS/UI/Project/ProjectCommon.ascx" TagName="ProjectCommon" TagPrefix="uc1" %>
<script type="text/javascript">
    function InitCustomerPlugin() {
        checkMaxLength();
    }
    //保存和发送时判断
    function KPMSCheckSubmit() {
        if ($readyFormSend) {
        }
        return true;
    }
</script>
<table class="tz-table" width="100%">
    <uc1:ProjectCommon runat="server" ID="ProjectCommon1" activestatus="(23.填写风险预警确认单/项目风险评估表)" />
    <tr>
        <td class="td-l">
            风险数据来源<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlRiskSounce" req="1" tablename="EPMS_ProjectRisk"
                field="RiskSounce" activestatus="(23.填写风险预警确认单/项目风险评估表)">
                <asp:ListItem Value="" Text="请选择"></asp:ListItem>
                <asp:ListItem Value="1" Text="来源1"></asp:ListItem>
                <asp:ListItem Value="2" Text="来源2"></asp:ListItem>
                <asp:ListItem Value="3" Text="来源3"></asp:ListItem>
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l">
            风险等级
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlRiskGrade" tablename="EPMS_ProjectRisk"
                field="RiskGrade" activestatus="(23.填写风险预警确认单/项目风险评估表)">
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l">
            风险状态
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlRiskState" tablename="EPMS_ProjectRisk"
                field="RiskState" activestatus="(23.填写风险预警确认单/项目风险评估表)">
            </zhongsoft:LightDropDownList>
        </td>
    </tr>
    <tr>
        <td class="td-r">
            风险类型
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbRiskType" req="1" MaxLength="64" TableName="EPMS_ProjectRisk"
                field="RiskType" activestatus="(23.填写风险预警确认单/项目风险评估表)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-r">
            风险描述<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbRiskDescription" TextMode="MultiLine"
                CssClass="kpms-textarea" EnableTheming="false" MaxLength="1024" tablename="EPMS_ProjectRisk"
                field="RiskDescription" activestatus="(23.填写风险预警确认单/项目风险评估表)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-r">
            风险确认及控制措施
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbRiskMeasure" TextMode="MultiLine" CssClass="kpms-textarea"
                EnableTheming="false" MaxLength="1024" tablename="EPMS_ProjectRisk" field="RiskMeasure"
                activestatus="(23.填写风险预警确认单/项目风险评估表)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-r">
            风险评价内容
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbRiskEvaluation" TextMode="MultiLine"
                CssClass="kpms-textarea" EnableTheming="false" MaxLength="1024" tablename="EPMS_ProjectRisk"
                field="RiskEvaluation" activestatus="(23.填写风险预警确认单/项目风险评估表)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-r">
            风险评审结论
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbRiskConclusion" TextMode="MultiLine"
                CssClass="kpms-textarea" EnableTheming="false" MaxLength="1024" tablename="EPMS_ProjectRisk"
                field="RiskConclusion" activestatus="(23.填写风险预警确认单/项目风险评估表)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-r">
            备注
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbMemo" TextMode="MultiLine" CssClass="kpms-textarea"
                EnableTheming="false" MaxLength="1024" tablename="EPMS_ProjectRisk" field="Memo"
                activestatus="(23.填写风险预警确认单/项目风险评估表)"></zhongsoft:LightTextBox>
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiProjectRiskID" tablename="EPMS_ProjectRisk"
    field="ProjectRiskID" />
<input type="hidden" runat="server" id="hiOrganizationID" tablename="EPMS_ProjectRisk"
    field="ORGANIZATIONID" />
<input type="hidden" runat="server" id="hiProjectCode" tablename="EPMS_ProjectRisk"
    field="ProjectCode" />
<input type="hidden" runat="server" id="hiProjectName" tablename="EPMS_ProjectRisk"
    field="ProjectName" />
