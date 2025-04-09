<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ProjectApproveForm.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.Form.Project.WF_ProjectApproveForm" %>
<%@ Register Src="../../../Sys/FileDocument/AttachmentView.ascx" TagName="UpLoadFile" TagPrefix="uc3" %>
<%@ Register Src="../../UI/OBS/ProjectMgrUser.ascx" TagName="ProjectMgrUser" TagPrefix="uc2" %>

<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="EDPortal.EPMS" %>
<table class="tz-table">
    <tr>
        <td class="td-l" style="display: none;">项目模板
        </td>
        <td class="td-r" colspan="3" style="display: none;">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsSelectTemplate" IsMutiple="false"
                SelectPageMode="Dialog" ResultForControls="{'hiProjectTemplateID':'id'}" EnableTheming="false"
                Text="选择模板" PageUrl="~/EPMS/Obsolete/ProjectTemplateSelector.aspx" ShowJsonRowColName="true"
                ResultAttr="name" FilterFunction="projTempFilter()" activestatus="(23.填写任务书)(23.填写申请)" field="ProjectTemplateName" tablename="EPMS_SurveyDesignProjForm" />
            <input type="hidden" runat="server" id="hiProjectTemplateID" name="hiProjectTemplateID" field="ProjectTemplateID" tablename="EPMS_SurveyDesignProjForm" />
            <span style="color: red" displaystatus="(23.填写任务书)(23.填写申请)" runat="server">如果找不到合适的模板请选择“空模板”</span>
            <%--<span style="color: red" displaystatus="(2.填写任务书)(2.汇总意见)" runat="server">保存后选择模板</span>--%>
            <input type="hidden" runat="server" id="hiOrginalTemplateID" />
        </td>
        <td class="td-l">通知单号
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbNoticeNo" EnableTheming="false" ToolTip="通知单号在流程保存时会自动生成，无需手动填写"
                field="NoticeNo" tablename="EPMS_SurveyDesignProjForm" CssClass="kpms-textbox" activestatus="(23.填写任务书)(23.填写申请)">
            </zhongsoft:LightTextBox>
        </td>
        <td class="td-l">项目档案号<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtProjectArchivesNo" runat="server" class="kpms-textbox" req="1"
                tablename="EPMS_SurveyDesignProjForm" field="ProjectArchivesNo" activestatus="(23.维护档号)" />
        </td>
        <td class="td-m" colspan="2">
            <span class="req-star" runat="server" displaystatus="(2.填写任务书)(23.填写申请)">项目档案号保存后即可自动生成</span>
        </td>
    </tr>
    <tr>
        <td class="td-l">项目名称<span class="req-star">*</span>
        </td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsMarketProjectName" activestatus="(23.填写任务书)(23.填写申请)" SourceMode="SelectorPage"
                SelectPageMode="Dialog" ResultAttr="name" ShowJsonRowColName="true" DoCancel="true"
                ResultForControls="{'hiMarketProjectID':'id','tbProjectName':'name','ddlProjectLevel':'ProjectLevel',
                'hiParamBusinessPlateID':'ParamBusinessPlateID','hiParamProjectTypeID':'ParamProjectTypeID',
                'txtProjectType':'ProjectType','tbProjectPlace':'BuildPlace','tbProjectScale':'ProjectScale',
                'hiBusinessPlate':'BusinessPlate','txtMarketProjectCode':'MarketProjectCode','hiIsAbroad':'IsChurchyard','hiProjectPackage':'ProjectPackage','txtPlanStartDate':'ProductionDate','txtPlanCompleteDate':'PlanFinishTime','txtAssignDate':'StartDate','tbProjectDrawCode':'ProjectDrawCode'}"
                OnClick="lbsMarketProjectName_Click" PageUrl="~/MM/Obsolete/MarketProjectSelector.aspx" Filter="{IsFormalProject:'1'}" req="1"
                EnableTheming="false" PageWidth="850" Writeable="false"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiProjectPackage" field="ProjectPackage" tablename="EPMS_SurveyDesignProjForm" />
            <input type="hidden" runat="server" id="hiMarketProjectID" field="MarketProjectID" tablename="EPMS_SurveyDesignProjForm" />
        </td>
        <td class="td-l">项目编号<span class="req-star">*</span>
        </td>
        <td class="td-m">
            <zhongsoft:XHtmlInputText ID="txtMarketProjectCode" runat="server" class="kpms-textbox" activestatus="(3.审核)" />
            <input runat="server" type="hidden" id="hiProjectCode" field="ProjectCode" tablename="EPMS_SurveyDesignProjForm">
            <asp:Button runat="server" ID="btnCheckRepeat" Text="验重" OnClick="btnCheckRepeat_Click" Visible="false" />
        </td>
    </tr>
    <tr>
        <td class="td-l">项目简称编码<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox runat="server" ID="tbProjectDrawCode" EnableTheming="false" field="ProjectDrawCode" req="1"
                tablename="EPMS_SurveyDesignProjForm" CssClass="kpms-textbox" activestatus="(23.接收任命书并打印)">
            </zhongsoft:LightTextBox>
        </td>
        <td class="td-m" colspan="2"></td>
    </tr>
    <tr style="display: none;">
        <td class="td-l">项目名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox runat="server" ID="tbProjectName" EnableTheming="false" field="ProjectName"
                tablename="EPMS_SurveyDesignProjForm" CssClass="kpms-textbox" activestatus="(23.填写任务书)(23.填写申请)">
            </zhongsoft:LightTextBox>
        </td>
        <td class="td-l">项目编号
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox runat="server" ID="tbProjectCode" EnableTheming="false" CssClass="kpms-textbox" activestatus="(23.填写任务书)(23.填写申请)">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">项目阶段<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <asp:CheckBoxList runat="server" ID="cblProjectPhases" activestatus="(23.填写任务书)(23.填写申请)"
                RepeatDirection="Horizontal" RepeatColumns="8" req="1" />
            <input type="hidden" runat="server" id="hiParamPhaseID" field="ParamPhaseID" tablename="EPMS_SurveyDesignProjForm" />
            <input type="hidden" runat="server" id="hiPhaseName" field="PhaseName" tablename="EPMS_SurveyDesignProjForm" />
        </td>
    </tr>
    <tr>
        <td class="td-l" style="display: none;">项目分类<span class="req-star">*</span>
        </td>
        <td class="td-r" style="display: none;">
            <zhongsoft:LightDropDownList runat="server" ID="ddlProjectLevel" activestatus="(23.填写任务书)(23.填写申请)" Width="220px">
            </zhongsoft:LightDropDownList>
            <input id="hiProjectLevel" runat="server" type="hidden" tablename="EPMS_SurveyDesignProjForm" field="ProjectLevel" />
        </td>
        <td class="td-l">是否重大项目<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <asp:RadioButtonList runat="server" ID="rblIsImportant" req="1" tablename="EPMS_SurveyDesignProjForm" field="IsImportant" RepeatDirection="Horizontal" activestatus="(23.填写任务书)(23.填写申请)">
                <asp:ListItem Text="是" Value="1"></asp:ListItem>
                <asp:ListItem Text="否" Value="0"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
        <td class="td-l">项目类别
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtProjectType" runat="server" readonly="readonly" class="kpms-textbox"
                activestatus="(23.填写任务书)(23.填写申请)" field="ProjectType" tablename="EPMS_SurveyDesignProjForm" />
            <input type="hidden" runat="server" id="hiParamProjectTypeID" field="ParamProjectTypeID" tablename="EPMS_SurveyDesignProjForm" />
            <input type="hidden" runat="server" id="hiProjectTypeCode" field="ProjectTypeCode" tablename="EPMS_SurveyDesignProjForm" />
        </td>
        <td class="td-l">项目来源<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlProjectResource" runat="server" activestatus="(23.填写任务书)(23.填写申请)" req="1" Field="ProjectResourceID" TableName="EPMS_SurveyDesignProjForm" Width="220px">
            </zhongsoft:LightDropDownList>
            <input type="hidden" id="hiProjectResource" name="hiProjectResource" runat="server" field="ProjectResource" tablename="EPMS_SurveyDesignProjForm" />
        </td>
    </tr>
    <tr>
        <td class="td-l">项目牵头分院<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlHostDeptName" req="1" runat="server" activestatus="(23.填写任务书)(23.填写申请)" Field="HostDeptID" TableName="EPMS_SurveyDesignProjForm" Width="220px"
                AutoPostBack="true" OnSelectedIndexChanged="ddlHostDeptName_SelectedIndexChanged">
            </zhongsoft:LightDropDownList>
            <input type="hidden" id="hiHostDeptName" name="hiHostDeptName" runat="server" field="HostDeptName" tablename="EPMS_SurveyDesignProjForm" />
        </td>
        <td class="td-l">项目配合分院<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsDeputyDeptName" IsMutiple="true" ShowSelectBtn="true" SelectPageMode="Dialog" req="1"
                ResultForControls="{'hiDeputyDeptID':'id'}" EnableTheming="false" PageWidth="850" PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx"
                ShowJsonRowColName="true" ResultAttr="name" tablename="EPMS_SurveyDesignProjForm" field="DeputyDeptName"
                activestatus="(23.填写任务书)(23.填写申请)" DoCancel="false" Writeable="false" FilterFunction="filterDeputyDept()" />
            <input type="hidden" id="hiDeputyDeptID" name="hiDeputyDeptID" runat="server" field="DeputyDeptID" tablename="EPMS_SurveyDesignProjForm" />
        </td>
    </tr>
    <tr>
        <td class="td-l">项目经费（万元）
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtProjectFunds" runat="server" class="kpms-textbox-money" activestatus="(23.填写任务书)(23.填写申请)" />
            <input type="hidden" runat="server" id="hiProjectFunds" field="ProjectFunds" tablename="EPMS_SurveyDesignProjForm" />
        </td>
        <td class="td-l" style="display: none;">项目预估产值(万元)
        </td>
        <td class="td-r" style="display: none;">
            <zhongsoft:XHtmlInputText ID="txtEstimateContractVal" runat="server" class="kpms-textbox-money"
                activestatus="(23.填写任务书)(23.填写申请)" />
            <input type="hidden" runat="server" id="hiEstimateContractVal" field="EstimateContractVal" tablename="EPMS_SurveyDesignProjForm" />
        </td>
        <td class="td-r" colspan="2"></td>
        <td class="td-r" colspan="2"></td>
    </tr>
    <tr>
        <td class="td-l">业主单位<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightObjectSelector runat="server" ID="txtCustomerName" IsMutiple="false"
                ShowSelectBtn="true" SelectPageMode="Dialog" ResultForControls="{'hiCustomerID':'id'}"
                EnableTheming="false" PageWidth="850" PageUrl="~/MM/Obsolete/CustomerSelector.aspx"
                ShowJsonRowColName="true" ResultAttr="name" tablename="EPMS_SurveyDesignProjForm"
                field="CustomerName" activestatus="(23.填写任务书)(23.填写申请)" DoCancel="false" Writeable="false" req="1" />
            <input type="hidden" id="hiCustomerID" name="hiCustomerID" runat="server" field="CustomerID"
                tablename="EPMS_SurveyDesignProjForm" />
        </td>
    </tr>
    <tr>
        <td class="td-l">业主单位联系人
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbCustomerContact" EnableTheming="false" field="CustomerContact" tablename="EPMS_SurveyDesignProjForm" CssClass="kpms-textbox" activestatus="(23.填写任务书)(23.填写申请)">
            </zhongsoft:LightTextBox>
        </td>
        <td class="td-l">联系方式
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbContactInformation" EnableTheming="false" field="ContactInformation" tablename="EPMS_SurveyDesignProjForm" CssClass="kpms-textbox" activestatus="(23.填写任务书)(23.填写申请)">
            </zhongsoft:LightTextBox>
        </td>
        <td class="td-r" colspan="2"></td>
    </tr>
    <tr>
        <td class="td-l">下达日期<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtAssignDate" runat="server" activestatus="(23.填写任务书)(23.填写申请)"
                class="kpms-textbox-date" readonly="readonly" field="AssignDate" tablename="EPMS_SurveyDesignProjForm" req="1">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">工程投产日期<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtPlanStartDate" runat="server" activestatus="(23.填写任务书)(23.填写申请)" req="1"
                class="kpms-textbox-comparedate" compare="1" readonly="readonly" field="PlanStartDate" tablename="EPMS_SurveyDesignProjForm">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">计划完成日期<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtPlanCompleteDate" runat="server" activestatus="(23.填写任务书)(23.填写申请)" Onchange="CompareDate(this);"
                class="kpms-textbox-comparedate" compare="1" readonly="readonly" field="PlanCompleteDate" tablename="EPMS_SurveyDesignProjForm" req="1">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" runat="server" id="hiPlanCompleteDate" />
        </td>
    </tr>
    <tr runat="server" id="trTips" displaystatus="(2.?)">
        <td colspan="6" style="text-align: center;">
            <span class="req-star">请保存后再选择项目角色人员</span>
        </td>
    </tr>
    <%--<uc2:ProjectMgrUser ID="ProjectMgrUser1" runat="server" />--%>
    <tr>
        <td class="td-l">院主管领导<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsCompetentLeader" IsMutiple="True" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"
                SelectPageMode="Dialog" activestatus="(23.填写任务书)(23.填写申请)" field="CompetentLeader" tablename="EPMS_SurveyDesignProjForm"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" Writeable="True"
                ShowAttrs="name,LoginId" PageWidth="850" ResultForControls="{'hiCompetentLeaderID':'id'}" req="1" />
            <input type="hidden" id="hiCompetentLeaderID" name="hiCompetentLeaderID" runat="server" field="CompetentLeaderID"
                tablename="EPMS_SurveyDesignProjForm" />
        </td>
        <td class="td-l">主管总工<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsChiefEngineer" IsMutiple="True" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx"
                SelectPageMode="Dialog" activestatus="(23.填写任务书)(23.填写申请)" field="ChiefEngineer" tablename="EPMS_SurveyDesignProjForm"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" Writeable="True"
                ShowAttrs="name,LoginId" PageWidth="850" ResultForControls="{'hiChiefEngineerID':'id'}" req="1" />
            <input type="hidden" id="hiChiefEngineerID" name="hiChiefEngineerID" runat="server" field="ChiefEngineerID"
                tablename="EPMS_SurveyDesignProjForm" />
        </td>
        <td class="td-l">设总<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsDesignEngineer" IsMutiple="True" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx"
                SelectPageMode="Dialog" activestatus="(23.填写任务书)(23.填写申请)" field="DesignEngineer" tablename="EPMS_SurveyDesignProjForm"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" Writeable="True"
                ShowAttrs="name,LoginId" PageWidth="850" ResultForControls="{'hiDesignEngineerID':'id'}" req="1" />
            <input type="hidden" id="hiDesignEngineerID" name="hiDesignEngineerID" runat="server" field="DesignEngineerID"
                tablename="EPMS_SurveyDesignProjForm" />
        </td>
    </tr>
    <tr>
        <td class="td-l">经营联系人<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsBusinessContacts" IsMutiple="True" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"
                SelectPageMode="Dialog" activestatus="(23.填写任务书)(23.填写申请)" field="BusinessContacts" tablename="EPMS_SurveyDesignProjForm"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" Writeable="True"
                ShowAttrs="name,LoginId" PageWidth="850" ResultForControls="{'hiBusinessContactsID':'id'}" req="1" />
            <input type="hidden" id="hiBusinessContactsID" name="hiBusinessContactsID" runat="server" field="BusinessContactsID"
                tablename="EPMS_SurveyDesignProjForm" />
        </td>
        <td class="td-l">执行设总</td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsExecutiveMaster" IsMutiple="True" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx"
                SelectPageMode="Dialog" activestatus="(23.填写任务书)(23.填写申请)" field="ExecutiveMaster" tablename="EPMS_SurveyDesignProjForm"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" Writeable="True"
                ShowAttrs="name,LoginId" PageWidth="850" ResultForControls="{'hiExecutiveMasterID':'id'}" />
            <input type="hidden" id="hiExecutiveMasterID" name="hiExecutiveMasterID" runat="server" field="ExecutiveMasterID"
                tablename="EPMS_SurveyDesignProjForm" />
        </td>
        <td class="td-l">副设总</td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsDeputyDesignEngineer" IsMutiple="True" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx"
                SelectPageMode="Dialog" activestatus="(23.填写任务书)(23.填写申请)" field="DeputyDesignEngineer" tablename="EPMS_SurveyDesignProjForm"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" Writeable="True"
                ShowAttrs="name,LoginId" PageWidth="850" ResultForControls="{'hiDeputyDesignEngineerID':'id'}" />
            <input type="hidden" id="hiDeputyDesignEngineerID" name="hiDeputyDesignEngineerID" runat="server" field="DeputyDesignEngineerID"
                tablename="EPMS_SurveyDesignProjForm" />
        </td>
    </tr>
    <tr>
        <td class="td-l">项目助理/秘书</td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsProjectAssistant" IsMutiple="True" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx"
                SelectPageMode="Dialog" activestatus="(23.填写任务书)(23.填写申请)" field="ProjectAssistant" tablename="EPMS_SurveyDesignProjForm"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" Writeable="True"
                ShowAttrs="name,LoginId" PageWidth="850" ResultForControls="{'hiProjectAssistantID':'id'}" />
            <input type="hidden" id="hiProjectAssistantID" name="hiProjectAssistantID" runat="server" field="ProjectAssistantID"
                tablename="EPMS_SurveyDesignProjForm" />
        </td>
        <td class="td-l">项目顾问总工</td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsProjectConsultant" IsMutiple="True" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx"
                SelectPageMode="Dialog" activestatus="(23.填写任务书)(23.填写申请)" field="ProjectConsultant" tablename="EPMS_SurveyDesignProjForm"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" Writeable="True"
                ShowAttrs="name,LoginId" PageWidth="850" ResultForControls="{'hiProjectConsultantID':'id'}" />
            <input type="hidden" id="hiProjectConsultantID" name="hiProjectConsultantID" runat="server" field="ProjectConsultantID"
                tablename="EPMS_SurveyDesignProjForm" />
        </td>
        <td class="td-l">项目主设人</td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsProjectMaster" IsMutiple="True" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx"
                SelectPageMode="Dialog" activestatus="(23.填写任务书)(23.填写申请)" field="ProjectMaster" tablename="EPMS_SurveyDesignProjForm"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" Writeable="True"
                ShowAttrs="name,LoginId" PageWidth="850" ResultForControls="{'hiProjectMasterID':'id'}" />
            <input type="hidden" id="hiProjectMasterID" name="hiProjectMasterID" runat="server" field="ProjectMasterID"
                tablename="EPMS_SurveyDesignProjForm" />
        </td>
    </tr>
    <tr>
        <td class="td-l">工作内容及范围<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbProjectScale" runat="server" TextMode="MultiLine" MaxLength="1024" req="1"
                field="ProjectScale" tablename="EPMS_SurveyDesignProjForm" activestatus="(23.填写任务书)(23.填写申请)" CssClass="kpms-textarea"
                EnableTheming="false"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">资料来源<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbFileResource" runat="server" TextMode="MultiLine" MaxLength="1024" req="1"
                field="FileResource" tablename="EPMS_SurveyDesignProjForm" activestatus="(23.填写任务书)(23.填写申请)" CssClass="kpms-textarea"
                EnableTheming="false"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">时间任务要求<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbTimeTaskRequire" EnableTheming="false" TextMode="MultiLine" MaxLength="1024" req="1"
                field="TimeTaskRequire" tablename="EPMS_SurveyDesignProjForm" CssClass="kpms-textarea" activestatus="(23.填写任务书)(23.填写申请)">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">专业工作内容及时间要求<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbDesignRange" runat="server" TextMode="MultiLine" MaxLength="1024" req="1"
                field="DesignRange" tablename="EPMS_SurveyDesignProjForm" activestatus="(23.填写任务书)(23.填写申请)" CssClass="kpms-textarea"
                EnableTheming="false"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">相关附件</td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightFileUploader ID="upLoadFile" runat="server" displaystatus="(23.填写任务书)(23.填写申请)" ActiveStatus="(23.填写任务书)(23.填写申请)" OnClick="upLoadFile_Click">
                <span>
                    <img id="imgFile" src="<%=WebAppPath %>/Themes/Images/btn_upload.gif" alt="上传文件" width="16"  height="16" />上传文件</span>
            </zhongsoft:LightFileUploader>
            <uc3:UpLoadFile ID="Attachment" runat="server" />
        </td>
    </tr>
