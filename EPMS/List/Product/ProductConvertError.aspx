<%@ Page Language="C#" AutoEventWireup="true" Title="成品批签错误信息" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="ProductConvertError.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Product.ProductConvertError" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="true"
        PageSize="100" AutoGenerateColumns="false" ShowExport="false" DataKeyNames="ProductCode"
        UseDefaultDataSource="false" BindGridViewMethod="BindGrid">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="ProductCode" HeaderText="成品" HeaderStyle-Width="150px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="SignInfo" HeaderText="批签错误信息" ShowToolTip="true"
                HeaderStyle-Width="350px">
            </zhongsoft:LightBoundField>
            <%--<zhongsoft:LightBoundField DataField="ProjectName" HeaderText="批转Plt" ShowToolTip="true"
                HeaderStyle-Width="150px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectName" HeaderText="批转Pdf" ShowToolTip="true"
                HeaderStyle-Width="150px">
            </zhongsoft:LightBoundField>--%>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
