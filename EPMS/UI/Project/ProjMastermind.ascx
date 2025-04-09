<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProjMastermind.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Project.ProjMastermind" %>
<%@ Register Src="~/EPMS/UI/Project/ProjectCommon.ascx" TagName="ProjectCommon" TagPrefix="uc1" %>
<%@ Register Src="~/EPMS/UI/OBS/ProjectMgrUser.ascx" TagName="ProjectMgrUser" TagPrefix="uc2" %>
<%@ Register Src="~/EPMS/UI/OBS/ProjectSpeUser.ascx" TagName="ProjectSpeUser" TagPrefix="uc3" %>
<%@ Register Src="~/EPMS/UI/WBS/WBSTreeAndList.ascx" TagName="WBSTreeAndList" TagPrefix="uc4" %>
<%@ Register Src="~/EPMS/UI/Plan/IntegrateProjPlan.ascx" TagName="IntegrateProjPlan" TagPrefix="uc5" %>  
<%@ Import Namespace="Zhongsoft.Portal.ACL" %>
<table class="tz-table" width="100%">
    <tr>
        <td colspan="6" class="flexible" onclick="openDetail('ProjectCommon')">项目基本信息&nbsp;<img src="../../themes/images/lright.png" />
        </td>
    </tr>
    <tr id="ProjectCommon">
        <td colspan="6">
            <table class="tz-table">
                <uc1:ProjectCommon ID="ucProjectCommon" runat="server" />
            </table>
        </td>
    </tr>
</table>
<table class="tz-table" width="100%">
    <tr>
        <td colspan="6" class="flexible" onclick="openDetail('projMemberInfo')">项目组成员&nbsp;<img src="../../themes/images/lright.png" />
        </td>
    </tr>
    <tr id="projMemberInfo">
        <td colspan="6">
            <table class="tz-table"> 
                <uc2:ProjectMgrUser ID="ucProjectMgrUser" runat="server" />
                <uc3:ProjectSpeUser ID="ucProjectSpeUser" runat="server" OnProjSpeChanged="ReLoadSpeInfo" />
            </table>
        </td>
    </tr>
</table>
<table class="tz-table" flag="wbsInfo">
    <tr>
        <td colspan="6" class="flexible" onclick="openDetail('projWBS')">WBS任务【<span>项目计划</span>】&nbsp;<img
            src="../../themes/images/lright.png" />
        </td>
    </tr>
    <tr id="projWBS">
        <td colspan="6">
            <table class="tz-table" style="width: 100%">
                <tr>
                    <td class="td-l">项目模板名称
                    </td>
                    <td class="td-m" colspan="5">
                        <zhongsoft:LightObjectSelector runat="server" ID="txtProjectTemplateName" SourceMode="SelectorPage"
                            IsMutiple="false" ShowJsonRowColName="true" DoCancel="false" ResultAttr="name"
                            EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/ProjectTemplateSelector.aspx"
                            ResultForControls="{'hiProjectTemplateID':'id','hiProjectTemplateName':'name'}"
                            FilterFunction="projTempFilter()" activestatus="(23.?)"></zhongsoft:LightObjectSelector>
                        <input type="hidden" runat="server" id="hiProjectTemplateID" />
                        <input type="hidden" runat="server" id="hiPreTempID" />
                        <input type="hidden" runat="server" id="hiProjectTemplateName" />
                    </td>
                </tr>
                <uc4:WBSTreeAndList ID="ucWBSTreeAndList" runat="server" OnWBSChanged="ReLoadWBSInfo" />
            </table>
        </td>
    </tr>
</table>
<table class="tz-table" width="100%">
    <tr>
        <td colspan="6" class="flexible" onclick="openDetail('planProjInfo')">工程设计计划&nbsp;<img src="../../themes/images/lright.png" />
        </td>
    </tr>
    <tr id="planProjInfo">
        <td colspan="6">
            <uc5:IntegrateProjPlan ID="ucIntegrateProjPlan" runat="server" /> 
        </td>
    </tr>
</table> 
<!----项目计划书ID--->
<input type="hidden" id="hiProjectPlanBookID" name="hiProjectPlanBookID" runat="server"
    tablename="EPMS_ProjectPlanBook" field="ProjectPlanBookID" />
<input type="hidden" id="hiOrganizationID" name="hiOrganizationID" runat="server"
    tablename="EPMS_ProjectPlanBook" field="OrganizationID" />
<!-- 业务类型、业务板块-->
<input type="hidden" runat="server" id="hiPhaseCode" />
<input type="hidden" runat="server" id="hiBusinessTypeId" />
<input type="hidden" runat="server" id="hiBusinessPlateId" />
<asp:LinkButton runat="server" ID="lbtnRefresh" OnClick="lbtnRefresh_Click" Style="display: none"></asp:LinkButton>
<script>
    function projMastermind_Init() {
        initWBSList();
        $('[flag="projOveralPlan"]').each(function () {
            $(this).bind('click', function () {
                return viewProjOverallPlan();
            });
        });
        integrateProjPlan_Init();
        integrateProjItem_Init(); 
        if ($actName !== "编制项目策划、配置人员") {
            $('[flag="wbsInfo"]').show();
        }
        else {
            $('[flag="wbsInfo"]').hide();
        }

    }
    //查看项目总体计划
    function viewProjOverallPlan() {
        var organizationID = $("#<%=hiOrganizationID.ClientID %>").val();
        var actType = parseBool("<%=IsProDirector.Value %>") && ("<%=ActionType %>" == "<%=AccessLevel.Update %>") ? "<%=(int)AccessLevel.Update %>" : "<%=(int)AccessLevel.Read %>";;
        var json = { OrganizationID: organizationID, Enabled: actType == "<%=(int)AccessLevel.Update %>", IsShowInExportWBS: false, IsHideToolBar: true };
        var url = buildBizUrl(actType, organizationID, "EPMS/List/Plan/ProjOverallPlan.aspx", json);
        var callBack = null;
        if (actType == "<%=(int)AccessLevel.Update %>") {
            callBack = bindWbsInfo;
        }
        showDivDialog(url, null, 900, 750, callBack);
        return false;
    }

    //绑定WBS列表
    function bindWbsInfo() {
        <%=Page.ClientScript.GetPostBackEventReference(this.lbtnRefresh,"")%>;
    }

    //选择项目模板筛选（业务类型、业务板块筛选）
    function projTempFilter() {
        return { 'BusinessTypeID': $('#<%=hiBusinessTypeId.ClientID %>').val(), 'BusinessPlateID': $('#<%=hiBusinessPlateId.ClientID %>').val() };
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

    function checkDoSpeHasSettingMemers() {
        var isAllCheck = "true";
        var orgId = $("#<%=hiOrganizationID.ClientID %>").val();
        $.ajax({
            type: 'POST',
            url: buildQueryUrl("/EPMS/List/OBS/ProjectSpecialtyUsersList.aspx", null),
            data: { asyfunc: "CheckDoSpeHasSettingMemers", userID: "<%=KPMSUser.UserId %>", orgId: orgId },
            async: false,
            dataType: "json",
            success: function (res) {
                isAllCheck = res;
            },
            error: function (err) {
            }
        });
        if (isAllCheck == false) {
            alert("请配置完全人员！");
            return true;
        }
    }
</script>
