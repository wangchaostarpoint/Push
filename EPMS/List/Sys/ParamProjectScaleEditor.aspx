<%@ Page Language="C#" AutoEventWireup="true" Title="项目规模参数编辑" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    CodeBehind="ParamProjectScaleEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Sys.ParamProjectScaleEditor" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                项目类型
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightDropDownList runat="server" ID="ddlProjType" TableName="EPMS_PARAMPROJECTSCALE"
                    Field="ParamProjectTypeId" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                项目规模<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbScale" TableName="EPMS_PARAMPROJECTSCALE"
                    Field="ProjectScale" activestatus="(23.*)" req="1"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                等级
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlGrade" TableName="EPMS_PARAMPROJECTSCALE"
                    Field="ParamScaleGradeID" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
                <input type="hidden" runat="server" id="hiGrade" tablename="EPMS_PARAMPROJECTSCALE"
                    field="Grade" />
            </td>
            <td class="td-l">
                数量（台数）
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbNumber" TableName="EPMS_PARAMPROJECTSCALE" Field="Number"
                    Style="text-align: right; width: 70px;" activestatus="(23.*)" regex="^[1-9]\d{0,2}$"
                    errmsg="请输入最多2位整数" runat="server"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                容量（长度）
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbCapacity" TableName="EPMS_PARAMPROJECTSCALE" Field="Capacity"
                    Style="text-align: right; width: 70px;" activestatus="(23.*)" regex="^[1-9]\d{0,2}$"
                    errmsg="请输入最多3位整数" runat="server"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                计量单位
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlMeasureUnit" TableName="EPMS_PARAMPROJECTSCALE"
                    Field="MeasureUnit" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                描述
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbDescription" TableName="EPMS_PARAMPROJECTSCALE"
                    Field="DESCRIPTION" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                排序号
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbSort" TableName="EPMS_PARAMPROJECTSCALE" Field="SORT"
                    Style="text-align: right; width: 70px;" activestatus="(23.*)" regex="^[1-9]\d{0,1}$"
                    errmsg="请输入最多2位整数" runat="server"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                是否启用
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rblFlag" RepeatDirection="Horizontal" TableName="EPMS_PARAMPROJECTSCALE"
                    Field="FLAG" activestatus="(23.*)">
                    <asp:ListItem Value="1" Selected="True">启用</asp:ListItem>
                    <asp:ListItem Value="0">不启用</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
    </table>
    <input id="hikeyID" type="hidden" tablename="EPMS_PARAMPROJECTSCALE" field="ParamProjectScaleid"
        runat="server" />
    <script>
        function initCustomerPlugin() {
            checkMaxLength();
            checkRegex();
        }

    </script>
</asp:Content>
