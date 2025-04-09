<%@ Page Language="c#" CodeBehind="RoleMgr.aspx.cs" Title="角色管理" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectList.Master"
    Inherits="Zhongsoft.Portal.Sys.RoleManager" %>

<%@ Register Src="~/UI/Controls/OrgTree.ascx" TagName="OrgTree" TagPrefix="uc" %>
<asp:Content ID="Content4" ContentPlaceHolderID="treeView" runat="server">
    <div>
        <uc:OrgTree ID="orgTree" Flag="1" runat="server" />
    </div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server"></asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="toolBtn" runat="server">
    <div class="subtoolbarbg">
        <table>
            <tr>
                <td>&nbsp;<asp:Label ID="lbDeptName" Font-Bold="true" runat="server"></asp:Label>
                </td>
                <td>
                    <input type="hidden" runat="server" id="hiXml" />
                    &nbsp;<asp:DropDownList ID="ddlRoleType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlRoleType_SelectedIndexChanged" Width="150px">
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
    </div>
    <div class="subtoolbarbg">
        <asp:LinkButton runat="server" ID="btnAddNew" EnableTheming="false" CssClass="subtoolbarlink"
            OnClick="btnAddNew_Click" OnClientClick="return selectUser();"><span>
         <img  src="../../Themes/Images/btn_subtoolbarnew.gif" width="16" height="16"/>分配角色</span></asp:LinkButton>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <div style="background-color: #fff;">
        <zhongsoft:LightPowerGridView ID="pdgRoleUser" runat="server" Width="100%" DataKeyNames="UserId,RoleId"
            OnRowDataBound="pdgRoleUser_RowDataBound" OnRowCommand="pdgRoleUser_ItemCommand"
            AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="UserId" HeaderText="UserId" Visible="false"></asp:BoundField>
                <asp:BoundField DataField="UserNameNew" HeaderText="姓名" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
                <asp:BoundField DataField="Email" HeaderText="电子邮箱" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
                <asp:BoundField DataField="MobilePhone" HeaderText="手机号码"></asp:BoundField>
                <asp:TemplateField HeaderText="性别" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <%#Eval("Sex") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="RoleName" HeaderText="角色名称" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
                <asp:TemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbDelete" runat="server" CommandName="DeleteData" EnableTheming="false">
												<IMG id="btDelete" alt="删除角色成员" style="CURSOR: hand" onclick='return deleteConfirm();'
													 src="./../../Themes/Images/btn_dg_delete.gif" border="0">
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </zhongsoft:LightPowerGridView>
    </div>
    <script language="javascript" type="text/javascript">
        function selectUser() {
            if ($("#<%=ddlRoleType.ClientID %>").val() != "") {
                var param = new InputParamObject("m");
                var re = getUsers("<%=hiXml.ClientID %>", param, { OrganizationId:'<%=OrganizationId%>' });
                if (re != null) {
                    setReturnValue("Saved")
                    return true;
                }
            }
            else {
                alert("请选择角色名称");
            }

            return false;
        }

        function setReturnValue(val) {
            if (window.parent != null) {
                window.returnValue = val;
            }
        }

        function deleteConfirm() {
            if (!confirm("确认删除角色成员?")) {
                return false;
            }
            else {
                setReturnValue("Deleted")
                return true;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
