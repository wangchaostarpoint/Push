<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="IntegrateProjPlan.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Plan.IntegrateProjPlan" %>
<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView" TagPrefix="uc1" %>
<%@ Register Src="~/EPMS/UI/Project/ProjectCommon.ascx" TagName="ProjectCommon" TagPrefix="uc1" %>
<%@ Import Namespace="Zhongsoft.Portal.EPMS" %>

<table class="tz-table">
    <tr>
        <td class="td-l">标题<span class="req-star">*</span>
        </td>
        <td class="td-m" id="trTitle" colspan="5">
            <zhongsoft:XHtmlInputText ID="txtPlanBookTheme" runat="server" TableName="EPMS_ProjectPlanBook"
                class="kpms-textbox" req="1" Field="PlanBookTheme" ActiveStatus="(23.编制项目计划书)(23.编制项目策划、配置人员)(23.编制项目设计计划)(23.编制专业设计计划)"
                readonly="readonly" />
        </td>
    </tr>
    <uc1:ProjectCommon ID="ucProjectCommon" runat="server" />
    <tr runat="server" id="trSpec" visible="False">
        <td class="td-l">专业<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlSpecialty" runat="server" activestatus="(23.编制项目设计计划)(23.编制专业设计计划)(3.会签调整)(3.修改计划)(3.调整计划)(23.编制项目策划、配置人员)">
            </zhongsoft:LightDropDownList>
            <!----专业表主键--->
            <input type="hidden" id="hiParamSpecialtyID" name="hiParamSpecialtyID" runat="server"
                tablename="EPMS_ProjectPlanBook" field="ParamSpecialtyID" />
            <!----专业代字--->
            <input type="hidden" id="hiSpecialtyCode" name="hiSpecialtyCode" runat="server" tablename="EPMS_ProjectPlanBook"
                field="SpecialtyCode" />
            <!---专业名称-->
            <input type="hidden" id="hiSpecialtyName" name="hiSpecialtyName" runat="server" tablename="EPMS_ProjectPlanBook"
                field="SpecialtyName" />
        </td>
        <td class="td-m" colspan="4"></td>
    </tr>
    <tr style="display: none">
        <td class="td-l">任务类型<span class="req-star">*</span>
        </td>
        <td class="td-r"> 
            <input type="hidden" runat="server" id="hiWBSType" field="WBSType" tablename="EPMS_ProjectPlanBook" />
            <input type="hidden" runat="server" id="hiParamWBSTypeID" field="ParamWBSTypeID"
                tablename="EPMS_ProjectPlanBook" />
        </td>
        <td class="td-l">编号<span class="req-star">*</span>
        </td>
        <td class="td-r"> 
            <zhongsoft:XHtmlInputText runat="server" ID="tbWBSCode" TableName="EPMS_ProjectPlanBook"
                Field="WBSCode" activestatus="(23.编制项目计划书)(3.会签调整)(3.修改计划)(3.调整计划)(23.编制项目策划、配置人员)(23.编制项目设计计划)(23.编制专业设计计划)"
                class="kpms-textbox" />
            <input type="hidden" runat="server" id="hiWBSID" tablename="EPMS_ProjectPlanBook"
                field="WBSID" />
            <input type="hidden" runat="server" id="hiWBSCode" tablename="EPMS_ProjectPlanBook"
                field="WBSCode" />
        </td>
    </tr>
    <tr style="display: none">
        <td class="td-l" style="display: none">是否简单工程<span class="req-star">*</span>
        </td>
        <td class="td-r" style="display: none">
            <asp:RadioButtonList ID="rdblIsSimpleProject" runat="server" ActiveStatus="(23.会签调整)"
                RepeatColumns="2" Field="IsSimpleProject" TableName="EPMS_ProjectPlanBook" req="1">
                <asp:ListItem Text="是" Value="1"></asp:ListItem>
                <asp:ListItem Text="否" Value="0"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
        <td class="td-l">工程分类
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="tbProjectLevel" runat="server" readonly="readonly" maxlength="16"
                class="kpms-textbox" activestatus="(23.?)" />
        </td>
        <td class="td-l">是否紧急
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtIsUrgent" ActiveStatus="(23.编制项目计划书)(23.编制项目策划、配置人员)(3.调整计划)(3.修改计划)" />
            <input type="hidden" runat="server" id="hiIsUrgent" field="IsUrgent" tablename="EPMS_ProjectPlanBook" />
        </td>
        <td class="td-l">是否创优
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtIsExcellent" ActiveStatus="(23.编制项目计划书)(23.编制项目策划、配置人员)(3.调整计划)(3.修改计划)" />
            <input type="hidden" runat="server" id="hiIsExcellent" field="IsExcellent" tablename="EPMS_ProjectPlanBook" />
        </td>
    </tr>
    <tr>
        <td class="td-l">编写人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox" ID="txtWriteUserName" runat="server"
                readonly="readonly" TableName="EPMS_ProjectPlanBook" Field="WriteUserName" ActiveStatus="(23.编制项目计划书)(23.编制项目策划、配置人员)(23.编制项目设计计划)(23.编制专业设计计划)" />
            <!--- 填写（编制\编写）人ID-->
            <input type="hidden" id="hiWriteUserID" name="hiWriteUserID" runat="server" tablename="EPMS_ProjectPlanBook"
                field="WriteUserID" />
        </td>
        <td class="td-l">编制部门
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtWriteDeptName" runat="server" MaxText="32" TableName="EPMS_ProjectPlanBook"
                class="kpms-textbox" readonly="readonly" Field="WriteDeptName" ActiveStatus="(23.编制项目计划书)(23.编制项目策划、配置人员)(23.编制项目设计计划)(23.编制专业设计计划)" />
            <!--编制（编写）部门ID--->
            <input type="hidden" id="hiWriteDeptID" name="hiWriteDeptID" runat="server" tablename="EPMS_ProjectPlanBook"
                field="WriteDeptID" />
        </td>
        <td class="td-l">编制时间
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtWriteTime" runat="server"
                readonly="readonly" TableName="EPMS_ProjectPlanBook" Field="WriteTime" ActiveStatus="(23.编制项目计划书)(23.编制项目策划、配置人员)(23.编制项目设计计划)(23.编制专业设计计划)" />
        </td>
    </tr>
    <tr style="display: none">
        <td class="td-l">综合项目计划书编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox" ID="txtBookCode" runat="server" readonly="readonly"
                TableName="EPMS_ProjectPlanBook" Field="BookCode" ActiveStatus="(23.编制项目计划书)(23.编制项目策划、配置人员)(23.编制项目设计计划)(23.编制专业设计计划)" />
        </td>
        <td class="td-l">联系电话
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText class="kpms-textbox" ID="txtPhone" runat="server" readonly="readonly"
                ActiveStatus="(23.编制项目计划书)(23.编制项目策划、配置人员)(23.编制项目设计计划)(23.编制专业设计计划)" />
        </td>

    </tr>
    <tr runat="server" displaystatus="(23.编制小型项目策划，配置人员)">
        <td class="td-m" colspan="6">
            <a class="subtoolbarlink" onclick="selectProj()"><span>
                <img runat="server" id="imgSelect" src="~/Themes/Images/look-up.gif" alt="选择历史工程策划"
                    width="16" height="16" />历史工程策划</span></a>
        </td>
    </tr>
    <tr class="projMastermind">
        <td class="td-l">项目依据性文件和资料<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbBasisFileAndMaterial" TextMode="MultiLine"
                CssClass="kpms-textarea" EnableTheming="false" MaxLength="4000" tablename="EPMS_ProjectPlanBook"
                itemReq="projMastermindReq" field="BasisFileAndMaterial" activestatus="(23.编制项目策划、配置人员)(3.会签调整)(3.修改计划)">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr class="projMastermind">
        <td class="td-l">设计内容及范围<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbPlanBookContent" TextMode="MultiLine"
                CssClass="kpms-textarea" EnableTheming="false" MaxLength="4000" tablename="EPMS_ProjectPlanBook"
                itemReq="projMastermindReq" field="PlanBookContent" activestatus="(23.编制项目策划、配置人员)(3.会签调整)(3.修改计划)">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr class="projMastermind">
        <td class="td-l">主要设计原则及设计要求<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbDesignPrinciples" TextMode="MultiLine"
                CssClass="kpms-textarea" EnableTheming="false" MaxLength="4000" tablename="EPMS_ProjectPlanBook"
                itemReq="projMastermindReq" field="DesignPrinciples" activestatus="(23.编制项目策划、配置人员)(3.会签调整)(3.修改计划)">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr class="projMastermind">
        <td class="td-l">质量、环境及职业健康<br />
            安全控制要求<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbResourceRequire" TextMode="MultiLine"
                CssClass="kpms-textarea" EnableTheming="false" MaxLength="4000" tablename="EPMS_ProjectPlanBook"
                itemReq="projMastermindReq" field="ControlRequire" activestatus="(23.编制项目策划、配置人员)(3.会签调整)(3.修改计划)">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr class="projMastermind">
        <td class="td-l">其他事项
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbOtherItem" TextMode="MultiLine" CssClass="kpms-textarea"
                EnableTheming="false" MaxLength="4000" tablename="EPMS_ProjectPlanBook" field="OtherItem"
                activestatus="(23.编制项目策划、配置人员)(3.会签调整)(3.修改计划)">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr class="projectPlan" style="display: none">
        <td class="td-l">备注
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbMemo" TextMode="MultiLine" CssClass="kpms-textarea"
                EnableTheming="false" MaxLength="4000" tablename="EPMS_ProjectPlanBook" field="Memo"
                activestatus="(23.编制项目计划书)(3.会签调整)(3.修改计划)(3.调整计划)(23.编制项目设计计划)(23.编制专业设计计划)">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr runat="server" id="trZB" Visible="False">
        <td class="td-l">是否总包工程<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <asp:RadioButtonList runat="server" ID="rblIsZBProject" tablename="EPMS_ProjectPlanBook" field="IsZBProject" RepeatDirection="Horizontal" req="1" activestatus="(23.编制项目设计计划)"/>
        </td>
        <td class="td-m" colspan="4"></td>
    </tr>
    <tr>
        <td class="td-l">主要内容说明</td>
        <td class="td-m" colspan="5">
            <span runat="server" id="ProjSpan" visible="False">一、设计依据及工程规模*<br />
                二、设计范围和内容*<br />
                三、设计基础资料（当编制专业设计计划时，可简化）<br />
                四、主要设计原则*<br />
                五、工程组人员及分工*<br />
                六、设计综合进度*<br />
                七、工程风险及应对措施<br />
                八、工程质量、环境、职业健康安全目标及控制措施<br />
                九、强条<br />
                十、其他
            </span>
            <span runat="server" id="specSpan" visible="False">一、本专业主要设计原则。<br />
                二、设计基础资料。<br />
                三、设计范围。<br />
                四、设计综合进度。<br />
                五、保证措施。<br />
                六、其他。<br />
            </span>
        </td>
    </tr>
    <tr flag="projPlan">
        <td class="td-l">使用说明</td>
        <td class="td-m" colspan="5">
            <span class="req-star">请先按顺序将以下列表完善，然后通过选择模板文件，自动生成工程设计计划文件（系统中已经有的信息都会自动生成，比如专业人员信息、卷册提资信息、产品质量、环境和职业健康安全管理目标、措施及测评表、环境因素识别评价表等），也可以在此基础上修改调整，并作为最终的工程设计计划文件。</span>
        </td>
    </tr>
     <tr>
        <td class="td-l">工程设计计划单</td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightFileUploader ID="upLoadFile" runat="server" ActiveStatus="(23.编制计划)" OnClick="upLoadFile_Click">
                <span>
                    <img id="imgFile" src="<%=WebAppPath %>/Themes/Images/btn_upload.gif" alt="上传文件" width="16"  height="16" />上传文件</span>
            </zhongsoft:LightFileUploader>
        </td>
    </tr>
    <tr>
        <td class="td-r" colspan="6">
            <uc1:AttachmentView ID="Attachment" runat="server" RepeatColumns="3" />
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiBookFileId" />
<input type="hidden" id="hiProjectPlanBookID" name="hiProjectPlanBookID" runat="server"
    tablename="EPMS_ProjectPlanBook" field="ProjectPlanBookID" />
