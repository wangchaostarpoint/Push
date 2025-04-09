<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeptProjPlanEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Plan.DeptProjPlanEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    Title="月度计划安排" %>

<%@ Register Src="~/EPMS/UI/Plan/PlanTimeInfo.ascx" TagName="PlanTimeInfo" TagPrefix="uc1" %>
<%@ Import Namespace="Zhongsoft.Portal" %>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table width="100%" class="tz-table">
        <uc1:PlanTimeInfo ID="ucPlanTimeInfo" runat="server" OnDDLSelectCompleted="SelectCompleted" />
        <tr>
            <td class="td-l">
                计划安排名称<span class="req-star">*</span>
            </td>
            <td colspan="5" class="td-m">
                <zhongsoft:LightTextBox ID="tbActivityTheme" runat="server" EnableTheming="false"
                    req="1" MaxLength="128" tablename="EPMS_PlanActivity" field="ActivityTheme" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                专业<span class="req-star">*</span>
            </td>
            <td colspan="5" class="td-m">
                <zhongsoft:LightDropDownList runat="server" ID="ddlSpecialty" activestatus="(23.*)"
                    req="1" tablename="EPMS_PlanActivity" field="WriteSpecialtys">
                </zhongsoft:LightDropDownList>
                <input type="hidden" runat="server" id="hiWriteDeptID" field="WriteDeptID" tablename="EPMS_PlanActivity" />
                <input type="hidden" runat="server" id="hiWriteDeptName" field="WriteDeptName" tablename="EPMS_PlanActivity" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                主任工名称<span class="req-star">*</span>
            </td>
            <td colspan="5" class="td-m">
                <zhongsoft:LightObjectSelector runat="server" ID="txtStartUserName" IsMutiple="false"
                    SelectPageMode="Dialog" activestatus="(23.*)" SourceMode="SelectorPage" ShowJsonRowColName="true"
                    DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode" ResultForControls="{'hiWriteUserID':'id'}"
                    BeforeSelect="beforeSelectUser()" req="1" tablename="EPMS_PlanActivity" field="WriteUserName"
                    PageWidth="850" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx" FilterFunction="userFilter()">
                </zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiWriteUserID" tablename="EPMS_PlanActivity"
                    field="WriteUserID" />
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
    <input type="hidden" runat="server" id="hiPeriodName" />
    <input type="hidden" runat="server" id="hiPlanState" field="PlanState" tablename="EPMS_PlanActivity" />
    <!----发起人ID-->
    <input type="hidden" runat="server" id="hiStartUserID" field="StartUserID" tablename="EPMS_PlanActivity" />
    <!----发起人姓名-->
    <input type="hidden" runat="server" id="hiStartUserName" field="StartUserName" tablename="EPMS_PlanActivity" />
    <!---主任工角色ID--->
    <input type="hidden" runat="server" id="hiRoleId" />
    <!---主任工角色名称--->
    <input type="hidden" runat="server" id="hiRoleName" value="主任工" />
    <script>
        function initCustomerPlugin() {
            planTimeInfo_Init();
            $("#<%=ddlSpecialty.ClientID %>").live("change", function () {
                var specialID = $("#<%=ddlSpecialty.ClientID %>").val();
                if (specialID == "")
                    $("#<%=tbActivityTheme.ClientID %>").val("");
                else {
                    var planYear = $("#<%=hiPlanYear.ClientID %>").val();
                    var periodName = $("#<%=hiPeriodName.ClientID %>").val();
                    var spcialtyName = $("#<%=ddlSpecialty.ClientID %> option:selected").text();
                    $("#<%=tbActivityTheme.ClientID %>").val(planYear + "年" + periodName + spcialtyName + "的月度计划安排流程");
                }
            });
        }

        //选择主任工之前的逻辑判断
        function beforeSelectUser() {
            var specialtyID = $('#<%=ddlSpecialty.ClientID %>').val();
            if (specialtyID == '' || specialtyID == undefined) {
                alert('请先选择专业，再选择主任工！');
                return false;
            }
            return true;
        }

        //选择主任工
        function userFilter() {
            var roleId = $('#<%=hiRoleId.ClientID %>').val();
            var specialtyID = $('#<%=ddlSpecialty.ClientID %>').val();
            return "{RoleID:'" + roleId + "',SpecialtyID:'" + specialtyID + "',IsShowMore:'1',IsQualiticByRole:'1'}";
        }
    </script>
</asp:Content>
