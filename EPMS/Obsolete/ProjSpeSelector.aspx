<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjSpeSelector.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Obsolete.ProjSpeSelector" MasterPageFile="~/UI/Master/ObjectSelector.Master" %>

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
        OnJsonClick="addObject" JsonClickMode="onclick" DataKeyNames="ProjectSpecialtyID"
        ShowJsonRowColName="true">
        <Columns>
            <zhongsoft:LightBoundField DataField="SpecialtyCode" HeaderText="专业代字" />
            <zhongsoft:LightBoundField DataField="SpecialtyName" HeaderText="专业名称" />
            <zhongsoft:LightBoundField DataField="DeptName" HeaderText="所在部门">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
 
    </script>
</asp:Content>
