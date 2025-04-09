<%@ Page Language="C#" AutoEventWireup="true" Title="图幅参数编辑" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    CodeBehind="ParamMapSizeEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Sys.ParamMapSizeEditor" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                图幅<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbMapSize" TableName="EPMS_ParamMapsize"
                    Field="Mapsize" activestatus="(23.*)" req="1"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                标准图幅
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbStdMapSize" TableName="EPMS_ParamMapsize"
                    Field="StandardMapsize" activestatus="(23.*)" req="1"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                横竖<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rblIsErect" RepeatDirection="Horizontal"
                    TableName="EPMS_ParamMapsize" Field="IsErect" activestatus="(23.*)">
                    <asp:ListItem Value="0" Selected="True">横</asp:ListItem>
                    <asp:ListItem Value="1">竖</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="td-l">
                是否加长<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rblIsEndThen" RepeatDirection="Horizontal"
                    TableName="EPMS_ParamMapsize" Field="IsEndThen" activestatus="(23.*)">
                    <asp:ListItem Value="0" Selected="True">不加长</asp:ListItem>
                    <asp:ListItem Value="1">加长</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                长<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbLength" TableName="EPMS_ParamMapsize" Field="Length"
                    Style="text-align: right; width: 70px;" activestatus="(23.*)" regex="^\d{0,4}$"
                    errmsg="请输入最多4位整数" runat="server" req="1"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                宽<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbWidth" TableName="EPMS_ParamMapsize" Field="Width"
                    Style="text-align: right; width: 70px;" activestatus="(23.*)" regex="^\d{0,4}$"
                    errmsg="请输入最多4位整数" runat="server" req="1"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                折合标准张
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbStdPage" TableName="EPMS_ParamMapsize" Field="StandardPage"
                    Style="text-align: right; width: 70px;" activestatus="(23.*)" regex="^\d{0,2}\.\d{0,3}$"
                    errmsg="请输入最多2位整数3位小数" runat="server" req="1"></zhongsoft:LightTextBox>
            </td>
            <td class="td-m" colspan="2">
            </td>
        </tr>
        <tr>
            <td class="td-l">
                描述
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbDescription" TableName="EPMS_ParamMapsize"
                    Field="DESCRIPTION" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                排序号
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbSort" TableName="EPMS_ParamMapsize" Field="SORT" Style="text-align: right;
                    width: 70px;" activestatus="(23.*)" regex="^[1-9]{0,2}$" errmsg="请输入最多2位整数" runat="server"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                是否启用
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rblFlag" RepeatDirection="Horizontal" TableName="EPMS_ParamMapsize"
                    Field="FLAG" activestatus="(23.*)">
                    <asp:ListItem Value="1" Selected="True">启用</asp:ListItem>
                    <asp:ListItem Value="0">不启用</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
    </table>
    <input id="hikeyID" type="hidden" tablename="EPMS_ParamMapsize" field="ParamMapsizeID"
        runat="server" />
    <script>
        function initCustomerPlugin() {
            checkMaxLength();
            checkRegex();
        }
    </script>
</asp:Content>
