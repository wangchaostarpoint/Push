<%@ Page Language="C#" AutoEventWireup="true" Title="校审要点模板" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="VerifyPointTemplateList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Sys.VerifyPointTemplateList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
    <asp:TreeView ID="tvVerifyPointTree" runat="server" ShowLines="True" Height="100%"
        OnSelectedNodeChanged="tvVerifyPointTree_SelectedNodeChanged">
        <SelectedNodeStyle BackColor="#F7F7F7" />
    </asp:TreeView>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">校审要点</span> <span>
        <zhongsoft:LightTextBox ID="tbName" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">卷册编号/名称</span> <span>
        <zhongsoft:LightTextBox ID="tbWBSInfo" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
        PageSize="50" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
        DataKeyNames="VerifyPointTemplateID,WBSTemplateID,Flag,ExecSpecialtyID" UseDefaultDataSource="true" BindGridViewMethod="BindGrid"
        OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand" OnExport="gvList_Export">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" HeaderStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="任务类型" Visible="false">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbWBSType"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="编号" Visible="false">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbWBSCode"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="名称" Visible="false">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbWBSName"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSName" HeaderText="名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="VerifyRole" HeaderText="校审角色">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="VerifyPoint" HeaderText="校审要点" DataParamFields="VerifyPointTemplateID"
                DialogMode="Dialog" EditItemClick="viewDetail" HeaderStyle-Width="150px" ShowToolTip="true">
            </zhongsoft:LightBoundField>

            <zhongsoft:LightBoundField DataField="Description" HeaderText="描述">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="是否启用">
                <ItemTemplate>
                    <asp:RadioButtonList runat="server" ID="rbl" RepeatDirection="Horizontal" key='<%#Eval("VerifyPointTemplateID") %>'
                        OnSelectedIndexChanged="rbl_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem Value="1">启用</asp:ListItem>
                        <asp:ListItem Value="0">不启用</asp:ListItem>
                    </asp:RadioButtonList>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <input type="hidden" id="hiProjTempID" runat="server" value="" />
    <script>
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";

        function initCustomerPlugin() {

        }

        function viewDetail(bizId) {
            var json = { actionType: 1, bizId: bizId };
            var url = buildQueryUrl('/EPMS/List/Sys/VerifyPointTemplateEditor.aspx', json);
            showDivDialog(url, null, 1050, 550, rebindGridData);
        }

        function beforeDialog(actionType, bizId) {
            var json = { actionType: actionType, bizId: bizId, ProjTempID: $("#<%=hiProjTempID.ClientID %>").val() };
            var url = buildQueryUrl('/EPMS/List/Sys/VerifyPointTemplateEditor.aspx', json);
            showDivDialog(url, null, 1050, 550, rebindGridData);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
