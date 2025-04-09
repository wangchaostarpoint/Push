<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ProjectDesignPlanForm.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.Form.Plan.WF_ProjectDesignPlanForm" %>
<%@ Register Src="~/EPMS/UI/Plan/IntegrateProjPlan.ascx" TagName="IntegrateProjPlan"
    TagPrefix="uc1" %>
<%@ Register Src="~/EPMS/UI/Plan/IntegrateProjItemList.ascx" TagName="IntegrateProjItemList"
    TagPrefix="uc2" %>
<%@ Register Src="~/EPMS/UI/plan/ProjectPlanBookCreate.ascx" TagName="ProjectPlanBookCreate" TagPrefix="uc3" %>
<uc1:IntegrateProjPlan ID="ucIntegrateProjPlan" runat="server" />
<uc2:IntegrateProjItemList ID="ucIntegrateProjItemList" runat="server" />
<uc3:ProjectPlanBookCreate ID="ucProjectPlanbookCreate" runat="server" />

<script type="text/javascript">
    function initCustomerPlugin() {
        integrateProjPlan_Init();
        var formID = '<%=FormId%>';
        if (formID == "365") {
            integrateProjItem_Init();
        }
    }
    function checkForm() {
        if ($formAction == 0 && ($actName == "编制项目设计计划"||$actName=="编制专业设计计划")) {
            return checkHasFile();
        }
        return true;
    }
</script>
