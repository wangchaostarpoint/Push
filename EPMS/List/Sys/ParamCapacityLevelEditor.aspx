<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ParamCapacityLevelEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Sys.ParamCapacityLevelEditor" Title="容量等级详细"
    MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                项目类型<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightDropDownList runat="server" ID="ddlProjType" TableName="EPMS_ParamCapacityLevel"
                    Field="ProjectType" activestatus="(23.*)" req="1">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                容量等级<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
               <zhongsoft:LightTextBox runat="server" ID="tbCapacityLevel" TableName="EPMS_ParamCapacityLevel"
                    Field="CapacityLevel" activestatus="(23.*)" req="1"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                备注
            </td>
            <td class="td-m" colspan="3">
               <zhongsoft:LightTextBox runat="server" ID="tbMemo" TableName="EPMS_ParamCapacityLevel"
                    Field="Memo" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                排序号
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbSort" TableName="EPMS_ParamCapacityLevel" Field="SORT"
                    Style="text-align: right; width: 70px;" activestatus="(23.*)" regex="^[1-9]{0,2}$"
                    errmsg="请输入最多2位整数" runat="server"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                是否启用
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rblFlag" RepeatDirection="Horizontal" TableName="EPMS_ParamCapacityLevel"
                    Field="FLAG" activestatus="(23.*)">
                    <asp:ListItem Value="1" Selected="True">启用</asp:ListItem>
                    <asp:ListItem Value="0">不启用</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
    </table>
    <input id="hikeyID" type="hidden" tablename="EPMS_ParamCapacityLevel" field="ParamCapacityLevelID"
        runat="server" />
    <script type="text/javascript">
    </script>
</asp:Content>
