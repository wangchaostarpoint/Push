<%@ Page Language="C#" AutoEventWireup="true" Title="历史版本" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="ProductVersionList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Product.ProductVersionList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="false"
        PageSize="100" AutoGenerateColumns="false" ShowExport="true" DataKeyNames="ProductVersionID"
        UseDefaultDataSource="true" BindGridViewMethod="BindGrid" EmptyDataText="没有历史版本信息">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="VersionNumber" HeaderText="版本号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProductCode" HeaderText="成品编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProductName" HeaderText="成品名称" DataParamFields="ProductVersionID"
                DialogMode="Normal" EditItemClick="dowmloadVersion">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="CreateDate" HeaderText="日期" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script>
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";

        //下载版本文件
        function dowmloadVersion(vid) {
            var json = { FileType: 'version', FileId: vid };
            var url = buildQueryUrl('Sys/Handler/FileDownloadHandler.ashx', json);
            window.open(url);
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
