<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EquipmentOfTechAgreeSelector.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Obsolete.EquipmentOfTechAgreeSelector" MasterPageFile="~/UI/Master/ObjectSelector.Master"
    Title="选择设备信息" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                卷册编号/名称
                <zhongsoft:LightTextBox runat="server" ID="tbRollName" CssClass="kpms-textboxsearch"
                    EnableTheming="false"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvEqupmentList" AllowPaging="true" runat="server"
        BindJsonClick="true" OnJsonClick="addObject" JsonClickMode="onclick" ShowJsonRowColName="true"
        AutoGenerateColumns="false" UseDefaultDataSource="true" BindGridViewMethod="DoSelectByFilter">
        <Columns>
            <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="卷册编号" />
            <zhongsoft:LightBoundField DataField="WBSName" HeaderText="卷册名称" />
            <zhongsoft:LightBoundField DataField="EquipmentCode" HeaderText="设备编号" />
            <zhongsoft:LightBoundField DataField="EquipmentType" HeaderText="设备类型" />
            <zhongsoft:LightButtonField HeaderText="查看" EditItemClick="viewDetail" DataParamFields="TechEquipmentDetailID"
                CommandName="ViewData" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script>
        function viewDetail(bizId) {
            var url = buildBizUrl(1, bizId, "EPMS/List/WBS/TechAgreementEditor.aspx", null);
            return showDivDialog(url, null, 600, 550, null);
        }
    </script>
</asp:Content>
