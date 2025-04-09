<%@ Page Language="C#" AutoEventWireup="true" Title="任务作业（系统）方式设置" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="ParamWBSWayList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Sys.ParamWBSWayList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">作业系统方式</span> <span>
        <zhongsoft:LightTextBox ID="tbType" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
    <script src="../../UI/Script/EPMSGeneralScript.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
        PageSize="100" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
        DataKeyNames="ParamWBSWayId" UseDefaultDataSource="true" BindGridViewMethod="BindGrid"
        OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="WBSWay" HeaderText="作业（系统）方式">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WayClass" HeaderText="归属">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="DESCRIPTION" HeaderText="描述">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="SORT" HeaderText="排序号" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="是否启用">
                <ItemTemplate>
                    <asp:RadioButtonList runat="server" ID="rbl" RepeatDirection="Horizontal" key='<%#Eval("ParamWBSWayId") %>'
                        OnSelectedIndexChanged="rbl_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem Value="1">启用</asp:ListItem>
                        <asp:ListItem Value="0">不启用</asp:ListItem>
                    </asp:RadioButtonList>
                    <input type="hidden" runat="server" id="hiKeyId" value='<%#Eval("ParamWBSWayId") %>' />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script>
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
