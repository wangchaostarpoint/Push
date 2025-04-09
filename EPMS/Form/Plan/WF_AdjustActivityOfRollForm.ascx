<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_AdjustActivityOfRollForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.Plan.WF_AdjustActivityOfRollForm" %>
<%@ Register Src="../../UI/Plan/AdjustActivityOfRoll.ascx" TagName="AdjustActivityOfRoll"
    TagPrefix="uc1" %>
<%@ Import Namespace="Zhongsoft.Portal.ACL" %>
<uc1:AdjustActivityOfRoll ID="ucAdjustActivityOfRoll" runat="server" />
<!--主键 -->
<input type="hidden" id="hiPlanActivityOfProjectID" name="PlanActivityOfProjectID"
    runat="server" field="PlanActivityOfProjectID" tablename="EPMS_PlanActivityOfProject" />
<!--项目计划活动表主键 -->
<input type="hidden" id="hiPlanWBSID" name="hiPlanWBSID" runat="server" field="PlanWBSID"
    tablename="EPMS_PlanWBS" />
<!--项目ID -->
<input type="hidden" id="hiOrganizationId" name="hiOrganizationId" runat="server"
    field="OrganizationID" tablename="EPMS_PlanActivityOfProject" />
<script>
    function initCustomerPlugin() {
        adjustActivityOfRoll_init();
    }
    //发送时的相关提示
    function checkForm() {
        if ($formAction == 0) {
            if ($actName == "填写计划调整申请") {
                if (!checkDateIsRight())
                    return false;
            }
        }
        return true;
    }
            
</script>
