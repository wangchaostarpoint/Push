<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectMonthPlanEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Plan.ProjectMonthPlanEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    Title="月度计划编制详细" %>

<%@ Register Src="~/EPMS/UI/Plan/PlanTimeInfo.ascx" TagName="PlanTimeInfo" TagPrefix="uc1" %>
<%@ Import Namespace="Zhongsoft.Portal" %>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table width="100%" class="tz-table">
        <uc1:PlanTimeInfo ID="ucPlanTimeInfo" runat="server" />
        <tr runat="server" displaystatus="(13.*)">
            <td class="td-l">
                计划工程师
            </td>
            <td colspan="5" class="td-m">
                <zhongsoft:LightObjectSelector runat="server" ID="txtStartUserName" IsMutiple="false"
                    SelectPageMode="Dialog" activestatus="(3.*)" SourceMode="SelectorPage" ShowJsonRowColName="true"
                    DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode" ResultForControls="{'hiWriteUserID':'id'}"
                    tablename="EPMS_PlanActivity" field="WriteUserName" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx">
                </zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiWriteUserID" tablename="EPMS_PlanActivity"
                    field="WriteUserID" />
                <input type="hidden" runat="server" id="hiActivityTheme" tablename="EPMS_PlanActivity"
                    field="ActivityTheme" />
            </td>
        </tr>
        <tr runat="server" displaystatus="(23.*)">
            <td class="td-l">
                发起部门
            </td>
            <td colspan="5" class="td-m">
                <zhongsoft:XHtmlInputText runat="server" ID="txtWriteDeptName" activestatus="(3.*)"
                    readonly="readonly" class="kpms-textbox" field="WriteDeptName" tablename="EPMS_PlanActivity" />
                <asp:CheckBoxList runat="server" ID="cbSelDept" RepeatDirection="Horizontal" RepeatColumns="3"
                    Style="display: inline; padding-left: 5px;" activestatus="(2.*)">
                </asp:CheckBoxList>
                <input type="hidden" runat="server" id="hiWriteDeptID" field="WriteDeptID" tablename="EPMS_PlanActivity" />
            </td>
        </tr>
        <tr displaystatus="(2.*)">
            <td align="center" colspan="6" class="td-m">
                <asp:LinkButton runat="server" ID="lbtnSure" CssClass="subtoolbarlink" EnableTheming="false"
                    OnClick="lbtnSure_Click">
                    <span>
                        <img runat="server" id="img3" src="~/Themes/Images/btn_finish.gif" alt="确定" width="16"
                            height="16" />确定</span>
                </asp:LinkButton>
            </td>
        </tr>
    </table>
    <!--主键 -->
    <input type="hidden" id="hiPlanActivityID" runat="server" field="PlanActivityID"
        tablename="EPMS_PlanActivity" />
    <!--流程表单类型--->
    <input type="hidden" id="hiFormType" runat="server" field="FormType" tablename="EPMS_PlanActivity" />
    <input type="hidden" runat="server" id="hiPlanYear" field="PlanYear" tablename="EPMS_PlanActivity" />
    <input type="hidden" runat="server" id="hiPlanCycle" field="PlanCycle" tablename="EPMS_PlanActivity" />
    <input type="hidden" runat="server" id="hiPlanMonth" field="PlanMonth" tablename="EPMS_PlanActivity" />
    <input type="hidden" runat="server" id="hiPlanQuarter" field="PlanQuarter" tablename="EPMS_PlanActivity" />
    <input type="hidden" runat="server" id="hiPlanWeek" field="PlanWeek" tablename="EPMS_PlanActivity" />
    <input type="hidden" runat="server" id="hiRoleName" value="计划管理岗" />
    <script>
        function initCustomerPlugin() {
            //创建时 显示可选的部门信息，
            if ("<%=ActionType %>" == "Create") {
                $("#<%=cbSelDept.ClientID %>").show();
                $("#<%=txtWriteDeptName.ClientID %>").hide();
                $("[id$=divToolBtn]").hide();
            }
            else {
                $("#<%=cbSelDept.ClientID %>").hide();
                $("#<%=txtWriteDeptName.ClientID %>").show();
            }
            planTimeInfo_Init();
        }

        function closeExpWindow() {
            parent.returnValue = 'OK';
            closeWindow();
            return false;
        }
    </script>
</asp:Content>
