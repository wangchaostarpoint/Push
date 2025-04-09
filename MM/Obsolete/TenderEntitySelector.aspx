<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TenderEntitySelector.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.Obsolete.TenderEntitySelector" MasterPageFile="~/UI/Master/ObjectSelector.Master"
    Title="选择投标项目" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                工程编号/名称
                <zhongsoft:LightTextBox ID="tbProjectName" runat="server" Width="120px"></zhongsoft:LightTextBox>
                工程类型
                <zhongsoft:LightDropDownList runat="server" ID="ddlProjectType" Width="100px">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvProject" AllowPaging="true"
        PageSize="10" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true"
        BindGridViewMethod="DoSelectByFilter" OnJsonClick="addObject" JsonClickMode="onclick"
        ShowJsonRowColName="true">
        <Columns>
            <%--   <zhongsoft:LightBoundField DataField="BIDNUMBER" HeaderText="招标编号">
            </zhongsoft:LightBoundField>--%>
            <%-- <zhongsoft:LightBoundField DataField="MarketProjectCode" HeaderText="工程编号">
            </zhongsoft:LightBoundField>--%>
            <zhongsoft:LightBoundField DataField="ProjectName" HeaderText="工程名称" Width="200"
                ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectType" HeaderText="工程类别">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="BidUnitName" HeaderText="招标单位" Width="200"
                ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="BidOpenDate" HeaderText="开标时间" DataFormatString="{0:yyyy-MM-dd}"
                ItemStyle-Width="70px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="BidOpenPlace" HeaderText="开标地点" Width="150"
                ShowToolTip="true">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
