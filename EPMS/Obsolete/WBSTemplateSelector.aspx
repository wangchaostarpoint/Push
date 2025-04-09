<%@ Page Language="C#" AutoEventWireup="true" Title="选择任务模板" MasterPageFile="~/UI/Master/ObjectSelector.Master"
    CodeBehind="WBSTemplateSelector.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.Obsolete.WBSTemplateSelector" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                任务编号/名称
                <zhongsoft:LightTextBox ID="tbName" runat="server" Width="120px"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvList" AllowPaging="true"
        runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true" BindGridViewMethod="DoSelectByFilter"
        OnJsonClick="addObject" JsonClickMode="onclick" DataKeyNames="WBSTemplateID"
        ShowJsonRowColName="true" OnRowDataBound="gvList_RowDataBound">
        <Columns>
            <zhongsoft:LightBoundField DataField="WBSType" HeaderText="任务类别">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="任务编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSName" HeaderText="任务名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="SerialCode" HeaderText="成品号（校验号）">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSWay" HeaderText="任务作业（系统）方式">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSFlag" HeaderText="任务标识">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="BelongModule" HeaderText="所属模块（系统、区域）">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="BelongSpecialtyName" HeaderText="所属专业">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
 
    </script>
</asp:Content>
