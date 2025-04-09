<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanProjDetail.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Plan.PlanProjDetail" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    Title="任务计划" %>

<%@ Register Src="../../UI/Project/ProjectCommon.ascx" TagName="ProjectCommon" TagPrefix="uc1" %>
<%@ Register Src="../../UI/Plan/ProjOverallPlan.ascx" TagName="ProjOverallPlan" TagPrefix="uc2" %>
<%@ Register Src="../../UI/Plan/ProjMonthPlan.ascx" TagName="ProjMonthPlan" TagPrefix="uc3" %>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table class="tz-table" style="width: 100%">
        <uc1:ProjectCommon ID="ucProjectCommon" runat="server" />
    </table>
    <input type="hidden" runat="server" id="hiIndex" value="1" />
    <input type="hidden" runat="server" id="hiType" value="true" />
    <div id="templateTabs">
        <ul>
            <li><a href='#ProjAllPlan' id='aProjAllPlan'>项目总体计划 </a></li>
            <li><a href='#ProjMonthPlan' id='aProjMonthPlan'>项目月度计划 </a></li>
        </ul>
        <div id="ProjAllPlan" style="height: 100%">
            <asp:UpdatePanel ID="panelProjOverallPlan" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <iframe name="frameProjOverallPlan" frameborder="0" id="frameProjOverallPlan" style="width: 97%;
                        height: 100%"></iframe>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="ProjMonthPlan" style="height: 100%">
            <asp:UpdatePanel ID="panelProjMonthPlan" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <iframe name="frameProjMonthPlan" frameborder="0" id="frameProjMonthPlan" style="width: 97%;">
                    </iframe>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <script>

        function initCustomerPlugin() {
            $('#templateTabs li a').each(function (i) {
                var index = $("#<%=hiIndex.ClientID %>").val();
                if (i == index) {
                    $('#templateTabs').tabs({ active: i });
                    if (i == 0) {
                        resetTabsActive();
                    }
                    else if (i == 1) {
                        resetProjMonth();
                    }
                }

                $(this).click(function () {
                    $('#templateTabs').tabs({ active: i });
                    if (i == 0) {
                        resetTabsActive();
                    }
                    else if (i == 1) {
                        resetProjMonth();
                    }
                    $("#<%=hiIndex.ClientID %>").val(i);
                    return true;
                });
            });
        }

        //点击页签tab页加载页签内容
        function resetTabsActive() {
            var organizationID = "<%=OrganizationID %>";
            var planCycle = "<%=PlanCycle %>";
            var oldurl = $("#frameProjOverallPlan").attr("src");
            var enabled = "<%=Enabled %>";
            var isEntityData = "<%=IsEntityData %>";
            //判断oldurl是否为空
            if (oldurl == "" || oldurl == undefined) {
                $("#frameProjOverallPlan").attr("src", "<%=WebAppPath %>/EPMS/List/Plan/ProjOverallPlan.aspx?OrganizationID=" + organizationID + "&PlanCycle=" + escape(planCycle) + "&IsHideToolBar=true");
            }
        }

        function resetProjMonth() {
            var organizationID = "<%=OrganizationID %>";
            var planCycle = "<%=PlanCycle %>";
            var oldurl = $("#frameProjMonthPlan").attr("src");
            var enabled = "<%=Enabled %>";
            var isEntityData = "<%=IsEntityData %>";
            var isPlanDesignChoose = "<%=IsPlanDesignChoose %>";
            var url = "<%=WebAppPath %>/EPMS/List/Plan/ProjMonthPlan.aspx?OrganizationID=" + organizationID + "&Enabled=" + enabled + "&IsEntityData=" + isEntityData + "&IsPlanDesignChoose=" + isPlanDesignChoose;
            //判断oldurl是否为空
            if (oldurl == "" || oldurl == undefined) {
                if (planCycle != "") {
                    var planYear = "<%=PlanYear %>";
                    var planPeriod = "<%=PlanPeriod%>";
                    url += "&PlanCycle=" + escape(planCycle) + "&PlanYear=" + planYear + "&PlanPeriod=" + planPeriod;
                }
                $("#frameProjMonthPlan").attr("src", url);
            }
        }

        function iFrame(id, height) {
            $('#' + id).height(height + 50 + 'px');
        }

    </script>
</asp:Content>
