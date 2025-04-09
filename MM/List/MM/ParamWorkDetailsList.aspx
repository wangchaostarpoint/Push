<%@ Page Title="前期项目工作任务参数" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master"
    AutoEventWireup="true" CodeBehind="ParamWorkDetailsList.aspx.cs" Inherits="Zhongsoft.Portal.MM.List.MM.ParamWorkDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:TreeGridView ID="gvList" runat="server" AutoGenerateColumns="false" ShowExport="true"
        AllowPaging="true" PageSize="10" UseDefaultDataSource="true" ShowPageSizeChange="true"
        BindGridViewMethod="BindDataGrid" OnRowDataBound="gvList_RowDataBound" SelfIdColumn="ParamWorkDetailsID"
        ParentIdColumn="ParentId" DataKeyNames="ParamWorkDetailsID,ParentID,IsShowInList,Flag">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" ItemStyle-Width="15px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="20px">
                <ItemTemplate>
                    <%# gvList.CreateHeader(Container.DataItem)%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="工作名称" DataField="WorkName" HtmlEncode="false"
                ItemStyle-Width="15%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="工作内容" DataField="WorkContent" ItemStyle-Width="65%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="是否启用" DataField="Flag" ItemStyle-Width="15%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="是否在汇总表展示" DataField="IsShowInList" ItemStyle-Width="15%">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:TreeGridView>
    <script type="text/javascript">
        $gridCheckedClientID = "<%=this.gvList.CheckedClientID %>";
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
