<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProjectTimeChangeInfo.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Project.ProjectTimeChangeInfo" %>
<%@ Register Src="../../UI/Project/ProjectCommon.ascx" TagName="ProjectCommon" TagPrefix="uc1" %>
<table class="tz-table" width="100%">
    <uc1:ProjectCommon ID="ucProjectCommon" runat="server" />
    <tr>
        <td class="td-l">
            设总
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtManagerUserName" activestatus="(23.*)(23.提出变更申请)"
                class="kpms-textbox" readonly="readonly" />
        </td>
        <td id="Td1" class="td-l" runat="server">
            提出人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtApplyUserName" runat="server" readonly="readonly"
                activestatus="(23.*)(23.提出变更申请)" class="kpms-textbox-short" field="ApplyUserName"
                tablename="EPMS_ProjectTimeChange" />
            <input id="hiApplyUserID" type="hidden" runat="server" field="ApplyUserID" tablename="EPMS_ProjectTimeChange" />
        </td>
        <td class="td-l">
            提出日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtApplyDate" runat="server" activestatus="(23.*)(23.提出变更申请)"
                class="kpms-textbox-date" readonly="readonly" field="ApplyDate" tablename="EPMS_ProjectTimeChange">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            项目简介
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbProjectContent" runat="server" MaxLength="128" activestatus="(23.?)(3.?)" />
        </td>
    </tr>
    <tr>
        <td class="td-l" rowspan="3">
            业主要求
        </td>
        <td class="td-l" style="width: 15%">
            进度要求
        </td>
        <td class="td-m" colspan="4">
            <zhongsoft:LightTextBox ID="tbRequireOfSchedule" runat="server" MaxLength="256" Field="RequireOfSchedule"
                TableName="EPMS_ProjectTimeChange" activestatus="(23.*)(23.提出变更申请)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            质量要求
        </td>
        <td class="td-m" colspan="4">
            <zhongsoft:LightTextBox ID="tbRequireOfQuality" runat="server" MaxLength="128" activestatus="(23.*)(23.提出变更申请)"
                Field="RequireOfQuality" TableName="EPMS_ProjectTimeChange" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            其他要求
        </td>
        <td class="td-m" colspan="4">
            <zhongsoft:LightTextBox ID="tbRequireOfOther" runat="server" MaxLength="128" activestatus="(23.*)(23.提出变更申请)"
                Field="RequireOfOther" TableName="EPMS_ProjectTimeChange" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            变更前<br />
            业主要求进度
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtOuterCompleteDate" activestatus="(23.?)(23.?)"
                class="kpms-textbox" readonly="readonly" field="OutCompDateOfOrig" tablename="EPMS_ProjectTimeChange" />
            <input type="hidden" runat="server" id="hiOutCompDateOfOrig" field="OutCompDateOfOrig"
                tablename="EPMS_ProjectTimeChange" />
        </td>
        <td class="td-l">
            变更前<br />
            院计划进度
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtInnerCompleteDate" activestatus="(23.?)(23.?)"
                class="kpms-textbox" readonly="readonly" field="InCompDateOfOrig" tablename="EPMS_ProjectTimeChange" />
            <input type="hidden" runat="server" id="hiInCompDateOfOrig" field="InCompDateOfOrig"
                tablename="EPMS_ProjectTimeChange" />
        </td>
        <td class="td-l">
        </td>
        <td class="td-r">
        </td>
    </tr>
    <tr>
        <td class="td-l" nowrap>
            变更后<br />
            业主要求进度<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtOutCompDateOfChanged" runat="server" activestatus="(23.*)(23.提出变更申请)"
                req="1" class="kpms-textbox-date" readonly="readonly" field="OutCompDateOfChanged"
                tablename="EPMS_ProjectTimeChange">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l" nowrap>
            变更后<br />
            院计划进度<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtInCompDateOfChanged" runat="server" activestatus="(23.*)(23.提出变更申请)"
                req="1" class="kpms-textbox-date" readonly="readonly" field="InCompDateOfChanged"
                tablename="EPMS_ProjectTimeChange">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
        </td>
        <td class="td-r">
        </td>
    </tr>
    <tr>
        <td class="td-l">
            变更原因<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbChangeReason" CssClass="kpms-textarea"
                EnableTheming="false" activestatus="(23.*)(23.提出变更申请)" TextMode="MultiLine" maxtext="1024"
                Rows="3" req="1" field="ChangeReason" tablename="EPMS_ProjectTimeChange">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            备注
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbMemo" CssClass="kpms-textarea" EnableTheming="false"
                activestatus="(23.*)(23.提出变更申请)" TextMode="MultiLine" maxtext="1024" Rows="4"
                field="Memo" tablename="EPMS_ProjectTimeChange">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
</table>
<input type="hidden" id="hiOrganizationId" name="hiOrganizationId" runat="server"
    field="OrganizationId" tablename="EPMS_ProjectTimeChange" />
<input type="hidden" id="hiProjectTimeChangeID" name="ProjectTimeChangeID" runat="server"
    field="ProjectTimeChangeID" tablename="EPMS_ProjectTimeChange" />
<input type="hidden" runat="server" id="hiFlag" tablename="EPMS_ProjectTimeChange"
    field="Flag" />
<%--<asp:LinkButton runat="server" ID="btnBind" OnClick="btnBind_Click" Visible="false"></asp:LinkButton>
--%><script>
 
</script>
