<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContranctAndPurcContranct.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.List.MCM.ContranctAndPurcContranct" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    进项合同编号\名称
    <zhongsoft:LightTextBox runat="server" ID="tbContractCode" Width="120"></zhongsoft:LightTextBox>
    外委合同名称\编号
    <zhongsoft:LightTextBox runat="server" ID="tbPurcContractCode" Width="120"></zhongsoft:LightTextBox>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvContract" runat="server" AutoGenerateColumns="false"
        ShowExport="true" AllowPaging="true" PageSize="10" UseDefaultDataSource="true"
        BindGridViewMethod="BindContractGrid" DataKeyNames="CONTRACTCODE">
        <Columns>
            <zhongsoft:LightBoundField HeaderText="进项合同编号" DataField="CONTRACTCODE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="进项合同名称" DataField="CONTRACTNAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="进项合同额" DataField="CONTRACTVALUE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="已收合同额" DataField="HADCHARGE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="外委合同总额" DataField="PURCCONTRACTVALUETOTAL">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="已付合同总额" DataField="PURCHADCHARGETOTAL">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="外委合同编号" DataField="PURCCONTRACTCODE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="外委合同名称" DataField="PURCCONTRACTNAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="阶段项目名称" DataField="PROJECTNAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="外委合同额" DataField="PURCCONTRACTVALUE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="已付合同额" DataField="PURCHADCHARGE">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <asp:Label runat="server" ID="lbContractInfo"></asp:Label>
    <script>

        $gridCheckedClientID = "<%=this.gvContract.CheckedClientID %>";
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
