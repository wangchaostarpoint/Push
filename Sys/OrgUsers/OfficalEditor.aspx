<%@ Page Title="组织架构编辑" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="OfficalEditor.aspx.cs" Inherits="Zhongsoft.Portal.Sys.OrgUsers.OfficalEditor" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                名称
            </td>
            <td class="td-m">
                <asp:TextBox ID="tbUnitName" runat="server" req="1" field="OrgUnitName" tablename="OrganizationOfficial"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                编码
            </td>
            <td class="td-m">
                <asp:TextBox ID="tbUnitCode" runat="server" req="1" field="OrgUnitCode" tablename="OrganizationOfficial"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                级别
            </td>
            <td class="td-m">
                <asp:TextBox ID="tbLevel" runat="server" Text="2" tablename="OrganizationOfficial"
                    field="OrgUnitLevel" req="1"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                排序
            </td>
            <td class="td-m">
                <asp:TextBox ID="tbSort" runat="server" tablename="OrganizationOfficial" field="Sort"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                类型
            </td>
            <td class="td-m">
                <asp:DropDownList ID="ddlType" runat="server" req="1" field="OrgType" tablename="OrganizationOfficial">
                    <%--<asp:ListItem Value="">请选择</asp:ListItem>
                    <asp:ListItem Value="2">管理部门</asp:ListItem>
                    <asp:ListItem Value="1">生产部门</asp:ListItem>--%>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                是否启用
            </td>
            <td class="td-m">
                <asp:RadioButtonList runat="server" ID="rbtnFlag" RepeatDirection="Horizontal" field="flag"
                    tablename="OrganizationOfficial">
                    <asp:ListItem Value="1" Selected="True">是</asp:ListItem>
                    <asp:ListItem Value="0">否</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" field="OrganizationId" tablename="OrganizationUnit"
        id="hiUnitId" />
    <input type="hidden" runat="server" field="OrganizationTypeId" tablename="OrganizationUnit"
        id="hiUnitType" value="1" />
    <input type="hidden" runat="server" field="OrganizationCode" tablename="OrganizationUnit"
        id="hiUnitCode" />
    <input type="hidden" runat="server" field="OrganizationName" tablename="OrganizationUnit"
        id="hiUnitName" />
    <input type="hidden" runat="server" field="OrgUnitId" tablename="OrganizationOfficial"
        id="hiOfficalId" />
    <input type="hidden" runat="server" field="ParentId" tablename="OrganizationOfficial"
        id="hiOfficalParentId" />
    <script type="text/javascript">




    </script>
</asp:Content>
