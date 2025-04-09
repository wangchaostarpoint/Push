<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeptProjPlan.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Plan.DeptProjPlan"
    MasterPageFile="~/UI/Master/ObjectEditor.Master" Title="科室月度计划" %>

<%@ Register Src="~/EPMS/UI/Plan/PlanTimeInfo.ascx" TagName="PlanTimeInfo" TagPrefix="uc1" %>
<%@ Register Src="~/EPMS/UI/Plan/DeptPlanOfWBS.ascx" TagName="DeptPlanOfWBS" TagPrefix="uc2" %>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" width="100%">
        <uc1:PlanTimeInfo ID="ucPlanTimeInfo" runat="server" />
        <tr>
            <td class="td-l">
                科室<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtWriteDeptName" activestatus="(23.*)"
                    readonly="readonly" class="kpms-textbox" req="1" field="WriteDeptName" tablename="EPMS_PlanActivity" />
                <input type="hidden" runat="server" id="hiWriteDeptID" field="WriteDeptID" tablename="EPMS_PlanActivity" />
            </td>
            <td class="td-l" nowrap>
                筛选范围
            </td>
            <td colspan="3">
                <table width="100%">
                    <tr>
                        <td>
                            <asp:CheckBoxList runat="server" ID="cbTimeQuery" RepeatDirection="Horizontal">
                                <asp:ListItem Text="个人出手" Value="PlanHandTime"></asp:ListItem>
                                <asp:ListItem Text="校核" Value="PlanCheckTime"></asp:ListItem>
                                <asp:ListItem Text="室交出" Value="PlanRecheckTime1"></asp:ListItem>
                                <asp:ListItem Text="出图" Value="PlanCompleteTime"></asp:ListItem>
                            </asp:CheckBoxList>
                        </td>
                        <td>
                            <p>
                                <asp:RadioButtonList runat="server" ID="rbTimeQuery" RepeatDirection="Horizontal">
                                    <asp:ListItem Text="近两周" Value="twoWeek"></asp:ListItem>
                                    <asp:ListItem Text="近一周" Value="oneWeek"></asp:ListItem>
                                    <asp:ListItem Text="近三天" Value="neerThreeDay"></asp:ListItem>
                                </asp:RadioButtonList>
                            </p>
                        </td>
                        <td>
                            <asp:LinkButton runat="server" ID="btnQuery" OnClick="btnQuery_Click">
                      <span content='searchResult'>查询</span>
                            </asp:LinkButton>
                            <asp:LinkButton runat="server" ID="btnReset" OnClick="btnReset_Click">
                      <span content='searchResult'>重置</span>
                            </asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:CheckBox ID="cbThisFromModify" runat="server" Text="本次修改" />
                            <zhongsoft:XHtmlInputText runat="server" ID="txtStartDate" EnableTheming="false"
                                class="kpms-textbox-date" readonly="readonly" />
                            <zhongsoft:XHtmlInputText runat="server" ID="txtEndDate" EnableTheming="false" class="kpms-textbox-date"
                                readonly="readonly" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <uc2:DeptPlanOfWBS ID="ucDeptPlanOfWBS" runat="server" />
    </table>
    <script>
        var rollXmlDoc = new KPMSXml();
        function initCustomerPlugin() {
            planTimeInfo_Init();
            if (typeof (inExportEvent) == "function")
                inExportEvent();

            rollXmlDoc.loadXML("<root></root>");
            if (typeof (saveChangeWBSInfo) == "function")
                $("[wbsID]").live("blur", function () {
                    $("#" + $(this).attr("id")).val($(this).val());
                    saveChangeWBSInfo(this)
                });

            if (typeof (getWBSChecker) == "function")
                getWBSChecker();
        }
    </script>
</asp:Content>
