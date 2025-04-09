<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectTaskSelector.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.Obsolete.ProjectTaskSelector" MasterPageFile="~/UI/Master/ObjectSelector.Master"
    Title="选择工程立项审批单" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                委托书编号<zhongsoft:LightTextBox ID="tbProXYNum" runat="server" Width="120px"></zhongsoft:LightTextBox>
                经营经理<zhongsoft:LightTextBox ID="tbManagerName" runat="server" Width="120px"></zhongsoft:LightTextBox>
                任务名称<zhongsoft:LightTextBox ID="tbTaskName" runat="server" Width="120px"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvProjectTask" AllowPaging="true"
        PageSize="8" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true"
        OnJsonClick="addObject" JsonClickMode="onclick" BindGridViewMethod="DoSelectByFilter"
        ShowJsonRowColName="true">
        <Columns>
            <asp:BoundField HeaderText="委托书编号" DataField="PROXYNUMBER" />
            <asp:BoundField HeaderText="任务名称" DataField="TASKNAME" />
            <asp:BoundField HeaderText="工程类型" DataField="PROJECTTYPENAME" />
            <asp:BoundField HeaderText="服务类型" DataField="SERVICETYPE" />
            <asp:BoundField HeaderText="经营经理" DataField="MANAGERNAME" />
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
