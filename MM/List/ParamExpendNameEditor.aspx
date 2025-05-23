﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ParamExpendNameEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.List.ParamExpendNameEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table width="100%" class="tz-table">
        <tr>
            <td class="td-l">
                参数名<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <input type="hidden" runat="server" id="hiParamExpendNameID" field="PARAMEXPENDNAMEID" tablename="MM_PARAMEXPENDNAME" />
                <zhongsoft:LightTextBox runat="server" ID="tbParamName" CssClass="kpms-textbox" MaxLength="20"
                    req="1" field="PARAMEXPENDNAME" tablename="MM_PARAMEXPENDNAME" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                排序<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbSort" CssClass="kpms-textbox" Width="40px"
                    MaxLength="3" req="1" Style="text-align: right" field="Sort" regex="^\d*$" errmsg="排序只能填写非负整数"
                    tablename="MM_PARAMEXPENDNAME" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                说明
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox ID="tbRemark" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                    EnableTheming="false" maxtext="512" tablename="MM_PARAMEXPENDNAME" field="Remark" ActiveStatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiFlag" tablename="MM_PARAMEXPENDNAME" field="Flag" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }
    </script>
</asp:Content>
