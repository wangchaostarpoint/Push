<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="StdFormForTable.aspx.cs" Inherits="Zhongsoft.Portal.Sys.StandardizedForm.StdFormForTable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                <asp:Button runat="server" ID="btnSingleStd" Text="单个数据处理" OnClick="btnSingleStd_Click" />
                &nbsp;<asp:Button runat="server" ID="btnBatchStd" Text="批量处理" OnClick="btnBatchStd_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
