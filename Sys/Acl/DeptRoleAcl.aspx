<%@ Page Language="C#" AutoEventWireup="true" Title="部门角色权限设置" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="DeptRoleAcl.aspx.cs" Inherits="Zhongsoft.Portal.Sys.Acl.DeptRoleAcl" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="listGrid">
    <style>
        .lsb
        {
            width: 90%;
            height: 410px; /*高度样式不起作用*/
        }
    </style>
    <!--选择模式：先部门后角色，先角色后部门-->
    <input type="hidden" runat="server" id="hiSelType" />
    <table>
        <tr>
            <td>
                <asp:Label runat="server" ID="lbDept">部门</asp:Label>
            </td>
            <td>
                <asp:Label runat="server" ID="lbRole">角色</asp:Label>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td style="width: 30%;">
                <asp:ListBox runat="server" ID="lsbDept" CssClass="lsb" Rows="10" AutoPostBack="true"
                    OnSelectedIndexChanged="lsbDept_SelectedIndexChanged"></asp:ListBox>
            </td>
            <td style="width: 30%;">
                <asp:ListBox runat="server" ID="lsbRole" CssClass="lsb" Rows="10">
                    <asp:ListItem>请先选择部门信息</asp:ListItem>
                </asp:ListBox>
            </td>
            <td>
                <asp:Button runat="server" ID="btnAdd" Text=">" OnClick="btnAdd_Click" />
                <br />
                <asp:Button runat="server" ID="btnDel" Text="<" OnClick="btnDel_Click" />
            </td>
            <td style="width: 35%;">
                <asp:ListBox runat="server" ID="lsbResult" CssClass="lsb" Rows="10" SelectionMode="Multiple">
                </asp:ListBox>
            </td>
        </tr>
    </table>
    <div style="width: 100%; margin-top: 50px; text-align: center;">
        <asp:LinkButton runat="server" ID="ibtnOK" ToolTip="完成" OnClick="ibtnOK_Click">
            <span>
               完成</span>
        </asp:LinkButton>
        <asp:LinkButton runat="server" ID="lbtnCancel" ToolTip="取消" OnClientClick="return closeWindow();">
            <span>
               取消</span>
        </asp:LinkButton>
    </div>
    <input type="hidden" runat="server" id="hiXML" />
    <script>
        function closeExpWindow() {
            parent.returnValue = $('#<%=hiXML.ClientID %>').val();
            closeWindow();
            return false;
        }
    </script>
</asp:Content>
