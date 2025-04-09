<%@ Page Language="C#" AutoEventWireup="true" Title="设备模板" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="EquipmentTemplateList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Sys.EquipmentTemplateList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">设备名称</span> <span>
        <zhongsoft:LightTextBox ID="tbName" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
        PageSize="100" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
        DataKeyNames="QuipmentTemplateID" UseDefaultDataSource="true" BindGridViewMethod="BindGrid"
        OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" HeaderStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="QuipmentCode" HeaderText="设备编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="QuipmentName" HeaderText="设备名称" DataParamFields="QuipmentTemplateID"
                DialogMode="Dialog" EditItemClick="viewDetail">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="UsingRange" HeaderText="适用的范围">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="KKSCode" HeaderText="KKS编码">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="Description" HeaderText="描述">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="是否启用">
                <ItemTemplate>
                    <asp:RadioButtonList runat="server" ID="rbl" RepeatDirection="Horizontal" key='<%#Eval("QuipmentTemplateID") %>'
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

        }

        function viewDetail(bizId) {
            var json = { actionType: 1, bizId: bizId };
            var url = buildQueryUrl('/EPMS/List/Sys/EquipmentTemplateEditor.aspx', json);
            showDivDialog(url, null, 1050, 550, rebindGridData);
        }

    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
