<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ProjUserExceptionForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.OBS.WF_ProjUserExceptionForm" %>
<%@ Register Src="../../UI/Project/ProjectCommon.ascx" TagName="ProjectCommon" TagPrefix="uc1" %>
<table class="tz-table" width="100%">
    <uc1:ProjectCommon ID="ProjectCommon1" runat="server" />
    <tr>
        <td colspan="6" class="td-m flexible">
            破格人员信息
        </td>
    </tr>
    <tr>
        <td class="td-l" nowrap="nowrap">
            拟破格人<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtExceptionUserName" IsMutiple="false"
                req="1" activestatus="(2.*)" SourceMode="SelectorPage" ShowJsonRowColName="true"
                PageWidth="850" OnClick="txtExceptionUserName_Click" DoCancel="true" ResultAttr="name"
                ShowAttrs="name,UserCode" ResultForControls="{'hiExceptionUserID':'id'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"
                field="ExceptionUserName" tablename="EPMS_ProjectUserException"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiExceptionUserID" field="ExceptionUserID"
                tablename="EPMS_ProjectUserException" />
        </td>
        <td class="td-l" nowrap="nowrap">
            学历
        </td>
        <td class="td-r">
            <asp:Label ID="lbDegree" runat="server"></asp:Label>
        </td>
        <td class="td-l" nowrap="nowrap">
            现任职务
        </td>
        <td class="td-r">
            <asp:Label ID="lbRANKNAME" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <tr style="display: none">
        <td class="td-l" nowrap="nowrap">
            学历
        </td>
        <td class="td-r">
            <asp:Label ID="lbEducation" runat="server"></asp:Label>
        </td>
        <td class="td-l" nowrap="nowrap">
            入职时间
        </td>
        <td class="td-r">
            <asp:Label ID="lbInNowGroupDate" runat="server"></asp:Label>
        </td>
        <td class="td-l" nowrap="nowrap">
            从事专业
        </td>
        <td class="td-r">
            <asp:Label ID="lbSpecialty" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="td-l" nowrap="nowrap">
            主要工作能力和业绩
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbAchievement" runat="server" TextMode="MultiLine" MaxText="512"
                CssClass="kpms-textarea" Width="96%" EnableTheming="false" ActiveStatus="(23.提出破格申请)(3.修改破格申请)"
                Field="Achievement" TableName="EPMS_ProjectUserException"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l" nowrap="nowrap">
            资格类型<span class="req-star">*</span>
        </td>
        <td class="td-m">
            <zhongsoft:LightDropDownList ID="ddlQualificationID" runat="server" ActiveStatus="(23.提出破格申请)(3.修改破格申请)"
                req="1" Field="QualificationID" TableName="EPMS_ProjectUserException" AutoPostBack="true"
                OnSelectedIndexChanged="ddlQualificationID_SelectedIndexChanged">
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l" nowrap="nowrap">
            生效日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtEffectiveDate" runat="server" type="text" class="kpms-textbox-date"
                ActiveStatus="(23.提出破格申请)(3.修改破格申请)" Field="EffectiveDate" TableName="EPMS_ProjectUserException"
                readonly="readonly" />
        </td>
        <td class="td-l" nowrap="nowrap">
            过期日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtExpireDate" runat="server" type="text" class="kpms-textbox-date"
                ActiveStatus="(23.提出破格申请)(3.修改破格申请)" Field="ExpireDate" TableName="EPMS_ProjectUserException"
                readonly="readonly" />
        </td>
    </tr>
    <tr runat="server" id="trSpe">
        <td class="td-l" nowrap="nowrap" style="display: none">
            专业类型<span class="req-star">*</span>
        </td>
        <td class="td-r" style="display: none">
            <zhongsoft:LightDropDownList ID="ddlParamSpecialtyTypeID" runat="server" ActiveStatus="(23.提出破格申请)(3.修改破格申请)"
                req="1" Field="ParamSpecialtyTypeID" TableName="EPMS_ProjectUserException">
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l" nowrap="nowrap">
            专业<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlSpecialty" field="ParamSpecialtyID"
                tablename="EPMS_ProjectUserException" activestatus="(23.提出破格申请)(3.修改破格申请)" EnableTheming="True"
                req="1">
            </zhongsoft:LightDropDownList>
            <input type="hidden" runat="server" id="hiSpecialtyName" tablename="EPMS_ProjectUserException"
                field="SpecialtyName" />
        </td>
        <td class="td-m" colspan="4">
        </td>
    </tr>
    <tr>
        <td class="td-l" nowrap="nowrap">
            破格原因
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbExceptionReason" runat="server" TextMode="MultiLine"
                MaxText="512" CssClass="kpms-textarea" Width="96%" EnableTheming="false" ActiveStatus="(23.提出破格申请)(3.修改破格申请)"
                Field="ExceptionReason" TableName="EPMS_ProjectUserException"></zhongsoft:LightTextBox>
        </td>
    </tr>
</table>
<!--主键 -->
<input type="hidden" id="hiProjectUserExceptionID" name="hiProjectUserExceptionID"
    runat="server" field="ProjectUserExceptionID" tablename="EPMS_ProjectUserException" />
<input type="hidden" id="hiOrganizationId" name="hiOrganizationId" runat="server"
    field="OrganizationID" tablename="EPMS_ProjectUserException" />
<input type="hidden" id="hiProjectCode" name="hiProjectCode" runat="server" field="ProjectCode"
    tablename="EPMS_ProjectUserException" />
<input type="hidden" id="hiProjectName" name="hiProjectName" runat="server" field="ProjectName"
    tablename="EPMS_ProjectUserException" />