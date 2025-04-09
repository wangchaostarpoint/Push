<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_SurveyInnerTaskForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.Survey.WF_SurveyInnerTaskForm" %>
<table class="tz-table">
    <tr>
        <td class="td-l">
            任务编号
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:XHtmlInputText class="kpms-textbox" ID="txtTaskCode" runat="server" readonly="readonly"
                style="width: 200px" TableName="EPMS_SurveyInnerManage" Field="TaskCode" ActiveStatus="(23.提出任务)(3.修改任务)" />
        </td>
        <%-- <td class="td-m" colspan="4">
        </td>--%>
    </tr>
    <tr>
        <td class="td-l">
            项目名称<span class="req-star">*</span>
        </td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" SourceMode="SelectorPage"
                IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                PageWidth="850" EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                ResultForControls="{'hiProjectID':'id','txtProjectCode':'ProjectCode','txtPhaseName':'PhaseName'}"
                TableName="EPMS_SurveyInnerManage" Field="ProjectName" activestatus="(23.提出任务)(3.修改任务)"
                req="1" OnClick="txtProjectName_Click"></zhongsoft:LightObjectSelector>
            <input type="hidden" id="hiProjectID" runat="server" field="OrganizationID" tablename="EPMS_SurveyInnerManage" />
        </td>
        <td class="td-l">
            项目编号
        </td>
        <td>
            <zhongsoft:XHtmlInputText ID="txtProjectCode" runat="server" field="ProjectCode"
                readonly="readonly" tablename="EPMS_SurveyInnerManage" activestatus="(23.提出任务)(3.修改任务)"
                class="kpms-textbox" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            提出专业<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlSendSpecialtyID" tablename="EPMS_SurveyInnerManage"
                req="1" field="SendSpecialtyID" ActiveStatus="(2.提出任务)" onchange="InitRollInfo()">
            </zhongsoft:LightDropDownList>
            <input type="hidden" id="hiSendSpecialtyName" name="hiSendSpecialtyName" runat="server"
                tablename="EPMS_SurveyInnerManage" field="SendSpecialtyName" />
            <input type="hidden" id="hiSendSpecialtyCode" name="hiSendSpecialtyCode" runat="server"
                tablename="EPMS_SurveyInnerManage" field="SendSpecialtyCode" />
        </td>
        <td class="td-l">
            提出人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtSendUserName" runat="server" field="SendUserName"
                readonly="readonly" tablename="EPMS_SurveyInnerManage" activestatus="(23.提出任务)(3.修改任务)"
                class="kpms-textbox" />
            <input type="hidden" id="hiSendUserID" name="hiSendUserID" runat="server" tablename="EPMS_SurveyInnerManage"
                field="SendUserID" />
        </td>
        <td class="td-l">
            阶段名称
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtPhaseName" runat="server" field="PhaseName" readonly="readonly"
                tablename="EPMS_SurveyInnerManage" activestatus="(23.提出任务)(3.修改任务)" class="kpms-textbox" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            卷册名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtRollName" SourceMode="SelectorPage"
                IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/WBSSelector.aspx"
                ResultForControls="{'hiRollID':'id','txtRollCode':'WBSCode'}" activestatus="(23.提出任务)(3.修改任务)"
                BeforeSelect="beforeSelectWbs()" FilterFunction="wbsFilter()" tablename="EPMS_SurveyInnerManage"
                field="RollName" req="1"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiRollID" tablename="EPMS_SurveyInnerManage"
                field="RollID" />
        </td>
        <td class="td-l">
            卷册编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtRollCode" activestatus="(23.提出任务)(3.修改任务)"
                readonly="readonly" class="kpms-textbox" TableName="EPMS_SurveyInnerManage" Field="RollCode" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            任务要求
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbMemo" runat="server" MaxText="1024" TableName="EPMS_SurveyInnerManage"
                Field="Memo" ActiveStatus="(23.提出任务)(3.修改任务)" EnableTheming="false" CssClass="kpms-textarea"
                TextMode="MultiLine" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            接收任务专业<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlReceiveSpecialtyID" tablename="EPMS_SurveyInnerManage"
                req="1" field="ReceiveSpecialtyID" ActiveStatus="(2.提出任务)">
            </zhongsoft:LightDropDownList>
            <input type="hidden" id="hiReceiveSpecialtyName" name="hiReceiveSpecialtyName" runat="server"
                tablename="EPMS_SurveyInnerManage" field="ReceiveSpecialtyName" />
            <input type="hidden" id="hiReceiveSpecialtyCode" name="hiReceiveSpecialtyCode" runat="server"
                tablename="EPMS_SurveyInnerManage" field="ReceiveSpecialtyCode" />
        </td>
        <td class="td-l">
            任务提出日期
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtTaskSendDate" runat="server"
                readonly="readonly" TableName="EPMS_SurveyInnerManage" Field="TaskSendDate" ActiveStatus="(23.提出任务)(3.修改任务)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            接收人<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtReceiveUserName" field="ReceiveUserName"
                tablename="EPMS_SurveyInnerManage" activestatus="(3.接收分配任务)" SourceMode="SelectorPage"
                ResultAttr="name" EnableTheming="false" ResultForControls="{'hiReceiveUserID':'id'}"
                PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" req="1" FilterFunction="userFilter()">
            </zhongsoft:LightObjectSelector>
            <input type="hidden" id="hiReceiveUserID" name="hiReceiveUserID" runat="server" tablename="EPMS_SurveyInnerManage"
                field="ReceiveUserID" />
        </td>
        <td class="td-l">
            要求提资日期
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtMastSendDate" runat="server"
                readonly="readonly" TableName="EPMS_SurveyInnerManage" Field="MastSendDate" ActiveStatus="(23.提出任务)(3.修改任务)" />
        </td>
    </tr>