<!---项目ID-->
<input type="hidden" id="hiOrganizationID" name="hiOrganizationID" runat="server"
    tablename="EPMS_ProjectPlanBook" field="OrganizationID" />
<!---项目编号-->
<input type="hidden" id="hiProjectCode" name="hiProjectCode" runat="server" field="ProjectCode"
    tablename="EPMS_ProjectPlanBook" />
<!---项目名称-->
<input type="hidden" id="hiProjectName" name="hiProjectName" runat="server" field="ProjectName"
    tablename="EPMS_ProjectPlanBook" />
<%--项目经理--%>
<input type="hidden" runat="server" id="hiManagerUserID" />
<%--是否紧急工程--%>
<input type="hidden" runat="server" id="hiIsUrgentProject" />
<%--版块--%>
<input type="hidden" runat="server" id="hiBusinessPlate" />
<%--工程级别--%>
<input type="hidden" runat="server" id="hiProjectLevel" />
<!---表单类型--->
<input type="hidden" runat="server" id="hiFormType" field="FormType" tablename="EPMS_ProjectPlanBook" />
<input type="hidden" runat="server" id="hiBookName" />
<input type="hidden" runat="server" id="hiPhaseCode" />
<!---综合专业-->
<input runat="server" id="hiZHSpeCode" type="hidden" value="A" />
<%--<asp:LinkButton runat="server" ID="lbtnWBSOrSpeChange" Style="display: none" OnClick="lbtnWBSTypeChanged_Click">
</asp:LinkButton>--%>
<!-- 综合项目计划书备注信息-->
<input type="hidden" runat="server" id="hiComPlanBookMemo" value="项目设计计划主要内容
一、设计依据及工程规模*
二、设计范围和内容*
三、设计基础资料（当编制专业设计计划时，可简化）：
四、主要设计原则*
五、工程组人员及分工*  
六、设计综合进度*：
七、工程风险及应对措施
八 、工程质量、环境、职业健康安全目标及控制措施
九、其他

