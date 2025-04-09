<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskSelector.aspx.cs" Inherits="Zhongsoft.Portal.MM.Obsolete.TaskSelector"
    MasterPageFile="~/UI/Master/ObjectSelector.Master" Title="选择任务书" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                委托书编号<zhongsoft:LightTextBox ID="tbTaskCode" MaxLength="15" runat="server" CssClass="kpms-textbox"
                    Width="120px"></zhongsoft:LightTextBox>
                委托书名称<zhongsoft:LightTextBox ID="tbTaskName" MaxLength="15" runat="server" Width="120px"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvTask" AllowPaging="true"
        PageSize="10" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true"
        BindGridViewMethod="DoSelectByFilter" OnJsonClick="addObject" JsonClickMode="onclick"
        DataKeyNames="TaskInfoID" ShowJsonRowColName="true">
        <Columns>
            <zhongsoft:LightBoundField DataField="TaskCode" HeaderText="委托书编号" ItemStyle-Width="10%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TaskName" HeaderText="委托书名称">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
