<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SoftwareCopyRightEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.TSM.List.TSM.SoftwareCopyRightEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"
    TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                成果名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbResultName" runat="server" tablename="TSM_SOFTWARECOPYRIGHT"
                    req="1" field="RESULTSNAME" activestatus="(23.*)" MaxLength="64" />
            </td>
            <td class="td-l">
                软件著作权编号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbCode" runat="server" tablename="TSM_SOFTWARECOPYRIGHT"
                    req="1" field="SOFTWARECOPYRIGHTCODE" activestatus="(23.*)" MaxLength="32" />
            </td>
            <td class="td-l">
                发证时间
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText type="text" ID="txtIssuingDate" runat="server" readonly="readonly"
                    class="kpms-textbox-date" tablename="TSM_SOFTWARECOPYRIGHT" field="ISSUINGTIME"
                    activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                取得方式
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbWay" activestatus="(23.*)" tablename="TSM_SOFTWARECOPYRIGHT"
                    field="ACQUIREWAY" MaxLength="32" />
            </td>
            <td class="td-l">
                著作权人
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbCopyRightOwnerName" runat="server" tablename="TSM_SOFTWARECOPYRIGHT"
                    field="COPYRIGHTOWNERNAME" activestatus="(23.*)" MaxLength="32" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                申请人
            </td>
            <td class="td-r" colspan="1">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsApplyerName" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"
                    ResultAttr="name" ActiveStatus="(23.*)" ResultForControls="{'hiApplyerId':'id','hiApplyerCode':'UserCode'}"
                   SelectPageMode="Dialog"  IsMutiple="true" SourceMode="SelectorPage" field="ApplyerNAME" tablename="TSM_SOFTWARECOPYRIGHT" />
                <input id="hiApplyerId" type="hidden" runat="server" tablename="TSM_SOFTWARECOPYRIGHT"
                    field="ApplyerID" />
                <input id="hiApplyerCode" type="hidden" runat="server" tablename="TSM_SOFTWARECOPYRIGHT"
                    field="ApplyerCODE" />
            </td>
            <td class="td-l">
                类别
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlType" runat="server" field="TECHTYPE" activestatus="(23.*)"
                    tablename="TSM_SOFTWARECOPYRIGHT">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                关键词
            </td>
            <td class="td-r" colspan="1">
                <zhongsoft:LightTextBox runat="server" ID="tbKeyWord" activestatus="(23.*)" tablename="TSM_SOFTWARECOPYRIGHT"
                    field="KeyWord" CssClass="kpms-textbox" EnableTheming="false" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                权利范围
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="txtScope" Field="RIGHTSSCOPE" tableName="TSM_SOFTWARECOPYRIGHT"
                    activestatus="(23.*)" runat="server" CssClass ="kpms-textarea" TextMode="MultiLine"
                    maxtext="512" EnableTheming="false">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                摘要
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbAbstract" activestatus="(23.*)" tablename="TSM_SOFTWARECOPYRIGHT"
                    field="Abstract"  TextMode="MultiLine" EnableTheming="false" CssClass="kpms-textarea" />
            </td>
        </tr>
    </table>
    <!---软件著作权Id--->
    <input id="hiSoftwareCopyrightId" type="hidden" tablename="TSM_SOFTWARECOPYRIGHT"
        field="SOFTWARECOPYRIGHTID" runat="server" />
    <input id="hiFlag" type="hidden" tablename="TSM_SOFTWARECOPYRIGHT" field="FLAG"
        runat="server" value="1" />
    <input id="hiIssue" type="hidden" tablename="TSM_SOFTWARECOPYRIGHT" field="Issue"
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
