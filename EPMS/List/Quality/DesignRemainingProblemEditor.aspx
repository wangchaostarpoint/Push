<%@ Page Title="设计遗留问题跟踪表" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master" AutoEventWireup="true" CodeBehind="DesignRemainingProblemEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Quality.DesignRemainingProblemEditor" %>

<%@ Import Namespace="DAL.EPMS" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">工程名称</td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText runat="server" ID="txtProjectName" readonly="readonly" tableName="EPMS_DesignRemainingProblemTracking"
                    field="ProjectName" ActiveStatus="(23.*)" class="kpms-textbox" />
                <input type="hidden" id="hiOrganizationID" name="hiOrganizationID" runat="server" tablename="EPMS_DesignRemainingProblemTracking" field="OrganizationID" />
            </td>
            <td class="td-l">设计阶段</td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtPhaseName" TableName="EPMS_DesignRemainingProblemTracking" Field="PhaseName" ActiveStatus="(23.*)"
                    readonly="readonly" class="kpms-textbox" />
                <input type="hidden" id="hiParamPhaseID" name="hiParamPhaseID" runat="server" tablename="EPMS_DesignRemainingProblemTracking" field="ParamPhaseID" />
            </td>
        </tr>
        <tr>
            <td class="td-l">卷册名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsWbsName" PageUrl="~/EPMS/Obsolete/WBSSelector.aspx" SelectPageMode="Dialog" IsMutiple="false"
                    ShowJsonRowColName="true" ResultAttr="name" ResultForControls="{'hiWBSID':'id','txtWbsCode':'WBSCode','txtWbsOwner':'WBSOwnerName','hiWBSOwnerID':'WBSOwnerID'}" TableName="EPMS_DesignRemainingProblemTracking" Field="WBSName" ActiveStatus="(23.*)"
                    FilterFunction="wbsFilter()" req="1" />
                <input type="hidden" id="hiWBSID" name="hiWBSID" runat="server" tablename="EPMS_DesignRemainingProblemTracking" field="WBSID" />
            </td>
        </tr>
        <tr>
            <td class="td-l">卷册检索号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtWbsCode" readonly="readonly" TableName="EPMS_DesignRemainingProblemTracking" Field="WBSCode" ActiveStatus="(23.*)" class="kpms-textbox"></zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">卷册负责人
            </td>
            <td class="td-R">
                <zhongsoft:XHtmlInputText runat="server" ID="txtWbsOwner" readonly="readonly" class="kpms-textbox" TableName="EPMS_DesignRemainingProblemTracking" Field="WBSOwnerName" ActiveStatus="(23.*)" />
                <input type="hidden" id="hiWBSOwnerID" name="hiWBSOwnerID" runat="server" tablename="EPMS_DesignRemainingProblemTracking" field="WBSOwnerID" />
            </td>
            <td class="td-l">提出日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtPutDate" runat="server" readonly="readonly" TableName="EPMS_DesignRemainingProblemTracking" Field="PutDate" ActiveStatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">跟踪人
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtDisposeUserName" TableName="EPMS_DesignRemainingProblemTracking" Field="DisposeUserName" ActiveStatus="(23.*)"
                    PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" SelectPageMode="Dialog" ShowJsonRowColName="True" ResultAttr="name" ResultForControls="{'hiDisposeUserID':'id'}"
                    IsMutiple="False" />
                <input type="hidden" id="hiDisposeUserID" name="hiDisposeUserID" runat="server" tablename="EPMS_DesignRemainingProblemTracking" field="DisposeUserID" />
            </td>
            <td class="td-l">验证人
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsCheckUser" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" SelectPageMode="Dialog" ShowJsonRowColName="True"
                    ResultAttr="name" ResultForControls="{'hiCheckUserID':'id'}" TableName="EPMS_DesignRemainingProblemTracking" Field="CheckUserName" ActiveStatus="(23.*)" />
                <input type="hidden" id="hiCheckUserID" name="hiCheckUserID" runat="server" tablename="EPMS_DesignRemainingProblemTracking" field="CheckUserID" />
            </td>
            <td class="td-l">验证日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" readonly="readonly" class="kpms-textbox-date" ID="txtCheckDate" TableName="EPMS_DesignRemainingProblemTracking" Field="CheckDate" ActiveStatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">专工
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbSpecialtyUserName" runat="server" MaxText="16" TableName="EPMS_DesignRemainingProblemTracking" Field="SpecialtyUserName" ActiveStatus="(23.*)" />
                <input type="hidden" id="hiSpecialtyUserID" name="hiSpecialtyUserID" runat="server" tablename="EPMS_DesignRemainingProblemTracking"
                    field="SpecialtyUserID" ismutiple="false" />
            </td>
            <td class="td-l">签审日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtCheckSignDate" runat="server" readonly="readonly" TableName="EPMS_DesignRemainingProblemTracking" Field="CheckSignDate" ActiveStatus="(23.*)" />
            </td>
            <td colspan="2" class="td-m"></td>
        </tr>
        <tr>
            <td class="td-l">遗留问题<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbRemainingProblem" runat="server" EnableTheming="False" CssClass="kpms-textarea" TextMode="MultiLine" Rows="3"
                    MaxText="1024" TableName="EPMS_DesignRemainingProblemTracking" Field="RemainingProblem" ActiveStatus="(23.*)" req="1"/>
            </td>
        </tr>
        <tr>
            <td class="td-l">处理情况（包括何人、<br />
                何时、如何处理、<br />
                处理方案及最终处理结果）
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbDisposeResult" runat="server" EnableTheming="False" CssClass="kpms-textarea" TextMode="MultiLine" Rows="3"
                    MaxText="512" TableName="EPMS_DesignRemainingProblemTracking" Field="DisposeResult" ActiveStatus="(23.*)" />
            </td>
        </tr>
    </table>
    <input type="hidden" id="hiDesignRemainingProblemTrackingID" name="hiDesignRemainingProblemTrackingID" runat="server" tablename="EPMS_DesignRemainingProblemTracking" field="DesignRemainingProblemTrackingID" />
    <input type="hidden" id="hiQualityActivityOfProjectID" name="hiQualityActivityOfProjectID" runat="server" tablename="EPMS_DesignRemainingProblemTracking" field="QualityActivityOfProjectID" />
    <input type="hidden" id="hiDesignRemainingProblemTrackingNum" runat="server" tablename="EPMS_DesignRemainingProblemTracking" field="DesignRemainingProblemTrackingNum" activestatus="(23.*)" />
    <input type="hidden" runat="server" id="hiFlag" tablename="EPMS_DesignRemainingProblemTracking" field="Flag" activestatus="(23.*)" value="1" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }

        //选择任务的筛选条件
        function wbsFilter() {
            var orgId = $('#<%=hiOrganizationID.ClientID %>').val();
            <%--return { OrganizationID: orgId, TypeID: '<%=WBSType.册.GetHashCode() %>', IsShowMore: 0, WBSState: '<%=(int)WBSState.尚未开展 %>', 'IsFilterSpe': 'true' };--%>
            return { OrganizationID: orgId, TypeID: '<%=WBSType.册.GetHashCode() %>', IsShowMore: 0, 'IsFilterSpe': 'true' };
        }

    </script>
</asp:Content>
