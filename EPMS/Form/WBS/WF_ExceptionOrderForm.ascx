<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ExceptionOrderForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.WBS.WF_ExceptionOrderForm" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">
            申请书编号<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbApplyCode" runat="server" TableName="EPMS_ExceptionOrderInfo"
                Field="ApplyCode" req="1" activestatus="(23.例外转序申请)" MaxLength="32">
            </zhongsoft:LightTextBox>
        </td>
        <td class="td-l">
            申请人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtApplyUserName" runat="server" TableName="EPMS_ExceptionOrderInfo"
                Field="ApplyUserName" activestatus="(23.例外转序申请)" class="kpms-textbox-short" readonly="readonly">
            </zhongsoft:XHtmlInputText>
            <input id="hiApplyUserCode" type="hidden" runat="server" tablename="EPMS_ExceptionOrderInfo"
                field="ApplyUserCode" />
            <input id="hiApplyUserID" type="hidden" runat="server" tablename="EPMS_ExceptionOrderInfo"
                field="ApplyUserID" />
        </td>
        <td class="td-l">
            发起时间<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtApplyTime" runat="server" TableName="EPMS_ExceptionOrderInfo"
                req="1" Field="ApplyTime" activestatus="(23.例外转序申请)" class="kpms-textbox-date"
                readonly="readonly">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            项目名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsSelectProjectName" req="1" IsMutiple="false"
                SelectPageMode="Dialog" ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode','txtProjectScale':'ProjectScale','txtPhaseName':'PhaseName','txtManagerUserName':'ManagerUserName'}"
                EnableTheming="false" Text="选择项目名称" OnClick="lbsSelectProjectName_Click" PageWidth="850"
                PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx" ShowJsonRowColName="true"
                ResultAttr="name" activestatus="(23.例外转序申请)" field="ProjectName" tablename="EPMS_ExceptionOrderInfo" />
            <input type="hidden" id="hiOrganizationId" name="hiOrganizationId" runat="server"
                field="OrganizationId" tablename="EPMS_ExceptionOrderInfo" />
        </td>
        <td class="td-l">
            项目编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" activestatus="(23.例外转序申请)"
                class="kpms-textbox" readonly="readonly" field="ProjectCode" tablename="EPMS_ExceptionOrderInfo" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            设计阶段
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtPhaseName" class="kpms-textbox" readonly="readonly"
                activestatus="(23.例外转序申请)" />
        </td>
        <td class="td-l">
            项目规模
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProjectScale" class="kpms-textbox"
                readonly="readonly" activestatus="(23.例外转序申请)" />
        </td>
        <td class="td-l">
            项目设总
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtManagerUserName" class="kpms-textbox"
                readonly="readonly" activestatus="(23.例外转序申请)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            专业<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlSpecialtyID" runat="server" activestatus="(23.例外转序申请)"
                req="1" OnSelectedIndexChanged="ddlSpecialtyID_SelectedIndexChanged" AutoPostBack="true">
            </zhongsoft:LightDropDownList>
            <input type="hidden" id="hiSpecialtyID" runat="server" field="SpecialtyID" tablename="EPMS_ExceptionOrderInfo" />
            <input type="hidden" runat="server" id="hiSpecialtyName" field="SpecialtyName" tablename="EPMS_ExceptionOrderInfo" />
        </td>
        <td class="td-l">
            部门
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtSpeDept" class="kpms-textbox" readonly="readonly"
                activestatus="(23.例外转序申请)" />
        </td>
        <td class="td-l">
            主设人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtSpeZSR" class="kpms-textbox" readonly="readonly"
                activestatus="(23.例外转序申请)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            例外转序原因及其假定条件
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbApplyReason" TableName="EPMS_ExceptionOrderInfo"
                Field="ApplyReason" activestatus="(23.例外转序申请)" CssClass="kpms-textarea" EnableTheming="false"
                TextMode="MultiLine" Rows="3" MaxLength="1024"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            备注
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbApplyMemo" TableName="EPMS_ExceptionOrderInfo"
                Field="ApplyMemo" activestatus="(23.例外转序申请)" CssClass="kpms-textarea" EnableTheming="false"
                TextMode="MultiLine" Rows="3" MaxLength="1024"></zhongsoft:LightTextBox>
        </td>
    </tr>
</table>
<%--主键id--%>
<input type="hidden" id="hiExceptionOrderID" runat="server" tablename="EPMS_ExceptionOrderInfo"
    field="ExceptionOrderID" />
<%-- 是否正在追回:0代表正在追回，1代表未追回或已追回完毕--%>
<input type="hidden" id="hiIsRecover" runat="server" tablename="EPMS_ExceptionOrderInfo"
    field="IsRecover" value="1" />
