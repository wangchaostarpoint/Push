<%@ Page Title="选择插件-Plugin" Language="C#" MasterPageFile="~/UI/Master/ObjectSelector.Master"
    AutoEventWireup="true" CodeBehind="PluginSelector.aspx.cs" Inherits="Zhongsoft.Portal.BDM.List.PluginSelector" %>

<asp:Content ID="Content3" ContentPlaceHolderID="toolTip" runat="server">
    在搜索文本框中填写插件信息可以快速找到你要选择的插件。
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    插件名称
    <asp:TextBox ID="tbPluginName" runat="server" Width="150px" MaxLength="60"></asp:TextBox>
    程序集名称
    <asp:TextBox ID="tbAssemblyName" runat="server" Width="150px" MaxLength="60"></asp:TextBox>
    <br /><br />
    类型名称
    <asp:TextBox ID="tbClassName" runat="server" Width="150px" MaxLength="60"></asp:TextBox>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvList" AllowPaging="true"
        ShowJsonRowColName="true" PageSize="10" runat="server" AutoGenerateColumns="false"
        UseDefaultDataSource="true" BindGridViewMethod="LoadData" OnJsonClick="addObject"
        JsonClickMode="onclick">
        <Columns>
            <asp:BoundField HeaderText="插件名称" DataField="PluginName" />
            <asp:BoundField HeaderText="程序集名称" DataField="AssemblyName" />
            <asp:BoundField HeaderText="类型名称" DataField="ClassName" />
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
