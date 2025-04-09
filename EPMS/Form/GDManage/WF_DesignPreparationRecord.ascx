<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_DesignPreparationRecord.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.Form.GDManage.WF_DesignPreparationRecord" %>
<table class="tz-table">
    <tr>
        <td class="td-l">工程名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsProjectName" IsMutiple="false" req="1"
                SelectPageMode="Dialog" ResultForControls="{'hiOrganizationID':'id'}" AfterSelect="afterSelect()"
                EnableTheming="false" Text="选择项目" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                PageWidth="850" ShowJsonRowColName="true" ResultAttr="name" TableName="EPMS_DesignPreparationRecord" Field="ProjectName"
                activestatus="(23.填写设计交底准备记录)" />
            <input type="hidden" id="hiOrganizationID" name="hiOrganizationID" runat="server" tablename="EPMS_DesignPreparationRecord" field="OrganizationID" />
            <asp:LinkButton runat="server" ID="btnBind" OnClick="btnBind_OnClick" Visible="false" />
        </td>
        <td class="td-l">
            预计交底时间<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox-date" req="1" ID="txtExpectedTime" runat="server" readonly="readonly" TableName="EPMS_DesignPreparationRecord" Field="ExpectedTime" activestatus="(23.填写设计交底准备记录)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">填写人</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtWriteUserName" readonly="readonly" class="kpms-textbox" runat="server" MaxText="8" TableName="EPMS_DesignPreparationRecord" Field="WriteUserName" activestatus="(23.填写设计交底准备记录)" />
            <input type="hidden" id="hiWriteUserId" name="hiWriteUserId" runat="server" tablename="EPMS_DesignPreparationRecord" field="WriteUserId" />
        </td>
        <td class="td-l">专工</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtZGUserName" readonly="readonly" class="kpms-textbox" runat="server" MaxText="256" TableName="EPMS_DesignPreparationRecord" Field="ZGUserName" activestatus="(23.填写设计交底准备记录)" />
            <input type="hidden" id="hiZGUserID" name="hiZGUserID" runat="server" tablename="EPMS_DesignPreparationRecord" field="ZGUserID" />
        </td>
        <td class="td-l">批准日期</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtApproveDate" runat="server" readonly="readonly" TableName="EPMS_DesignPreparationRecord" Field="ApproveDate" activestatus="(3.审批)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">主要交底内容<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbMainContent" runat="server" MaxText="2048" CssClass="kpms-textarea" Height="150px" EnableTheming="False" TextMode="MultiLine" TableName="EPMS_DesignPreparationRecord" Field="MainContent" activestatus="(23.填写设计交底准备记录)" req="1" />
        </td>
    </tr>
</table>
<input type="hidden" id="hiDesignPreparationRecordID" name="hiDesignPreparationRecordID" runat="server" tablename="EPMS_DesignPreparationRecord" field="DesignPreparationRecordID" />

<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
    }

    function afterSelect() {
        <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.btnBind, "")%>;
    }
</script>
