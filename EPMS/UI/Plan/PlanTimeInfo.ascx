<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PlanTimeInfo.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Plan.PlanTimeInfo" %>
<%@ Import Namespace="DAL.EPMS" %>
<tr>
    <td class="td-l">
        计划周期
    </td>
    <td class="td-r" id="trPlanCycle">
        <zhongsoft:LightDropDownList runat="server" ID="ddlPlanCycle" AutoPostBack="true"
            Width="100px" OnSelectedIndexChanged="lbtnReBindTimeDll_Click" activestatus="(2.*)(3.查看)">
        </zhongsoft:LightDropDownList>
    </td>
    <td class="td-l" flag="planTime">
        计划年
    </td>
    <td class="td-r" flag="planTime" id="tdPlanYear">
        <zhongsoft:LightDropDownList runat="server" ID="ddlPlanYear" activestatus="(2.*)(3.查看)"
            Width="70px">
        </zhongsoft:LightDropDownList>
    </td>
    <td flag="planTime" class="td-l">
        <asp:Label runat="server" ID="lbPlanCycle" secondflag="noYear"></asp:Label>
    </td>
    <td flag="planTime" class="td-r">
        <zhongsoft:LightDropDownList runat="server" ID="ddlPlanPeriod" activestatus="(2.*)(3.查看)"
            Width="80px" secondflag="noYear">
        </zhongsoft:LightDropDownList>
        <input type="hidden" runat="server" id="hiPlanMonth" />
        <input type="hidden" runat="server" id="hiPlanQuarter" />
        <input type="hidden" runat="server" id="hiPlanWeek" />
    </td>
</tr>
<script>
    function planTimeInfo_Init() {
        timeInfoDisplay();
        $("#<%=ddlPlanCycle.ClientID %>").live("change", function () {
            timeInfoDisplay();
        });

    }
    // 计划周期为项目全周期时，不显示计划年、计划月信息
    function timeInfoDisplay() {
        var planCycle = $("#<%=ddlPlanCycle.ClientID %>").val();
        if (planCycle == "<%=DAL.EPMS.PlanCycle.项目全周期.ToString() %>") {
            $("[flag='planTime']").hide();
            $("#trPlanCycle").attr("colspan", "5");
        }
        else if (planCycle == "<%=DAL.EPMS.PlanCycle.年度.ToString() %>") {
            $("[secondFlag='noYear']").hide();
        }
        else {
            $("#tdPlanYear").attr("colspan", "1");
            $("[flag='planTime']").show();
            $("[secondFlag='noYear']").show();
            $("#trPlanCycle").attr("colspan", "1");
        }

        $("#<%=lbPlanCycle.ClientID %>").html(planCycle);
    }


</script>
