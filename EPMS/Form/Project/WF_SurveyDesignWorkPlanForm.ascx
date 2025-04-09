<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_SurveyDesignWorkPlanForm.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.Form.Project.WF_SurveyDesignWorkPlanForm" %>
<%@ Register Src="~/EPMS/UI/OBS/ProjectMgrUser.ascx" TagName="ProjectMgrUser" TagPrefix="uc2" %>
<%@ Register Src="~/EPMS/UI/OBS/ProjectSpeUser.ascx" TagName="ProjectSpeUser" TagPrefix="uc3" %>
<%@ Register Src="~/EPMS/UI/WBS/WBSTreeAndList.ascx" TagName="WBSTreeAndList" TagPrefix="uc4" %>
<%@ Register Src="~/EPMS/UI/Project/DesignerReviewInfoGrid.ascx" TagName="DesignReview" TagPrefix="uc5" %>
<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView" TagPrefix="uc1" %>
<%@ Import Namespace="Zhongsoft.Portal.ACL" %>
<table class="tz-table" width="100%">
    <tr>
        <td colspan="6" class="flexible" onclick="openDetail('ProjectCommon')">项目基本信息&nbsp;<img src="../../themes/images/lright.png" />
        </td>
    </tr>
    <tr id="ProjectCommon">
        <td colspan="6">
            <table class="tz-table">
                <tr runat="server" id="trBaseInfo">
                    <td class="td-l">项目名称<span class="req-star">*</span>
                    </td>
                    <td class="td-m" colspan="3" style="white-space: nowrap">
                        <zhongsoft:LightObjectSelector runat="server" ID="lbsSelectProject" req="1" IsMutiple="false" SelectPageMode="Dialog" ResultForControls="{'hiOrganizationId':'id','tbProjectCode':'ProjectCode','tbPhaseName':'PhaseName','hiPhaseCode':'PhaseCode','tbProjectTemplateName':'ProjectTemplateName','hiProjectTemplateID':'ProjectTemplateID','tbHostDeptName':'HostDeptName'}"
                            EnableTheming="false" Text="选择项目" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx" PageWidth="850" ShowJsonRowColName="true" ResultAttr="name" activestatus="(23.编制计划)" tablename="EPMS_SurveyDesignWorkPlan" field="ProjectName" OnClick="lbsSelectProject_Click" />
                    </td>
                    <td class="td-l">项目编号
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="tbProjectCode" runat="server" readonly="readonly"
                            activestatus="(23.编制计划)" class="kpms-textbox" tablename="EPMS_SurveyDesignWorkPlan" field="ProjectCode" />
                        <input type="hidden" id="hiOrganizationId" runat="server"
                            tablename="EPMS_SurveyDesignWorkPlan" field="OrganizationID" />
                    </td>
                </tr>
                <tr>
                    <td class="td-l">设计阶段
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="tbPhaseName" runat="server" readonly="readonly"
                            class="kpms-textbox" activestatus="(23.编制计划)"
                            tablename="EPMS_SurveyDesignWorkPlan" field="PhaseName" />
                        <input type="hidden" id="hiPhaseCode" runat="server"
                            tablename="EPMS_SurveyDesignWorkPlan" field="PhaseCode" />
                    </td>
                    <td class="td-l">牵头分院
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="tbHostDeptName" runat="server" readonly="readonly"
                            class="kpms-textbox" activestatus="(23.编制计划)"
                            tablename="EPMS_SurveyDesignWorkPlan" field="HostDeptName" />
                    </td>
                    <td class="td-l">
                    </td>
                    <td class="td-r">
                    </td>
                </tr>
                <tr style="display: none;">
                    <td class="td-l">项目质量目标</td>
                    <td class="td-m" colspan="5">
                        <zhongsoft:LightTextBox runat="server" ID="tbQualityTarget" TextMode="MultiLine"
                            CssClass="kpms-textarea" EnableTheming="false" tablename="EPMS_SurveyDesignWorkPlan"
                            field="QualityTarget" activestatus="(23.编制计划)" Text="产品合格">                            
                        </zhongsoft:LightTextBox></td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<table class="tz-table" width="100%" flag="userInfo">
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
                    <td class="td-m">
                        <zhongsoft:XHtmlInputText ID="tbProjectTemplateName" runat="server" readonly="readonly"
                            activestatus="(2.编制计划)" class="kpms-textbox" tablename="EPMS_SurveyDesignWorkPlan" field="ProjectTemplateName" />
                        <input type="hidden" runat="server" id="hiProjectTemplateID" field="ProjectTemplateID" tablename="EPMS_SurveyDesignWorkPlan" />

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
            <table class="tz-table">
                <tr style="display: none;">
                    <td rowspan="3" class="td-l">大纲编制要求</td>
                    <td class="td-l">勘测设计大纲<span class="req-star">*</span></td>
                    <td class="td-r">
                        <asp:RadioButtonList runat="server" ID="rblIsDesign" tablename="EPMS_SurveyDesignWorkPlan" field="IsDesign"
                            RepeatDirection="Horizontal"  activestatus="(23.编制计划)" />
                    </td>
                    <td class="td-l">完成时间</td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtDesignCompleteDate" runat="server" readonly="readonly"
                            TableName="EPMS_SurveyDesignWorkPlan" Field="DesignCompleteDate" ActiveStatus="(23.编制计划)" />
                    </td>
                </tr>
                <tr style="display: none;">
                    <td class="td-l">设计各专业大纲<span class="req-star">*</span></td>
                    <td class="td-r">
                        <asp:RadioButtonList runat="server" ID="rblIsDesignSpecial" tablename="EPMS_SurveyDesignWorkPlan" field="IsDesignSpecial"
                            RepeatDirection="Horizontal"  activestatus="(23.编制计划)" />
                    </td>
                    <td class="td-l">完成时间</td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtDesignSpecialCompleteDate" runat="server" readonly="readonly"
                            TableName="EPMS_SurveyDesignWorkPlan" Field="DesignSpecialCompleteDate" ActiveStatus="(23.编制计划)" />

                    </td>
                </tr>
                <tr style="display: none;">
                    <td class="td-l">勘测专业大纲<span class="req-star">*</span></td>
                    <td class="td-r">
                        <asp:RadioButtonList runat="server" ID="rblIsSpecial" tablename="EPMS_SurveyDesignWorkPlan" field="IsSpecial"
                            RepeatDirection="Horizontal"  activestatus="(23.编制计划)" />
                    </td>
                    <td class="td-l">完成时间</td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtSpecialCompleteDate" runat="server" readonly="readonly"
                            TableName="EPMS_SurveyDesignWorkPlan" Field="SpecialCompleteDate" ActiveStatus="(23.编制计划)" />
                    </td>
                </tr>
                <tr style="display: none;">
                    <td rowspan="4" id="tdRowSpan" class="td-l">设计评审</td>
                    <td class="td-l">院级<span class="req-star">*</span></td>
                    <td class="td-m" colspan="4">
                        <asp:RadioButtonList runat="server" ID="rblHospitalReview" tablename="EPMS_SurveyDesignWorkPlan" field="HospitalReview"
                            RepeatDirection="Horizontal"  activestatus="(23.编制计划)" AutoPostBack="true" OnSelectedIndexChanged="rblHospitalReview_SelectedIndexChanged" />
                    </td>
                </tr>
                <tr id="trHospital">
                    <%--<td class="td-l">完成时间</td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtHospitalCompleteDate" runat="server" readonly="readonly"
                            TableName="EPMS_SurveyDesignWorkPlan" Field="HospitalCompleteDate" ActiveStatus="(23.编制计划)" />
                    </td>
                    <td class="td-l">评审内容</td>
                    <td class="td-m">
                        <zhongsoft:LightTextBox runat="server" ID="tbHospitalContent" TextMode="MultiLine"
                            CssClass="kpms-textarea" EnableTheming="false" tablename="EPMS_SurveyDesignWorkPlan"
                            field="HospitalContent" activestatus="(23.编制计划)">
                        </zhongsoft:LightTextBox></td>--%>
                    <uc5:DesignReview ID="designReviewY" runat="server"/>
                </tr>
                <tr style="display: none;">
                    <td class="td-l">分院级<span class="req-star">*</span></td>
                    <td class="td-m" colspan="4">
                        <asp:RadioButtonList runat="server" ID="rblInstituteReview" tablename="EPMS_SurveyDesignWorkPlan" field="InstituteReview"
                            RepeatDirection="Horizontal"  activestatus="(23.编制计划)" AutoPostBack="true" OnSelectedIndexChanged="rblInstituteReview_SelectedIndexChanged" />
                    </td>
                </tr>
                <tr id="trInstitute" style="display: none;">
                    <%--<td class="td-l">完成时间</td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtInstituteCompleteDate" runat="server" readonly="readonly"
                            TableName="EPMS_SurveyDesignWorkPlan" Field="InstituteCompleteDate" ActiveStatus="(23.编制计划)" />
                    </td>
                    <td class="td-l">评审内容</td>
                    <td class="td-m" colspan="2">
                        <zhongsoft:LightTextBox runat="server" ID="tbInstituteContent" TextMode="MultiLine"
                            CssClass="kpms-textarea" EnableTheming="false" tablename="EPMS_SurveyDesignWorkPlan"
                            field="InstituteContent" activestatus="(23.编制计划)">
                        </zhongsoft:LightTextBox></td>--%>
                    <uc5:DesignReview ID="designReviewFY" runat="server"/>
                </tr>
                <tr style="display: none;">
                    <td class="td-l">设计验证<span class="req-star">*</span>
                    </td>
                    <td class="td-m" colspan="5">
                        <asp:RadioButtonList runat="server" ID="rblDesignCheck" tablename="EPMS_SurveyDesignWorkPlan" field="DesignCheck" RepeatDirection="Horizontal"  activestatus="(23.编制计划)" />
                    </td>
                </tr>
                <tr style="display: none;">
                    <td class="td-l">设计确认<span class="req-star">*</span>
                    </td>
                    <td class="td-m" colspan="5">
                        <div style="clear: both">
                            <div style="float: left; margin-right: 10px">
                                <asp:RadioButtonList runat="server" ID="rblDesignConfir" tablename="EPMS_SurveyDesignWorkPlan" field="DesignConfir" RepeatDirection="Horizontal" activestatus="(23.编制计划)" />
                            </div>
                            <div style="float: left; display: none" id="divExplained1">
                                <zhongsoft:LightTextBox Width="250px" class="kpms-textbox" ID="tbExplained1" runat="server" tablename="EPMS_SurveyDesignWorkPlan" field="Explained1" ActiveStatus="(23.编制计划)" />
                            </div>
                        </div>
                    </td>
                </tr>
                <tr style="display: none;">
                    <td class="td-l">是否涉密项目<span class="req-star">*</span>
                    </td>
                    <td class="td-r" colspan="2">
                        <asp:RadioButtonList runat="server" ID="rblIsSecretProject" tablename="EPMS_SurveyDesignWorkPlan" field="IsSecretProject" RepeatDirection="Horizontal" activestatus="(23.编制计划)" />
                        <span class="req-star">如果为涉密项目，要严格控制电子版文件的上传</span>
                    </td>
                    <td class="td-l">密级 
                    </td>
                    <td class="td-m" colspan="2">
                        <div style="clear: both">
                            <div style="float: left; margin-right: 10px">
                                <asp:RadioButtonList runat="server" ID="rblSecretLevel" tablename="EPMS_SurveyDesignWorkPlan" field="SecretLevel" RepeatDirection="Horizontal" activestatus="(23.编制计划)" />
                            </div>
                            <div style="float: left; display: none" id="divExplained2">
                                <zhongsoft:LightTextBox Width="250px" class="kpms-textbox" ID="tbExplained2" runat="server" tablename="EPMS_SurveyDesignWorkPlan" field="Explained2" ActiveStatus="(23.编制计划)" />
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">项目起止日期<span class="req-star">*</span></td>
                    <td class="td-m" colspan="5">
                        <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtPlanStartDate" runat="server" readonly="readonly"
                            TableName="EPMS_SurveyDesignWorkPlan" Field="PlanStartDate" ActiveStatus="(23.编制计划)"  req="1" compare="1"/>至
                        <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtPlanCompleteDate" runat="server" readonly="readonly"
                            TableName="EPMS_SurveyDesignWorkPlan" Field="PlanCompleteDate" ActiveStatus="(23.编制计划)" req="1" compare="1"/>
                </tr>
                <tr>
                    <td class="td-l">项目计划文件</td>
                    <td class="td-r" colspan="5">
                        <zhongsoft:LightFileUploader ID="upLoadFile" runat="server" ActiveStatus="(23.编制计划)" DisplayStatus="(23.编制计划)" OnClick="upLoadFile_Click">
                <span>
                    <img id="imgFile" src="../../Themes/Images/btn_upload.gif" alt="上传文件" width="16"  height="16" />上传文件</span>
                        </zhongsoft:LightFileUploader>
                        <uc1:AttachmentView ID="Attachment" runat="server" RepeatColumns="3" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<input type="hidden" id="hiSurveyDesignWorkPlanID" runat="server" tablename="EPMS_SurveyDesignWorkPlan" field="SurveyDesignWorkPlanID" />
