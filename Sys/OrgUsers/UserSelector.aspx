<%@ Page Title="选择用户" Language="C#" MasterPageFile="~/UI/Master/ObjectSelector.Master"
    AutoEventWireup="true" CodeBehind="UserSelector.aspx.cs" Inherits="Zhongsoft.Portal.Sys.OrgUsers.UserSelector" %>

<%@ Register Assembly="Zhongsoft.Portal.UI.Controls" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<asp:Content ID="Content3" ContentPlaceHolderID="toolTip" runat="server">
    在搜索文本框中填写人员相关信息可以快速找到你要选择的人员。
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td nowrap>
                <zhongsoft:DropCheckBoxList runat="server" ID="ddlUserGroup" TitleName="分组" SearchBtnId="listGrid$btnList"
                    Style="text-align: left" RepeatColumns="2" RepeatDirection="Horizontal" ListWidth="380px" />
                工号、姓名(拼音简写)
                <asp:TextBox ID="tbUserInfo" runat="server" Width="100px"></asp:TextBox>
                <%-- <asp:DropDownList runat="server" ID="ddlGroup" Width="100px" EnableTheming="false">
    </asp:DropDownList>--%>
                <asp:DropDownList runat="server" Width="100px" ID="ddlDept" EnableTheming="false">
                </asp:DropDownList>
                <asp:LinkButton ID="lbtnMore" runat="server" Visible="false" OnClick="lbtnMore_Click">更多</asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <asp:LinkButton runat="server" ID="btnList" Style="display: none" OnClick="btnSearch_Click"></asp:LinkButton>
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="UsersList" AllowPaging="true"
        PageSize="10" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true"
        OnRowCommand="UsersList_RowCommand" OnJsonClick="addObject" JsonClickMode="onclick">
        <Columns>
            <asp:BoundField DataField="LoginId" HeaderText="工号" HeaderStyle-Width="30%" />
            <asp:BoundField DataField="UserName" HeaderText="姓名" HeaderStyle-Width="30%"></asp:BoundField>
            <asp:BoundField DataField="DeptName" HeaderText="部门" HeaderStyle-Width="30%"></asp:BoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script>
        function initCustomerPlugin() {
            $("#<%=this.tbUserInfo.ClientID %>").autocomplete({
                source: function (request, response) {
                    $.getJSON("JsonSelectorHandler.ashx", {
                        term: request.term + ',user4Code'
                    }, response);
                },
                minLength: 1,
                select: function (event, ui) {
                    if (ui.item) {
                        $("#<%=tbUserInfo.ClientID %>").attr("value", ui.item.value.substring(0, ui.item.value.indexOf('[')));
                        if (typeof (rebindSelectorList) == "function") {
                            rebindSelectorList();
                        }
                    }
                }
            });
        }
    
    </script>
</asp:Content>
