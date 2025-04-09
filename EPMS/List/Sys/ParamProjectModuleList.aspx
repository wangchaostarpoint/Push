<%@ Page Language="C#" AutoEventWireup="true" Title="项目模块系统区域设置" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="ParamProjectModuleList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Sys.ParamProjectModuleList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">名&nbsp;称</span> <span>
        <zhongsoft:LightTextBox ID="tbType" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
        PageSize="100" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
        DataKeyNames="ParamProjectModuleId" UseDefaultDataSource="true" BindGridViewMethod="BindGrid"
        OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="ModuleCode" HeaderText="代字">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ModuleName" HeaderText="名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="类型">
                <ItemTemplate>
                    <asp:RadioButtonList runat="server" ID="rblType" RepeatDirection="Horizontal" key='<%#Eval("ParamProjectModuleId") %>'
                        OnSelectedIndexChanged="rblType_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem Value="模块">模块</asp:ListItem>
                        <asp:ListItem Value="系统">系统</asp:ListItem>
                        <asp:ListItem Value="区域">区域</asp:ListItem>
                    </asp:RadioButtonList>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="适用的项目类型">
                <ItemTemplate>
                    <%-- %><asp:CheckBox runat="server" ID="cbAllProjType" Text="选择全部项目类型" OnCheckedChanged="cbAll_CheckedChanged"
                        AutoPostBack="true" />
                    <asp:CheckBoxList runat="server" ID="cblProjType" RepeatDirection="Horizontal" RepeatColumns="3"
                        OnSelectedIndexChanged="cbl_SelectedIndexChanged" AutoPostBack="true">
                    </asp:CheckBoxList>--%>
                    <asp:Label runat="server" ID="lbProjectTypes" ></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="DESCRIPTION" HeaderText="描述">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="SORT" HeaderText="排序号" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="是否启用">
                <ItemTemplate>
                    <asp:RadioButtonList runat="server" ID="rbl" RepeatDirection="Horizontal" key='<%#Eval("ParamProjectModuleId") %>'
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
