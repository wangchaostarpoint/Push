<%@ Page Language="C#" AutoEventWireup="true" Title="资料项模板" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="FileItemTemplateList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Sys.FileItemTemplateList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                模板名称
                <zhongsoft:LightTextBox ID="tbName" runat="server" Width="70px"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
        PageSize="100" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
        DataKeyNames="FileItemTemplateID" UseDefaultDataSource="true" BindGridViewMethod="BindGrid"
        OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" HeaderStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="任务编号">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbWBSCode"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="任务名称">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbWBSName"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="FileItemCode" HeaderText="资料项编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="FileItemName" HeaderText="资料项名称" DataParamFields="FileItemTemplateID"
                DialogMode="Dialog" EditItemClick="viewDetail">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="FileType" HeaderText="资料类别">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="FileImportance" HeaderText="资料重要性">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="FileSource" HeaderText="资料来源">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="DelayDays" HeaderText="延迟（开工起）" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="BelongSpecialtyName" HeaderText="所属专业">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="BelongModule" HeaderText="所属模块（系统、区域）">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="是否启用">
                <ItemTemplate>
                    <asp:RadioButtonList runat="server" ID="rbl" RepeatDirection="Horizontal" key='<%#Eval("FileItemTemplateID") %>'
                        OnSelectedIndexChanged="rbl_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem Value="1">启用</asp:ListItem>
                        <asp:ListItem Value="0">不启用</asp:ListItem>
                    </asp:RadioButtonList>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";

        function initCustomerPlugin() {

        }

        //定制新建、编辑、查看弹出窗口方式
        function beforeDialog(actionType, bizId) {
            //传递资料类别（互提、外部）
            var json = { FileType: '<%=FileType %>', actionType: actionType, bizId: bizId };
            var url = buildQueryUrl('/EPMS/List/Sys/FileItemTemplateEditor.aspx', json);
            showDivDialog(url, "", 1050, 600, rebindGridData);
            return false;
        }

        function viewDetail(bizId) {
            var json = { actionType: 1, bizId: bizId, FileType: '<%=FileType %>' };
            var url = buildQueryUrl('/EPMS/List/Sys/FileItemTemplateEditor.aspx', json);
            showDivDialog(url, null, 1050, 550, rebindGridData);
        }

    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
