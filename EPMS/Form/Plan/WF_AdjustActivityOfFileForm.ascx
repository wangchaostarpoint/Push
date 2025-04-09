<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_AdjustActivityOfFileForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.Plan.WF_AdjustActivityOfFileForm" %>
<%@ Register Src="../../UI/Plan/AdjustActivityOfFile.ascx" TagName="AdjustActivityOfFile"
    TagPrefix="uc1" %>
<uc1:AdjustActivityOfFile ID="ucAdjustActivityOfFile" runat="server" />
<!--主键 -->
<input type="hidden" id="hiPlanActivityOfProjectID" name="PlanActivityOfProjectID"
    runat="server" field="PlanActivityOfProjectID" tablename="EPMS_PlanActivityOfProject" />
<!--项目计划活动表主键 -->
<input type="hidden" id="hiPlanWBSID" name="hiPlanWBSID" runat="server" field="PlanWBSID"
    tablename="EPMS_PlanWBS" />
<script>
    function initCustomerPlugin() {
        if (typeof (adjustActivityOfFile_init) == 'function') {
            adjustActivityOfFile_init();
        }
    }
</script>
