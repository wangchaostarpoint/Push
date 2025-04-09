<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanProgressFillEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Plan.PlanProgressFillEditor"
    Title="工程进度填报" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">进度及协议办理情况
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbScheduleAndRequire" tablename="EPMS_PlanActivityOfProject" field="ScheduleAndRequire" Rows="3" MaxLength="1024"
                    TextMode="MultiLine" EnableTheming="False" CssClass="kpms-textarea" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">存在问题及解决措施
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbThisImportance" tablename="EPMS_PlanActivityOfProject" field="ThisImportance" Rows="3" MaxLength="1024"
                    TextMode="MultiLine" EnableTheming="False" CssClass="kpms-textarea" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">需要业主协调的问题
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbProblemOfNeedOuter" tablename="EPMS_PlanActivityOfProject" field="ProblemOfNeedOuter" Rows="3" MaxLength="1024"
                    TextMode="MultiLine" EnableTheming="False" CssClass="kpms-textarea" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">需要我院协调的问题
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbProblemOfNeedInner" tablename="EPMS_PlanActivityOfProject" field="ProblemOfNeedInner" Rows="3" MaxLength="1024"
                    TextMode="MultiLine" EnableTheming="False" CssClass="kpms-textarea" activestatus="(23.*)" />
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiPlanActivityOfProjectID" tablename="EPMS_PlanActivityOfProject" field="PlanActivityOfProjectID" />
</asp:Content>

