<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductTypeReferNameList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Sys.ProductTypeReferNameList"
    MasterPageFile="~/UI/Master/ObjectList.Master" Title="图纸名称对应成品等级设置" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">图纸名称</span> <span>
        <zhongsoft:LightTextBox ID="tbName" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">专业名称</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlSpe" />
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
        PageSize="100" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
        DataKeyNames="ProductTypeReferNameID" UseDefaultDataSource="true" BindGridViewMethod="BindGrid"
        OnRowDataBound="gvList_RowDataBound">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" HeaderStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="ProductName" HeaderText="图纸名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="SpecialityName" HeaderText="专业名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProductType" HeaderText="成品等级">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProductTypeForShort" HeaderText="成品等级简称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="Memo" HeaderText="描述" ShowToolTip="true"
                HeaderStyle-Width="300px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="是否启用">
                <ItemTemplate>
                    <asp:RadioButtonList runat="server" ID="rbl" RepeatDirection="Horizontal" key='<%#Eval("ProductTypeReferNameID") %>'
                        OnSelectedIndexChanged="rbl_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem Value="1">启用</asp:ListItem>
                        <asp:ListItem Value="0">不启用</asp:ListItem>
                    </asp:RadioButtonList>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script>
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
