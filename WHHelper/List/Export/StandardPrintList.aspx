<%@ Page Title="标准表单导出配置" Language="C#" MasterPageFile="~/UI/Master/ObjectWhList.Master" AutoEventWireup="true" CodeBehind="StandardPrintList.aspx.cs" Inherits="Zhongsoft.Portal.WHHelper.List.Export.StandardPrintList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block">
        <span class="filter-block-lb">标准表单名称</span>
        <span>
            <zhongsoft:LightTextBox ID="ltbStandardName" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false" Width="120px"></zhongsoft:LightTextBox>
        </span>
    </span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true" AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" BindGridViewMethod="BindData"
        ShowExport="true" ShowPageSizeChange="true" PageSize="15" DataKeyNames="StandardExportId">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="30px" OnClientClick="checkGridViewRow"></zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="标准表单名称" DataField="StandardName" ItemStyle-HorizontalAlign="Center" />
             <zhongsoft:LightBoundField HeaderText="关键字" DataField="KeyWord" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="50px" />
            <zhongsoft:LightBoundField HeaderText="标准表单模板" DataField="StandardTemplateName" />
            <zhongsoft:LightTemplateField HeaderText="是否启用" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                <ItemTemplate>
                    <%#Enum.GetName(typeof(Zhongsoft.Portal.BoolType),Convert.ToInt32(Eval("IsUse"))) %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
        <FooterStyle ForeColor="Red" Font-Bold="true" HorizontalAlign="Right" />
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">										
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";
        $KeyUrl = "/WHHelper/List/Export/StandardPrintEditor.aspx";
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
