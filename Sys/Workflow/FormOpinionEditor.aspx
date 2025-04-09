<%@ Page Title="常用语维护" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="FormOpinionEditor.aspx.cs" Inherits="Zhongsoft.Portal.Sys.Workflow.FormOpinionEditor" %>

<%@ Register Assembly="Zhongsoft.Portal.UI.Controls" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table width="100%">
        <tr>
            <td>
                意见内容
                <asp:TextBox ID="tbContent" Req="1" runat="server" MaxLength="100" Width="400px"></asp:TextBox>
                <asp:Button ID="btnAdd" runat="server" Text="添加意见" OnClick="btnAdd_Click"
                    OnClientClick="return checkReqField();" />
            </td>
        </tr>
        <tr>
            <td class="kpms-fim-m">
                <zhongsoft:LightPowerGridView ID="OpinionList" Width="100%" runat="server" AutoGenerateColumns="false"
                    AllowPaging="true" OnRowCommand="OpinionList_RowCommand" UseDefaultDataSource="true"
                    OnRowDeleting="OpinionList_RowDeleting" DataKeyNames="OpinionId" PageSize="8">
                    <Columns>
                        <asp:BoundField DataField="OpinionContent" HeaderText="内容" HeaderStyle-Width="90%" />
                        <asp:TemplateField HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:ImageButton ToolTip="删除" OnClientClick="return window.confirm('您确定删除吗？')" ID="btnDelete"
                                    CommandName="Delete" ImageUrl="~/Themes/Images/btn_dg_delete.gif" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
</asp:Content>
