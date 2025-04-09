<%@ Page Title="项目标识修改编辑" Language="C#" AutoEventWireup="true" CodeBehind="ProjectFlagInfoEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Project.ProjectFlagInfoEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                项目名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" SourceMode="SelectorPage"
                    IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                    PageWidth="850" EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                    ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode','txtPhaseName':'PhaseName','txtProjectType':'ProjectType','txtProjectScale':'ProjectScale'}"
                    TableName="EPMS_ProjectModifyInfo" Field="ProjectName" activestatus="(2.*)" req="1"
                    OnClick="txtProjectName_Click"></zhongsoft:LightObjectSelector>
                <input id="hiOrganizationID" type="hidden" runat="server" tablename="EPMS_ProjectModifyInfo"
                    field="OrganizationID" />
            </td>
            <td class="td-l">
                项目编号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" activestatus="(2.*)"
                    readonly="readonly" class="kpms-textbox" TableName="EPMS_ProjectModifyInfo" Field="ProjectCode" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                设计规模
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtProjectScale" readonly="readonly"
                    class="kpms-textbox" activestatus="(2.*)">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                工程类别
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtProjectType" readonly="readonly"
                    class="kpms-textbox" activestatus="(2.*)">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                设计阶段
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtPhaseName" readonly="readonly" class="kpms-textbox"
                    activestatus="(2.*)">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                是否简单工程<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rblIsSimple" RepeatDirection="Horizontal"
                    TableName="EPMS_ProjectModifyInfo" Field="IsSimple" activestatus="(23.*)" req="1">
                    <asp:ListItem Value="1">是</asp:ListItem>
                    <asp:ListItem Value="0">否</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="td-l">
                修改人
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtModifyUserName" runat="server" TableName="EPMS_ProjectModifyInfo"
                    Field="ModifyUserName" activestatus="(2.*)" class="kpms-textbox-short" readonly="readonly">
                </zhongsoft:XHtmlInputText>
                <input id="hiModifyUserId" type="hidden" runat="server" tablename="EPMS_ProjectModifyInfo"
                    field="ModifyUserId" />
                <input id="hiModifyDeptId" type="hidden" runat="server" tablename="EPMS_ProjectModifyInfo"
                    field="ModifyDeptId" />
                <input id="hiModifyDeptName" type="hidden" runat="server" tablename="EPMS_ProjectModifyInfo"
                    field="ModifyDeptName" />
            </td>
            <td class="td-l">
                修改日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtModifyDate" readonly="readonly"
                    class="kpms-textbox-date" activestatus="(23.?)" />
                <input id="hiModifyDate" type="hidden" runat="server" tablename="EPMS_ProjectModifyInfo"
                    field="ModifyDate" />
            </td>
        </tr>
    </table>
    <input id="hikeyID" type="hidden" tablename="EPMS_ProjectModifyInfo" field="KeyId"
        runat="server" />
    <input id="hiFlag" type="hidden" tablename="EPMS_ProjectModifyInfo" field="Flag"
        runat="server" value="1" />
</asp:Content>
