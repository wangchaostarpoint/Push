<%@ Page Title="合同类别参数" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master" AutoEventWireup="true" CodeBehind="ParamContractTypeEditor.aspx.cs" Inherits="Zhongsoft.Portal.MM.List.Sys.ParamContractTypeEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">合同类别<span class="req-star">*</span></td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbProjectClass" runat="server" MaxText="32" TableName="MM_ParamContractType" Field="ContractTypeName" ActiveStatus="(23.*)" req="1" />
            </td>
        </tr>
        <tr>
            <td class="td-l">排序<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbSort" EnableTheming="False" CssClass="kpms-textbox-money" DataType="Integer" runat="server" TableName="MM_ParamContractType" Field="Sort" ActiveStatus="(23.*)" req="1" />
            </td>
            <td class="td-l">
                是否启用
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rblFlag" RepeatDirection="Horizontal" TableName="MM_ParamContractType"
                                     Field="Flag" activestatus="(23.*)">
                    <asp:ListItem Value="1" Selected="True">启用</asp:ListItem>
                    <asp:ListItem Value="0">不启用</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="td-l">主要内容<span class="req-star">*</span></td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbContent" EnableTheming="False" CssClass="kpms-textarea" Rows="3" TextMode="MultiLine" runat="server" MaxText="256" TableName="MM_ParamContractType" Field="Content" ActiveStatus="(23.*)" req="1" />
            </td>
        </tr>
        <tr>
            <td class="td-l">备注</td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbMemo" EnableTheming="False" CssClass="kpms-textarea" Rows="3" TextMode="MultiLine" runat="server" MaxText="1024" TableName="MM_ParamContractType" Field="Memo" ActiveStatus="(23.*)" />
            </td>
        </tr>
    </table>
    <input type="hidden" id="hiParamContractTypeID" name="hiParamContractTypeID" runat="server" tablename="MM_ParamContractType" field="ParamContractTypeID" />
    <input type="hidden" runat="server" id="hiBaseType" tablename="MM_ParamContractType" field="BaseType" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }
    </script>
</asp:Content>
