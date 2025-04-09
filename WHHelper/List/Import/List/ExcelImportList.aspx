<%@ Page Title="Excel导入配置" MasterPageFile="~/UI/Master/ObjectWhList.Master" Language="C#" AutoEventWireup="true" CodeBehind="ExcelImportList.aspx.cs" Inherits="Zhongsoft.Portal.WHHelper.List.Import.List.ExcelImportList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block">
        <span class="filter-block-lb">数据库表名</span>
        <span>
            <zhongsoft:LightTextBox ID="tbTableName" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false" Width="120px"></zhongsoft:LightTextBox>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">关键字</span>
        <span>
            <zhongsoft:LightTextBox ID="tbKeyWord" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">列表菜单</span>
        <span>
            <zhongsoft:LightTextBox ID="tbPageName" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server"></asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true" AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" BindGridViewMethod="BindData"
        ShowExport="true" ShowPageSizeChange="true" PageSize="15" DataKeyNames="ImportId">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="30px" OnClientClick="checkGridViewRow"></zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="数据库表名" DataField="TableName" />
            <zhongsoft:LightBoundField HeaderText="关键字" DataField="KeyWord" />
            <zhongsoft:LightBoundField HeaderText="列表菜单" DataField="PageName" />
            <zhongsoft:LightBoundField HeaderText="表说明" DataField="TableDsc" />
            <zhongsoft:LightBoundField HeaderText="Sheet名称" DataField="SheetName" />
            <zhongsoft:LightBoundField HeaderText="表主键" DataField="TableKeyId" />
            <zhongsoft:LightBoundField HeaderText="备注" DataField="Remark" />
        </Columns>
        <FooterStyle ForeColor="Red" Font-Bold="true" HorizontalAlign="Right" />
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">										
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";
        $KeyUrl = "/WHHelper/List/Import/List/ExcelImportEditor.aspx";
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server"></asp:Content>

