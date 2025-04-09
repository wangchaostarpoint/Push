<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_DProjectStartForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.Project.WF_DProjectStartForm" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">
            项目名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox ID="tbProjectName" runat="server" MaxLength="128" Field="DProjectName"
                req="1" TableName="EPMS_DProjectInfoForm" activestatus="(23.提出项目立项申请)(23.修改立项申请)" />
            <input type="hidden" runat="server" id="hiTaskXml" />
            <input type="hidden" runat="server" id="hiName" />
        </td>
        <td class="td-l">
            项目编号<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <table cellpadding='0' cellspacing='0' width="100%">
                <tr>
                    <td>
                        <zhongsoft:LightTextBox ID="tbProjectCode" runat="server" MaxLength="32" Field="DProjectCode"
                            req="1" TableName="EPMS_DProjectInfoForm" activestatus="(23.编制项目编号)" />
                    </td>
                    <td runan="server">
                        <asp:LinkButton runat="server" ID="lbtnCheckCode" CssClass="btn-look-up" EnableTheming="false"
                            OnClientClick="return selPhaseCode();" activestatus="(23.编制项目编号)" Visible="false">
                        <img src="<%=WebAppPath%>/Themes/Images/look-up.gif"/>
                        </asp:LinkButton>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            项目阶段<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlPhase" runat="server" activestatus="(23.提出项目立项申请)"
                Field="ParamPhaseID" req="1" TableName="EPMS_DProjectInfoForm">
            </zhongsoft:LightDropDownList>
            <input type="hidden" id="hiPhaseCode" name="hiPhaseCode" runat="server" field="PhaseCode"
                tablename="EPMS_DProjectInfoForm" />
            <input type="hidden" id="hiPhaseName" name="hiPhaseName" runat="server" field="PhaseName"
                tablename="EPMS_DProjectInfoForm" />
        </td>
        <td class="td-l">
            任务类别<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlTaskType" runat="server" activestatus="(23.提出项目立项申请)(23.修改立项申请)"
                req="1" Field="TaskType" TableName="EPMS_DProjectInfoForm">
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l">
            任务单编号
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbTaskCode" runat="server" MaxLength="128" activestatus="(23.提出项目立项申请)"
                Field="TaskApplyCode" TableName="EPMS_DProjectInfoForm" ReadOnly="true" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            专业<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsSelectSpecialty" req="1" IsMutiple="false"
                SelectPageMode="Dialog" ResultForControls="{'hiMainSpeId':'id'}" EnableTheming="false"
                Text="选择专业" PageUrl="~/EPMS/Obsolete/SpeSelector.aspx" PageWidth="850" ShowJsonRowColName="true"
                ResultAttr="name" activestatus="(23.提出项目立项申请)(23.修改立项申请)" TableName="EPMS_DProjectInfoForm"
                field="SpecialtyName" />
            <input type="hidden" runat="server" id="hiMainSpeId" tablename="EPMS_DProjectInfoForm"
                field="SpecialtyId" />
        </td>
        <td class="td-l">
            配合专业
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsSelectSpe" IsMutiple="true"
                SelectPageMode="Dialog" ResultForControls="{'hiProjectSpeId':'id'}" EnableTheming="false"
                Text="选择专业" PageUrl="~/EPMS/Obsolete/SpeSelector.aspx" PageWidth="850" ShowJsonRowColName="true"
                ResultAttr="name" activestatus="(23.提出项目立项申请)(23.修改立项申请)" TableName="EPMS_DProjectInfoForm"
                field="OtherSpecialtyName" />
            <input type="hidden" runat="server" id="hiProjectSpeId" tablename="EPMS_DProjectInfoForm"
                field="OtherSpecialtyId" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            项目负责人<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtManagerUserName" field="ManagerUserName"
                SelectPageMode="Dialog" tablename="EPMS_DProjectInfoForm" activestatus="(23.接收)"
                SourceMode="SelectorPage" ResultAttr="name" EnableTheming="false" ResultForControls="{'hiManageUserID':'id','hiManagerUserCode':'LoginId'}"
                PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" req="1" Width="100px"></zhongsoft:LightObjectSelector>
            <input type="hidden" id="hiManageUserID" name="hiManageUserID" runat="server" tablename="EPMS_DProjectInfoForm"
                field="ManagerUserID" />
            <input type="hidden" id="hiManagerUserCode" runat="server" tablename="EPMS_DProjectInfoForm"
                field="ManagerUserCode" />
        </td>
        <td class="td-l">
            主管总工<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtMasterDesignName" field="MasterDesignName"
                SelectPageMode="Dialog" tablename="EPMS_DProjectInfoForm" activestatus="(3.接收)"
                SourceMode="SelectorPage" ResultAttr="name" EnableTheming="false" ResultForControls="{'hiMasterDesignID':'id','hiMasterDesignCode':'LoginId'}"
                PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" req="1" FilterFunction="managerFilter()"
                Width="100px"></zhongsoft:LightObjectSelector>
            <input type="hidden" id="hiMasterDesignID" name="hiMasterDesignID" runat="server"
                tablename="EPMS_DProjectInfoForm" field="MasterDesignID" />
            <input type="hidden" id="hiMasterDesignCode" runat="server" tablename="EPMS_DProjectInfoForm"
                field="MasterDesignCode" />
        </td>
        <td class="td-l">
            审批是否同意
        </td>
        <td class="td-r">
            <asp:RadioButtonList runat="server" ID="RadioButtonList1" field="IsAgree" req="1"
                RepeatDirection="Horizontal" tablename="EPMS_DProjectInfoForm" activestatus="(23.审批)">
                <asp:ListItem Text="是" Value="1"></asp:ListItem>
                <asp:ListItem Text="否" Value="0"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            主要内容
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbProjectContent" runat="server" TextMode="MultiLine"
                MaxText="512" CssClass="kpms-textarea" EnableTheming="false" activestatus="(23.提出项目立项申请)(3.修改立项申请)"
                Field="ProjectContent" TableName="EPMS_DProjectInfoForm"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            预期目标
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbProjectAim" runat="server" TextMode="MultiLine" MaxText="512"
                CssClass="kpms-textarea" EnableTheming="false" activestatus="(23.提出项目立项申请)(3.修改立项申请)"
                Field="ProjectAim" TableName="EPMS_DProjectInfoForm"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            申请部门
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtApplyDeptName" runat="server" TableName="EPMS_DProjectInfoForm"
                Field="HostDeptName" activestatus="(23.提出项目立项申请)" class="kpms-textbox" readonly="readonly">
            </zhongsoft:XHtmlInputText>
            <input id="hiApplyDeptID" type="hidden" runat="server" tablename="EPMS_DProjectInfoForm"
                field="HostDeptID" />
        </td>
        <td class="td-l">
            申请人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtApplyUserName" runat="server" TableName="EPMS_DProjectInfoForm"
                Field="ApplyUserName" activestatus="(23.提出项目立项申请)" class="kpms-textbox" readonly="readonly">
            </zhongsoft:XHtmlInputText>
            <input id="hiApplyUserID" type="hidden" runat="server" tablename="EPMS_DProjectInfoForm"
                field="ApplyUserID" />
        </td>
        <td class="td-l">
            联系方式
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtApplyUserPhone" runat="server" TableName="EPMS_DProjectInfoForm"
                Field="ApplyUserPhone" activestatus="(23.提出项目立项申请)" class="kpms-textbox" readonly="readonly">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            申请日期<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtApplyDate" runat="server" TableName="EPMS_DProjectInfoForm"
                Field="ApplyDate" activestatus="(23.提出项目立项申请)" req="1" class="kpms-textbox-date"
                readonly="readonly">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
            计划开始日期<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtPlanStartDate" runat="server" TableName="EPMS_DProjectInfoForm"
                Field="PlanStartDate" activestatus="(23.提出项目立项申请)" req="1" class="kpms-textbox-date"
                readonly="readonly">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
            计划结束日期<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtPlanCompleteDate" runat="server" TableName="EPMS_DProjectInfoForm"
                Field="PlanCompleteDate" activestatus="(23.提出项目立项申请)" req="1" class="kpms-textbox-date"
                readonly="readonly">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            是否替代<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <asp:RadioButtonList runat="server" ID="rdoIsreplace" field="IsReplace" onclick="return IsReplace();"
                req="1" RepeatDirection="Horizontal" tablename="EPMS_DProjectInfoForm" activestatus="(23.提出项目立项申请)(3.修改立项申请)">
                <asp:ListItem Text="是" Value="1"></asp:ListItem>
                <asp:ListItem Text="否" Value="0" Selected="True"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
        <td class="td-m" colspan="4">
        </td>
    </tr>
    <tr id="ReplaceProject">
        <td class="td-l">
            替代项目名称
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtReplaceProject" IsMutiple="false"
                field="RDProjectName" tablename="EPMS_DProjectInfoForm" SelectPageMode="Dialog"
                ResultForControls="{'hiReplaceProjectId':'id','txtReplaceProjectCode':'ProjectCode'}"
                PageWidth="850" Text="选择项目" PageUrl="~/EPMS/Obsolete/DesignProjectSelector.aspx"
                ShowJsonRowColName="true" ResultAttr="name" activestatus="(23.提出项目立项申请)(3.修改立项申请)"
                AfterSelect="afterSelect()" />
            <input type="hidden" id="hiReplaceProjectId" name="hiReplaceProjectId" runat="server"
                field="RDProjectId" tablename="EPMS_DProjectInfoForm" />
        </td>
        <td class="td-l">
            替代项目编号
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="txtReplaceProjectCode" runat="server" MaxLength="128"
                activestatus="(23.提出项目立项申请)" field="RDProjectCode" tablename="EPMS_DProjectInfoForm"
                ReadOnly="true" />
        </td>
    </tr>
</table>
<!--主键-->
<input type="hidden" id="hiDProjectInfoId" name="hiDProjectInfoId" runat="server"
    field="DProjectInfoId" tablename="EPMS_DProjectInfoForm" />
<input runat="server" id="hiZHSpeCode" type="hidden" value="A" />
<input runat="server" id="hiZHSpeName" type="hidden" value="综合" />
<script>
    function initCustomerPlugin() {
        IsReplace();
    }

    //选择校核人的筛选条件
    function managerFilter() {
        return { Rank: "副总工程师" };
    }

    //是否替代
    function IsReplace() {
        var isSubProject = $("#<%=rdoIsreplace.ClientID %> input[type=radio]:checked").val();
        if (isSubProject == "1") {
            $("#ReplaceProject").show();
        }
        else {
            $("#ReplaceProject").hide();
        }
    }
</script>
