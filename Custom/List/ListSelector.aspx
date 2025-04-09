<%@ Page Title="自定视图页面" Language="C#" MasterPageFile="~/UI/Master/ObjectSelector.Master"
    AutoEventWireup="true" CodeBehind="ListSelector.aspx.cs" Inherits="Zhongsoft.Portal.Custom.List.ListSelector" %>

<%@ Register Assembly="Zhongsoft.Portal.UI.Controls" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    类型
    <asp:DropDownList runat="server" ID="ddlViewType" Width="120px">
    </asp:DropDownList>
    名称
    <asp:TextBox ID="tbName" MaxLength="20" runat="server" Width="120px"></asp:TextBox>
    <script>
        function addXList() {
            var url = "ListEditor.aspx?actionType=2&&IsCustom=1&IsBaseView=1";
            if (showModal(encodeURI(url), null, 1100, 700) == undefined) {
                return false;
            }
            return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvList" AllowPaging="true"
        PageSize="10" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true"
        OnRowCommand="gvList_RowCommand" OnJsonClick="addObject" JsonClickMode="onclick">
        <Columns>
            <asp:BoundField DataField="ListName" HeaderText="名称" />
               <asp:BoundField DataField="ListCode" HeaderText="编号" />
            <asp:BoundField DataField="CreateUserName" HeaderText="创建人" />
            <asp:BoundField DataField="CreateDate" HeaderText="创建日期" DataFormatString="{0:yyyy-MM-dd}" />
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
