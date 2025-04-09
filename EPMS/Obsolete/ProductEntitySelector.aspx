<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductEntitySelector.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Obsolete.ProductEntitySelector" MasterPageFile="~/UI/Master/ObjectSelector.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                项目名称/编号
                <zhongsoft:LightTextBox ID="tbProjectInfo" runat="server" Width="120px"></zhongsoft:LightTextBox>
                卷册名称/编号
                <zhongsoft:LightTextBox ID="tbRollInfo" runat="server" Width="120px"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvList" AllowPaging="true"
        Width="100%" PageSize="10" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true"
        BindGridViewMethod="DoSelectByFilter" OnJsonClick="addObject" JsonClickMode="onclick"
        DataKeyNames="ProductID" ShowJsonRowColName="true">
        <Columns>
            <zhongsoft:LightTemplateField ItemStyle-Width="40px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="项目编号" ItemStyle-Width="10%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectName" HeaderText="项目名称" ItemStyle-Width="200px"
                MaxLength="20">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="任务编号" ItemStyle-Width="10%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSName" HeaderText="任务名称" ItemStyle-Width="10%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProductCode" HeaderText="成品编号" ItemStyle-Width="200px"
                MaxLength="20">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProductName" HeaderText="成品名称">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
