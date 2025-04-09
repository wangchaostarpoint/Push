<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WBSSplitEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.WBS.WBSSplitEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    Title="分解WBS任务" %>

<%@ Register Src="../../UI/WBS/WBSTreeAndList.ascx" TagName="WBSTreeAndList" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">项目名称<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" SourceMode="SelectorPage"
                    IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                    PageWidth="850" EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                    ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode','txtPhase':'PhaseName','hiProjectTemplateID':'ProjectTemplateID','txtProjectTemplateName':'ProjectTemplateName','hiProjectTemplateName':'ProjectTemplateName','hiBusinessTypeID':'ParamBusinessTypeID','hiBusinessPlateID':'ParamBusinessPlateID'}"
                    TableName="EPMS_WBSSplitForm" Field="ProjectName" activestatus="(23.*)" ShowSelectBtn="false"
                    req="1"></zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiOrganizationID" tablename="EPMS_WBSSplitForm"
                    field="OrganizationID" />
            </td>
            <td class="td-l">项目编号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" activestatus="(23.*)"
                    readonly="readonly" class="kpms-textbox" TableName="EPMS_WBSSplitForm" Field="ProjectCode"
                    req="1" />
            </td>
        </tr>
        <tr>
            <td class="td-l">模板名称
            </td>
            <td class="td-m">
                <zhongsoft:LightObjectSelector runat="server" ID="txtProjectTemplateName" SourceMode="SelectorPage"
                    IsMutiple="true" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                    EnableTheming="false" SelectPageMode="Dialog" ResultForControls="{'hiProjectTemplateID':'id','hiProjectTemplateName':'name'}"
                    PageUrl="~/EPMS/Obsolete/ProjectTemplateSelector.aspx" activestatus="(23.*)" ShowSelectBtn="false"
                    FilterFunction="projTempFilter()"></zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiPreTempID" />
                <input type="hidden" runat="server" id="hiProjectTemplateID" />
                <input type="hidden" runat="server" id="hiProjectTemplateName" />
            </td>
            <td class="td-l">项目阶段
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtPhase" activestatus="(23.*)" readonly="readonly"
                    class="kpms-textbox" />
                <input type="hidden" runat="server" id="hiPhaseCode" />
            </td>
        </tr>
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
    <input type="hidden" runat="server" id="hiWBSSplitType" tablename="EPMS_WBSSplitForm"
        field="WBSSplitType" />
    <input type="hidden" runat="server" id="hiFlag" tablename="EPMS_WBSSplitForm"
        field="Flag" value="2" />
    <input type="hidden" runat="server" id="hiMemo" tablename="EPMS_WBSSplitForm"
        field="Memo" value="历史项目WBS维护" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            initWBSList();
        }

        //选择项目模板筛选（业务类型、业务板块筛选）
        function projTempFilter() {
            return { 'BusinessTypeID': $('#<%=hiBusinessTypeId.ClientID %>').val(), 'BusinessPlateID': $('#<%=hiBusinessPlateId.ClientID %>').val() };
        }
    </script>
</asp:Content>
