<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_DesignReViewForm.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.Form.Quality.WF_DesignReViewForm" %>
<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView" TagPrefix="uc3" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">项目名称<span class="req-star">*</span></td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="tbProjectName" IsMutiple="false" req="1"
                SelectPageMode="Dialog" ResultForControls="{'hiOrganizationID':'id','tbProjectCode':'ProjectCode'}" EnableTheming="false" PageWidth="900px"
                Text="选择项目" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx" ShowJsonRowColName="true" OnClick="tbProjectName_Click"
                ResultAttr="name" TableName="EPMS_QualityActivityOfProject" Field="ProjectName" ActiveStatus="(23.提出评审要求)" Height="28px" />
            <input type="hidden" id="hiOrganizationID" name="hiOrganizationID" runat="server" tablename="EPMS_QualityActivityOfProject" field="OrganizationID" />
        </td>
        <td class="td-l">项目编号</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox" ID="tbProjectCode" runat="server" readonly="readonly" TableName="EPMS_QualityActivityOfProject" Field="ProjectCode" ActiveStatus="(23.提出评审要求)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">设计阶段<span class="req-star">*</span></td>
        <td class="td-m" colspan="5">
            <asp:CheckBoxList runat="server" ID="cblProjectPhases" activestatus="(23.提出评审要求)" RepeatDirection="Horizontal" req="1" />
    </tr>
    <tr>
        <td class="td-l">评审编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtSerialNumber" activestatus="(23.提出评审要求)"
                field="SerialNumber" tablename="EPMS_QualityActivityOfProject" class="kpms-textbox" EnableTheming="false" />
        </td>
        <td class="td-l">评审级别<span class="req-star">*</span></td>
        <td class="td-r">
            <asp:RadioButtonList ID="rblReViewLevel" req="1" runat="server" tablename="EPMS_QualityActivityOfProject" field="ReViewLevel" activestatus="(23.提出评审要求)" RepeatDirection="Horizontal"></asp:RadioButtonList>
        </td>
        <td class="td-l">评审时间<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtViewTime" activestatus="(23.提出评审要求)"
                field="InnerTime" tablename="EPMS_QualityActivityOfProject" class="kpms-textbox-date"
                EnableTheming="false" readonly="readonly" req="1" />
        </td>
    </tr>
    <tr>
        <td class="td-l">评审依据<span class="req-star">*</span>
        </td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightTextBox ID="tbActivityGist" runat="server" MaxText="1024" TextMode="MultiLine"
                CssClass="kpms-textarea" EnableTheming="false" req="1" ActiveStatus="(23.提出评审要求)"
                Field="ActivityGist" TableName="EPMS_QualityActivityOfProject" />
        </td>
    </tr>
    <tr>
        <td class="td-l">评审内容<span class="req-star">*</span>
        </td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightTextBox ID="tbActivityContent" runat="server" MaxText="5000" TextMode="MultiLine"
                CssClass="kpms-textarea" EnableTheming="false" req="1" ActiveStatus="(23.提出评审要求)"
                Field="ActivityContent" TableName="EPMS_QualityActivityOfProject" />
        </td>
    </tr>
    <tr>
        <td class="td-l">评审方式<span class="req-star">*</span></td>
        <td class="td-r">
            <asp:RadioButtonList ID="rblReViewMethod" req="1" runat="server" tablename="EPMS_QualityActivityOfProject" field="ReViewMethod" activestatus="(23.提出评审要求)" RepeatDirection="Horizontal"></asp:RadioButtonList>
        </td>
        <td class="td-l">主持人<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtInnerEmceeUserName" IsMutiple="false"
                SelectPageMode="Dialog" activestatus="(23.提出评审要求)" SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" BeforeSelect="beforeSelectUser()" PageWidth="800px" req="1"
                ShowAttrs="name,UserCode" ResultForControls="{'hiInnerEmceeUserID':'id'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"
                field="InnerEmceeUserName" tablename="EPMS_QualityActivityOfProject"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiInnerEmceeUserID" field="InnerEmceeUserID" tablename="EPMS_QualityActivityOfProject" />
        </td>
        <td class="td-l">记录人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtStartUserName" activestatus="(23.提出评审要求)"
                field="StartUserName" tablename="EPMS_QualityActivityOfProject" class="kpms-textbox" EnableTheming="false" req="1" readonly="readonly" />
            <input type="hidden" runat="server" id="hiStartUserID" field="StartUserID" tablename="EPMS_QualityActivityOfProject" />
        </td>
    </tr>
    <tr>
        <td class="td-l">参加人员<span class="req-star">*</span></td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightObjectSelector ID="lbsInnerParticipantName" runat="server" ActiveStatus="(23.提出评审要求)"
                TableName="EPMS_QualityActivityOfProject" Field="InnerParticipantName" class="kpms-textbox" req="1"
                IsMutiple="True" SourceMode="SelectorPage" ShowJsonRowColName="true" ResultAttr="name" BeforeSelect="beforeSelectUser()"
                PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" ResultForControls="{'hiInnerParticipantID':'id'}"
                SelectPageMode="Dialog" />
            <input type="hidden" runat="server" id="hiInnerParticipantID" field="InnerParticipantID" tablename="EPMS_QualityActivityOfProject" />
        </td>
    </tr>
    <tr>
        <td class="td-l">附件</td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightFileUploader runat="server" ID="lbtnUpload" EnableTheming="false"
                DisplayStatus="(23.提出评审要求)" OnClick="upLoadFile_Click" >
                <img src="../../Themes/Images/btn_upload.gif" />
            <span>上传附件</span></zhongsoft:LightFileUploader>
                  <uc3:AttachmentView ID="Attachment" runat="server" />
        </td>
    </tr> 
</table>
<%--综合评审记录单ID--%>
<input id="hiQualityActivityOfProjectID" name="hiQualityActivityOfProjectID" type="hidden" runat="server" field="QualityActivityOfProjectID" tablename="EPMS_QualityActivityOfProject" />
<%--编制部门 --%>
<input type="hidden" runat="server" id="hiDeptId" field="DeptID" tablename="EPMS_QualityActivityOfProject" />
<input type="hidden" runat="server" id="hiDeptName" field="DeptName" tablename="EPMS_QualityActivityOfProject" />
<script type="text/javascript"> 
    function initCustomerPlugin() {
        //隐藏附件功能
        $("#FormToolBar_LinkAttachment").hide();
        $("#partAttachment").hide();
    } 
    function checkForm() {//原有方法: KPMSCheckSubmit 
        if ($formAction == 2) {//原有属性: $readyFormSend
            if ($actName == "提出评审要求") {//$actName 系统变量 
                var OrganizationID = $("#<%=hiOrganizationID.ClientID%>").val();
                if (OrganizationID == "" || OrganizationID == undefined) {
                    alert("请先选择项目！");
                    return false;
                } else {
                    return true;
                }
            }
        }
        return true;
    }
    //选择人员之前的逻辑判断
    function beforeSelectUser() {
        var orgId = $('#<%=hiOrganizationID.ClientID %>').val();
        if (orgId == '' || orgId == undefined) {
            alert('请先选择项目，再选择人员！');
            return false;
        }
        return true;
    }
</script>
