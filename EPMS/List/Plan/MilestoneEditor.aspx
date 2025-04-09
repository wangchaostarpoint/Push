<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="MilestoneEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Plan.MilestoneEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" width="100%">
        <tr style="display: none">
            <td class="td-l">
                里程碑节点类型
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightDropDownList runat="server" ID="ddlMilestoneType" TableName="EPMS_MilestoneDetailNew"
                    Field="MilestoneType" activestatus="(23.*)" >
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                阶段名称<span class="req-star">*</span><%--里程碑节点主题--%>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText runat="server" ID="tbMiestoneTopicName" TableName="EPMS_MilestoneDetailNew"
                    Field="MilestoneTopic" activestatus="(23.*)" class="kpms-textbox" req="1" maxLength="256" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                日期<span class="req-star">*</span><%--计划开始日期--%>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtPlanStartTime" readonly="readonly"
                                          runat="server" compare="1" activestatus="(23.*)" field="PlanStartTime" req="1"
                                          tablename="EPMS_MilestoneDetailNew" />
            </td>
            <td class="td-l" style="display: none">
                计划结束日期
            </td>
            <td class="td-r" style="display: none">
                <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtPlanCompleteTime" readonly="readonly"
                                          runat="server" compare="1" activestatus="(23.*)" field="PlanEndTime"
                                          tablename="EPMS_MilestoneDetailNew" />
            </td>
        </tr>
        <tr style="display: none">
            <td class="td-l">
                里程碑节点内容
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbMiestoneContent" TextMode="MultiLine"
                    CssClass="kpms-textarea" EnableTheming="false" MaxLength="1023" tablename="EPMS_MilestoneDetailNew"
                    field="MilestoneContent" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiFormID" tablename="EPMS_MilestoneDetailNew"
        field="MilestoneDetailID" />
    <!--计划书流程主键-->
    <input type="hidden" runat="server" id="hiProjectPlanBookID" tablename="EPMS_MilestoneDetailNew"
        field="ProjectPlanBookID" />
    <!--所属项目id-->
    <input type="hidden" runat="server" id="hiOrganizationID" tablename="EPMS_MilestoneDetailNew"
        field="OrganizationID" />
    <!--里程碑来源（项目计划书流程。。。。。-->
    <input type="hidden" runat="server" id="hiSourceType" tablename="EPMS_MilestoneDetailNew"
        field="MilestoneSource" />
</asp:Content>
