<%@ Page Title="项目进度确认流程发起人设置" Language="C#" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master"
    AutoEventWireup="true" CodeBehind="DeptPlannerList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Cost.DeptPlannerList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="fixedFilter" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="toolBar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="false"
        PageSize="30" AutoGenerateColumns="false" ShowExport="false" AllowSorting="false"
        ShowHeader="true" ShowFooter="false" DataKeyNames="DeptPlannerID" UseDefaultDataSource="true"
        OnRowDataBound="gvList_RowDataBound">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField ItemStyle-Width="30px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="DeptName" HeaderText="部门名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="UserName" HeaderText="计划管理岗">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="是否启用">
                <ItemTemplate>
                    <asp:RadioButtonList runat="server" ID="rbtnlIsUse" RepeatDirection="Horizontal"
                        key='<%#Eval("DeptPlannerID") %>' OnSelectedIndexChanged="rbl_SelectedIndexChanged"
                        AutoPostBack="true">
                        <asp:ListItem Text="是" Value="1"></asp:ListItem>
                        <asp:ListItem Text="否" Value="0"></asp:ListItem>
                    </asp:RadioButtonList>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script>
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";
    </script>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
