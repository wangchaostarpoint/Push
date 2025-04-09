<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoleTypeList.aspx.cs" EnableEventValidation="false"
    MasterPageFile="~/UI/Master/ObjectList.Master" Inherits="Zhongsoft.Portal.Sys.RoleTypeList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">角色名称</span> <span>
        <asp:TextBox ID="tbRoleName" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></asp:TextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">角色类型</span> <span>
        <asp:DropDownList runat="server" ID="ddlScope" class="kpms-ddlsearch"
            EnableTheming="false">
        </asp:DropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">角色所属部门</span>
        <span>
            <zhongsoft:LightObjectSelector runat="server" ID="lbsOrgs" PageUrl="/Portal/Sys/OrgUsers/OrgSelector.aspx"
                ResultAttr="name" ResultForControls="{'hiOrganizationId':'id'}" />
            <input type="hidden" runat="server" id="hiOrganizationId" />
        </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView PageSize="15" ID="RoleTypeView" runat="server" AutoGenerateColumns="false"
        AllowPaging="true" OnRowCommand="RoleTypeView_RowCommand" OnRowDeleting="RoleTypeView_RowDeleting"
        UseDefaultDataSource="true" DataKeyNames="roleId" BindGridViewMethod="BindDataGrid" ShowExport="True" HideFieldOnExport="全部">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全部" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
              <asp:BoundField DataField="RoleCode" HeaderText="角色编号" ItemStyle-Width="200px" />
            <asp:BoundField DataField="RoleName" HeaderText="角色名称" ItemStyle-Width="200px" />
            <asp:TemplateField HeaderText="角色类型" ItemStyle-Width="100px">
                <ItemTemplate>
                    <%#GetScope(Eval("RoleScope"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="OrganizationName" HeaderText="角色所属部门" ItemStyle-Width="200px"></asp:BoundField>
            <asp:BoundField DataField="RoleLevel" HeaderText="级别" HeaderStyle-Width="80px" ItemStyle-HorizontalAlign="Center"
                ItemStyle-Font-Bold="true" />
            <asp:BoundField DataField="RoleMemo" HeaderText="描述"></asp:BoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script>
        $gridCheckedClientID = "<%=RoleTypeView.CheckedClientID %>";
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
