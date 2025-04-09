<%@ Page Title="产品质量、环境和职业健康安全管理目标、措施及测评详细" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master" AutoEventWireup="true" CodeBehind="ParamProjPlanTargetEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Plan.ParamProjPlanTargetEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l" style="display: none">责任人</td>
            <td class="td-r" style="display: none">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsDutyUser" ShowJsonRowColName="True" PageUrl="~/sys/OrgUsers/UserSelectorJson.aspx" activestatus="(23.*)"
                    ResultAttr="name" tablename="EPMS_ParamProjectPlanTarget" field="DutyUserName" ResultForControls="{'hiDutyUserID':'id'}" IsMutiple="False" SelectPageMode="Dialog" />
                <input type="hidden" runat="server" id="hiDutyUserID" tablename="EPMS_ParamProjectPlanTarget" field="DutyUserID" />
            </td>
            <td class="td-l">
                目标分类<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3" >
                <zhongsoft:LightDropDownList runat="server" ID="ddlTargetType" activestatus="(23.*)" CssClass="kpms-ddl" EnableTheming="False" req="1" tablename="EPMS_ParamProjectPlanTarget" field="TargetType"/>
            </td>
            <td class="td-l">
                完成时间
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtFinishDate" class="kpms-textbox-date" readonly="readonly" tablename="EPMS_ParamProjectPlanTarget" field="FinishDate" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">目标内容<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbTargetContent" tablename="EPMS_ParamProjectPlanTarget" field="TargetContent" Rows="3" MaxLength="1024"
                    TextMode="MultiLine" EnableTheming="False" CssClass="kpms-textarea" req="1" activestatus="(23.*)"/>
            </td>
        </tr>
        <tr>
            <td class="td-l">目标分解
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbTargetResolve" tablename="EPMS_ParamProjectPlanTarget" field="TargetResolve" Rows="3" MaxLength="1024"
                                        TextMode="MultiLine" EnableTheming="False" CssClass="kpms-textarea" activestatus="(23.*)"/>
            </td>
        </tr>
        <tr>
            <td class="td-l">实施措施
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbImplementingMeasures" tablename="EPMS_ParamProjectPlanTarget" field="ImplementingMeasures" Rows="3" MaxLength="1024"
                                        TextMode="MultiLine" EnableTheming="False" CssClass="kpms-textarea" activestatus="(23.*)"/>
            </td>
        </tr>
        <tr>
            <td class="td-l">评测方法结果
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbEvaluationMethodResult" tablename="EPMS_ParamProjectPlanTarget" field="EvaluationMethodResult" Rows="3" MaxLength="1024"
                                        TextMode="MultiLine" EnableTheming="False" CssClass="kpms-textarea" activestatus="(23.*)"/>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiProjectPlanTargetID" tablename="EPMS_ParamProjectPlanTarget" field="ParamProjectPlanTargetID"/>
    <input type="hidden" runat="server" id="hiFlag" value="1" tablename="EPMS_ParamProjectPlanTarget" field="Flag"/>
</asp:Content>
