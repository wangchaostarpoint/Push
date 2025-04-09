<%@ Page Title="全文检索台账" Language="C#" AutoEventWireup="true" CodeBehind="FullTextRetrieval.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Sys.FullTextRetrieval" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
   <span class="filter-block"><span class="filter-block-lb">关键词</span> <span>
        <zhongsoft:LightTextBox ID="tbSearch" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView runat="server" ID="gvList" AllowPaging="true" PageSize="25"
        OnRowDataBound="gvList_RowDataBound" BindGridViewMethod="BindData" AutoGenerateColumns="false"
        UseDefaultDataSource="true" EmptyDataText="没有文件信息">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="文件名" HeaderStyle-Width="20%">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="btnView" fileId='<%#Eval("Id")%>' fileName='<%#Eval("Name")%>'
                        storage='<%#Eval("Storage")%>' filePath='<%#Eval("Path")%>' EnableTheming="false">
                          <span ><%#Eval("Title") %> </span>
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="摘要" HeaderStyle-Width="75%">
                <ItemTemplate>
                    <%#Eval("Abstract")%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="下载" HeaderStyle-Width="5%" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <a runat="server" id="aLoad"><span style="color: Blue">下载</span> </a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        function onlineView(filePath, fileName) {
            if (filePath.length > 0 && fileName.length > 0) {
                var url = buildQueryUrl("/Sys/FileView/OnlineView.aspx", { "fileName": fileName, "filePath": filePath });
                window.open(url);
            }
            return false;
        }   

    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
