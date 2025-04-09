<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WBSProject.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.WBS.WBSProject" %>
<tr>
    <td class="td-l">
        项目名称<span class="req-star">*</span>
    </td>
    <td class="td-m" colspan="3">
        <%--<zhongsoft:XHtmlInputText runat="server" ID="txtProjectName" activestatus="(23.*)"
            readonly="readonly" class="kpms-textbox" TableName="EPMS_WBSSplitForm" Field="ProjectName"
            req="1" />--%>
        <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" SourceMode="SelectorPage"
            PageWidth="850" IsMutiple="true" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
            EnableTheming="false" SelectPageMode="Dialog" ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode'}"
            PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx" TableName="EPMS_WBSSplitForm"
            Field="ProjectName" activestatus="(23.*)" req="1"></zhongsoft:LightObjectSelector>
        <input type="hidden" runat="server" id="hiOrganizationID" tablename="EPMS_WBSSplitForm"
            field="OrganizationID" />
    </td>
    <td class="td-l">
        项目编号<span class="req-star">*</span>
    </td>
    <td class="td-r">
        <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" activestatus="(23.*)"
            readonly="readonly" class="kpms-textbox" TableName="EPMS_WBSSplitForm" Field="ProjectCode"
            req="1" />
    </td>
</tr>
<tr>
    <td class="td-l">
        模板名称
    </td>
    <td class="td-m" colspan="3">
        <zhongsoft:XHtmlInputText runat="server" ID="txtProjectTemplateName" activestatus="(23.*)"
            readonly="readonly" class="kpms-textbox" />
        <input type="hidden" runat="server" id="hiProjectTemplateID" />
    </td>
    <td class="td-l">
        项目阶段
    </td>
    <td class="td-r">
        <zhongsoft:XHtmlInputText runat="server" ID="txtPhase" activestatus="(23.*)" readonly="readonly"
            class="kpms-textbox" />
    </td>
</tr>