</table>
<!-- 主键-->
<input id="hiSurveyDesignProjFormID" type="hidden" tablename="EPMS_SurveyDesignProjForm" field="SurveyDesignProjFormID" runat="server" />
<input type="hidden" runat="server" id="hiParamBusinessPlateID" tablename="EPMS_SurveyDesignProjForm" field="ParamBusinessPlateID" />
<input type="hidden" runat="server" id="hiBusinessPlate" tablename="EPMS_SurveyDesignProjForm" field="BusinessPlate" />
<input type="hidden" runat="server" id="hiIsAbroad" tablename="EPMS_SurveyDesignProjForm" field="IsAbroad" />
<input type="hidden" runat="server" id="hiFormType" tablename="EPMS_SurveyDesignProjForm" field="FormType" />
<%--综合能源公司,用于估算产值权限判断--%>
<input type="hidden" runat="server" id="hiZHNYGSName" value="综合能源公司" />
<%--创建时是立项状态--%>
<input id="hiProjectState" runat="server" type="hidden" tablename="EPMS_SurveyDesignProjForm" field="ProjectState" value="1" />
<input id="hiRoleName" runat="server" type="hidden" value="'分管总工','专业总工','分管所领导','设总','项目跟踪岗'" />
<input type="hidden" id="hiCheckFlowMes" name="hiCheckFlowMes" runat="server" value="已经存在发起的勘测设计项目通知单流程,不能重复发起！" />
<%-- 传阅的职能部门 数字中心，技术质量处（总工办）--%>
<input id="hiPassDeptID" runat="server" type="hidden" value="F0FF6CD7-0E15-46C3-9F44-827880E32924,58AEDB7A-4832-48AC-A18D-C99E3D2DAAA0" />
<%--主管总工 改为部门角色"主管总工" --副总工程师,总工程师--%>
<input type="hidden" runat="server" id="hiFilterByRank" value="<root><o roleName='勘测副总' rank='副总工程师' /></root>" />
<input type="hidden" runat="server" id="hiFilterByDept" value="<root><o roleName='主管领导' deptCode='200802290000019' /><o roleName='前期项目负责人' deptCode='01017019' /><o roleName='项目助理' deptCode='hostDept' /><o roleName='经营经理' deptCode='hostDept' /><o roleName='院主管领导' deptCode='101' deptRoleName='院主管领导' /><o roleName='项目助理/秘书' deptCode='hostDept' deptRoleName='项目助理/秘书' /><o roleName='经营联系人' deptCode='104' deptRoleName='经营联系人' /></root>" />
<!---数字化管理员【默认信息化业务部的数字化管理员】，质量工程师【默认技术质量部的质量工程师】，安全工程师【默认安全监察部的安全工程师】，计划工程师【默认项目组织部门的计划工程师】，财务部【默认财务部的费用工程师】--->
<input type="hidden" runat="server" id="hiFilterByDeptRole" value="<root><o roleName='数字化管理员' deptCode='01017018' deptRoleName='数字化管理员' /><o roleName='质量工程师' deptCode='01017022' deptRoleName='质量工程师' /><o roleName='安全工程师' deptCode='01017066' deptRoleName='安全工程师' /><o roleName='计划工程师' deptCode='hostDept' deptRoleName='计划工程师' /><o roleName='费用工程师' deptCode='01017033' deptRoleName='费用工程师' /></root>" />
<input type="hidden" runat="server" id="hiHostDeptCode" />
<!--选择主管总工的时候，也可以选择其他角色类型的人员-->
<input type="hidden" runat="server" id="hiOrInRoleName" value="院副总,分院总工" />

