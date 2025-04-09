<%@ Page Language="C#" AutoEventWireup="true" Title="选择专业" MasterPageFile="~/UI/Master/ObjectSelector.Master"
    CodeBehind="SpecialtySelector.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.Obsolete.SpecialtySelector" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                专业代字/名称
                <zhongsoft:LightTextBox ID="tbName" runat="server" Width="120px"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvList" AllowPaging="true"
        runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true" BindGridViewMethod="DoSelectByFilter"
        OnJsonClick="addObject" JsonClickMode="onclick" DataKeyNames="ParamSpecialtyId"
        ShowJsonRowColName="true" OnRowDataBound="gvList_RowDataBound">
        <Columns>
            <zhongsoft:LightBoundField DataField="ParamSpecialtyId" HeaderText="专业ID" Visible="false" />
            <zhongsoft:LightBoundField DataField="SpecialtyCode" HeaderText="专业代字" />
            <zhongsoft:LightBoundField DataField="SpecialtyName" HeaderText="专业名称" />
            <zhongsoft:LightBoundField DataField="SpecialtyType" HeaderText="专业类型">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="所在部门">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbDept"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
 
    </script>
</asp:Content>
