<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QualityDeptInfo.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Quality.QualityDeptInfo" %>
<zhongsoft:LightPowerGridView Width="100%" ID="gvList" runat="server" AutoGenerateColumns="false"
    AllowPaging="true" PageSize="100" ShowExport="true" BindGridViewMethod="BindDataGrid">
    <Columns>
        <zhongsoft:LightBoundField HeaderText="部门" DataField="OrgUnitName">
        </zhongsoft:LightBoundField>
        <zhongsoft:LightBoundField HeaderText="专业" DataField="SpecialtyName">
        </zhongsoft:LightBoundField>
        <zhongsoft:LightBoundField HeaderText="未鉴定" ItemStyle-HorizontalAlign="Right" DataField="notValid">
        </zhongsoft:LightBoundField>
        <zhongsoft:LightBoundField HeaderText="入库" ItemStyle-HorizontalAlign="Right" DataField="Valid">
        </zhongsoft:LightBoundField>
        <zhongsoft:LightBoundField HeaderText="放弃" ItemStyle-HorizontalAlign="Right" DataField="inValid">
        </zhongsoft:LightBoundField>
    </Columns>
</zhongsoft:LightPowerGridView>
