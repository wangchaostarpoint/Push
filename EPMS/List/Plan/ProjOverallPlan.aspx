<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjOverallPlan.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Plan.ProjOverallPlan"
    MasterPageFile="~/UI/Master/ObjectEditor.Master" Title="项目总体计划" %>

<%@ Register Src="../../UI/Plan/ProjOverallPlan.ascx" TagName="ProjOverallPlan" TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <input type="hidden" runat="server" id="hiWBSXml" />
    <uc1:ProjOverallPlan ID="ucProjOverallPlan" runat="server" />
    <script>
        function getThisHeight() {
            var headerH = 26;
            var tabList = $("#editor-content").height();
            var content = $("#tdEditor");
            var tabHeight = 0;

            content.height(tabList + 20 + "px");
            return tabList + headerH;
        }

        function initCustomerPlugin() {
            if (parent.iFrame != null) {
                parent.iFrame("frameProjOverallPlan", getThisHeight());
            }
            if (typeof (projOverallPlan_Init) == "function") {
                projOverallPlan_Init();
            }
            initAllEvent();
            if ("<%=IsHideToolBar %>".toLowerCase() == "true") {
                $("[id$=divToolBtn]").hide();
            }
        };

        function saveChildData() {
            saveData();
        }
    </script>
</asp:Content>
