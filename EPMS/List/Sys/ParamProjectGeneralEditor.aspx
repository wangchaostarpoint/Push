<%@ Page Language="C#" AutoEventWireup="true" Title="项目通用参数编辑" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    CodeBehind="ParamProjectGeneralEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Sys.ParamProjectGeneralEditor" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                参数类型<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <%--<zhongsoft:LightTextBox runat="server" ID="tbType" TableName="EPMS_PARAMPROJECTGENERAL"
                    Field="ParamType" activestatus="(23.*)" req="1"></zhongsoft:LightTextBox>--%>
                <zhongsoft:LightDropDownList runat="server" ID="ddlType" activestatus="(23.*)" req="1">
                </zhongsoft:LightDropDownList>
                <input type="hidden" runat="server" id="hiType" tablename="EPMS_PARAMPROJECTGENERAL"
                    field="ParamType" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                参数名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbName" TableName="EPMS_PARAMPROJECTGENERAL"
                    Field="ParamName" activestatus="(23.*)" req="1"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                参数值<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbValue" TableName="EPMS_PARAMPROJECTGENERAL"
                    Field="ParamValue" activestatus="(23.*)" req="1"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                描述
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbDescription" TableName="EPMS_PARAMPROJECTGENERAL"
                    Field="DESCRIPTION" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                排序号
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbSort" TableName="EPMS_PARAMPROJECTGENERAL" Field="SORT"
                    Style="text-align: right; width: 70px;" activestatus="(23.*)" regex="^([1-9]\d{0,1}|0)$"
                    errmsg="请输入最多2位整数" runat="server"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                是否启用
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rblFlag" RepeatDirection="Horizontal" TableName="EPMS_PARAMPROJECTGENERAL"
                    Field="FLAG" activestatus="(23.*)">
                    <asp:ListItem Value="1" Selected="True">启用</asp:ListItem>
                    <asp:ListItem Value="0">不启用</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
    </table>
    <input id="hikeyID" type="hidden" tablename="EPMS_PARAMPROJECTGENERAL" field="ParamProjectGeneralId"
        runat="server" />
    <script>
        function initCustomerPlugin() {
            checkMaxLength();
            checkRegex();
        }
    </script>
</asp:Content>
