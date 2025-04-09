<%@ Page Language="C#" AutoEventWireup="true" Title="项目通用参数设置" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="ParamProjectGeneralList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Sys.ParamProjectGeneralList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
    <div>
        <asp:TreeView ID="treeParam" runat="server" OnSelectedNodeChanged="treeParam_SelectedNodeChanged"
            Height="100%" Width="100%" ShowLines="True">
            <SelectedNodeStyle BackColor="#F7F7F7" />
        </asp:TreeView>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">参数类型</span> <span>
        <zhongsoft:LightTextBox ID="tbType" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
        PageSize="100" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
        DataKeyNames="ParamProjectGeneralId" UseDefaultDataSource="true" BindGridViewMethod="BindGrid"
        OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="ParamType" HeaderText="参数类型">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ParamName" HeaderText="参数名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ParamValue" HeaderText="参数值">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="DESCRIPTION" HeaderText="描述">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="SORT" HeaderText="排序号" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="是否启用">
                <ItemTemplate>
                    <asp:RadioButtonList runat="server" ID="rbl" RepeatDirection="Horizontal" key='<%#Eval("ParamProjectGeneralId") %>'
                        OnSelectedIndexChanged="rbl_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem Value="1">启用</asp:ListItem>
                        <asp:ListItem Value="0">不启用</asp:ListItem>
                    </asp:RadioButtonList>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script>
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";

        function initCustomerPlugin() {
            checkMaxLength();
            checkRegex();
        }

    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
