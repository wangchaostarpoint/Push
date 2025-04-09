<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectDeptValueSelector.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Obsolete.ProjectDeptValueSelector" Title="选择项目"
    MasterPageFile="~/UI/Master/ObjectSelector.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                项目编号/名称
                <zhongsoft:LightTextBox ID="tbName" runat="server" Width="120px"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvList" AllowPaging="true"
        runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true" BindGridViewMethod="DoSelectByFilter"
        OnJsonClick="addObject" JsonClickMode="onclick" DataKeyNames="ProjectDeptValueID"
        ShowJsonRowColName="true" OnRowDataBound="gvList_RowDataBound">
        <Columns>
            <zhongsoft:LightBoundField DataField="ProjectName" HeaderText="项目名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="SingleName" HeaderText="单项">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="DeptName" HeaderText="部门">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="AllotValue" HeaderText="分配产值" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
    
    </script>
</asp:Content>
