<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ProjectToPublish.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.Project.WF_ProjectToPublish" %>
<table class="tz-table">
    <tr>
        <td colspan="6">
            <span class="req-star">审批通过后，该项目可以省去项目组成员配置、WBS任务分解、互提资料提交、卷册作业指导书、成品校审流程等生产流程，直接进行工程印制出版。
            </span>
        </td>
    </tr>
    <tr>
        <td class="td-l">项目名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsSelectProject" req="1" IsMutiple="false"
                SelectPageMode="Dialog" ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode','tbDesignSize':'ProjectScale','tbProjectTypeName':'ProjectType','tbPhaseName':'PhaseName','txtHostDeptName':'HostDeptName','tbDesignName':'ManagerUserName'}"
                EnableTheming="false" Text="选择项目" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx" Filter="{IsAllowGo:'0'}"
                PageWidth="850" ShowJsonRowColName="true" ResultAttr="name"
                activestatus="(23.放行申请)(3.修改放行申请)" />
        </td>
        <td class="td-l">项目编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" class="kpms-textbox" readonly="readonly"
                field="ProjectCode" tablename="EPMS_ProjectToPublishForm" activestatus="(23.放行申请)(3.修改放行申请)" />
            <input type="hidden" runat="server" id="hiOrganizationId" field="OrganizationId"
                tablename="EPMS_ProjectToPublishForm" />
        </td>
    </tr>
    <tr>
        <td class="td-l">项目类别
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="tbProjectTypeName" readonly="readonly" class="kpms-textbox"
                activestatus="(23.放行申请)(3.修改放行申请)" />
        </td>
        <td class="td-l">设计阶段
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="tbPhaseName" runat="server" readonly="readonly" class="kpms-textbox"
                activestatus="(23.放行申请)(3.修改放行申请)" />
        </td>
        <td class="td-l">设总
        </td>
        <td class="td-m">
            <zhongsoft:XHtmlInputText runat="server" ID="tbDesignName" class="kpms-textbox" readonly="readonly"
                style="width: 100px;" activestatus="(23.放行申请)(3.修改放行申请)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">设计规模
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:XHtmlInputText runat="server" ID="tbDesignSize" readonly="readonly" class="kpms-textbox"
                activestatus="(23.放行申请)(3.修改放行申请)" />
        </td>
        <td class="td-l" runat="server" visible="false">主办部门
        </td>
        <td class="td-m" colspan="3" runat="server" visible="false">
            <zhongsoft:XHtmlInputText ID="txtHostDeptName" runat="server" readonly="readonly" class="kpms-textbox"
                style="width: 80%" activestatus="(23.放行申请)(3.修改放行申请)" field="HostDeptName" tablename="EPMS_ProjectToPublishForm" />
            <input type="hidden" id="hiHostDeptID" runat="server" field="HostDeptID" tablename="EPMS_ProjectToPublishForm" />
        </td>

    </tr>
    <tr>
        <td class="td-l">申请人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtApplyUserName" field="ApplyUserName" tablename="EPMS_ProjectToPublishForm"
                readonly="readonly" class="kpms-textbox" activestatus="(23.放行申请)(3.修改放行申请)" style="width: 100px;" />
            <input type="hidden" runat="server" id="hiApplyUserID" field="ApplyUserID" tablename="EPMS_ProjectToPublishForm" />
        </td>
        <td class="td-l">申请部门
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtApplyUserDeptName" field="ApplyUserDeptName"
                tablename="EPMS_ProjectToPublishForm" readonly="readonly" class="kpms-textbox"
                activestatus="(23.放行申请)(3.修改放行申请)" />
            <input type="hidden" runat="server" id="hiApplyUserDeptID" field="ApplyUserDeptID"
                tablename="EPMS_ProjectToPublishForm" />
        </td>
        <td class="td-l">申请日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtApplyDate" field="ApplyDate" tablename="EPMS_ProjectToPublishForm"
                readonly="readonly" class="kpms-textbox-date" activestatus="(23.放行申请)(3.修改放行申请)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">放行申请理由<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbPublishReason" runat="server" TextMode="MultiLine" Rows="3" MaxLength="512"
                CssClass="kpms-textarea" EnableTheming="false" activestatus="(23.放行申请)(3.修改放行申请)"
                field="PublishReason" tablename="EPMS_ProjectToPublishForm" req="1"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">备注
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbRemark" runat="server" TextMode="MultiLine" Rows="3" MaxLength="512"
                CssClass="kpms-textarea" EnableTheming="false" activestatus="(23.放行申请)(3.修改放行申请)"
                field="Remark" tablename="EPMS_ProjectToPublishForm"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr class="tdIsAgree">
        <td class="td-l">是否同意<span class="req-star">*</span></td>
        <td class="td-r" colspan="5">
            <asp:RadioButtonList ID="rdIsAgree" runat="server" RepeatDirection="Horizontal" TableName="EPMS_ProjectToPublishForm" Field="IsAgree" activestatus="(23.部门负责人审批)(3.分管院领导审批)"></asp:RadioButtonList>
        </td>
    </tr>
</table>
<input type="hidden" id="hiProjectToPublishFormID" runat="server" field="ProjectToPublishFormID"
    tablename="EPMS_ProjectToPublishForm" />

<script type="text/javascript">
    function initCustomerPlugin() {
        if ($actName != "放行申请" && $actName != "修改放行申请") {
            $(".tdIsAgree").show();
            $("#<%=rdIsAgree.ClientID%>").attr("req", "1");

        } else {
            $(".tdIsAgree").hide();
            $("#<%=rdIsAgree.ClientID%>").removeAttr("req");
        }
    } 
</script>
