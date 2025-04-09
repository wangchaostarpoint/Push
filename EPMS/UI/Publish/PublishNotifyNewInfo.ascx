<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PublishNotifyNewInfo.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Publish.PublishNotifyNewInfo" %>
<%@ Register Src="~/EPMS/UI/Publish/PublishNotifyNumInfo.ascx" TagName="PublishNotifyNumInfo"
    TagPrefix="uc1" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">
            项目名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" req="1" IsMutiple="false"
                SelectPageMode="Dialog" ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode','txtPhaseName':'PhaseName','txtManagerUserName':'ManagerUserName','hiManagerUserID':'ManagerUserID'}"
                EnableTheming="false" Text="选择项目" PageWidth="850"
                PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx" ShowJsonRowColName="true"
                OnClick="txtProjectName_Click" field="ProjectName" tablename="EPMS_PublishNotify"
                ResultAttr="name" activestatus="(2.*)(2.编写勘测设计成品发送单)" />
            <input type="hidden" id="hiOrganizationId" name="hiOrganizationId" runat="server"
                field="OrganizationId" tablename="EPMS_PublishNotify" />
            <asp:LinkButton runat="server" ID="btnBind" OnClick="btnBind_Click" Visible="false"></asp:LinkButton>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            工程检索号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" activestatus="(23.*)(23.编写勘测设计成品发送单)"
                class="kpms-textbox" readonly="readonly" field="ProjectCode" tablename="EPMS_PublishNotify" />
        </td>
        <td class="td-l">
            设计阶段
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtPhaseName" activestatus="(23.*)(23.编写勘测设计成品发送单)"
                class="kpms-textbox" readonly="readonly" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            设总
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtManagerUserName" activestatus="(23.*)(23.编写勘测设计成品发送单)"
                class="kpms-textbox" readonly="readonly" field="ManagerUserName" tablename="EPMS_PublishNotify" />
            <input type="hidden" runat="server" id="hiManagerUserID" field="ManagerUserID" tablename="EPMS_PublishNotify" />
        </td>
        <td class="td-l">
            发起日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtCreateDate" runat="server" activestatus="(23.*)(23.编写勘测设计成品发送单)"
                class="kpms-textbox-date" readonly="readonly" field="CreateDate" tablename="EPMS_PublishNotify">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" id="hiStartUserID" name="hiStartUserID" runat="server" field="StartUserID"
                tablename="EPMS_PublishNotify" />
            <input type="hidden" id="hiStartUserName" name="hiStartUserName" runat="server" field="StartUserName"
                tablename="EPMS_PublishNotify" />
        </td>
    </tr>
    <tr>
        <uc1:PublishNotifyNumInfo ID="PublishNotifyNumInfo" runat="server" />
    </tr>
</table>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">
            备注
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbMemo" CssClass="kpms-textarea" EnableTheming="false"
                activestatus="(23.*)(23.编写勘测设计成品发送单)" TextMode="MultiLine" maxtext="1024" Rows="4"
                field="Memo" tablename="EPMS_PublishNotify">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l" rowspan="3">
            业主信息
        </td>
        <td class="td-l">
            业主单位
        </td>
        <td class="td-m" colspan="2">
            <zhongsoft:XHtmlInputText runat="server" ID="txtCustomer" activestatus="(23.*)(23.编写勘测设计成品发送单)"
                class="kpms-textbox" readonly="readonly" />
        </td>
        <td class="td-l">
            联系人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtContactPerson" activestatus="(23.*)(23.编写勘测设计成品发送单)"
                class="kpms-textbox" readonly="readonly" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            联系地址
        </td>
        <td class="td-m" colspan="2">
            <zhongsoft:XHtmlInputText runat="server" ID="txtAddress" activestatus="(23.*)(23.编写勘测设计成品发送单)"
                class="kpms-textbox" readonly="readonly" />
        </td>
        <td class="td-l">
            E-Mail地址
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtMail" activestatus="(23.*)(23.编写勘测设计成品发送单)"
                class="kpms-textbox" readonly="readonly" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            邮政编码
        </td>
        <td class="td-m" colspan="2">
            <zhongsoft:XHtmlInputText runat="server" ID="txtPostCode" activestatus="(23.*)(23.编写勘测设计成品发送单)"
                class="kpms-textbox" readonly="readonly" />
        </td>
        <td class="td-l">
            联系电话
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtPhone" activestatus="(23.*)(23.编写勘测设计成品发送单)"
                class="kpms-textbox" readonly="readonly" />
        </td>
    </tr>
</table>
<%--主键id--%>
<input type="hidden" id="hiPublishNotifyID" runat="server" tablename="EPMS_PublishNotify"
    field="PublishNotifyID" />
<input type="hidden" id="hiFlag" runat="server" tablename="EPMS_PublishNotify" field="Flag" />
<script type="text/javascript">
    function afterSelect() { 
        <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.btnBind, "")%>;
    }
</script>
