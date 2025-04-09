<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SurveyInnerTaskSelector.aspx.cs"
    MasterPageFile="~/UI/Master/ObjectSelector.Master" Inherits="Zhongsoft.Portal.EPMS.Obsolete.SurveyInnerTaskSelector"
    Title="选择勘测内部配合（提出任务）" %>

<%@ Register Assembly="Zhongsoft.Portal" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                项目编号/名称
                <zhongsoft:LightTextBox ID="tbProjectInfo" runat="server" Width="100px"></zhongsoft:LightTextBox>
                卷册编号/名称
                <zhongsoft:LightTextBox ID="tbRollInfo" runat="server" Width="100px"></zhongsoft:LightTextBox>
                接收专业
                <zhongsoft:LightDropDownList runat="server" ID="ddlSpecialtyID" class="kpms-ddlsearch"
                    EnableTheming="false">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" BindJsonClick="true" ID="gvList" AllowPaging="true"
        PageSize="8" AllowFrozing="true" FrozenColNum="4" runat="server" AutoGenerateColumns="false"
        UseDefaultDataSource="true" BindGridViewMethod="DoSelectByFilter" OnJsonClick="addObject"
        JsonClickMode="onclick" DataKeyNames="SurveyInnerID" ShowJsonRowColName="true">
        <Columns>
            <asp:TemplateField HeaderText="序号" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%#Container.DataItemIndex+1 %>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightBoundField DataField="TaskCode" HeaderText="任务编号" SortExpression="TaskCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="项目编号" SortExpression="ProjectCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectName" HeaderText="项目名称" SortExpression="ProjectName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="RollCode" HeaderText="卷册编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="RollName" HeaderText="卷册名称" SortExpression="RollName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="SendSpecialtyName" HeaderText="提出专业">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="SendUserName" HeaderText="提出人">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ReceiveSpecialtyName" HeaderText="接收专业">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ReceiveUserName" HeaderText="接收人">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
