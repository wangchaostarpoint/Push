<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true"
    CodeBehind="UserContactsList.aspx.cs" Inherits="Zhongsoft.Portal.Sys.OrgUsers.UserContactsList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">工号/姓名(拼音简写)</span> <span>
        <asp:TextBox ID="tbUserCode" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></asp:TextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView runat="server" ID="gvList" UseDefaultDataSource="True"
        AllowPaging="true" PageSize="15" AutoGenerateColumns="False" BindGridViewMethod="BindData">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="20px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="工号" DataField="UserCode" />
            <zhongsoft:LightBoundField HeaderText="姓名" DataField="UserName" />
            <zhongsoft:LightBoundField HeaderText="性别" DataField="Sex" />
            <zhongsoft:LightBoundField HeaderText="部门" DataField="OrgUnitName" />
            <zhongsoft:LightBoundField HeaderText="座机号码" DataField="Phone" />
            <zhongsoft:LightBoundField HeaderText="手机号码" DataField="MobilePhone" Visible="false" />
            <zhongsoft:LightBoundField HeaderText="房间号" DataField="SEATNO"/>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
