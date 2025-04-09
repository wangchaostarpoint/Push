<%@ Page Language="C#" AutoEventWireup="true" Title="专业类型参数编辑" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    CodeBehind="ParamSpecialtyTypeEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Sys.ParamSpecialtyTypeEditor" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                专业代字<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbCode" TableName="EPMS_PARAMSPECIALTYTYPE"
                    Field="SpecialtyCode" activestatus="(23.*)" req="1"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                专业名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="LightTextBox1" TableName="EPMS_PARAMSPECIALTYTYPE"
                    Field="SpecialtyName" activestatus="(23.*)" req="1"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                类型<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <asp:RadioButtonList runat="server" ID="rblType" RepeatDirection="Horizontal" key='<%#Eval("ParamSpecialtyTypeId") %>'
                    TableName="EPMS_PARAMSPECIALTYTYPE" Field="BusinessType" req="1">
                    <asp:ListItem Value="设计">设计</asp:ListItem>
                    <asp:ListItem Value="勘测">勘测</asp:ListItem>
                    <asp:ListItem Value="其他">其他</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                描述
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbDescription" TableName="EPMS_PARAMSPECIALTYTYPE"
                    Field="DESCRIPTION" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                排序号
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbSort" TableName="EPMS_PARAMSPECIALTYTYPE" Field="SORT"
                    Style="text-align: right; width: 70px;" activestatus="(23.*)" regex="^([1-9]\d{0,1}|0)$"
                    errmsg="请输入最多2位整数" runat="server"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                是否启用
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rblFlag" RepeatDirection="Horizontal" TableName="EPMS_PARAMSPECIALTYTYPE"
                    Field="FLAG" activestatus="(23.*)">
                    <asp:ListItem Value="1" Selected="True">启用</asp:ListItem>
                    <asp:ListItem Value="0">不启用</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
    </table>
    <input id="hikeyID" type="hidden" tablename="EPMS_PARAMSPECIALTYTYPE" field="ParamSpecialtyTypeId"
        runat="server" />
    <script>
        function initCustomerPlugin() {
            checkMaxLength();
            checkRegex();
        }

    </script>
</asp:Content>
