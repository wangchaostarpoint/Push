<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WBSVerifyPoint.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Product.WBSVerifyPoint" %>
<zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvVerifyPoint" AllowPaging="true"
    PageSize="2000" ShowExport="true" AutoGenerateColumns="false" AllowSorting="true"
    UseDefaultDataSource="true" BindGridViewMethod="BindGrid" EmptyDataText="没有校审要点">
    <Columns>
        <zhongsoft:LightTemplateField ItemStyle-Width="30px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <%# Container.DataItemIndex+1 %>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightBoundField DataField="VerifyRole" HeaderText="校审角色" SortExpression="VerifyRole"
            ItemStyle-Width="100px" />
        <zhongsoft:LightBoundField DataField="VerifyPoint" HeaderText="校审要点" ShowToolTip="true"
            HeaderStyle-Width="650px">
        </zhongsoft:LightBoundField>
        <zhongsoft:LightCheckField HeaderText="符合" HeaderStyle-Width="40px" Visible="false">
        </zhongsoft:LightCheckField>
    </Columns>
</zhongsoft:LightPowerGridView>
