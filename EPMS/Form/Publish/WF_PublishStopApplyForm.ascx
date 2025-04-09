<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_PublishStopApplyForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.Publish.WF_PublishStopApplyForm" %>
<%@ Import Namespace="DAL.EPMS" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">
            项目名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" SourceMode="SelectorPage"
                IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                PageWidth="850" EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode'}"
                TableName="EPMS_PublishStopApplyForm" Field="ProjectName" activestatus="(2.填写终止申请)"
                req="1" OnClick="txtProjectName_Click"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiOrganizationID" tablename="EPMS_PublishStopApplyForm"
                field="OrganizationID" />
        </td>
        <td class="td-l">
            项目编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" activestatus="(2.填写终止申请)"
                readonly="readonly" class="kpms-textbox" TableName="EPMS_PublishStopApplyForm"
                Field="ProjectCode" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            申请部门
        </td>
        <td class="td-r">
            <input type="hidden" runat="server" id="hiApplyDeptID" tablename="EPMS_PublishStopApplyForm"
                field="ApplyDeptID" />
            <zhongsoft:XHtmlInputText runat="server" ID="txtApplyDeptName" tablename="EPMS_PublishStopApplyForm"
                field="ApplyDeptName" activestatus="(2.填写终止申请)" readonly="readonly" class="kpms-textbox" />
        </td>
        <td class="td-l">
            专业
        </td>
        <td class="td-r">
            <input type="hidden" runat="server" id="hiApplySpecialtyName" tablename="EPMS_PublishStopApplyForm"
                field="ApplySpecialtyName" />
            <zhongsoft:LightDropDownList runat="server" ID="ddlApplySpecialty" tablename="EPMS_PublishStopApplyForm"
                field="ApplySpecialtyID" activestatus="(2.填写终止申请)">
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-m" colspan="2">
        </td>
    </tr>
    <tr>
        <td class="td-l">
            卷册名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtWBSName" SourceMode="SelectorPage"
                IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/WBSSelector.aspx"
                ResultForControls="{'hiWBSID':'id','txtWBSCode':'WBSCode','ddlApplySpecialty':'ExecSpecialtyID','hiApplySpecialtyName':'ExecSpecialtyName'}"
                activestatus="(2.填写终止申请)" tablename="EPMS_PublishStopApplyForm" field="WBSName"
                BeforeSelect="beforeSelectWbs()" FilterFunction="wbsFilter()" req="1" OnClick="txtWBSName_Click">
            </zhongsoft:LightObjectSelector>
            <%--OnClick="txtWBSName_Click"--%>
            <input type="hidden" runat="server" id="hiWBSID" tablename="EPMS_PublishStopApplyForm"
                field="WBSID" />
        </td>
        <td class="td-l">
            卷册编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtWBSCode" activestatus="(2.填写终止申请)"
                tablename="EPMS_PublishStopApplyForm" field="WBSCode" readonly="readonly" class="kpms-textbox" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            相关流程
        </td>
        <td class="td-m" colspan="5">
            <span runat="server" displaystatus="(13.*)"><a class="aStyle" onclick="viewVerify()">
                校审流程</a> <a class="aStyle" onclick="viewPublish()">出版流程</a></span>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            申请人<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtApplyUserName" activestatus="(23.填写终止申请)"
                tablename="EPMS_PublishStopApplyForm" field="ApplyUserName" readonly="readonly"
                class="kpms-textbox" />
            <input type="hidden" runat="server" id="hiApplyUserCode" tablename="EPMS_PublishStopApplyForm"
                field="ApplyUserCode" />
            <input type="hidden" runat="server" id="hiApplyUserID" tablename="EPMS_PublishStopApplyForm"
                field="ApplyUserID" />
        </td>
        <td class="td-l">
            申请时间<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText runat="server" ID="txtApplyDate" tablename="EPMS_PublishStopApplyForm"
                field="ApplyDate" activestatus="(23.填写终止申请)" readonly="readonly" class="kpms-textbox-date">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            批准人<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtApproveUserName" activestatus="(23.审批)"
                tablename="EPMS_PublishStopApplyForm" field="ApproveUserName" readonly="readonly"
                class="kpms-textbox" />
            <input type="hidden" runat="server" id="hiApproveUserID" tablename="EPMS_PublishStopApplyForm"
                field="ApproveUserID" />
        </td>
        <td class="td-l">
            批准时间<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtApproveDate" tablename="EPMS_PublishStopApplyForm"
                field="ApproveDate" activestatus="(23.审批)" readonly="readonly" class="kpms-textbox-date">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
            是否同意<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <asp:RadioButtonList ID="rblIsAgree" runat="server" RepeatDirection="Horizontal"
                req="1" tablename="EPMS_PublishStopApplyForm" field="IsAgree" activestatus="(23.审批)">
                <asp:ListItem Value="1">是</asp:ListItem>
                <asp:ListItem Value="0">否</asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            终止理由
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbStopReason" TextMode="MultiLine" EnableTheming="false"
                CssClass="kpms-textarea" TableName="EPMS_PublishStopApplyForm" Field="StopReason"
                activestatus="(23.填写终止申请)"></zhongsoft:LightTextBox>
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiPublishStopApplyFormID" tablename="EPMS_PublishStopApplyForm"
    field="PublishStopApplyFormID" />
