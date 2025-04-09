<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BidPlanSelector.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.Obsolete.BidPlanSelector" MasterPageFile="~/UI/Master/ObjectSelector.Master"
    Title="选择投标计划安排" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                任务名称<zhongsoft:LightTextBox ID="tbTaskName" runat="server" Width="120px"></zhongsoft:LightTextBox>
                招标编号<zhongsoft:LightTextBox ID="tbBidNumber" runat="server" Width="120px"></zhongsoft:LightTextBox>
                招标单位名称<zhongsoft:LightTextBox ID="tbCustomerName" runat="server" Width="120px"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvProject" AllowPaging="true"
        PageSize="10" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true"
        OnJsonClick="addObject" JsonClickMode="onclick" BindGridViewMethod="DoSelectByFilter"
        ShowJsonRowColName="true">
        <Columns>
            <asp:BoundField HeaderText="招标编号" DataField="BIDNUMBER" />
            <asp:BoundField HeaderText="任务名称" DataField="TASKNAME" />
            <zhongsoft:LightBoundField DataField="STARTBIDDAY" HeaderText="开标日期" ItemStyle-HorizontalAlign="center"
                DataFormatString="{0:yyyy-MM-dd}" />
            <asp:BoundField HeaderText="相关部门" DataField="RELEVANTDEPTNAME" />
            <asp:BoundField HeaderText="招标单位" DataField="CUSTOMERNAME" />
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
