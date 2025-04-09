<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ParamPipeMediumEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Sys.ParamPipeMediumEditor" Title="管道介质详细页面"
    MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                介质名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbMedium" TableName="EPMS_ParamPipeMedium"
                    Field="PipeMediumName" activestatus="(23.*)" req="1" MaxLength="64"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                父级介质
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlParentMedium" runat="server" TableName="EPMS_ParamPipeMedium"
                    Field="ParentID" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                排序号<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbSort" TableName="EPMS_ParamPipeMedium" Field="Sort"
                    Style="text-align: right; width: 70px;" activestatus="(23.*)" regex="^[0-9]{0,3}$"
                    errmsg="请输入最多2位整数" runat="server" req="1"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input id="hiParamPipeMediumID" type="hidden" tablename="EPMS_ParamPipeMedium" field="ParamPipeMediumID"
        runat="server" />
    <script>
        function initCustomerPlugin() {
            checkMaxLength();
            checkRegex();
        }
    </script>
</asp:Content>
