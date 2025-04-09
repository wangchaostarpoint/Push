<%@ Page Title="系统参数值选择页面" Language="C#" MasterPageFile="~/UI/Master/ObjectSelector.Master"
    AutoEventWireup="true" CodeBehind="ParamDetailSelector.aspx.cs" Inherits="Zhongsoft.Portal.Sys.ParamDetailSelector" %>

<%@ Register Assembly="Zhongsoft.Portal.UI.Controls" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    参数值名称<asp:TextBox ID="tbName" MaxLength="20" runat="server" Width="120px"></asp:TextBox>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvList" AllowPaging="true"
        PageSize="10" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true"
        OnRowCommand="gvList_RowCommand" OnJsonClick="addObject" JsonClickMode="onclick">
        <Columns>
            <asp:BoundField DataField="ItemText" HeaderText="参数值名称" />
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
