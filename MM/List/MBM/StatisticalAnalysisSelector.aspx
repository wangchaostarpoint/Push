<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Master/ObjectSelector.Master" AutoEventWireup="true" CodeBehind="StatisticalAnalysisSelector.aspx.cs" Inherits="Zhongsoft.Portal.GM.List.GM.StatisticalAnalysisSelector" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolTip" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
     <table>
        <tr>
            <td>
                竞标成员名称<zhongsoft:LightTextBox ID="tbBidderName" runat="server" Width="120px"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvList" AllowPaging="true"
        PageSize="10" DataKeyNames="BD_BiddingInformationID" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="false"
        BindGridViewMethod="DoSelectByFilter" OnJsonClick="addObject" JsonClickMode="onclick"
        ShowJsonRowColName="true">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" HeaderStyle-Width="40" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <asp:BoundField DataField="BidderName" HeaderText="竞标成员"></asp:BoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
