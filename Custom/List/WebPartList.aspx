<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true"
    CodeBehind="WebPartList.aspx.cs" Inherits="Zhongsoft.Portal.Custom.List.WebPartList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" DataKeyNames="ViewId,ListId"
        AutoGenerateColumns="False" HideFieldOnExport="编辑,删除" OnChangeSize="changeSize"
        BindGridViewMethod="BindListGrid" OnRowDataBound="gvList_RowDataBound" ShowExport="true"
        AllowPaging="True">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全部" OnClientClick="checkList">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightBoundField DataField="ListName" HeaderText="列表名称" HeaderStyle-Width="300px"
                ItemStyle-Width="300px" EditItemClick="editList" DataParamFields="ViewId">
            </zhongsoft:LightBoundField>
            <asp:BoundField DataField="ListCode" HeaderText="列表编号" HeaderStyle-Width="300px"
                ItemStyle-Width="300px" />
            <asp:BoundField DataField="CreateUserName" HeaderText="创建人" HeaderStyle-HorizontalAlign="Justify"
                HeaderStyle-Width="200px" ItemStyle-Width="200px" />
            <asp:BoundField DataField="CreateDate" HeaderText="创建时间" DataFormatString="{0:yyyy-MM-dd}"
                HeaderStyle-Width="200px" ItemStyle-Width="200px" />
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
