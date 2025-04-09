<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="AutoGeneralCode.aspx.cs" Inherits="Zhongsoft.Portal.Sys.AutoGeneralCode" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                数据表
            </td>
            <td>
                <asp:DropDownList ID="ddlTable" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlTable_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td>
                字段显示
            </td>
            <td>
                <asp:DropDownList ID="ddlColumn" runat="server">
                </asp:DropDownList>
            </td>
            <td>
                表格
            </td>
            <td>
                <asp:TextBox ID="tbColumnNum" runat="server" Width="40px" MaxLength="2">3</asp:TextBox>*2列
            </td>
        </tr>
        <tr>
            <td colspan="3">
            </td>
            <td colspan="3">
                <asp:DropDownList ID="ddlModule" runat="server" Width="80px">
                    <asp:ListItem Value="EPMS">生产管理</asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="btnClassCode" runat="server" Text="类代码" OnClick="btnClassCode_Click" />
                <asp:Button ID="btnUICode" runat="server" Text="前端代码" OnClick="btnUICode_Click">
                </asp:Button>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <asp:TextBox ID="tbCodes" runat="server" CssClass="kpms_textarea" Height="370px"
        EnableTheming="false" Width="100%" TextMode="MultiLine"></asp:TextBox>
</asp:Content>