" />
<!-- 项目策划备注信息-->
<input type="hidden" runat="server" id="hiProjPlanMemo" value="" />
<input type="hidden" runat="server" id="hiOldProjID" />
<input type="hidden" runat="server" id="hiProjectTemplateFileId" field="TemplateFileID"
    tablename="EPMS_ProjectPlanBook" />
<asp:Button runat="server" ID="btnInitFormInfo" OnClick="btnInitFormInfo_Click" Style="display: none;" />




<script type="text/javascript">
    function integrateProjPlan_Init() {

        //综合项目计划书中，不显示class="projMastermind" 的内容
        if ($("#<%=hiFormType.ClientID %>").val() == "<%=(int)PlanBookType.项目策划 %>".toString()) {
            $(".projMastermind").show();
            //$(".projectPlan").hide();
            if ("<%=CurActivityName %>" == "编制项目策划、配置人员" || "<%=CurActivityName %>" == "会签调整" || "<%=CurActivityName %>" == "修改计划")
                //必填控制
                $("[itemReq=projMastermindReq]").attr("req", "1");
        }
        else {
            $(".projMastermind").hide();
            //$(".projectPlan").show();
            //必填控制
            $("[itemReq=projMastermindReq]").removeAttr("req");

        }

        //只有工程设计计划，才显示使用说明
        if ($("#<%=hiFormType.ClientID %>").val() == '<%=PlanBookType.工程设计计划.GetHashCode() %>') {
            $('[flag="projPlan"]').show();
        }
        else {
            $('[flag="projPlan"]').hide();
        }

        ProjPlanBook_Init();
    }



    function uploadBookFile() {
        showUploadForm($prcInstId, "Module");
        return true;
    }



    //选择历史项目
    function selectProj() {
        var param = new InputParamObject("s");
        getDivProject(null, param, null, setProjInfo);
        return false;
    }

    //带出历史策划信息
    function setProjInfo(reObj) {
        if (reObj != null) {
            $('#<%=hiOldProjID.ClientID %>').val(reObj.buildAttrJson("o", "id"));
            $('#<%=btnInitFormInfo.ClientID %>').click();
        }
    }

</script>
