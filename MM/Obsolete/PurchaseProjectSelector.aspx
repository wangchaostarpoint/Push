<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PurchaseProjectSelector.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.Obsolete.PurchaseProjectSelector" MasterPageFile="~/UI/Master/ObjectSelector.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                项目名称
                <zhongsoft:LightTextBox ID="tbProjName" runat="server" Width="120px"></zhongsoft:LightTextBox>
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
            <zhongsoft:LightBoundField DataField="PROJECTCODE" HeaderText="项目编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PROJECTNAME" HeaderText="项目名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PROJECTMANAGER" HeaderText="项目设总">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PROJECTTYPENAME" HeaderText="工程类型">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
