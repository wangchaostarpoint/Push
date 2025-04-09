<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ParamDetailEditor.aspx.cs" Title="参数明细编辑页"
    Inherits="Zhongsoft.Portal.MM.List.ParamDetailEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table width="100%" class="tz-table">
        <tr>
            <td class="td-l">参数类型</td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText runat="server" ID="txtParamType" readonly="readonly"
                    class="kpms-textbox" activestatus="(23.*)" field="ParamType"
                    tablename="MM_ParamGeneral">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">参数明细名<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <input type="hidden" runat="server" id="hiParamGeneralID" field="ParamGeneralID" tablename="MM_ParamGeneral" />
                <zhongsoft:LightTextBox runat="server" ID="tbParamName" CssClass="kpms-textbox"
                    MaxLength="128" req="1" field="ParamName" tablename="MM_ParamGeneral" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">参数明细值<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbParamValue" CssClass="kpms-textbox"
                    DataType="PositiveInteger" MaxLength="20" req="1" field="ParamValue" tablename="MM_ParamGeneral" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">排序<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbSort" CssClass="kpms-textbox" Width="40px"
                    MaxLength="3" req="1" Style="text-align: right" field="Sort" regex="^\d*$" errmsg="排序只能填写非负整数"
                    tablename="MM_ParamGeneral" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">是否启用
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rblFlag" RepeatDirection="Horizontal" TableName="MM_ParamGeneral"
                    Field="Flag" activestatus="(23.*)">
                    <asp:ListItem Value="1" Selected="True">启用</asp:ListItem>
                    <asp:ListItem Value="0">不启用</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
    </table>
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }
    </script>
</asp:Content>
