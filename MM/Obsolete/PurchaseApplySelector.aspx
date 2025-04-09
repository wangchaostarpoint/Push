<%@ Page Language="C#" Title="采购申请编号选择页面" AutoEventWireup="true" CodeBehind="PurchaseApplySelector.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.Obsolete.PurchaseApplySelector" MasterPageFile="~/UI/Master/ObjectSelector.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                申请类型（大类）/（小类）
                <zhongsoft:LightTextBox ID="tbApplyType" runat="server" Width="120px"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvList" AllowPaging="true"
        PageSize="10" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true"
        BindGridViewMethod="DoSelectByFilter" OnJsonClick="addObject" JsonClickMode="onclick"
        ShowJsonRowColName="true">
        <Columns>
            <zhongsoft:LightBoundField DataField="APPLYCODE" HeaderText="流水号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="APPLYBIGTYPE" HeaderText="申请类型（大类）">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="APPLYLITTLETYPE" HeaderText="申请类型（小类）">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="APPLYERNAME" HeaderText="申请人">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ESTIMATEDPRICE" HeaderText="估算价格" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <asp:TemplateField HeaderText="采购内容">
                <ItemTemplate>
                    <asp:Label ID="lbPasserName" runat="server" Text='<%# gvList.GetSubString(DataBinder.Eval(Container.DataItem, "PURCHASECONTENT"), 20)%>'
                        ToolTip='<%#Eval("PURCHASECONTENT") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
