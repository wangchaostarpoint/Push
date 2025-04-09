<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_IntegrateProjPlanForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.Plan.WF_IntegrateProjPlanForm" %>
<%@ Register Src="~/EPMS/UI/Plan/IntegrateProjPlan.ascx" TagName="IntegrateProjPlan"
    TagPrefix="uc1" %>
<%@ Register Src="~/EPMS/UI/Plan/IntegrateProjItemList.ascx" TagName="IntegrateProjItemList"
    TagPrefix="uc2" %>
<uc1:IntegrateProjPlan ID="ucIntegrateProjPlan" runat="server" />
<uc2:IntegrateProjItemList ID="ucIntegrateProjItemList" runat="server" />

<script>
    function initCustomerPlugin() {
        integrateProjPlan_Init();
        integrateProjItem_Init();
    }

    function checkForm() {
        if ($formAction == 0) {
            if ($actName == "编制项目计划书" || $actName == "会签调整" || $actName == "修改计划" || $actName == "调整计划") {
//                if (!checkHasChooseWBS()) {
//                    alert("请选择专业及任务类型信息");
//                    return false;
//                }
                if (!checkHasChooseLawRegular())
                    return false;
                if ($actName == "编制项目计划书") {
                    alert("请发送生产组织部门营销、生产、质量负责人，同时发送给质量工程师安全工程师会签");
                    return true;
                }
            }            
        }
        return true;
    }

    //判断是否选择了法律法规和规程规范，环境因素，危险源辨识，应急预案
    function checkHasChooseLawRegular() {
        var chooseLaw = getLawRowCount();
        var chooseRegular = getRegularCount();
        var chooseEnvironmental = getEnvironmentalCount();
        var chooseDanger = getDangerRowCount();
        var chooseEmergency = getEmergencyCount();
        var chooseRiskItems = getRiskItemCount();

        if (chooseLaw == 2) {
            alert("请添加法律法规信息");
            return false;
        }
        else if (chooseRegular == 2) {
            alert("请添加规程规范信息");
            return false;
        }
        else if (chooseEnvironmental == 2) {
            alert("请添加环境因素识别信息");
            return false;
        }
        else if (chooseDanger == 2) {
            alert("请添加危险源辨识表信息");
            return false;
        }
        else if (chooseEmergency == 2) {
            alert("请添加应急预案信息");
            return false;
        }

        else if (chooseRiskItems == 2) {
            alert("请添加项目风险辨识信息");
            return false;
        }

        return true;
    }
</script>