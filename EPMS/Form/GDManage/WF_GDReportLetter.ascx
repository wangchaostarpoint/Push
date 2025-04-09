<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_GDReportLetter.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.Form.GDManage.WF_GDReportLetter" %>
<table class="tz-table">
    <tr>
        <td class="td-l">工程名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsProjectName" IsMutiple="false" req="1"
                SelectPageMode="Dialog" ResultForControls="{'hiOrganizationID':'id','txtProjectPlace':'ProjectPlace'}" AfterSelect="afterSelect()"
                EnableTheming="false" Text="选择工程" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                PageWidth="850" ShowJsonRowColName="true" ResultAttr="name" TableName="EPMS_GDReportLetter" Field="ProjectName" ActiveStatus="(23.填写工代汇报信)" />
            <input type="hidden" id="hiOrganizationID" name="hiOrganizationID" runat="server" tablename="EPMS_GDReportLetter" field="OrganizationID" />
            <asp:LinkButton runat="server" ID="btnBind" OnClick="btnBind_OnClick" Visible="false" />
        </td>
        <td class="td-l">汇报时间</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtReportDate" runat="server" readonly="readonly" TableName="EPMS_GDReportLetter" Field="ReportDate" ActiveStatus="(23.填写工代汇报信)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">专业</td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlSpecialty" TableName="EPMS_GDReportLetter" Field="SpecialtyID" ActiveStatus="(23.填写工代汇报信)" />
            <input type="hidden" id="hiSpecialtyName" name="hiSpecialtyName" runat="server" tablename="EPMS_GDReportLetter" field="SpecialtyName" />
        </td>
        <td class="td-l">工地</td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox ID="tbPlace" runat="server" MaxText="256" TableName="EPMS_GDReportLetter" Field="Place" ActiveStatus="(23.填写工代汇报信)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">工代组长</td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsGDLeaderName" IsMutiple="true"
                SelectPageMode="Dialog" TableName="EPMS_GDReportLetter" Field="GDLeaderName" ActiveStatus="(23.填写工代汇报信)"
                SourceMode="SelectorPage" ShowJsonRowColName="true"
                DoCancel="true" ResultAttr="name" ShowAttrs="name,LoginId" ResultForControls="{'hiGDLeaderID':'id'}"
                PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx" PageWidth="850" />
            <input type="hidden" id="hiGDLeaderID" name="hiGDLeaderID" runat="server" tablename="EPMS_GDReportLetter" field="GDLeaderID" />
        </td>
        <td class="td-l">汇报人姓名</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtReportUserName" readonly="readonly" class="kpms-textbox" runat="server" MaxText="8" TableName="EPMS_GDReportLetter" Field="ReportUserName" ActiveStatus="(23.填写工代汇报信)" />
            <input type="hidden" id="hiReportUserID" name="hiReportUserID" runat="server" tablename="EPMS_GDReportLetter" field="ReportUserID" />
        </td>
        <td colspan="2" class="td-m"></td>
    </tr>
    <tr>
        <td class="td-l">工地现有工代名单</td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightObjectSelector runat="server" ID="LightObjectSelector1" IsMutiple="true"
                SelectPageMode="Dialog" TableName="EPMS_GDReportLetter" Field="GDUserName" ActiveStatus="(23.填写工代汇报信)"
                SourceMode="SelectorPage" ShowJsonRowColName="true"
                DoCancel="true" ResultAttr="name" ShowAttrs="name,LoginId" ResultForControls="{'hiGDUserID':'id'}"
                PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx" PageWidth="850" />
            <input type="hidden" id="hiGDUserID" name="hiGDUserID" runat="server" tablename="EPMS_GDReportLetter" field="GDUserID" />
        </td>
    </tr>
    <tr>
        <td class="td-l">一、主要施工情况<br />
            （项目、进度等）<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbMainSituation" EnableTheming="False" CssClass="kpms-textarea" TextMode="MultiLine" Height="150px" runat="server" MaxText="512" TableName="EPMS_GDReportLetter" Field="MainSituation" ActiveStatus="(23.填写工代汇报信)" req="1"/>
        </td>
    </tr>
    <tr>
        <td class="td-l">二、施工中发现的<br />
            设计问题及处理情况
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbQuestion" EnableTheming="False" CssClass="kpms-textarea" TextMode="MultiLine" Height="150px" runat="server" MaxText="512" TableName="EPMS_GDReportLetter" Field="Question" ActiveStatus="(23.填写工代汇报信)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">截止汇报信发出日期，<br />
            设计变更通知单编号
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbDesignModifyCode" runat="server" MaxText="64" TableName="EPMS_GDReportLetter" Field="DesignModifyCode" ActiveStatus="(23.填写工代汇报信)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">三、生产施工方面的<br />
            要求和处理意见
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbConstructionRequirements" EnableTheming="False" CssClass="kpms-textarea" TextMode="MultiLine" Height="150px" runat="server" MaxText="512" TableName="EPMS_GDReportLetter" Field="ConstructionRequirements" ActiveStatus="(23.填写工代汇报信)" />
        </td>
    </tr>
    <td class="td-l">四、需公司解决的问题
    </td>
    <td class="td-m" colspan="5">
        <zhongsoft:LightTextBox ID="tbQuestionOfCompany" EnableTheming="False" CssClass="kpms-textarea" TextMode="MultiLine" Height="150px" runat="server" MaxText="512" TableName="EPMS_GDReportLetter" Field="QuestionOfCompany" ActiveStatus="(23.填写工代汇报信)" />
    </td>
    <tr>
        <td class="td-l">五、其他（包括对优秀<br />
            图纸的评价、施工中好<br />
            的经验或其他问题）
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbOtherQuestion" EnableTheming="False" CssClass="kpms-textarea" TextMode="MultiLine" Height="150px" runat="server" MaxText="512" TableName="EPMS_GDReportLetter" Field="OtherQuestion" ActiveStatus="(23.填写工代汇报信)" />
        </td>
    </tr>
</table>
<input type="hidden" id="hiGDReportLetterID" name="hiGDReportLetterID" runat="server" tablename="EPMS_GDReportLetter" field="GDReportLetterID" />


<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
    }



    function afterSelect() {
        <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.btnBind, "")%>;
    }
</script>
