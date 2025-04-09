<%@ Page Language="C#" AutoEventWireup="true" Title="选择项目阶段" MasterPageFile="~/UI/Master/ObjectSelector.Master"
    CodeBehind="ProjectPhaseSelector.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.Obsolete.ProjectPhaseSelector" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvList" AllowPaging="true"
        runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true" BindGridViewMethod="DoSelectByFilter"
        OnJsonClick="addObject" JsonClickMode="onclick" DataKeyNames="ParamPhaseId"
        ShowJsonRowColName="true" OnRowDataBound="gvList_RowDataBound">
        <Columns>
            <zhongsoft:LightBoundField DataField="PhaseName" HeaderText="项目阶段">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PhaseCode" HeaderText="项目阶段代字">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>

    <%--JS部分--%>
    <script type="text/javascript">

</script>

</asp:Content>
