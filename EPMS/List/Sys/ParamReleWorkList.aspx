<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ParamReleWorkList.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Sys.ParamReleWorkList" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<%-- 工种类型树--%>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">出版类型</span> <span>
        <zhongsoft:LightDropDownList ID="ddlConsignType" runat="server" />
    </span><span class="filter-block-lb">工种类型名称</span> <span>
        <zhongsoft:LightTextBox ID="tbWorkTypeName" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <style type="text/css">
        .gvHideHeader
        {
            display: none;
        }
    </style>
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
        PageSize="10" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
        DataKeyNames="ConsignTypeID" UseDefaultDataSource="true" BindGridViewMethod="BindGrid"
        OnRowDataBound="gvList_RowDataBound" HideFieldOnExport="全选" ShowPageSizeChange="true">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="40px">
                <ItemTemplate>
                    <%#Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="ConsignTypeName" HeaderText="出版类型" HeaderStyle-Width="20%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="工种类型名称" HeaderStyle-Width="20%">
                <ItemTemplate>
                    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvWorkType" AllowPaging="false"
                        AutoGenerateColumns="false">
                        <Columns>
                            <zhongsoft:LightBoundField DataField="WorkTypeName" ShowHeader="false">
                                <HeaderStyle CssClass="gvHideHeader" />
                            </zhongsoft:LightBoundField>
                        </Columns>
                    </zhongsoft:LightPowerGridView>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="Memo" HeaderText="描述">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="Sort" HeaderText="排序" HeaderStyle-Width="10%"
                ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="是否启用" HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbFlag"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script>
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";   

    </script>
</asp:Content>
