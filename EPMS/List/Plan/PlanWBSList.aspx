<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanWBSList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Plan.PlanWBSList"
    MasterPageFile="~/UI/Master/ObjectEditor.Master" Title="任务计划编制详细" %>

<%@ Register Src="~/EPMS/UI/Plan/PlanWBSOfRoll.ascx" TagName="PlanWBSOfRoll" TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <uc1:PlanWBSOfRoll ID="ucPlanWBSOfRoll" runat="server" />
    <script>
        var rollXmlDoc = new KPMSXml();
        function initCustomerPlugin() {
            inExportEvent();
            rollXmlDoc.loadXML("<root></root>");
            $("[wbsID]").live("change", function () {
                $("#" + $(this).attr("id")).val($(this).val());
            });
            $("[id$=divToolBtn]").hide();
        }

        function saveChildData() {
            saveData();
        }
    </script>
</asp:Content>
