<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCContractSplitStatistics.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.UI.Controls.UCContractSplitStatistics" %>
<table class="tz-table" style="width: 100%">
    <tr class="trProject">
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvStatistics" runat="server" AllowPaging="true"
                AutoGenerateColumns="false" UseDefaultDataSource="true" DataKeyNames="ORGANIZATIONID"
                ShowExport="true" OnExport="gvStatistics_Export" OnRowDataBound="gvStatistics_RowDataBound">
                <Columns>
                    <zhongsoft:LightBoundField DataField="PROJECTCODE" HeaderText="项目编号" ItemStyle-Width="100px"
                        ItemStyle-HorizontalAlign="Left" />
                    <zhongsoft:LightBoundField DataField="PROJECTNAME" HeaderText="项目名称" ItemStyle-Width="250px"
                        ItemStyle-HorizontalAlign="Left" />
                    <zhongsoft:LightBoundField DataField="ITEMVALUE" HeaderText="合同额(万元)" ItemStyle-HorizontalAlign="Right"
                        ItemStyle-Width="100px" />
                    <zhongsoft:LightBoundField DataField="COMPLETEVALUE" HeaderText="完成合同额(万元)" ItemStyle-HorizontalAlign="Right"
                        ItemStyle-Width="100px" />
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
