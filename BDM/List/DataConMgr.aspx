<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true"
    CodeBehind="DataConMgr.aspx.cs" Inherits="Zhongsoft.Portal.BDM.List.DataConMgr" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                连接名
            </td>
            <td>
                <asp:TextBox ID="tbInfo" runat="server" EnableViewState="true">
                </asp:TextBox>
            </td>
            <td>
                类型
            </td>
            <td>
                <asp:DropDownList runat="server" ID="ddlSqlType">
                </asp:DropDownList>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" DataKeyNames="Id" AutoGenerateColumns="False"
        AllowPaging="True" BindGridViewMethod="BindGrid" OnRowDataBound="gvList_RowDataBound">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <asp:BoundField DataField="Name" HeaderText="连接名" HeaderStyle-Width="15%" />
            <asp:BoundField DataField="ConnectionString" HeaderText="连接串" />
            <asp:TemplateField HeaderStyle-Width="15%" ItemStyle-HorizontalAlign="Center" HeaderText="类型">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lblSqlType"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        $gridCheckedClientID = "<%=this.gvList.CheckedClientID %>";
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
