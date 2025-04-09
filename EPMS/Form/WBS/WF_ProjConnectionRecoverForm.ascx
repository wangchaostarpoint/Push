<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ProjConnectionRecoverForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.WBS.WF_ProjConnectionRecoverForm" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">
            原联系单编号<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtProjConnectionCode" req="1"
                IsMutiple="false" SelectPageMode="Dialog" EnableTheming="false" Text="选择原申请书编号"
                AfterSelect="afterSelect()" ResultForControls="{'hiOrganizationID':'OrganizationID','txtProjectName':'ProjectName','txtProjectCode':'ProjectCode','txtSpecialtyName':'SpecialtyName','hiSpecialtyID':'SpecialtyID','hiProjConnectionID':'id','tbRecoverReason':'RecoverReason','tbRecoverOpinion':'RecoverOpinion','tbRecoverMemo':'RecoverMemo'}"
                FilterFunction="codeFilter()" PageUrl="~/EPMS/Obsolete/ProjConnectionInfoSelector.aspx"
                ShowJsonRowColName="true" ResultAttr="name" activestatus="(2.登记、上传)" field="ProjConnectionCode"
                tablename="EPMS_ProjConnectionBill" />
            <asp:LinkButton runat="server" ID="btnBind" OnClick="btnBind_Click" Visible="false"></asp:LinkButton>
        </td>
        <td class="td-l">
            创建人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtRecoverApplyUserName" runat="server" TableName="EPMS_ProjConnectionBill"
                Field="RecoverApplyUserName" activestatus="(23.登记、上传)" class="kpms-textbox-short"
                readonly="readonly">
            </zhongsoft:XHtmlInputText>
            <input id="hiRecoverApplyUserCode" type="hidden" runat="server" tablename="EPMS_ProjConnectionBill"
                field="RecoverApplyUserCode" />
            <input id="hiRecoverApplyUserID" type="hidden" runat="server" tablename="EPMS_ProjConnectionBill"
                field="RecoverApplyUserID" />
        </td>
        <td class="td-l">
            创建时间<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtRecoverApplyTime" runat="server" TableName="EPMS_ProjConnectionBill"
                req="1" Field="RecoverApplyTime" activestatus="(23.登记、上传)" class="kpms-textbox-date"
                readonly="readonly">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            项目名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProjectName" activestatus="(23.登记、上传)"
                class="kpms-textbox" readonly="readonly" field="ProjectName" tablename="EPMS_ProjConnectionBill" />
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
            专业
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtSpecialtyName" activestatus="(23.登记、上传)"
                class="kpms-textbox" readonly="readonly" field="SpecialtyName" tablename="EPMS_ProjConnectionBill" />
            <input type="hidden" id="hiSpecialtyID" runat="server" field="SpecialtyID" tablename="EPMS_ProjConnectionBill" />
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
            修改原因
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbRecoverReason" TableName="EPMS_ProjConnectionBill"
                Field="RecoverReason" activestatus="(23.登记、上传)" CssClass="kpms-textarea" EnableTheming="false"
                TextMode="MultiLine" Rows="3" MaxLength="1024"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            回复或处理跟踪意见
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbRecoverOpinion" TableName="EPMS_ProjConnectionBill"
                Field="RecoverOpinion" activestatus="(23.登记、上传)" CssClass="kpms-textarea" EnableTheming="false"
                TextMode="MultiLine" Rows="3" MaxLength="1024"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            备注
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbRecoverMemo" TableName="EPMS_ProjConnectionBill"
                Field="RecoverMemo" activestatus="(23.登记、上传)" CssClass="kpms-textarea" EnableTheming="false"
                TextMode="MultiLine" Rows="3" MaxLength="1024"></zhongsoft:LightTextBox>
        </td>
    </tr>
</table>
<%--主键id--%>
<input type="hidden" id="hiProjConnectionID" runat="server" tablename="EPMS_ProjConnectionBill"
    field="ProjConnectionID" />
<script type="text/javascript">
//选择原联系单编号的筛选条件
    function codeFilter() {
        var userID = $('#<%=hiRecoverApplyUserID.ClientID %>').val();

        return { UserID: userID };
    }
    function afterSelect() { 
        <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.btnBind, "")%>;
    }

</script>
