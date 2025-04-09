<%@ Page Language="C#" AutoEventWireup="true" Title="图纸类型详细" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    CodeBehind="ParamMapTypeEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Sys.ParamMapTypeEditor" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                专业<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightDropDownList runat="server" ID="ddlSpeType" TableName="EPMS_ParamMapType"
                    Field="ParamSpecialtyTypeID" activestatus="(23.*)" req="1">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                成品类别<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightDropDownList runat="server" ID="ddlProductType" TableName="EPMS_ParamMapType"
                    Field="ParamProductTypeID" activestatus="(23.*)" req="1">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                图纸类型
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbName" TableName="EPMS_ParamMapType"
                    Field="MapType" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                排序号
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbSort" TableName="EPMS_ParamMapType" Field="SORT" Style="text-align: right;
                    width: 70px;" activestatus="(23.*)" regex="^[0-9]{0,2}$" errmsg="请输入最多2位整数" runat="server"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                是否启用
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rblFlag" RepeatDirection="Horizontal" TableName="EPMS_ParamMapType"
                    Field="FLAG" activestatus="(23.*)">
                    <asp:ListItem Value="1" Selected="True">启用</asp:ListItem>
                    <asp:ListItem Value="0">不启用</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
    </table>
    <input id="hikeyID" type="hidden" tablename="EPMS_ParamMapType" field="ParamMapTypeID"
        runat="server" />
</asp:Content>