</table>
<input type="hidden" id="hiSurveyInnerID" name="hiSurveyInnerID" runat="server" tablename="EPMS_SurveyInnerManage"
    field="SurveyInnerID" />
<input type="hidden" id="hiFormType" name="hiFormType" runat="server" tablename="EPMS_SurveyInnerManage"
    field="FormType" value="0" />
<input type="hidden" id="hiTaskState" name="hiTaskState" runat="server" tablename="EPMS_SurveyInnerManage"
    field="TaskState" />
<input type="hidden" id="hiSpeName1" name="hiSpeName1" runat="server" value="物探" />
<input type="hidden" id="hiSpeDept1" name="hiSpeDept1" runat="server" value="勘测物探室" />
<input type="hidden" id="hiSpeName2" name="hiSpeName2" runat="server" value="试验" />
<input type="hidden" id="hiSpeDept2" name="hiSpeDept2" runat="server" value="勘测岩土室" />
<input type="hidden" id="hiSpeName3" name="hiSpeName3" runat="server" value="钻探" />
<input type="hidden" id="hiSpeDept3" name="hiSpeDept3" runat="server" value="勘测岩土施工处" />
<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
    }

    function InitRollInfo() {
        $("#<%=txtRollName.ClientID %>").next().val("");
        $("#<%=txtRollCode.ClientID %>").val("");
        $("#<%=hiRollID.ClientID %>").val("");
    }

    //选择任务之前的逻辑判断
    function beforeSelectWbs() {
        var orgId = $('#<%=hiProjectID.ClientID %>').val();
        var specialtyId = $("#<%=ddlSendSpecialtyID.ClientID %>").val();
        if (orgId == '' || orgId == undefined) {
            alert('请先选择项目，再选择卷册！');
            return false;
        }
        if (specialtyId == '' || specialtyId == undefined) {
            alert('请先选择提出专业，再选择卷册！');
            return false;
        }
        return true;
    }

    //选择任务的筛选条件
    function wbsFilter() {
        var orgId = $('#<%=hiProjectID.ClientID %>').val();
        var specialtyId = $("#<%=ddlSendSpecialtyID.ClientID %>").val();
        return { OrganizationID: orgId, WBSType: '<%= DAL.EPMS.WBSMode.任务管理.GetHashCode() %>', ExeSpecialtyID: specialtyId, IsShowMore: 1 };
    }

    //选择接收人的筛选条件
    function userFilter() {
        var orgId = $('#<%=hiProjectID.ClientID %>').val();
        var specialtyId = $("#<%=ddlReceiveSpecialtyID.ClientID %>").val();
        return { ProjectPhaseID: orgId, SpecialtyID: specialtyId };
    }
</script>
