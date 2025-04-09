<%@ Page Title="实物量指标参数" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master" AutoEventWireup="true" CodeBehind="ParamPhysicalIndicatorEditor.aspx.cs" Inherits="Zhongsoft.Portal.MM.List.Sys.ParamPhysicalIndicatorEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">分类<span class="req-star">*</span></td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightDropDownList runat="server" ID="ddlClass" TableName="MM_ParamPhysicalIndicator" Field="Class" ActiveStatus="(23.*)" req="1" />
            </td>
        </tr>
        <tr>
            <td class="td-l">实物量指标<span class="req-star">*</span></td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbProjectClass" runat="server" MaxText="32" TableName="MM_ParamPhysicalIndicator" Field="ParamPhysicalIndicator" ActiveStatus="(23.*)" req="1" />
            </td>
        </tr>
        <tr>
            <td class="td-l">排序<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbSort" EnableTheming="False" CssClass="kpms-textbox-money" DataType="Integer" runat="server" TableName="MM_ParamPhysicalIndicator" Field="Sort" ActiveStatus="(23.*)" req="1" />
            </td>
            <td class="td-l">
                是否启用
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rblFlag" RepeatDirection="Horizontal" TableName="MM_ParamPhysicalIndicator"
                                     Field="Flag" activestatus="(23.*)">
                    <asp:ListItem Value="1" Selected="True">启用</asp:ListItem>
                    <asp:ListItem Value="0">不启用</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="td-l">备注</td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbMemo" EnableTheming="False" CssClass="kpms-textarea" Rows="3" TextMode="MultiLine" runat="server" MaxText="1024" TableName="MM_ParamPhysicalIndicator" Field="Memo" ActiveStatus="(23.*)" />
            </td>
        </tr>
    </table>
    <input type="hidden" id="hiParamPhysicalIndicatorID" name="hiParamPhysicalIndicatorID" runat="server" tablename="MM_ParamPhysicalIndicator" field="ParamPhysicalIndicatorID" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }
    </script>
</asp:Content>
