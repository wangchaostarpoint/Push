<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjMonthPlan.aspx.cs"
    Title="项目月度计划" Inherits="Zhongsoft.Portal.EPMS.List.Plan.ProjMonthPlan" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<%@ Register Src="../../UI/Plan/ProjMonthPlan.ascx" TagName="ProjMonthPlan" TagPrefix="uc1" %>
<%@ Import Namespace="DAL.EPMS" %>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <style>
        .td-l
        {
            height: 28px !important;
            border: #cbccce 1px solid !important;
            background: #f3f4f4 /*fbfbfb*/;
            line-height: 18px;
        }
        .td-r
        {
            height: 28px !important;
            border: #cbccce 1px solid !important;
            background: #fefefe;
        }
    </style>
    <span class="filter-block"><span class="filter-block-lb">计划周期</span> <span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlPlanCycle" AutoPostBack="true"
            OnSelectedIndexChanged="lbtnReBindTimeDll_Click" Width="60px" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">计划年度</span> <span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlPlanYear" Width="60px" flag="planTime"
            class="kpms-ddlsearch" EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">
        <asp:Label runat="server" ID="lbPlanCycle" secondflag="noYear" flag="planTime"></asp:Label>
        <zhongsoft:LightDropDownList runat="server" ID="ddlPlanPeriod" Width="80px" secondflag="noYear"
            flag="planTime" class="kpms-ddlsearch" EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">计划开始/完成时间</span> <span>
        <zhongsoft:XHtmlInputText ID="txtStartDate" runat="server" class="kpms-textbox-comparedate"
            compare="1" readonly="readonly">
        </zhongsoft:XHtmlInputText>
        <zhongsoft:XHtmlInputText ID="txtEndDate" runat="server" class="kpms-textbox-comparedate"
            compare="1" readonly="readonly">
        </zhongsoft:XHtmlInputText>
    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <input type="hidden" runat="server" id="hiWBSXml" />
    <table class="tz-table">
        <tr>
            <td>
                <uc1:ProjMonthPlan ID="ucProjMonthPlan" runat="server" />
            </td>
        </tr>
    </table>
    <asp:LinkButton runat="server" ID="lbtnRefresh" Style="display: none"></asp:LinkButton>
    <script>
        var rollXmlDoc = new KPMSXml();

        function getThisHeight() {
            var headerH = $("#divBars").height();
            var tabList = $("#tableContent").height();
            var content = $("#divContent");
            var tabHeight = 0;

            content.height(tabList + 25 + "px");
            return tabList + headerH + 25;
        }

        function initCustomerPlugin() {
            parent.iFrame("frameProjMonthPlan", getThisHeight());
            ucProjectMonthPlan_Init();
            timeInfoDisplay();
            $("#<%=ddlPlanCycle.ClientID %>").live("change", function () {
                timeInfoDisplay();
            });
        };

        // 计划周期为项目全周期时，不显示计划年、计划月信息
        function timeInfoDisplay() {
            var planCycle = $("#<%=ddlPlanCycle.ClientID %>").val();

            if (planCycle == "<%=DAL.EPMS.PlanCycle.年度.ToString() %>") {
                $("[secondFlag='noYear']").hide();
            }
            else {
                $("[secondFlag='noYear']").show();
            }

            $("#<%=lbPlanCycle.ClientID %>").html(planCycle);
        }

    </script>
</asp:Content>