<script type="text/javascript">
    function initCustomerPlugin() {
        //隐藏附件功能
        $("#FormToolBar_LinkAttachment").hide();
        $("#partAttachment").hide();
        //modified by biye 20210302 设置复制套用历史工程项目组成员行隐藏
        //setCopyProjUserHide();
    }
    function checkForm() {
        // 防止不勾选新的阶段走流程
        if (($actName == "填写任务书" || $actName=="填写申请") && $formAction == 0) {
            var count = ($("#<%=cblProjectPhases.ClientID %>").find("input[type=checkbox]:checked:not(:disabled)").length);
            if (count == 0) {
                alert("请选择项目阶段。");
                return false;
            }
        }
        if ($formAction == 0 || $formAction == 2) {
            return checkType();
        }
        return true;
    }
    //选择项目模板筛选（业务类型、业务板块筛选）
    function projTempFilter() {
        return { 'OrganizationID': $('#<%=hiSurveyDesignProjFormID.ClientID%>').val() };
    }
    //选择项目模板前
    function beforeSelectTemplate() {
        var orgID = $("#<%=hiSurveyDesignProjFormID.ClientID %>").val();
        if (orgID == "") {
            alert("请先选择项目");
            return false;
        }
        $("#<%=hiOrginalTemplateID.ClientID %>").val($("#<%=hiProjectTemplateID.ClientID %>").val());
        return true;
    }
    //选择设总前验证选择了工程类型
    function beforeSelChief() {
        var projectLevel = $('#<%=ddlProjectLevel.ClientID%>').val();
        if (projectLevel == "" || projectLevel == undefined) {
            alert("请先选择工程类型");
            return false;
        }
        return true;
    }
    function CompareDate(planDate) {
        var thisDate = planDate.value;
        var MPDate = $("#<%=hiPlanCompleteDate.ClientID%>").val();
        if (thisDate != "" && MPDate != "") {

            if (new Date(thisDate.replaceAll('-', '/')) > new Date(MPDate.replaceAll('-', '/'))) {
                alert("阶段计划完成日期不能超过项目计划完成日期" + MPDate);
                planDate.value = "";
            }
        }
    }
    //检查估算额是否填写
    function checkGS() {
        var flag = 0;
        $('#<%=cblProjectPhases.ClientID %>').find("input[type='checkbox']:checked").each(function () {
            var sValue = $(this).next().text();
            if (sValue != "") {
                flag = 1;
            }
        })
        if (flag == 0) {
            var gsValus = $("#<%=txtEstimateContractVal.ClientID%>").val();
            if (gsValus == "") {
                alert("阶段估算产值不可为空，请在【正式项目】台帐维护。");
                return false;
            }
        }
        return true;
    }
    function checkType() {
        var typeID = $("#<%=hiParamProjectTypeID.ClientID%>").val();
        if (typeID == undefined || typeID == "") {
            alert("历史工程—请到正式项目台账中进行修改工程类别信息！");
            return false;
        }
        return true;
    }
    function filterDeputyDept() {
        //配合分院可能没有，所以需要可以选择无
        //return { OrgUnitCode:'<%=string.Join(",",EPMSConfig.Instance.ProductDeptCodes)%>', UnionDept: '无' };
        //modified by yangzhen on 20211012 传递部门类型,部门级别
        return { OrgUnitType: '1', UnionDept: '无', OrganizationLevel: '2' };
    }

    //打印前控制，必须流程结束才可以打印
    function beforePrint() {
        var processStatus = '0';
        <%
    if (ProcessManager != null)
    {

    %>
        processStatus = '<%=ProcessManager.WorkflowProcessStatus.GetHashCode()%>';
         <%
    }
    %>
        if (processStatus != '7') {
            alert('任命书必须在流程结束后才可以打印。');
            return false;
        }

        return true;
    }
</script>