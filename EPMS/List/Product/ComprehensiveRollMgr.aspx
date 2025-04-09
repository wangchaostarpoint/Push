<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ComprehensiveRollMgr.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Product.ComprehensiveRollMgr" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">项目名称/编号</span> <span>
        <asp:TextBox ID="tbProjectInfo" search="1" runat="server" MaxLength="64" CssClass="kpms-textboxsearch"
            EnableTheming="false"></asp:TextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">卷册名称/编号</span>
        <span>
            <asp:TextBox ID="tbWBSInfo" search="1" runat="server" MaxLength="64" CssClass="kpms-textboxsearch"
                EnableTheming="false"></asp:TextBox>
        </span></span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvZHRollList" AutoGenerateColumns="false"
        ShowExport="true" HideFieldOnExport="全部" runat="server" BindGridViewMethod="BindDataGrid"
        PageSize="10" ShowPageSizeChange="true" UseDefaultDataSource="true">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName" ShowToolTip="true"
                Width="350">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="阶段名称" DataField="PhaseName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="卷册编号" DataField="WBSCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="卷册名称" DataField="WBSName" ShowToolTip="true"
                Width="350">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="卷册负责人" DataField="WBSOwnerName" ItemStyle-Width="70px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="所属部门" DataField="BelongDeptName" ItemStyle-Width="150px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightButtonField HeaderText="编辑" CommandName="EditorData" DataParamFields="WBSID"
                EditItemClick="editDetail" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
            </zhongsoft:LightButtonField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        function editDetail(wbsID) {
            var url = buildQueryUrl("/EPMS/List/Product/ComprehensiveRollRelRolls.aspx", { wbsID: wbsID });
            showDivDialog(url, null, 900, 600, null);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
