<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ParamCurrencyditor.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.List.MCM.ParamCurrencyEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                币种<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox ID="tbCurrencyName" runat="server" req="1" activestatus="(23.*)"
                    MaxLength="16" field="CURRENCYNAME" tablename="MCM_PARAMCURRENCY"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                符号
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox ID="tbCurrencySymbol" runat="server" field="CURRENCYSYMBOL"
                    tablename="MCM_PARAMCURRENCY" MaxLength="8" activestatus="(23.*)" CssClass="kpms-textbox"
                    EnableTheming="false"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                汇率
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox ID="tbExchangeRate" runat="server" field="EXCHANGERATE" tablename="MCM_PARAMCURRENCY"
                    MaxLength="16" activestatus="(23.*)" regex="^([1-9]\d{0,7}|[0])(\.\d{1,4})?$"
                    errmsg="汇率请输入正数，最多8位整数，4位小数！" CssClass="kpms-textbox" EnableTheming="false"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                排序<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox runat="server" ID="tbSort" field="SORT" tablename="MCM_PARAMCURRENCY"
                    regex="^\d+$" errmsg="请填写两位正整数！" class="kpms-textbox" MaxLength="2" Width="30px"
                    req="1" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                说明
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox ID="tbMemmo" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                    EnableTheming="false" maxtext="512" tablename="MCM_PARAMCURRENCY" field="MEMO"
                    ActiveStatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiCurrencyID" field="CURRENCYID" tablename="MCM_PARAMCURRENCY" />
    <input type="hidden" runat="server" id="hiFlag" field="FLAG" tablename="MCM_PARAMCURRENCY" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }
    </script>
</asp:Content>
