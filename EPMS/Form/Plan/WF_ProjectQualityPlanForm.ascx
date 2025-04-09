<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ProjectQualityPlanForm.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.Form.Plan.WF_ProjectQualityPlanForm" %>
<%@ Register Src="../../../Sys/FileDocument/AttachmentView.ascx" TagName="UpLoadFile"
    TagPrefix="uc3" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">工程名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsProject" ShowJsonRowColName="True" SelectPageMode="Dialog" Writeable="False"
                tablename="EPMS_ProjectPlanBook" req="1" field="ProjectName" activestatus="(23.编制工程质量计划)"
                ResultAttr="name" ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode'}"
                PageUrl="/EPMS/Obsolete/ProjectEntitySelector.aspx" PageWidth="850" OnClick="lbsProject_OnClick" />
            <input type="hidden" runat="server" id="hiOrganizationID" tablename="EPMS_ProjectPlanBook" field="OrganizationID" />
        </td>
        <td class="td-l">工程编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" readonly="readonly" class="kpms-textbox" tablename="EPMS_ProjectPlanBook"
                field="ProjectCode" activestatus="(23.编制工程质量计划)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">质量计划的主要内容
        </td>
        <td class="td-m" colspan="5" style="font-size:14px;">
            1  前言：应给出工程的基本信息，包括：工程名称、顾客名称、使用对象和控制要求（指质量计划的使用范围）。<br />
            <br />
            2  目次：列出各章节的题目及页码。<br />
            <br />
            3  工程概况：工程规模、性质、服务范围等；重点阐述工程特点、技术难点。<br />
            <br />
            4  工程质量、环境和职业健康安全目标：应依据公司质量目标，结合本工程特点、顾客要求及采用的新技术、新过程、新设备、新材料或新软件的要求，编制本工程质量、环境和职业健康安全目标。质量、环境和职业健康安全目标应尽量量化，做到可测量。<br />
            <br />
            5  工程组织机构、职责、权限和接口：应阐明本工程的组织机构。列出设计总工程师、各专业工程师、主要设计人的名单，明确各级人员在工程中的职责和权限，并阐明在实施质量活动时，涉及到的相关部门和相互关系。对特定的组织机构（如合作设计），作为主体设计公司应重点阐述各设计公司之间的接口协调问题。<br />
            <br />
            6  工程质量活动步骤。<br />
            <br />
            7  质量管理过程的描述。<br />
            <br />
            8  相关文件：列出引用的程序文件及作业文件的名称及编号。
        </td>
    </tr>
    <tr>
        <td class="td-l">附件
        </td>
        <td class="td-m" colspan="5" flag="file">
            <zhongsoft:LightFileUploader runat="server" ID="lbtnUpload" EnableTheming="false"
                DisplayStatus="(3.编制工程质量计划)" OnClick="lbtnUpload_OnClick"><img src="../../Themes/Images/btn_upload.gif" />
                <span>上传附件</span></zhongsoft:LightFileUploader><span class="req-star" style="float: right;"
                    id="Span2" runat="server" displaystatus="(2.*)"> 请先保存再上传附件</span>
            <uc3:UpLoadFile ID="uploadFile" runat="server" />
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiProjectPlanBookID" tablename="EPMS_ProjectPlanBook" field="ProjectPlanBookID" />
<input type="hidden" runat="server" id="hiFormType" tablename="EPMS_ProjectPlanBook" field="FormType" />
<input type="hidden" runat="server" id="hiWriteUserID" tablename="EPMS_ProjectPlanBook" field="WriteUserID" />
<input type="hidden" runat="server" id="hiWriteUserName" tablename="EPMS_ProjectPlanBook" field="WriteUserName" />
<input type="hidden" runat="server" id="hiWriteDeptID" tablename="EPMS_ProjectPlanBook" field="WriteDeptID" />
<input type="hidden" runat="server" id="hiWriteDeptName" tablename="EPMS_ProjectPlanBook" field="WriteDeptName" />
<input type="hidden" runat="server" id="hiWriteTime" tablename="EPMS_ProjectPlanBook" field="WriteTime" />
<script type="text/javascript">
    function checkForm() {
        if ($formAction == 0) {
            if ($actName == "编制工程质量计划") {
                var attachScanner = $("table[id^='" + "<%=uploadFile.ClientID %>" + "']").find("a");
                if (attachScanner.length == 0) {
                    if (!confirm("您没有上传任何附件，是否继续发往下一步？")) {
                        return false;
                    }
                }
            }
        }
        <%--else if ($formAction == 2) {
            if ($actName == "编制工程质量计划") {
                var projectID = $("#<%=hiOrganizationID.ClientID%>").val();
                if (projectID == "") {
                    alert("请先选择工程再进行保存！");
                    return false;
                }
            }
        }--%>
        return true;
    }


</script>
