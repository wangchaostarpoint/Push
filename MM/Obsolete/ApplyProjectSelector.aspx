<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ApplyProjectSelector.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.Obsolete.ApplyProjectSelector" MasterPageFile="~/UI/Master/ObjectSelector.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                项目编号/名称
                <zhongsoft:LightTextBox ID="tbProjectName" runat="server" Width="120px"></zhongsoft:LightTextBox>
            </td>
            <td>
                项目设总
                <zhongsoft:LightTextBox ID="tbMaster" runat="server" Width="120px"></zhongsoft:LightTextBox>
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
            <zhongsoft:LightBoundField DataField="PROJECTCODE" HeaderText="项目编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PROJECTNAME" HeaderText="项目名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="DESIGNNAME" HeaderText="项目设总">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
