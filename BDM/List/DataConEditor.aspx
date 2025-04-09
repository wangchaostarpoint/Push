<%@ Page Title="数据连接编辑页" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="DataConEditor.aspx.cs" Inherits="Zhongsoft.Portal.BDM.List.DataConEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                类型<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <asp:RadioButtonList runat="server" ID="rbtnSqlType" field="SqlType" tablename="BD_DataCon"
                    req="1" RepeatDirection="Horizontal" activestatus="(23.*)">
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                连接名<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox runat="server" ID="tbName" field="Name" tablename="BD_DataCon"
                    req="1" DataType="EnStr" MaxLength="50" activestatus="(2.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                连接串<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox runat="server" ID="tbConnectionString" field="ConnectionString"
                    EnableTheming="false" CssClass="kpms-textarea" TextMode="MultiLine" tablename="BD_DataCon"
                    maxtext="500" req="1" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                密码<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <asp:TextBox runat="server" ID="tbPassword" field="Password" TextMode="Password"
                    MaxLength="20" req="1" tablename="BD_DataCon" activestatus="(23.*)"></asp:TextBox>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiId" field="Id" tablename="BD_DataCon" />
</asp:Content>
