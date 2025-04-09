<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BidPackageSelector.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.Obsolete.BidPackageSelector" MasterPageFile="~/UI/Master/ObjectSelector.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                包名称<zhongsoft:LightTextBox ID="tbPackageName" runat="server" Width="120px"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvPackage" AllowPaging="true"
        PageSize="8" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true"
        OnJsonClick="addObject" JsonClickMode="onclick" BindGridViewMethod="DoSelectByFilter"
        ShowJsonRowColName="true">
        <Columns>
            <asp:BoundField HeaderText="包名称" DataField="PACKAGENAME" />
            <asp:BoundField HeaderText="包号" DataField="PACKAGENUMBER" />
            <asp:BoundField HeaderText="标段号" DataField="BIDNUM" />
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
