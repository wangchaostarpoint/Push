<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WorkDoneTypeTree.ascx.cs"
    Inherits="Zhongsoft.Portal.Sys.Workflow.Controls.WorkDoneTypeTree" %>
<table>
    <tr>
        <td>
            <asp:LinkButton ID="lkbAll" runat="server" EnableTheming="false" OnClick="lkbAll_Click">全部</asp:LinkButton>
        </td>
    </tr>
    <tr>
        <td>
            <table>
                <tr>
                    <td>
                        <zhongsoft:LightTextBox ID="tbInfo" runat="server" MaxText="256" CssClass="kpms-textbox-short" />
                    </td>
                    <td style="width: 40px">
                        <asp:LinkButton ID="lkbtn" content="searchResult" runat="server" EnableTheming="false" OnClick="lkbtn_Click">搜索</asp:LinkButton>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <asp:TreeView ID="tvTypeTree" runat="server" ShowLines="True" Height="100%" OnSelectedNodeChanged="tvTypeTree_SelectedNodeChanged">
            </asp:TreeView>
        </td>
    </tr>
</table>
<script type="text/javascript">
    function initCustomerPlugin() {
        if (event.keyCode == 13 && $("#<%=tbInfo.ClientID %>").is(":focus")) {
            $("#<%=lkbtn.ClientID %>").click();
        }
    }
</script>
