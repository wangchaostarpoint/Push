<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BatchAddUser.aspx.cs" EnableEventValidation="false" Title="批量添加用户"
    MasterPageFile="~/UI/Master/ObjectList.Master" Inherits="Zhongsoft.Portal.Sys.OrgUsers.BatchAddUser" %>


<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
    <asp:Button ID="btnPreview" runat="server" Text="预览" OnClick="btnPreview_Click" Style="margin-left: 8px;" />
    <asp:Button ID="btnBatchAdd" runat="server" Text="批量添加" OnClientClick="if( window.confirm('您确定批量添加吗？')){ parent.returnValue = 'isSave';return true;}else{return false;}"
        OnClick="btnBatchAdd_Click" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <table class="kpms-detailtabletotal" width="100%">
        <tr>
            <td class="kpms-detailtop">
                <img src="../../Themes/Images/btn_title.gif" border="0">
                批量添加用户:<%=OfficalName%>
                格式：用户登录ID,用户名称。以逗号分隔(,)
            </td>
        </tr>
        <tr>
            <td class="kpms-detailtoptitle">
                <table class="kpms-detsearch">
                    <tr>
                        <td style="width: 50%" valign="top">
                            <asp:TextBox ID="tbUserStr" runat="server" TextMode="MultiLine" Width="200px" Height="130px"></asp:TextBox>
                        </td>
                        <td style="width: 50%" valign="top">
                            <div style="overflow-y: scroll; overflow-x: hidden; height: 130px">
                                <asp:GridView ID="userPreview" runat="server" EmptyDataText="没有数据" AutoGenerateColumns="false">
                                    <Columns>
                                        <asp:BoundField DataField="登录Id" HeaderText="登录Id" ItemStyle-Width="90px" />
                                        <asp:BoundField DataField="姓名" HeaderText="姓名" ItemStyle-Width="90px" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiDefaultPwd" value="123456" />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
