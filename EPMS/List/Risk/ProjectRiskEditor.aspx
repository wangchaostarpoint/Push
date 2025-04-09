<%@ Page Language="C#" Title="项目风险编辑页面" AutoEventWireup="true" CodeBehind="ProjectRiskEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Risk.ProjectRiskEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" width="100%">
        <tr>
            <td class="td-l">
                项目名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" activestatus="(23.*)"
                    Tablename="EPMS_ProjectRisk" Field="ProjectName" SourceMode="SelectorPage" SelectPageMode="Dialog"
                    PageWidth="850" ShowJsonRowColName="true" ResultAttr="name" EnableTheming="false"
                    Writeable="false" req="1" ShowAttrs="name" ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode','tbProjectType':'ProjectType','tbPhaseName':'PhaseName','tbProjectScale':'ProjectScale'}"
                    PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"></zhongsoft:LightObjectSelector>
                <input id="hiOrganizationID" type="hidden" tablename="EPMS_ProjectRisk" field="ORGANIZATIONID"
                    runat="server" />
            </td>
            <td class="td-l">
                项目编号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" activestatus="(23.*)"
                    TableName="EPMS_ProjectRisk" Field="ProjectCode" readonly="readonly" class="kpms-textbox">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                项目类型
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbProjectType" activestatus="(23.*)" ReadOnly="true"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                设计阶段
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbPhaseName" activestatus="(23.*)" ReadOnly="true"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                风险类型
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbRiskType" activestatus="(23.*)" tablename="EPMS_ProjectRisk"
                    field="RiskType" MaxLength="64"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                风险数据来源<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlRiskSounce" activestatus="(23.*)"
                    tablename="EPMS_ProjectRisk" field="RiskSounce" req="1">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                风险状态
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlRiskState" activestatus="(23.*)"
                    tablename="EPMS_ProjectRisk" field="RiskState">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                风险等级
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlRiskGrade" activestatus="(23.*)"
                    tablename="EPMS_ProjectRisk" field="RiskGrade">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                风险描述<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbRiskDescription" TableName="EPMS_ProjectRisk"
                    Field="RiskDescription" activestatus="(23.*)" MaxLength="1024" CssClass="kpms-textarea"
                    EnableTheming="false" TextMode="MultiLine" Rows="3" req="1"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                风险确认及控制措施
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbRiskMeasure" TableName="EPMS_ProjectRisk"
                    Field="RiskMeasure" activestatus="(23.*)" MaxLength="1024" CssClass="kpms-textarea"
                    EnableTheming="false" TextMode="MultiLine" Rows="3"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                风险评价内容
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbRiskEvaluation" TableName="EPMS_ProjectRisk"
                    Field="RiskEvaluation" activestatus="(23.*)" MaxLength="1024" CssClass="kpms-textarea"
                    EnableTheming="false" TextMode="MultiLine" Rows="3"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                风险评审结论
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbRiskConclusion" TableName="EPMS_ProjectRisk"
                    Field="RiskConclusion" activestatus="(23.*)" MaxLength="1024" CssClass="kpms-textarea"
                    EnableTheming="false" TextMode="MultiLine" Rows="3"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                备注
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbMemo" TableName="EPMS_ProjectRisk" Field="Memo"
                    activestatus="(23.*)" MaxLength="1024" CssClass="kpms-textarea" EnableTheming="false"
                    TextMode="MultiLine" Rows="3"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input type="hidden" id="hiProjectRiskID" runat="server" field="ProjectRiskID" tablename="EPMS_ProjectRisk" />
    <input type="hidden" id="hiFlag" runat="server" field="Flag" tablename="EPMS_ProjectRisk"
        value="1" />
</asp:Content>
