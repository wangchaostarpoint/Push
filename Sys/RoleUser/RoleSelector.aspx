<%@ Page Title="选择角色" Language="C#" MasterPageFile="~/UI/Master/ObjectSelector.Master"
    AutoEventWireup="true" CodeBehind="RoleSelector.aspx.cs" Inherits="Zhongsoft.Portal.Sys.RoleUser.RoleSelector" %>

<%@ Register Src="~/UI/Controls/OrgTree.ascx" TagName="OrgTree" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolTip" runat="server">
    在搜索文本框中填写相关信息可以快速找到你要选择的角色。
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    名称
    <asp:TextBox runat="server" ID="tbRoleName" Width="150px" MaxLength="60"></asp:TextBox>
    角色类型
    <asp:DropDownList runat="server" ID="ddlScope" Width="150px" EnableTheming="false">
    </asp:DropDownList>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="listGrid" runat="server">
    <table class="tz-table">
        <tr>
            <td width="40%" valign="top" class="selector-tree">
                <div style="overflow-x: auto; height: 300px !important">
                    <uc:OrgTree ID="orgTree" Flag="1" runat="server" />
                </div>
            </td>
            <td valign="top">
                <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="False"
                    UseDefaultDataSource="true" AllowPaging="True" BindGridViewMethod="BindDataGrid"
                    ShowJsonRowColName="true" OnJsonClick="addObject" JsonClickMode="onclick" BindJsonClick="true">
                    <Columns>
                        <asp:BoundField DataField="RoleName" HeaderText="角色名称" ItemStyle-Width="100px" />
                        <%--<asp:TemplateField HeaderText="角色类型" ItemStyle-Width="100px">
                            <ItemTemplate>
                                <%#GetScope(Eval("RoleScope"))%>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
</asp:Content>
