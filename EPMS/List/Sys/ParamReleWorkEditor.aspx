<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ParamReleWorkEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Sys.ParamReleWorkEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                出版类型名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightDropDownList runat="server" ID="ddlConsignTypeID" activestatus="(23.*)"
                    req="1" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                包含工种<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <asp:CheckBoxList ID="cblWorkTypeID" runat="server" activestatus="(23.*)" req="1"
                    RepeatColumns="4" RepeatDirection="Horizontal" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                排序号
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbSort" TableName="EPMS_ParamConsignType" Field="Sort"
                    Style="text-align: right; width: 70px;" activestatus="(23.*)" regex="^[1-9]\d*$"
                    errmsg="请输入最多2位整数" runat="server" MaxLength="2"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                是否启用
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rblFlag" RepeatDirection="Horizontal" TableName="EPMS_ParamConsignType"
                    Field="FLAG" activestatus="(23.*)">
                    <asp:ListItem Value="1" Selected="True">启用</asp:ListItem>
                    <asp:ListItem Value="0">不启用</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                描述
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbMemo" TableName="EPMS_ParamConsignType"
                    Field="Memo" activestatus="(23.*)" MaxLength="1024" CssClass="kpms-textarea"
                    EnableTheming="false" TextMode="MultiLine" Rows="3"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input id="hiConsignTypeID" type="hidden" tablename="EPMS_ParamConsignType" field="ConsignTypeID"
        runat="server" />
    <input id="hiConsignTypeName" type="hidden" tablename="EPMS_ParamConsignType" field="ConsignTypeName"
        runat="server" />
    <script>
        function initCustomerPlugin() {
            checkMaxLength();
            checkRegex();
        }
    </script>
</asp:Content>
