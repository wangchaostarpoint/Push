<%@ Page Language="C#" AutoEventWireup="true" Title="任务书模板" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="TaskBookTemplateList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Sys.TaskBookTemplateList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
    <asp:TreeView ID="tvTaskBookTree" runat="server" ShowLines="True" Height="100%" OnSelectedNodeChanged="tvTaskBookTree_SelectedNodeChanged">
        <SelectedNodeStyle BackColor="#F7F7F7" />
    </asp:TreeView>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">卷册名称/编号</span> <span>
        <zhongsoft:LightTextBox ID="tbWBSInfo" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">任务内容、范围、分工</span>
        <span>
            <zhongsoft:LightTextBox ID="tbName" runat="server" CssClass="kpms-textboxsearch"
                EnableTheming="false"></zhongsoft:LightTextBox>
        </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
        PageSize="50" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
        DataKeyNames="WBSBookTemplateID" UseDefaultDataSource="true" BindGridViewMethod="BindGrid"
        OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand" OnExport="gvList_Export">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" HeaderStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="任务类型">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbWBSType"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="编号">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbWBSCode"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="名称">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbWBSName"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="ContentOrRange" HeaderText="任务内容、范围、分工" DataParamFields="WBSBookTemplateID"
                HeaderStyle-Width="150px" ShowToolTip="true" DialogMode="Dialog" EditItemClick="viewDetail">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="BasisOrConditions" HeaderText="任务依据及条件" HeaderStyle-Width="150px"
                ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PrincipleOrRequire" HeaderText="任务原则及要求" HeaderStyle-Width="150px"
                ShowToolTip="true" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ReleParam" HeaderText="任务相关参数" HeaderStyle-Width="150px"
                ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TechMeasure" HeaderText="技术组织措施（技术指导书）" HeaderStyle-Width="150px"
                ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="Description" HeaderText="描述">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="是否启用">
                <ItemTemplate>
                    <asp:RadioButtonList runat="server" ID="rbl" RepeatDirection="Horizontal" key='<%#Eval("WBSBookTemplateID") %>'
                        OnSelectedIndexChanged="rbl_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem Value="1">启用</asp:ListItem>
                        <asp:ListItem Value="0">不启用</asp:ListItem>
                    </asp:RadioButtonList>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <%--ProjTempID--%>
    <input type="hidden" id="hiProjTempID" runat="server" value="" />
    <script>
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";

        function initCustomerPlugin() {

        }

        function viewDetail(bizId) {
            var json = { actionType: 1, bizId: bizId };
            var url = buildQueryUrl('/EPMS/List/Sys/TaskBookTemplateEditor.aspx', json);
            showDivDialog(url, null, 1050, 550, rebindGridData);
        }

        function beforeDialog(actionType, bizId) {
            var json = { actionType: actionType, bizId: bizId, ProjTempID: $("#<%=hiProjTempID.ClientID %>").val() };
            var url = buildQueryUrl('/EPMS/List/Sys/TaskBookTemplateEditor.aspx', json);
            showDivDialog(url, null, 1050, 550, rebindGridData);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
