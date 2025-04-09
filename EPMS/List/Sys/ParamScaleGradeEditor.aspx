<%@ Page Language="C#" AutoEventWireup="true" Title="规模等级参数编辑" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    CodeBehind="ParamScaleGradeEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Sys.ParamScaleGradeEditor" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                规模类型
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightDropDownList runat="server" ID="ddlScaleType" TableName="EPMS_ParamScaleGrade"
                    Field="ScaleType" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                规模等级<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbScale" TableName="EPMS_ParamScaleGrade"
                    Field="ScaleGrade" activestatus="(23.*)" req="1"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                规模容量（长度）
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbCapacity" TableName="EPMS_ParamScaleGrade" Field="Capacity"
                    Style="text-align: right; width: 70px;" activestatus="(23.*)" regex="^[1-9]{0,1}[0-9]{0,3}$"
                    errmsg="请输入最多4位整数" runat="server"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                计量单位
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlMeasureUnit" TableName="EPMS_ParamScaleGrade"
                    Field="MeasureUnit" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                描述
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbDescription" TableName="EPMS_ParamScaleGrade"
                    Field="DESCRIPTION" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                排序号
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbSort" TableName="EPMS_ParamScaleGrade" Field="SORT"
                    Style="text-align: right; width: 70px;" activestatus="(23.*)" regex="^[1-9]{0,1}[0-9]{0,1}$"
                    errmsg="请输入最多2位整数" runat="server"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                是否启用
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rblFlag" RepeatDirection="Horizontal" TableName="EPMS_ParamScaleGrade"
                    Field="FLAG" activestatus="(23.*)">
                    <asp:ListItem Value="1" Selected="True">启用</asp:ListItem>
                    <asp:ListItem Value="0">不启用</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
    </table>
    <input id="hikeyID" type="hidden" tablename="EPMS_ParamScaleGrade" field="ParamScaleGradeID"
        runat="server" />
    <script>
        function initCustomerPlugin() {
            checkMaxLength();
            checkRegex();
        }

    </script>
</asp:Content>
