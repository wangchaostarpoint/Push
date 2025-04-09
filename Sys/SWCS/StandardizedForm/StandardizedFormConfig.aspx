<%@ Page Title="标准表单设置" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master"
    AutoEventWireup="true" CodeBehind="StandardizedFormConfig.aspx.cs" Inherits="Zhongsoft.Portal.Sys.StandardizedForm.StandardizedFormConfig" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">表单/台帐名称</span> <span>
        <zhongsoft:LightTextBox runat="server" ID="tbFormName" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="lpgvList" runat="server" AutoGenerateColumns="false"
        PageSize="15" ShowExport="true" AllowPaging="true" ItemShowLength="50" DataKeyNames="MappingID">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <asp:BoundField DataField="RowNumber" HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                ItemStyle-Width="40px" />
            <asp:BoundField DataField="CONFIGNAME" HeaderText="标准表单名称" />
            <asp:BoundField DataField="StandardizedTemplateFileName" HeaderText="标准表单模板" />
            <asp:BoundField DataField="IsUseText" HeaderText="是否启用" ItemStyle-Width="60px" />
            <asp:BoundField DataField="CHECKSTATE" HeaderText="验证状态" ItemStyle-Width="60px" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script>
        $gridCheckedClientID = "<%=lpgvList.CheckedClientID %>";

    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
