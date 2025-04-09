<%@ Page Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true"
    CodeBehind="UsersInRole.aspx.cs" Inherits="Zhongsoft.Portal.Sys.UsersInRole" %>

<%@ Register Assembly="Zhongsoft.Portal.UI.Controls" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView PageSize="10" ID="UserNameView" runat="server" AutoGenerateColumns="false"
        AllowPaging="true" OnRowCommand="UserNameView_RowCommand" UseDefaultDataSource="true"
        DataKeyNames="OrganizationUsersInRolesID" OnRowDeleting="UserNameView_RowDeleting">
        <Columns>
            <asp:BoundField DataField="UserName" HeaderText="用户名" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="70px" />
            <asp:BoundField DataField="OrganizationName" HeaderText="所属部门" HeaderStyle-Width="130px" />
            <asp:BoundField DataField="MobilePhone" HeaderText="手机号码" HeaderStyle-Width="100px" />
            <asp:BoundField DataField="Email" HeaderText="电子邮件" />
            <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="删除" ItemStyle-Width="50px">
                <ItemTemplate>
                    <asp:ImageButton CommandName="Delete" OnClientClick="return window.confirm('您确定删除吗?')"
                        ImageUrl="/Portal/Themes/Images/btn_dg_delete.gif" ID="IbtnButton" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
