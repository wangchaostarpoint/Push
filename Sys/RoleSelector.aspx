<%@ Page Title="角色选择" Language="C#" MasterPageFile="~/UI/Master/ObjectSelector.Master"
    AutoEventWireup="true" CodeBehind="RoleSelector.aspx.cs" Inherits="Zhongsoft.Portal.Sys.RoleSelector" %>

<%@ Register Assembly="Zhongsoft.Portal.UI.Controls" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<asp:Content ID="toolTip" ContentPlaceHolderID="toolTip" runat="server">
    输入您的搜索条件，点击“查找”按钮搜索，在结果中点击信息进行选择。点击“确定”按钮完成选择。
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    角色名<asp:TextBox ID="tbRoleName" MaxLength="10" Width="120px" runat="server"></asp:TextBox>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="RolesList" runat="server" AutoGenerateColumns="false"
        JsonClickMode="onclick"  AllowPaging="true"
        OnJsonClick="addObject" BindGridViewMethod="LoadData" UseDefaultDataSource="true" BindJsonClick="true">
        <Columns>
            <asp:BoundField DataField="RoleName" HeaderText="名称" HeaderStyle-Width="35%" />
            <asp:BoundField DataField="RoleMemo" HeaderText="备注" />
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