<!---表单类型--->
<input type="hidden" runat="server" id="hiFormType" field="FormType" tablename="EPMS_SurveyDesignWorkPlan" />
<%-- 技术质量处（总工办），数字工程中心 --%>
<input type="hidden" runat="server" id="hiTransDeptIDs" value="58AEDB7A-4832-48AC-A18D-C99E3D2DAAA0,F0FF6CD7-0E15-46C3-9F44-827880E32924" />
<script>     


    function initCustomerPlugin() {

        var onlyShowPlan = parseBool('<%=OnlyShowPlan%>');
        //如果只显示计划，则不显示OBS、WBS信息
        if (onlyShowPlan) {
            $('[flag="userInfo"]').hide();
            $('[flag="wbsInfo"]').hide();
        }

        if (typeof (initWBSList) == 'function') {
            initWBSList();
        }

        hideHospital();
        hideInstitute();
        hideDesignConfir();
        hideSecretLevel();
    }
    //院级别评审
    $("#<%=rblHospitalReview.ClientID%>").live("change", function () {
        hideHospital();

    });
    function hideHospital() {
        var selectValue = $("#<%=rblHospitalReview.ClientID%> :checked").val();
        //有
        var rowspan = parseInt($("#tdRowSpan").attr("rowspan"));
        if (selectValue == "1") {
            $("#trHospital").show();
            rowspan++;
        } else {
            $("#trHospital").hide();
            rowspan--;
        }
        $("#tdRowSpan").attr("rowspan", rowspan < 2 ? 2 : rowspan);
    }
    //所级评审
    $("#<%=rblInstituteReview.ClientID%>").live("change", function () {
        hideInstitute();
    });
    function hideInstitute() {
        var selectValue = $("#<%=rblInstituteReview.ClientID%> :checked").val();
        //有
        var rowspan = parseInt($("#tdRowSpan").attr("rowspan"));
        if (selectValue == "1") {
            $("#trInstitute").show();
            rowspan++;
        } else {
            $("#trInstitute").hide();
            rowspan--;
        }
        $("#tdRowSpan").attr("rowspan", rowspan < 2 ? 2 : rowspan);
    }
    //设计确认
    $("#<%=rblDesignConfir.ClientID%>").live("change", function () {
        hideDesignConfir();
    });
    function hideDesignConfir() {
        var selectValue = $("#<%=rblDesignConfir.ClientID%> :checked").val();
        //其他
        if (selectValue == "其他") {
            $("#divExplained1").show();
        } else {
            $("#divExplained1").hide();
        }
    }
    //密级
    $("#<%=rblSecretLevel.ClientID%>").live("change", function () {
        hideSecretLevel();
    });
    function hideSecretLevel() {
        var selectValue = $("#<%=rblSecretLevel.ClientID%> :checked").val();
        //待定
        if (selectValue == "3") {
            $("#divExplained2").show();
        } else {
            $("#divExplained2").hide();
        }
    }

</script>
