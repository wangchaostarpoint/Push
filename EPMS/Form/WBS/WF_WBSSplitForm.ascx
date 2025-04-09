<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_WBSSplitForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.WBS.WF_WBSSplitForm" %>
<%@ Register Src="../../UI/WBS/WBSOfSpecialtyList.ascx" TagName="WBSOfSpecialtyList"
    TagPrefix="uc2" %>
<%@ Register Src="../../UI/WBS/WBSTreeAndList.ascx" TagName="WBSTreeAndList" TagPrefix="uc1" %>
<%@ Import Namespace="DAL.EPMS" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">项目名称<span class="req-star">*</span>
        </td>
        <td class="td-m" style="width:50%;">
            <%--<zhongsoft:XHtmlInputText runat="server" ID="txtProjectName" activestatus="(23.*)"
            readonly="readonly" class="kpms-textbox" TableName="EPMS_WBSSplitForm" Field="ProjectName"
            req="1" />--%>
            <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" SourceMode="SelectorPage"
                IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                PageWidth="850" ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode','txtPhase':'PhaseName','hiProjectTemplateID':'ProjectTemplateID','hiPreTempID':'ProjectTemplateID','txtProjectTemplateName':'ProjectTemplateName','hiProjectTemplateName':'ProjectTemplateName','hiBusinessTypeID':'ParamBusinessTypeID','hiBusinessPlateID':'ParamBusinessPlateID','hiProjectFlag':'ProjectFlag'}"
                TableName="EPMS_WBSSplitForm" Field="ProjectName" activestatus="(2.确定主要卷册)(2.专业WBS任务分解)"
                req="1" OnClick="txtProjectName_Click"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiOrganizationID" tablename="EPMS_WBSSplitForm"
                field="OrganizationID" />
        </td>
        <td class="td-l">项目编号<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" activestatus="(2.确定主要卷册)(2.专业WBS任务分解)"
                readonly="readonly" class="kpms-textbox" TableName="EPMS_WBSSplitForm" Field="ProjectCode"
                req="1" />
        </td>
    </tr>
    <tr>
        <td class="td-l">模板名称
        </td>
        <td class="td-m">
            <zhongsoft:LightObjectSelector runat="server" ID="txtProjectTemplateName" SourceMode="SelectorPage"
                IsMutiple="false" ShowJsonRowColName="true" DoCancel="false" ResultAttr="name"
                EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/ProjectTemplateSelector.aspx"
                ResultForControls="{'hiProjectTemplateID':'id','hiProjectTemplateName':'name'}"
                AfterSelect="afterSelectProTemp()" FilterFunction="projTempFilter()" activestatus="(23.?)"></zhongsoft:LightObjectSelector>
            <asp:LinkButton runat="server" ID="btnAfterSelectTempalte" OnClick="btnAfterSelectTempalte_Click"
                Visible="false"></asp:LinkButton>
            <input type="hidden" runat="server" id="hiProjectTemplateID" tablename="EPMS_WBSSplitForm"
                field="ProjectTemplateID" />
            <input type="hidden" runat="server" id="hiPreTempID" />
            <input type="hidden" runat="server" id="hiProjectTemplateName" tablename="EPMS_WBSSplitForm"
                field="ProjectTemplateName" />
        </td>
        <td class="td-l">项目阶段
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtPhase" activestatus="(2.确定主要卷册)(2.专业WBS任务分解)"
                readonly="readonly" class="kpms-textbox" />
            <input type="hidden" runat="server" id="hiPhaseCode" />
        </td>
    </tr>
    <!-- WBS任务分解用户自定义控件-->
    <%--<uc2:WBSOfSpecialtyList ID="WBSGenerate" runat="server" />--%>
    <uc1:WBSTreeAndList ID="WBSList" runat="server" />
</table>
<!--主键-->
<input type="hidden" id="hiFormID" runat="server" tablename="EPMS_WBSSplitForm" field="WBSSplitFormID" />
<!-- 任务分解表单类型-->
<input type="hidden" runat="server" id="hiSplitType" tablename="EPMS_WBSSplitForm"
    field="WBSSplitType" />
<!-- 填写（编制\编写）人-->
<input type="hidden" runat="server" id="hiWriteUserID" tablename="EPMS_WBSSplitForm"
    field="WriteUserID" />
<input type="hidden" runat="server" id="hiWriteUserName" tablename="EPMS_WBSSplitForm"
    field="WriteUserName" />
<!-- 项目专业ID-->
<input type="hidden" runat="server" id="hiParamSpecialtyID" tablename="EPMS_WBSSplitForm"
    field="ParamSpecialtyID" />
<!-- 业务类型、业务板块-->
<input type="hidden" runat="server" id="hiBusinessTypeId" />
<input type="hidden" runat="server" id="hiBusinessPlateId" />
<%--项目标识--%>
<input type="hidden" runat="server" id="hiProjectFlag" />
<script type="text/javascript">
    function initCustomerPlugin() {
        initWBSList();
    }

    //选择项目模板筛选（业务类型、业务板块筛选）
    function projTempFilter() {
        return { 'BusinessTypeID': $('#<%=hiBusinessTypeId.ClientID %>').val(), 'BusinessPlateID': $('#<%=hiBusinessPlateId.ClientID %>').val() };
    }

    function afterSelectProTemp() {
         <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.btnAfterSelectTempalte, "")%>;
    }

</script>
