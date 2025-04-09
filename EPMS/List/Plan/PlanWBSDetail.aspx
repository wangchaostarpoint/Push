<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanWBSDetail.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Plan.PlanWBSDetail" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    Title="项目计划专业" %>

<%@ Register Src="~/EPMS/UI/Plan/ProjPlanSpe.ascx" TagName="ProjPlanSpe" TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table width="100%" class="tz-table">
        <tr>
            <td align="center" colspan="6" style="font-weight: bold"  class="td-m">
                <asp:Label runat="server" ID="lbProjectInfo"></asp:Label>
            </td>
        </tr>
        <uc1:ProjPlanSpe ID="ucProjPlanSpe" runat="server" />
    </table>
    <script>
        function initCustomerPlugin() {
            projPlanSpe_Init();
        }
    </script>
</asp:Content>
