<%@ Page Title="选择表单" Language="C#" MasterPageFile="~/UI/Master/ObjectSelector.Master"
    AutoEventWireup="true" CodeBehind="UserFormSelector.aspx.cs" Inherits="Zhongsoft.Portal.Sys.UserFormSelector" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                名称<asp:TextBox ID="tbName" MaxLength="20" runat="server" Width="120px"></asp:TextBox>
                分类<asp:DropDownList runat="server" ID="ddlFormType" CssClass="kpms-ddl" Width="120px"
                    AutoPostBack="true" OnSelectedIndexChanged="ddlFormType_SelectedIndexChanged">
                </asp:DropDownList>
                表单类型
                <asp:DropDownList runat="server" ID="ddlType" Width="120px" EnableTheming="false">
                </asp:DropDownList>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <table>
        <tr>
            <td  valign="top" class="selector-tree">
                <asp:TreeView ID="treeModule" runat="server" Height="100%" Width="100%" ShowLines="true"
                    OnSelectedNodeChanged="treeModule_Change">
                    <SelectedNodeStyle BackColor="#F7F7F7" />
                </asp:TreeView>
            </td>
            <td valign="top" width="100%">
                <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvList" AllowPaging="true"
                    PageSize="10" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true"
                    OnRowCommand="gvList_RowCommand" OnJsonClick="addObject" JsonClickMode="onclick"
                    Width="100%">
                    <Columns>
                        <asp:BoundField DataField="FormCode" HeaderText="编号" />
                        <asp:BoundField DataField="FormName" HeaderText="名称" />
                        <asp:BoundField DataField="FormTypeName" HeaderText="类别" />
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
</asp:Content>
