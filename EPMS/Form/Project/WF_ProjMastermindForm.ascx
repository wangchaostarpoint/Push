<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ProjMastermindForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.Project.WF_ProjMastermindForm" %>
<%@ Register Src="../../UI/Project/ProjMastermind.ascx" TagName="ProjMastermind"
    TagPrefix="uc1" %>
<uc1:ProjMastermind ID="ucProjMastermind" runat="server" />
<input runat="server" id="hiSpeRoleName" type="hidden" value="主任工程师" />
<%--是否发送--%>
<input runat="server" id="hiIsSend" type="hidden" value="0" />
<script>
    function initCustomerPlugin() {
        projMastermind_Init();
    }

    function checkForm() {
        if ($formAction == 0) {
            if ($actName == "编制小型项目策划，配置人员" || $actName == "会签调整" || $actName == "修改计划" || $actName == "调整计划") {
                //                if (!checkHasChooseWBS()) {
                //                    alert("请选择专业及任务类型信息");
                //                    return false;
                //                }            
                if (!checkHasChooseLawRegular())
                    return false;
            }
            if (($actName == "汇总人员" || $actName == "配置人员") && !checkHasUser()) {
                alert("请将人员配置完全");
                return false;
            }

            if (($actName == "编制小型项目策划，配置人员" && checkHasUser()) || $actName == "汇总人员") {
                alert("请发送生产组织部门营销、生产、质量负责人，同时发送给质量工程师安全工程师会签");
                return true;
            }
            if ($actName == "编制项目设计计划") {
                return checkHasFile();
            }
        }
        return true;
    }

</script>
