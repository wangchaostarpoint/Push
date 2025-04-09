<%@ Page Language="C#" AutoEventWireup="true" Title="选择模板适用范围" MasterPageFile="~/UI/Master/ObjectSelector.Master"
    CodeBehind="TemplateUsingRangeSelector.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.Obsolete.TemplateUsingRangeSelector" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                关键词
                <zhongsoft:LightTextBox ID="tbName" runat="server" Width="120px"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvList" AllowPaging="true"
        runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true" BindGridViewMethod="DoSelectByFilter"
        OnJsonClick="addObject" JsonClickMode="onclick" DataKeyNames="TemplateUsingRangeID"
        ShowJsonRowColName="true">
        <Columns>
            <zhongsoft:LightBoundField DataField="TemplateUsingRangeID" HeaderText="ID" Visible="false" />
            <zhongsoft:LightBoundField DataField="KeyWord" HeaderText="关键词" />
            <zhongsoft:LightBoundField DataField="Description" HeaderText="描述" />
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
