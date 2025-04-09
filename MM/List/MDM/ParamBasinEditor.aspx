<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ParamBasinEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.List.MDM.ParamBasinEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                流域名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbParamBasinName" field="ParamBasinName"
                    req="1" MaxLength="16" tablename="MDM_ParamBasin" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                排序
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbSort" runat="server" MaxLength="3" TableName="MDM_ParamBasin"
                    Field="SORT" ActiveStatus="(23.*)" regex="^[0-9]\d{0,3}$" errmsg="请输入整数" Width="100px" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                备注
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbMemo" TableName="MDM_ParamBasin" activestatus="(23.*)"
                    Field="MEMO" runat="server" CssClass="kpms-textarea" EnableTheming="false" maxtext="512"
                    TextMode="MultiLine"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <!---流域主键ID--->
    <input type="hidden" runat="server" id="hiParamBasinID" field="ParamBasinID" tablename="MDM_ParamBasin" />
    <input type="hidden" runat="server" id="hiFlag" field="Flag" tablename="MDM_ParamBasin" />
    <script>
      
    </script>
</asp:Content>
