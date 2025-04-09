<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_DProjResourceAppointForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.OBS.WF_DProjResourceAppointForm" %>
<%@ Register Src="~/EPMS/UI/FileList.ascx" TagName="FileList" TagPrefix="uc1" %>
<%@ Register Src="../../UI/OBS/ProjectMgrUser.ascx" TagName="ProjectMgrUser" TagPrefix="uc2" %>
<%@ Register Src="../../UI/OBS/ProjectSpeUser.ascx" TagName="ProjectSpeUser" TagPrefix="uc3" %>
<script type="text/javascript">

    function projFilter() {
        return "{ProjectState:'2'}";
    }

    function initCustomerPlugin() {
        if (typeof (initFileList) == 'function')
            initFileList();
    }

    function checkForm() {
        if ($formAction == 0) {
            if (!beforSend()) {
                return false;
            }
            else if (($actName == "汇总" || $actName == "配备人员") && !checkHasUser()) {
                alert("请将人员配置完全");
                return false;
            }
        }
        return true;
    }

</script>
<table class="tz-table" width="100%">
    <tr runat="server" id="trBaseInfo">
        <td class="td-l">
            项目名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3" style="white-space: nowrap">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsSelectProject" req="1" IsMutiple="false"
                SelectPageMode="Dialog" ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode'}"
                EnableTheming="false" Text="选择项目" AfterSelect="afterSelect()" PageUrl="~/EPMS/Obsolete/DesignProjectSelector.aspx"
                PageWidth="850" ShowJsonRowColName="true" FilterFunction="projFilter()" ResultAttr="name"
                activestatus="(23.编制项目方案)" field="ProjectName" tablename="EPMS_ProjectResource" />
        </td>
        <td class="td-l">
            项目编号
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="txtProjectCode" runat="server" CssClass="kpms-textbox"
                EnableTheming="false" ActiveStatus="(23.编制项目方案)" Field="ProjectCode" TableName="EPMS_ProjectResource"
                ReadOnly="true"></zhongsoft:LightTextBox>
            <input type="hidden" id="hiOrganizationId" name="hiOrganizationId" runat="server"
                field="OrganizationID" tablename="EPMS_ProjectResource" />
        </td>
    </tr>
    <tr>
        <td class="td-l" nowrap="nowrap">
            任务类别
        </td>
        <td class="td-m">
            <zhongsoft:XHtmlInputText ID="txtTaskType" runat="server" readonly="readonly" activestatus="(23.?)"
                maxlength="16" class="kpms-textbox" field="TaskType" tablename="EPMS_DProjectResourceForm" />
        </td>
        <td class="td-l" nowrap="nowrap">
            提出人<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtPutUserName" IsMutiple="false"
                req="1" activestatus="(2.*)" SourceMode="SelectorPage" ShowJsonRowColName="true"
                SelectPageMode="Dialog" DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode"
                ResultForControls="{'hiPutUserId':'id'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"
                field="PutUserName" tablename="EPMS_ProjectResource"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiPutUserId" field="PutUserID" tablename="EPMS_ProjectResource" />
        </td>
        <td class="td-l" nowrap="nowrap">
            发起时间
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtApplyDate" runat="server" TableName="EPMS_DProjectResourceForm"
                Field="ApplyDate" activestatus="(23.编制项目方案)" req="1" class="kpms-textbox-date"
                readonly="readonly">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <uc2:ProjectMgrUser ID="ProjectMgrUser1" runat="server" />
    <uc3:ProjectSpeUser ID="ProjectSpeUser1" runat="server" />
    <tr>
        <td class="td-l" nowrap="nowrap" rowspan="6">
            项目策划
        </td>
        <td class="td-l" nowrap="nowrap">
            项目概况<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="4">
            <zhongsoft:LightTextBox ID="tbResourceRequire" runat="server" TextMode="MultiLine"
                req="1" MaxText="512" CssClass="kpms-textarea" Width="96%" EnableTheming="false"
                ActiveStatus="(23.编制项目方案)" Field="ProjectContent" TableName="EPMS_DProjectResourceForm"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l" nowrap="nowrap">
            编制依据及范围<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="4">
            <zhongsoft:LightTextBox ID="LightTextBox1" runat="server" TextMode="MultiLine" req="1"
                MaxText="512" CssClass="kpms-textarea" Width="96%" EnableTheming="false" ActiveStatus="(23.编制项目方案)"
                Field="ProjectBasin" TableName="EPMS_DProjectResourceForm"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l" nowrap="nowrap">
            主要技术原则及方案<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="4">
            <zhongsoft:LightTextBox ID="LightTextBox2" runat="server" TextMode="MultiLine" req="1"
                MaxText="512" CssClass="kpms-textarea" Width="96%" EnableTheming="false" ActiveStatus="(23.编制项目方案)"
                Field="ProjectTech" TableName="EPMS_DProjectResourceForm"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l" nowrap="nowrap">
            配合要求及说明事项<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="4">
            <zhongsoft:LightTextBox ID="LightTextBox3" runat="server" TextMode="MultiLine" req="1"
                MaxText="512" CssClass="kpms-textarea" Width="96%" EnableTheming="false" ActiveStatus="(23.编制项目方案)"
                Field="ProjectRequire" TableName="EPMS_DProjectResourceForm"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l" nowrap="nowrap">
            项目里程碑计划<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="4">
            <zhongsoft:LightTextBox ID="LightTextBox4" runat="server" TextMode="MultiLine" req="1"
                MaxText="512" CssClass="kpms-textarea" Width="96%" EnableTheming="false" ActiveStatus="(23.编制项目方案)"
                Field="ProjectAim" TableName="EPMS_DProjectResourceForm"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l" nowrap="nowrap">
            计划开始日期
        </td>
        <td class="td-m" colspan="2">
            <zhongsoft:XHtmlInputText ID="XHtmlInputText1" runat="server" TableName="EPMS_DProjectResourceForm"
                Field="PlanStartDate" activestatus="(23.编制项目方案)" class="kpms-textbox-date" readonly="readonly">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l" nowrap="nowrap">
            计划结束日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="XHtmlInputText2" runat="server" TableName="EPMS_DProjectResourceForm"
                Field="PlanCompleteDate" activestatus="(23.编制项目方案)" class="kpms-textbox-date"
                readonly="readonly">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td colspan="6" class="td-m" align="center">
            <b>业务建设、参考设计、通用设计项目审批材料</b>
        </td>
    </tr>
    <tr>
        <td colspan="6" class="td-m">
            <uc1:FileList ID="fileList" runat="server" FileType="典型设计项目资料" DownAllFile="true" />
        </td>
    </tr>
</table>
<!--主键 -->
<input type="hidden" id="hiDProjectResourceID" name="hiDProjectResourceID" runat="server"
    field="DProjectResourceID" tablename="EPMS_DProjectResourceForm" />
<input type="hidden" id="hiProjectResourceID" name="hiProjectResourceID" runat="server"
    field="ProjectResourceID" tablename="EPMS_ProjectResource" />
<input type="hidden" id="hiResourceType" name="hiResourceType" runat="server" field="ResourceType"
    tablename="EPMS_ProjectResource" value="6" />