<!-- 状态-->
<input type="hidden" runat="server" id="hiState" tablename="EPMS_PublishStopApplyForm"
    field="State" value="未批准" />
<!--校审流程的业务ID、流程ID、表单ID、表单名称、包名称、XpdlID-->
<input type="hidden" runat="server" id="hiVerifyID" />
<input type="hidden" runat="server" id="hiVerifyPID" />
<input type="hidden" runat="server" id="hiVerifyFID" />
<input type="hidden" runat="server" id="hiVerifyFName" />
<input type="hidden" runat="server" id="hiVerifyPName" />
<input type="hidden" runat="server" id="hiVerifyXpdlId" />
<!--出版流程的业务ID、流程ID、表单ID、表单名称、包名称、XpdlID-->
<input type="hidden" runat="server" id="hiPublishID" />
<input type="hidden" runat="server" id="hiPublishPID" />
<input type="hidden" runat="server" id="hiPublishFID" />
<input type="hidden" runat="server" id="hiPublishFName" />
<input type="hidden" runat="server" id="hiPublishPName" />
<input type="hidden" runat="server" id="hiPublishXpdlId" />
<!-- 出版中心部门ID-->
<input type="hidden" runat="server" id="hiPublishCenterID" value="9F585658-1DB9-4B3D-817B-A8BA89D15706" />
<script>

    //选择任务之前的逻辑判断
    function beforeSelectWbs() {
        var orgId = $('#<%=hiOrganizationID.ClientID %>').val();
        if (orgId == '' || orgId == undefined) {
            alert('请先选择项目，再选择卷册！');
            return false;
        }
        return true;
    }

    //选择任务的筛选条件
    function wbsFilter() {
        var orgId = $('#<%=hiOrganizationID.ClientID %>').val();
        var ownerId = '<%=KPMSUser.Id %>';
        return { OrganizationID: orgId, WBSType: '<%=WBSMode.任务管理.GetHashCode() %>', OwnerId: ownerId, IsShowMore: 1 };
    }

    function viewVerify() {
        var formId = $('#<%=hiVerifyFID.ClientID %>').val();
        var processId = $('#<%=hiVerifyPID.ClientID %>').val();
        if (formId == '' && processId == '') {
            alert('没有对应的流程信息');
            return;
        }
        url = "<%=WebAppPath %>/Sys/Workflow/FormDetail.aspx?actionType=1&FormID=" + formId + "&prcinstid=" + processId;
        window.open(url, '_blank');
        return false;
    }

    function viewPublish() {
        var formId = $('#<%=hiPublishFID.ClientID %>').val();
        var processId = $('#<%=hiPublishPID.ClientID %>').val();
        if (formId == '' && processId == '') {
            alert('没有对应的流程信息');
            return;
        }
        url = "<%=WebAppPath %>/Sys/Workflow/FormDetail.aspx?actionType=1&FormID=" + formId + "&prcinstid=" + processId;
        window.open(url, '_blank');
        return false;
    }
</script>
