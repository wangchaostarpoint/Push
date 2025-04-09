<%@ Page Title="选择程序集" Language="C#" MasterPageFile="~/UI/Master/ObjectSelector.Master"
    AutoEventWireup="true" CodeBehind="AssemblySelector.aspx.cs" Inherits="Zhongsoft.Portal.BDM.List.AssemblySelector" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    名称<asp:TextBox ID="tbName" runat="server" MaxLength="60"></asp:TextBox>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolTip" runat="server">
    在搜索文本框中填写程序集名称可以快速找到你要选择的程序集。
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvAssembly" AllowPaging="true"
        PageSize="10" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true"
        OnRowCommand="gvList_RowCommand" OnJsonClick="addObject" JsonClickMode="onclick">
        <Columns>
            <asp:BoundField HeaderText="程序集名称" DataField="AssemblyName" />
            <asp:BoundField HeaderText="说明" DataField="Memo" />
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
