<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ExceptionOrderRecoverForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.WBS.WF_ExceptionOrderRecoverForm" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">
            原申请书编号<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtApplyCode" req="1" IsMutiple="false"
                SelectPageMode="Dialog" EnableTheming="false" Text="选择原申请书编号" AfterSelect="afterSelect()"
                ResultForControls="{'hiOrganizationID':'OrganizationID','txtProjectName':'ProjectName','txtProjectCode':'ProjectCode','txtSpecialtyName':'SpecialtyName','hiSpecialtyID':'SpecialtyID','hiExceptionOrderID':'id','tbRecoverContent':'RecoverContent','tbRecoverMemo':'RecoverMemo'}"
                FilterFunction="codeFilter()" PageUrl="~/EPMS/Obsolete/ExceptionOrderInfoSelector.aspx"
                ShowJsonRowColName="true" ResultAttr="name" activestatus="(2.填写追回单)" field="ApplyCode"
                tablename="EPMS_ExceptionOrderInfo" />
            <asp:LinkButton runat="server" ID="btnBind" OnClick="btnBind_Click" Visible="false"></asp:LinkButton>
        </td>
        <td class="td-l">
            追回人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtRecoverUseName" runat="server" TableName="EPMS_ExceptionOrderInfo"
                Field="RecoverUseName" activestatus="(23.填写追回单)" class="kpms-textbox-short" readonly="readonly">
            </zhongsoft:XHtmlInputText>
            <input id="hiRecoverUseCode" type="hidden" runat="server" tablename="EPMS_ExceptionOrderInfo"
                field="RecoverUseCode" />
            <input id="hiRecoverUserId" type="hidden" runat="server" tablename="EPMS_ExceptionOrderInfo"
                field="RecoverUserId" />
        </td>
        <td class="td-l">
            追回时间<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtRecoverUseTime" runat="server" TableName="EPMS_ExceptionOrderInfo"
                req="1" Field="RecoverUseTime" activestatus="(23.填写追回单)" class="kpms-textbox-date"
                readonly="readonly">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            项目名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProjectName" activestatus="(23.填写追回单)"
                class="kpms-textbox" readonly="readonly" field="ProjectName" tablename="EPMS_ExceptionOrderInfo" />
            <input type="hidden" id="hiOrganizationId" name="hiOrganizationId" runat="server"
                field="OrganizationId" tablename="EPMS_ExceptionOrderInfo" />
        </td>
        <td class="td-l">
            项目编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" activestatus="(23.填写追回单)"
                class="kpms-textbox" readonly="readonly" field="ProjectCode" tablename="EPMS_ExceptionOrderInfo" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            设计阶段
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtPhaseName" class="kpms-textbox" readonly="readonly"
                activestatus="(23.填写追回单)" />
        </td>
        <td class="td-l">
            项目规模
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProjectScale" class="kpms-textbox"
                readonly="readonly" activestatus="(23.填写追回单)" />
        </td>
        <td class="td-l">
            项目设总
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtManagerUserName" class="kpms-textbox"
                readonly="readonly" activestatus="(23.填写追回单)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            专业
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtSpecialtyName" activestatus="(23.填写追回单)"
                class="kpms-textbox" readonly="readonly" field="SpecialtyName" tablename="EPMS_ExceptionOrderInfo" />
            <input type="hidden" id="hiSpecialtyID" runat="server" field="SpecialtyID" tablename="EPMS_ExceptionOrderInfo" />
        </td>
        <td class="td-l">
            部门
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtSpeDept" class="kpms-textbox" readonly="readonly"
                activestatus="(23.填写追回单)" />
        </td>
        <td class="td-l">
            主设人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtSpeZSR" class="kpms-textbox" readonly="readonly"
                activestatus="(23.填写追回单)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            例外转序简况及真实资料核定
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbRecoverContent" TableName="EPMS_ExceptionOrderInfo"
                Field="RecoverContent" activestatus="(23.填写追回单)" CssClass="kpms-textarea" EnableTheming="false"
                TextMode="MultiLine" Rows="3" MaxLength="1024"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            备注
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbRecoverMemo" TableName="EPMS_ExceptionOrderInfo"
                Field="RecoverMemo" activestatus="(23.填写追回单)" CssClass="kpms-textarea" EnableTheming="false"
                TextMode="MultiLine" Rows="3" MaxLength="1024"></zhongsoft:LightTextBox>
        </td>
    </tr>
</table>
<%--主键id--%>
<input type="hidden" id="hiExceptionOrderID" runat="server" tablename="EPMS_ExceptionOrderInfo"
    field="ExceptionOrderID" />
<script type="text/javascript">
    //选择原申请书编号的筛选条件
    function codeFilter() {
        var userID = $('#<%=hiRecoverUserId.ClientID %>').val();

        return { UserID: userID };
    }

    function afterSelect() { 
        <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.btnBind, "")%>;
    }

</script>
