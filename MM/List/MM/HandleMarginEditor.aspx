<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="HandleMarginEditor.aspx.cs" Inherits="Zhongsoft.Portal.MM.List.MM.HandleMarginEditor" %>

<%@ Register Src="~/Sys/FileDocument/CustomerUpLoadFile.ascx" TagName="UpLoadFile"
    TagPrefix="uc3" %>
<%@ Register Assembly="Zhongsoft.Portal" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                申请人
            </td>
            <td class="td-r">
                <input id="hiApplyUserID" type="hidden" runat="server" field="APPLYUSERID" tablename="FM_HANDLEMARGIN" />
                <input id="hiApplyUserCode" type="hidden" runat="server" field="APPLYUSERCODE" tablename="FM_HANDLEMARGIN" />
                <zhongsoft:XHtmlInputText ID="txtApplyUserName" runat="server" class="kpms-textbox"
                    Field="APPLYUSERNAME" TableName="FM_HANDLEMARGIN" readonly="readonly" Activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                申请部门
            </td>
            <td class="td-r">
                <input id="hiApplyDeptID" type="hidden" runat="server" field="APPLYDEPTID" tablename="FM_HANDLEMARGIN" />
                <zhongsoft:XHtmlInputText ID="txtApplyDept" runat="server" readonly="readonly" Field="APPLYDEPTNAME"
                    TableName="FM_HANDLEMARGIN" class="kpms-textbox" Activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                申请日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtApplyDate" runat="server" readonly="readonly" class="kpms-textbox-date"
                    Field="APPLYDATE" TableName="FM_HANDLEMARGIN" Activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                保函工程名称
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtGuaranteeProject" runat="server" Field="GUARANTEEPROJECT"
                    ReadOnly="readonly" TableName="FM_HANDLEMARGIN" CssClass="kpms-textbox" Activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                保函种类
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtGuaranteeType" runat="server" Activestatus="(23.*)"
                    ReadOnly="readonly" Field="GUARANTEETYPEID" TableName="FM_HANDLEMARGIN">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                保函格式
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtGuaranteeForm" runat="server" Activestatus="(23.*)"
                    ReadOnly="readonly" Field="GUARANTEEFORMID" TableName="FM_HANDLEMARGIN">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                保函金额
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txt" runat="server" Field="GUARANTEEPROJECT" ReadOnly="readonly"
                    TableName="FM_HANDLEMARGIN" CssClass="kpms-textbox" Activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                保函期限(月)
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtGuaranteeTerm" runat="server" Activestatus="(23.*)"
                    ReadOnly="readonly" Field="GUARANTEETERM" TableName="FM_HANDLEMARGIN">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                受益人名称
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtBeneficiaryName" runat="server" Activestatus="(23.*)"
                    ReadOnly="readonly" Field="BENEFICIARYNAME" TableName="FM_HANDLEMARGIN">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                受益人联系电话
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtBeneficiaryPhone" runat="server" Field="BENEFICIARYPHONE"
                    ReadOnly="readonly" TableName="FM_HANDLEMARGIN" Activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                受益人地址
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText ID="txtBeneficiaryAddress" runat="server" Field="BENEFICIARYADDRESS"
                    ReadOnly="readonly" TableName="FM_HANDLEMARGIN" Activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                开户银行
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbAccountBank" runat="server" Field="ACCOUNTBANK" TableName="FM_HANDLEMARGIN"
                    CssClass="kpms-textbox" Activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                银行帐号
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbBankAccount" runat="server" Field="BANKACCOUNT" TableName="FM_HANDLEMARGIN"
                    CssClass="kpms-textbox" Activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                开具时间
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtStartDate" runat="server" Field="STARTDATE" TableName="FM_HANDLEMARGIN"
                    CssClass="kpms-textbox-date" Activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                保证金比例(%)
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbMarginScale" runat="server" Field="MARGINSCALE" TableName="FM_HANDLEMARGIN"
                    CssClass="kpms-textbox" Activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                保证金金额
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtMarginValue" runat="server" Field="MARGINVALUE"
                    TableName="FM_HANDLEMARGIN" CssClass="kpms-textbox" readonly="readonly" Activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                到期时间
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtEndDate" runat="server" Field="ENDDATE" TableName="FM_HANDLEMARGIN"
                    CssClass="kpms-textbox-date" Activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                领用人
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbRecipient" runat="server" Field="RECIPIENT" TableName="FM_HANDLEMARGIN"
                    CssClass="kpms-textbox" Activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                保函状态
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlGuaranteeState" runat="server" Field="GUARANTEESTATE"
                    TableName="FM_HANDLEMARGIN" CssClass="kpms-textbox" Activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                是否到期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtIsExpire" runat="server" Field="ISEXPIRE" TableName="FM_HANDLEMARGIN"
                    CssClass="kpms-textbox" Activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
    </table>
    <input runat="server" id="hiHandleMarginID" type="hidden" field="HANDLEMARGINID"
        tablename="FM_HANDLEMARGIN" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkMaxLength();
            checkRegex();
        }
    </script>
</asp:Content>
