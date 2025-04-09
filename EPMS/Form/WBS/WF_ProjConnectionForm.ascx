<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ProjConnectionForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.WBS.WF_ProjConnectionForm" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">
            工程联系单编号<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbProjConnectionCode" runat="server" TableName="EPMS_ProjConnectionBill"
                Field="ProjConnectionCode" req="1" activestatus="(23.登记、上传)" MaxLength="32">
            </zhongsoft:LightTextBox>
        </td>
        <td class="td-l">
            创建人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtConMakeUserName" runat="server" TableName="EPMS_ProjConnectionBill"
                Field="ConMakeUserName" activestatus="(23.登记、上传)" class="kpms-textbox-short"
                readonly="readonly">
            </zhongsoft:XHtmlInputText>
            <input id="hiConMakeUserCode" type="hidden" runat="server" tablename="EPMS_ProjConnectionBill"
                field="ConMakeUserCode" />
            <input id="hiConMakeUserId" type="hidden" runat="server" tablename="EPMS_ProjConnectionBill"
                field="ConMakeUserId" />
        </td>
        <td class="td-l">
            创建时间<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtConMakeUserTime" runat="server" TableName="EPMS_ProjConnectionBill"
                req="1" Field="ConMakeUserTime" activestatus="(23.登记、上传)" class="kpms-textbox-date"
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
                EnableTheming="false" Text="选择项目名称" PageWidth="850" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                ShowJsonRowColName="true" ResultAttr="name" activestatus="(23.登记、上传)" field="ProjectName"
                tablename="EPMS_ProjConnectionBill" OnClick="lbsSelectProjectName_Click" />
            <input type="hidden" id="hiOrganizationId" name="hiOrganizationId" runat="server"
                field="OrganizationId" tablename="EPMS_ProjConnectionBill" />
        </td>
        <td class="td-l">
            项目编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" activestatus="(23.登记、上传)"
                class="kpms-textbox" readonly="readonly" field="ProjectCode" tablename="EPMS_ProjConnectionBill" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            设计阶段
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtPhaseName" class="kpms-textbox" readonly="readonly"
                activestatus="(23.登记、上传)" />
        </td>
        <td class="td-l">
            项目规模
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProjectScale" class="kpms-textbox"
                readonly="readonly" activestatus="(23.登记、上传)" />
        </td>
        <td class="td-l">
            项目设总
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtManagerUserName" class="kpms-textbox"
                readonly="readonly" activestatus="(23.登记、上传)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            专业<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlSpecialtyID" runat="server" activestatus="(23.登记、上传)"
                req="1" OnSelectedIndexChanged="ddlSpecialtyID_SelectedIndexChanged" AutoPostBack="true">
            </zhongsoft:LightDropDownList>
            <input type="hidden" id="hiSpecialtyID" runat="server" field="SpecialtyID" tablename="EPMS_ProjConnectionBill" />
            <input type="hidden" runat="server" id="hiSpecialtyName" field="SpecialtyName" tablename="EPMS_ProjConnectionBill" />
        </td>
        <td class="td-l">
            部门
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtSpeDept" class="kpms-textbox" readonly="readonly"
                activestatus="(23.登记、上传)" />
        </td>
        <td class="td-l">
            工代
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtSpeZSR" class="kpms-textbox" readonly="readonly"
                activestatus="(23.登记、上传)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            联系原因
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbConReason" TableName="EPMS_ProjConnectionBill"
                Field="ConReason" activestatus="(23.登记、上传)" CssClass="kpms-textarea" EnableTheming="false"
                TextMode="MultiLine" Rows="3" MaxLength="1024"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            联系内容
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbConContent" TableName="EPMS_ProjConnectionBill"
                Field="ConContent" activestatus="(23.登记、上传)" CssClass="kpms-textarea" EnableTheming="false"
                TextMode="MultiLine" Rows="3" MaxLength="1024"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            回复或处理跟踪意见
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbConOpinion" TableName="EPMS_ProjConnectionBill"
                Field="ConOpinion" activestatus="(23.登记、上传)" CssClass="kpms-textarea" EnableTheming="false"
                TextMode="MultiLine" Rows="3" MaxLength="1024"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            备注
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbConMemo" TableName="EPMS_ProjConnectionBill"
                Field="ConMemo" activestatus="(23.登记、上传)" CssClass="kpms-textarea" EnableTheming="false"
                TextMode="MultiLine" Rows="3" MaxLength="1024"></zhongsoft:LightTextBox>
        </td>
    </tr>
</table>
<%--主键id--%>
<input type="hidden" id="hiProjConnectionID" runat="server" tablename="EPMS_ProjConnectionBill"
    field="ProjConnectionID" />
<%-- 是否正在回复:0代表正在回复，1代表未回复或已回复完毕--%>
<input type="hidden" id="hiIsRecover" runat="server" tablename="EPMS_ProjConnectionBill"
    field="IsRecover" value="1" />
