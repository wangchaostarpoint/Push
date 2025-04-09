<%@ Page Title="帮助信息类目台账" MasterPageFile="~/UI/Master/ObjectList.Master"
    Language="C#" AutoEventWireup="true" CodeBehind="ContentList.aspx.cs" Inherits="Zhongsoft.Portal.WHHelper.List.ContentList" %>


<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block">
        <span class="filter-block-lb">类目名称</span>
        <span>
            <zhongsoft:LightTextBox ID="tbTitle" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>
    
</asp:Content>
<asp:Content ID="Content13" ContentPlaceHolderID="toolBtn" runat="server">
      <asp:LinkButton runat="server" ID="LinkButton1" class="searchbtn"
        OnClientClick="return EditCatalog('','2');">
                     <span>添加目录</span>
    </asp:LinkButton>
    <asp:LinkButton runat="server" ID="btnNew1" class="searchbtn" Visible="false"
        OnClientClick="return EditView('','2');">
                     <span>新建内容</span>
    </asp:LinkButton>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" AllowPaging="true" PageSize="15" AutoGenerateColumns="false"
        runat="server" ShowExport="true" DataKeyNames="CatalogId" UseDefaultDataSource="true"
        OnRowCommand="gvList_RowCommand" OnRowDataBound="gvList_RowDataBound"
        Width="100%" RowStyle-Height="28px">
        <Columns>
            <zhongsoft:LightBoundField HeaderText="编号" DataField="CatalogCode" />
            <zhongsoft:LightBoundField HeaderText="目录名称" DataField="CatalogName" />
            <zhongsoft:LightBoundField HeaderText="说明" DataField="Remark" /> 
            <zhongsoft:LightBoundField HeaderText="序号" DataField="Sort" /> 
            <zhongsoft:LightButtonField CommandName="ViewData" HeaderText="查看" CausesValidation="false"
                EditIdField="CatalogId" EditPageWidth="600px" EditPageHeight="300px" EditPageUrl="CatalogEditor.aspx">
            </zhongsoft:LightButtonField>
            <zhongsoft:LightButtonField CommandName="EditData" HeaderText="编辑" CausesValidation="false"
                EditIdField="CatalogId" EditPageWidth="600px" EditPageHeight="300px" EditPageUrl="CatalogEditor.aspx">
            </zhongsoft:LightButtonField>
            <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" CausesValidation="false">
            </zhongsoft:LightButtonField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
          function EditCatalog(id, acType) {
            var pid = "<%= ParentId%>";
           var url = buildQueryUrl("WHHelper/List/CatalogEditor.aspx", { actionType: 2, pid: pid });
            if (acType != "2") {
                url = buildQueryUrl("WHHelper/List/CatalogEditor.aspx", { actionType: acType, bizId: id });
            }
            showDivDialog(url, null, 1100, 700, rebindGridData);
            return false;

        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
