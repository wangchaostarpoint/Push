<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProprietaryTechnicalEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.TSM.List.TSM.ProprietaryTechnicalEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"
    TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                成果名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbResultName" runat="server" tablename="TSM_PROPRIETARYTECHNICAL"
                    req="1" field="RESULTSNAME" activestatus="(23.*)" MaxLength="64" />
            </td>
            <td class="td-l">
                专有技术编号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbProprietaryCode" runat="server" tablename="TSM_PROPRIETARYTECHNICAL"
                    req="1" field="PROPRIETARYCODE" activestatus="(23.*)" MaxLength="32" />
            </td>
        </tr>
        <tr>
           
            <td class="td-l">
                主要完成人
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsInventorName" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"
                    ResultAttr="name" ActiveStatus="(23.*)" ResultForControls="{'hiInventorId':'id','hiInventorCode':'UserCode'}"
                  SelectPageMode="Dialog"   IsMutiple="true" SourceMode="SelectorPage" field="INVENTORNAME" tablename="TSM_PROPRIETARYTECHNICAL" />
                <input id="hiInventorId" type="hidden" runat="server" tablename="TSM_PROPRIETARYTECHNICAL"
                    field="INVENTORID" />
                <input id="hiInventorCode" type="hidden" runat="server" tablename="TSM_PROPRIETARYTECHNICAL"
                    field="INVENTORCODE" />
            </td>
            <td class="td-l">
                发证时间
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText type="text" ID="txtIssuingDate" runat="server" readonly="readonly"
                    class="kpms-textbox-date" tablename="TSM_PROPRIETARYTECHNICAL" field="ISSUINGTIME"
                    activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                权利人
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbPatentee" runat="server" tablename="TSM_PROPRIETARYTECHNICAL"
                    field="PATENTEENAME" activestatus="(23.*)" MaxLength="32" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                价值（元）
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbValue" activestatus="(23.*)" tablename="TSM_PROPRIETARYTECHNICAL"
                    field="VALUE" Regex="^([1-9]\d{0,11}|[0])(\.\d{1,2})?$" ErrMsg="请输入正数，最多12位整数，2位小数"
                    CssClass="kpms-textbox-money" EnableTheming="false" />
            </td>
            <td class="td-l">
                类别
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlType" runat="server" field="TECHTYPE" activestatus="(23.*)"
                    tablename="TSM_PROPRIETARYTECHNICAL">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                关键词
            </td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbKeyWord" activestatus="(23.*)" tablename="TSM_PROPRIETARYTECHNICAL"
                    field="KeyWord" CssClass="kpms-textbox" EnableTheming="false" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                权利范围
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="txtRightsScope" Field="RIGHTSSCOPE" tableName="TSM_PROPRIETARYTECHNICAL"
                    activestatus="(23.*)" runat="server" CssClass ="kpms-textarea" TextMode="MultiLine"
                    maxtext="128" EnableTheming="false">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
       <tr>
            <td class="td-l">
                摘要
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbAbstract" activestatus="(23.*)" tablename="TSM_PROPRIETARYTECHNICAL"
                    field="Abstract" CssClass="kpms-textarea" TextMode="MultiLine" EnableTheming="false" />
            </td>
        </tr>
    </table>
    <!---专有技术Id--->
    <input id="hiProprietatyId" type="hidden" tablename="TSM_PROPRIETARYTECHNICAL" field="PROPRIETARYID"
        runat="server" />
    <input id="hiFlag" type="hidden" tablename="TSM_PROPRIETARYTECHNICAL" field="flag"
        runat="server" value="1" />
    <input id="hiIssue" type="hidden" tablename="TSM_PROPRIETARYTECHNICAL" field="Issue"
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

        //上传证书
        function uploadFile() {
            var fileSrcId = "<%=BusinessObjectId%>";
            showUploadForm(fileSrcId, "Module");
            return true;
        }
    </script>
</asp:Content>
