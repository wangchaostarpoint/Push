<%@ Page Language="C#" AutoEventWireup="true" Title="项目阶段参数设置" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="ParamProjectPhaseList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Sys.ParamProjectPhaseList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">项目阶段</span> <span>
        <zhongsoft:LightTextBox ID="tbType" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:TreeGridView Width="100%" runat="server" ID="tgvList" AllowPaging="true"
        PageSize="100" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
        DataKeyNames="PARAMPHASEID" UseDefaultDataSource="true" BindGridViewMethod="BindGrid"
        OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand" ParentIdColumn="PARENTID"
        SelfIdColumn="PARAMPHASEID">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField ItemStyle-Width="40px" HeaderText="序号">
                <ItemTemplate>
                    <%# tgvList.CreateHeader(Container.DataItem)%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="PHASECODE" HeaderText="项目阶段代字">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PHASENAME" HeaderText="项目阶段名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PHASENAMEFORSHORT" HeaderText="项目阶段简称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PhaseDrawCode" HeaderText="阶段简称编码">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="DESCRIPTION" HeaderText="描述">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="SORT" HeaderText="排序号" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="是否启用">
                <ItemTemplate>
                    <asp:RadioButtonList runat="server" ID="rbl" RepeatDirection="Horizontal" key='<%#Eval("PARAMPHASEID") %>'
                        OnSelectedIndexChanged="rbl_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem Value="1">启用</asp:ListItem>
                        <asp:ListItem Value="0">不启用</asp:ListItem>
                    </asp:RadioButtonList>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:TreeGridView>
    <script>
        $gridCheckedClientID = "<%=tgvList.CheckedClientID %>";

        function initCustomerPlugin() {
            checkMaxLength();
            checkRegex();
        }

    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
