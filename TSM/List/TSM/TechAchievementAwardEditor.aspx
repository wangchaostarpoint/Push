<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TechAchievementAwardEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.TSM.List.TSM.TechAchievementAwardEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"
    TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                项目名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsProjectName" field="ProjectName"
                    req="1" tablename="TSM_TECHACHIEVEMENTAWARD" IsMutiple="false" EnableTheming="false"
                    ResultForControls="{ 'hiProjectID':'ProjectListID','txtProjectCode':'ProjectCode'}"
                   SelectPageMode="Dialog"  ResultAttr="name" ShowJsonRowColName="true" activestatus="(23.*)"
                    PageUrl="~/TSM/Obsolete/TechProjectTaskSelector.aspx"/>
                <input type="hidden" runat="server" id="hiProjectID" field="ProjectID" tablename="TSM_TECHACHIEVEMENTAWARD" />
            </td>
            <td class="td-l">
                项目编号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtProjectCode" runat="server" readonly="readonly"
                    Field="ProjectCode" TableName="TSM_TECHACHIEVEMENTAWARD" class="kpms-textbox">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                成果名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbResultName" runat="server" tablename="TSM_TECHACHIEVEMENTAWARD"
                    req="1" field="RESULTSNAME" activestatus="(23.*)" MaxLength="64" />
            </td>
            <td class="td-l">
                证书编号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbCode" runat="server" tablename="TSM_TECHACHIEVEMENTAWARD"
                    req="1" field="CERTIFICATECODE" activestatus="(23.*)" MaxLength="32" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                获奖者
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsWinnerName" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"
                    ResultAttr="name" ActiveStatus="(23.*)" ResultForControls="{'hiWinnerId':'id','hiWinnerCode':'UserCode'}"
                    SelectPageMode="Dialog"  IsMutiple="true" SourceMode="SelectorPage" field="WINNERSNAME" tablename="TSM_TECHACHIEVEMENTAWARD" />
                <input id="hiWinnerId" type="hidden" runat="server" tablename="TSM_TECHACHIEVEMENTAWARD"
                    field="WINNERSID" />
                <input id="hiWinnerCode" type="hidden" runat="server" tablename="TSM_TECHACHIEVEMENTAWARD"
                    field="WINNERSCODE" />
            </td>
            <td class="td-l">
                颁发机构
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbAuthority" runat="server" tablename="TSM_TECHACHIEVEMENTAWARD"
                    field="AUTHORITY" activestatus="(23.*)" MaxLength="32" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                获奖等级
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbAwardRating" activestatus="(23.*)" tablename="TSM_TECHACHIEVEMENTAWARD"
                    field="AWARDRATING" />
            </td>
            <td class="td-l">
                获奖时间
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText type="text" ID="txtAwardDate" runat="server" readonly="readonly"
                    class="kpms-textbox-date" tablename="TSM_TECHACHIEVEMENTAWARD" field="AWARDDATETIME"
                    activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                获奖单位
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbAwardUnit" runat="server" tablename="TSM_TECHACHIEVEMENTAWARD"
                    field="AwardUnit" activestatus="(23.*)" MaxLength="32" />
            </td>
            <td class="td-l">
                类别
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlType" runat="server" field="TECHTYPE" activestatus="(23.*)"
                    tablename="TSM_TECHACHIEVEMENTAWARD">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                关键词
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbKeyWord" activestatus="(23.*)" tablename="TSM_TECHACHIEVEMENTAWARD"
                    field="KeyWord" CssClass="kpms-textbox" EnableTheming="false" />
            </td>
            <td class="td-r"></td>
            <td class="td-r"></td>
        </tr>
        <tr>
            <td class="td-l">
                摘要
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbAbstract" activestatus="(23.*)" tablename="TSM_TECHACHIEVEMENTAWARD"
                    field="Abstract"  TextMode="MultiLine" EnableTheming="false" CssClass="kpms-textarea"/>
            </td>
        </tr>
    </table>
    <!---获奖Id--->
    <input id="hiAwardId" type="hidden" tablename="TSM_TECHACHIEVEMENTAWARD" field="AWARDID"
        runat="server" />
    <input id="hiFlag" type="hidden" tablename="TSM_TECHACHIEVEMENTAWARD" field="flag"
        runat="server" value="1" />
    <input id="hiIssue" type="hidden" tablename="TSM_TECHACHIEVEMENTAWARD" field="Issue"
        runat="server" value="1" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkMaxLength();
            checkRegex();
            var pageType = '<%=Request.QueryString["pageType"]%>';
            if (pageType == "1") {
                $("#<%=hiIssue.ClientID%>").val(0);
            }
        }
    </script>
</asp:Content>
