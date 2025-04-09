<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Master/ObjectSelector.Master"
    AutoEventWireup="true" CodeBehind="XPageSelector.aspx.cs" Inherits="Zhongsoft.Portal.Custom.List.XPageSelector" %>

<%@ Register Assembly="Zhongsoft.Portal.UI.Controls" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    页面名称<asp:TextBox ID="tbName" MaxLength="20" runat="server" Width="120px"></asp:TextBox>
    <asp:LinkButton runat="server" ID="btnQuery" OnClick="btnQuery_Click" CssClass="kpms-btn">
    <img   src="../../Themes/Images/btn_search.gif" /><span>查询</span>
    </asp:LinkButton>
    <asp:LinkButton runat="server" CssClass="kpms-btn" ID="btnReset" OnClick="btnReset_Click">
                     <img  src="../../Themes/Images/btn_empty.gif"/><span>重置</span>
    </asp:LinkButton>
    <asp:LinkButton runat="server" ID="btnAdd" class="kpms-btn" OnClick="btnAdd_Click"
        OnClientClick="return addXPage();">
                     <img  src="../../Themes/Images/btn_new.gif"/><span>新建页面</span>
    </asp:LinkButton>

    <script>
        function addXPage() {
            var url = "XPageEditor.aspx?actionType=2";
            if (showModal(encodeURI(url), null, 1000, 700) == undefined) {
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
            <asp:BoundField DataField="PageName" HeaderText="页面名称" />
            <asp:BoundField DataField="CreateUserName" HeaderText="创建人" />
            <asp:BoundField DataField="CreateDate" HeaderText="创建日期" DataFormatString="{0:yyyy-MM-dd}" />
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
