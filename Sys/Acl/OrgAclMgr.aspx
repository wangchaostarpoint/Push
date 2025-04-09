<%@ Page Title="页面权限设置" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true"
    CodeBehind="OrgAclMgr.aspx.cs" Inherits="Zhongsoft.Portal.Sys.Acl.OrgAclMgr" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <contenttemplate>
    <table class="tz-table">
        <tr>
            <td class="tz-title">
                页面权限
            </td>
        </tr>
        <tr>
            <td>
                <div class="tz-toolbar">
                    【<asp:Label ID="lbOrg" runat="server"></asp:Label>】页面权限 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    访问级别:<asp:DropDownList ID="ddlRoleAccess" runat="server" Width="150px">
                    </asp:DropDownList>
                    &nbsp;&nbsp;<asp:LinkButton ID="btnSelMenu" runat="server" EnableTheming="false"
                        OnClick="btnSelMenu_Click" CssClass="searchbtn" OnClientClick="return selMenu();">
                        <span>新增页面</span>
                    </asp:LinkButton>
                    <input type="hidden" id="hiMenu" runat="server" />
                    <asp:LinkButton ID="btnSaveMenu" runat="server" OnClick="btnSaveMenu_Click" EnableTheming="false"
                        CssClass="searchbtn">
                        <span>保存</span>
                    </asp:LinkButton>
                </div>
                <zhongsoft:lightpowergridview id="gvMenu" runat="server" autogeneratecolumns="false"
                    usedefaultdatasource="true" allowpaging="true" pagesize="15" allowsorting="true"
                    onrowdatabound="gvMenu_RowDataBound" onrowcommand="gvMenu_RowCommand" onrowdeleting="gvMenu_RowDeleting"
                    bindgridviewmethod="BindMenu" datakeynames="RuleId">
                            <Columns>
                                <asp:TemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                                    <ItemTemplate>
                                        <%#Container.DisplayIndex+1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="PageName" HeaderText="页面名称" SortExpression="PageName">
                                </asp:BoundField>
                                <asp:BoundField DataField="PageUrl" HeaderText="页面路径" SortExpression="PageUrl"></asp:BoundField>
                                <asp:BoundField DataField="ParentPageName" HeaderText="父级页面" SortExpression="ParentPageName">
                                </asp:BoundField>
                          <asp:TemplateField HeaderText="权限"  ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                       
                                                               <asp:DropDownList runat="server" ID="ddlAuthority" Width="100px">
                                                            </asp:DropDownList>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                <asp:TemplateField HeaderText="保存" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnSave" runat="server" CommandName="Save" EnableTheming="false" CommandArgument="<%#Container.DisplayIndex %>">
                                      <img alt="" src="../../Themes/Images/btn_save.gif" border='0' />
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnDelete" runat="server"  EnableTheming="false" CommandName="Delete">
                                      <img alt="" src="/portal/Themes/Images/btn_dg_delete.gif" onclick="if(!confirm('确认要删除吗？')) return false;" border='0' />
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </zhongsoft:lightpowergridview>
            </td>
        </tr>
    </table>
        </contenttemplate>
    </asp:UpdatePanel>

       <script type="text/javascript">
           function selMenu() {
               var access = $("#<%=ddlRoleAccess.ClientID %>").val();
               if (access == "") {
                   alert("请先选择访问级别");
                   return false;
               }
               var param = new InputParamObject("m");
               var re = getPage("<%=hiMenu.ClientID %>", param, null);
               if (re != null) {
                   return true;
               }
           }
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
