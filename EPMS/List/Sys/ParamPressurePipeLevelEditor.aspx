<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ParamPressurePipeLevelEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Sys.ParamPressurePipeLevelEditor" Title="压力管道级别详细页面"
    MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                压力管道级别<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbMedium" TableName="EPMS_ParamPressurePipeLevel"
                    Field="PressurePipeLevel" activestatus="(23.*)" req="1" MaxLength="64"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                排序号<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbSort" TableName="EPMS_ParamPressurePipeLevel" Field="Sort"
                    Style="text-align: right; width: 70px;" activestatus="(23.*)" regex="^[0-9]{0,3}$"
                    errmsg="请输入最多2位整数" runat="server" req="1"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input id="hiParamPressurePipeLevelID" type="hidden" tablename="EPMS_ParamPressurePipeLevel"
        field="ParamPressurePipeLevelID" runat="server" />
    <input id="hiFlag" type="hidden" tablename="EPMS_ParamPressurePipeLevel" field="Flag"
        runat="server" />
    <script>
        function initCustomerPlugin() {
            checkMaxLength();
            checkRegex();
        }
    </script>
</asp:Content>
