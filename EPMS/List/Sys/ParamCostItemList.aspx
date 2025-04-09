<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ParamCostItemList.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Sys.ParamCostItemList" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master" %>

<%-- 工种类型树--%>
<%@ Register Src="~/EPMS/UI/Publish/WorkTypeTree.ascx" TagName="WorkTypeTree" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
    <table>
        <tr>
            <td>
                <uc1:WorkTypeTree ID="treeWorkType" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">工种类型名称</span> <span>
        <zhongsoft:LightTextBox ID="tbWorkTypeName" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
        PageSize="10" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
        DataKeyNames="WorkTypeID" UseDefaultDataSource="true" BindGridViewMethod="BindDataGrid"
        OnRowDataBound="gvList_RowDataBound" HideFieldOnExport="全选" ShowPageSizeChange="true">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="40px">
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="工种类型名称" HeaderStyle-Width="10%">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbWorkTypeName"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="CostItemName" HeaderText="费用项目名称" HeaderStyle-Width="40%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="是否加长" HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbIsLengthen"></asp:Label>
                    <input type="hidden" runat="server" id="hiWorkTypeID" value='<%#Eval("WorkTypeID") %>' />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="UnitName" HeaderText="规格单位">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="Price" HeaderText="单价（元）" ItemStyle-HorizontalAlign="right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="Sort" HeaderText="排序" ItemStyle-HorizontalAlign="right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="是否启用" HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbFlag"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <input type="hidden" runat="server" id="hiWorkTypeId" />
    <input type="hidden" runat="server" id="hiTypeLevel" />
    <script>
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";
        //定制新建、编辑、查看弹出窗口方式
        function beforeDialog(actionType, bizId) {
            //传递工种类型名称
            var TypeId = $('#<%=hiWorkTypeId.ClientID %>').val();
            var TypeLevel = $('#<%=hiTypeLevel.ClientID %>').val();
            var json = { TypeId: TypeId, TypeLevel: TypeLevel, actionType: actionType, bizId: bizId };
            var url = buildQueryUrl('/EPMS/List/Sys/ParamCostItemEditor.aspx', json);
            showDivDialog(url, "", 1050, 600, rebindGridData);
            return false;
        }

    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
