<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TreatiseEntityEditor.aspx.cs" Inherits="Zhongsoft.Portal.TSM.List.TSM.TreatiseEntityEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master"  %>

<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"
    TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                专著名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbTreatiseName" runat="server" tablename="TSM_TreatiseEntity"
                    req="1" field="TreatiseNAME" activestatus="(23.*)" MaxLength="64" />
            </td>
            <td class="td-l">
                作者
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsWriterName" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" SelectPageMode="Dialog"
                    ResultAttr="name" ActiveStatus="(23.*)" ResultForControls="{'hiWriterId':'id','hiWriterCode':'UserCode'}"
                    IsMutiple="true" SourceMode="SelectorPage" field="AUTHORNAME" tablename="TSM_TreatiseEntity" />
                <input id="hiWriterId" type="hidden" runat="server" tablename="TSM_TreatiseEntity" field="AUTHORID" />
                <input id="hiWriterCode" type="hidden" runat="server" tablename="TSM_TreatiseEntity"
                    field="AUTHORCODE" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                第一作者<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbFirstWriter" runat="server" tablename="TSM_TreatiseEntity"
                    req="1" field="FirstWriter" activestatus="(23.*)" MaxLength="64" />
            </td>
            <td class="td-l">
                第二作者<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbSecondWriter" runat="server" tablename="TSM_TreatiseEntity"
                    req="1" field="SecondWriter" activestatus="(23.*)" MaxLength="64" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                第三作者<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbThirdWriter" runat="server" tablename="TSM_TreatiseEntity"
                    req="1" field="ThirdWriter" activestatus="(23.*)" MaxLength="64" />
            </td>
            <td class="td-l">
                作者排序
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbSort" runat="server" tablename="TSM_TreatiseEntity" field="AUTHORSORT"
                    activestatus="(23.*)" CssClass="kpms-textbox-money" EnableTheming="false" Regex="^[0-9]*$"
                    ErrMsg="请输入数字！" MaxLength="8" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                关键词
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbKeyWord" activestatus="(23.*)" tablename="TSM_TreatiseEntity"
                    field="KeyWord"  />
            </td>
            <td class="td-l">
                发表时间
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText type="text" ID="txtDate" runat="server" readonly="readonly"
                    class="kpms-textbox-date" tablename="TSM_TreatiseEntity" field="PUBLISHEDTIME" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                发表刊物
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbPublication" activestatus="(23.*)" tablename="TSM_TreatiseEntity"
                    field="PUBLICATIONS" />
            </td>
            <td class="td-l">
                刊物级别
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbLevel" activestatus="(23.*)" tablename="TSM_TreatiseEntity"
                    field="PUBLICATIONSLEVEL" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                类别
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightDropDownList ID="ddlType" runat="server" field="TECHTYPE" activestatus="(23.*)"
                    tablename="TSM_TreatiseEntity">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                摘要
            </td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbAbstract" activestatus="(23.*)" tablename="TSM_TreatiseEntity"
                    field="Abstract" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false"/>
            </td>
        </tr>
    </table>
    <!---专著Id--->
    <input id="hiPaperId" type="hidden" tablename="TSM_TreatiseEntity" field="TreatiseID" runat="server" />
    <input id="hiFlag" type="hidden" tablename="TSM_TreatiseEntity" field="flag"
        runat="server" value="1" />
    <input id="hiIssue" type="hidden" tablename="TSM_TreatiseEntity" field="Issue"
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
