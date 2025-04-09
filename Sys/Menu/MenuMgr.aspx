<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuMgr.aspx.cs" MasterPageFile="~/UI/Master/ObjectList.Master"
    Inherits="Zhongsoft.Portal.Sys.MenuMgr" %>

<%@ Import Namespace="Zhongsoft.Portal.ACL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
    <div>
        <asp:TreeView ID="treMenu" runat="server" OnSelectedNodeChanged="tvMenuTree_SelectedNodeChanged"
            Height="100%" Width="100%" ShowLines="false">
            <SelectedNodeStyle BackColor="#F7F7F7" />
        </asp:TreeView>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="listGrid" runat="server">
    <table width="100%">
        <tr>
            <td valign="top">
                <div id="AclTabs">
                    <ul>
                        <li><a href="#Permission" id="aPermission">菜单设置</a></li>
                        <li><a href="#Action" id="aAction">权限控制</a></li>
                        <li><a href="#Person" id="aPerson">人员查询</a></li>
                    </ul>
                    <div id="Permission">
                        <div runat="server" id="divApp">
                            <table class="tz-table">
                                <tr class="subtoolbar" runat="server" id="trAddModule">
                                    <td style="width: 35%">
                                        <asp:LinkButton ID="btnAddModule" OnClick="btnAddModule_Click" runat="server">
                                       <span>增加</span></asp:LinkButton>
                                        增加[<asp:Label ID="lblPortalTitle" runat="server" Font-Bold="true"></asp:Label>]的子模块
                                    </td>
                                    <td>
                                        <asp:DataList runat="server" ID="appList" RepeatDirection="Horizontal" RepeatColumns="5"
                                            OnItemDataBound="appList_ItemDataBound" OnItemCommand="appList_ItemCommand" EnableTheming="false">
                                            <ItemTemplate>
                                                系统名称：
                                                <%#Eval("AppName").ToString()%>
                                                <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="EditData" EnableTheming="false">
                                                        <img title="配置管理" src="../../Themes/Images/btn-cfg.gif"  /></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:DataList>
                                    </td>
                                </tr>
                            </table>
                            <div style="margin-top: 4px">
                                <zhongsoft:LightPowerGridView ID="gvModule" runat="server" Width="100%" AutoGenerateColumns="False"
                                    BindGridViewMethod="BindModule" AllowPaging="true" AllowSorting="true" PageSize="20"
                                    OnRowDataBound="gvModule_ItemDataBound" OnRowCommand="gvModule_ItemCommand" DataKeyNames="ModuleId"
                                    UseDefaultDataSource="true">
                                    <Columns>
                                        <asp:BoundField DataField="ModuleId" HeaderText="模块ID" Visible="False"></asp:BoundField>
                                        <asp:TemplateField HeaderText="模块名称">
                                            <ItemTemplate>
                                                <%#Eval("ModuleName").ToString()%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="页面权限" ItemStyle-Width="8%">
                                            <ItemTemplate>
                                                <%#GetPermissionFlag(Convert.ToString(Eval("IsPublic")))%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="编辑" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="4%">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="EditData" EnableTheming="false">
                                    <img alt="编辑" src="../../Themes/Images/btn_dg_edit.gif" border='0' onclick="return editModule('<%#Eval("ModuleId").ToString()%>')" />
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="权限" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="4%">
                                            <ItemTemplate>
                                                <a href="#" onclick="editPermission('<%# Eval("ModuleId").ToString() %>','<%# Eval("ModuleName").ToString() %>','')">
                                                    <img title="权限" src="../../Themes/Images/btn_lock.gif" /></a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="配置设置" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="4%">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnEditConfig" runat="server" EnableTheming="false">
                                            <img alt="配置设置" src="/Portal/Themes/Images/btn-cfg.gif" border='0'  />
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="4%">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="DeleteData" Visible="False"
                                                    EnableTheming="false">
                                      <img alt="" src="../../Themes/Images/btn_dg_delete.gif" onclick="if(!confirm('删除模块，其配置也会删除，确认要删除吗？')) return false;" border='0' />
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </zhongsoft:LightPowerGridView>
                            </div>
                        </div>
                        <div runat="server" id="divModule" visible="false">
                            <table class="tz-table">
                                <tr>
                                    <td>
                                        <asp:DataList runat="server" ID="moduleList" RepeatDirection="Horizontal" RepeatColumns="5"
                                            OnItemCommand="moduleList_ItemCommand" OnItemDataBound="moduleList_ItemDataBound"
                                            DataKeyField="ModuleId">
                                            <ItemStyle Width="170px" Height="100px" BackColor="AliceBlue" BorderColor="CadetBlue"
                                                BorderWidth="1px" Font-Size="Medium" />
                                            <ItemTemplate>
                                                <table>
                                                    <tr>
                                                        <td style="height: 20px">
                                                            模块名称：
                                                            <%#Eval("ModuleName").ToString()%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="height: 20px">
                                                            模块权限：
                                                            <%#GetPermissionFlag(Eval("IsPublic").ToString())%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" style="height: 20px">
                                                            <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="EditData" EnableTheming="false">
                                                    <img alt="编辑模块" src="../../Themes/Images/btn_dg_edit.gif" border='0' onclick="return editModule('<%# Eval("ModuleId").ToString() %>')" />
                                                            </asp:LinkButton>
                                                            <a href="#" onclick="editPermission('<%# Eval("ModuleId").ToString() %>','<%# Eval("ModuleName").ToString() %>','1')">
                                                                <img title="权限设置" src="/portal/Themes/Images/btn_lock.gif" /></a>
                                                            <asp:LinkButton ID="lbtnEditConfig" runat="server" CommandName="EditData" EnableTheming="false">
                                                    <img alt="配置设置" src="/Portal/Themes/Images/btn-cfg.gif" border='0'  />
                                                            </asp:LinkButton>
                                                            <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="DeleteData" Visible="false"
                                                                EnableTheming="false">
                                                <img alt="删除" src="/portal/Themes/Images/btn_dg_delete.gif" onclick="if(!confirm('删除模块，其配置也会删除，确认要删除吗？')) return false;" border='0' />
                                                            </asp:LinkButton>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                        </asp:DataList>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div runat="server" id="divMenu" visible="false">
                            <table class="tz-table">
                                <tr runat="server" id="trAddMenu">
                                    <td class="subtoolbar">
                                        <asp:LinkButton ID="btnAddMenu" CssClass="kpms-btn" OnClick="btnAddMenu_Click" runat="server">
                                      <span>增加</span></asp:LinkButton>
                                        增加[<asp:Label ID="lbPrompt" runat="server" Font-Bold="true"></asp:Label>]的子页面 &nbsp;&nbsp;&nbsp;
                                        页面名称<asp:TextBox runat="server" ID="tbPageName" Width="100px"></asp:TextBox>
                                        <asp:LinkButton ID="btnQuery" OnClick="btnQuery_Click" runat="server">
                                        <span content='searchResult'>查找</span></asp:LinkButton>
                                        <asp:LinkButton runat="server" ID="btnResrt" OnClick="btnReset_Click">
                    <span>重置</span>
                                        </asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                            <div style="margin-top: 4px">
                                <zhongsoft:LightPowerGridView ID="pdgMenu" runat="server" Width="100%" AutoGenerateColumns="False"
                                    BindGridViewMethod="DataGridBindMenu" AllowPaging="true" PageSize="15" OnRowDataBound="pdgMenu_ItemDataBound"
                                    OnRowCommand="pdgMenu_ItemCommand" DataKeyNames="PageId">
                                    <Columns>
                                        <asp:BoundField DataField="PageId" HeaderText="PageId" Visible="False"></asp:BoundField>
                                        <asp:BoundField DataField="ParentPageId" HeaderText="ParentPageId" Visible="False">
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="页面名称">
                                            <ItemTemplate>
                                                <a href="<%# Eval("PageUrl").ToString() == "" ? "#" : "/Portal" + Eval("PageUrl").ToString() %>"
                                                    target="_blank">
                                                    <%#Eval("PageName").ToString()%></a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="PageUrl" HeaderText="Url路径"></asp:BoundField>
                                        <asp:TemplateField HeaderText="自定义" ItemStyle-Width="8%" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <%#GetIsXpage(Convert.ToString(Eval("IsXpage")))%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="页面类型" ItemStyle-Width="8%" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <%#GetPageType(Convert.ToString(Eval("PageType")))%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="编辑" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="4%">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="EditData" EnableTheming="false">
                                    <img alt="编辑" src="../../Themes/Images/btn_dg_edit.gif" border='0' onclick="return editMenu('<%#Eval("PageId").ToString()%>')" />
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="页面权限" ItemStyle-Width="8%">
                                            <ItemTemplate>
                                                <%#GetPermissionFlag(Convert.ToString(Eval("IsPublic")))%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="操作权限" ItemStyle-Width="8%" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <%#GetPermissionFlag(Convert.ToString( Eval("ActionIsPublic")))%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="权限" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="4%">
                                            <ItemTemplate>
                                                <a href="#" onclick="editPermission('<%# Eval("PageId").ToString() %>','<%# Eval("PageName").ToString() %>','')">
                                                    <img title="权限" src="../../Themes/Images/btn_lock.gif" /></a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="4%">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="DeleteData" Visible="False"
                                                    EnableTheming="false">
                                      <img alt="" src="../../Themes/Images/btn_dg_delete.gif" onclick="if(!confirm('确认要删除吗？')) return false;" border='0' />
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </zhongsoft:LightPowerGridView>
                            </div>
                        </div>
                    </div>
                    <div id="Action">
                        <iframe id="framAction" runat="server" src="" frameborder="0" width="100%" height="450px"
                            scrolling="auto" allowtransparency="true"></iframe>
                    </div>
                    <div id="Person">
                        reny
                    </div>
                </div>
            </td>
        </tr>
    </table>
    <script type="text/javascript">
        function initCustomerPlugin() {
            $("#AclTabs").tabs();
            $("#aPerson").hide();
        }
        function changeNode(isModule, menuId) {
            var type = parseBool(isModule) ? "<%=ObjectSecurityType.Module %>" : "<%=ObjectSecurityType.Page %>";
            var menuName = "<%=SelectedNode.Text %>";
            var url = buildQueryUrl("sys/Acl/AclMgr.aspx", { secObjId: menuId, secObjName: encodeURI(menuName), ObjSecurityType: type });
            $("#<%=framAction.ClientID %>").attr("src", url);
        }

        function editMenu(menuId) {
            var url = buildBizUrl(3, menuId, "sys/menu/MenuEditor.aspx", null);
            return checkReturn(showModal(url, null, 800, 600));
        }
        function addMenu(parentMenuId, scope, moduleId) {
            var url = buildBizUrl(2, null, "sys/menu/MenuEditor.aspx", { ParentMenuId: parentMenuId, PageScope: scope, ModuleId: moduleId });
            return checkReturn(showModal(url, null, 800, 600));
        }
        function addModule(type) {
            var url = buildBizUrl(2, null, "sys/menu/ModuleEditor.aspx", { ModuleType: type });
            return checkReturn(showModal(url, null, 800, 600));
        }
        function editModule(menuId) {
            var url = buildBizUrl(3, menuId, "sys/menu/ModuleEditor.aspx", null);
            return checkReturn(showModal(url, null, 700, 400));
        }
        function editConfig(clname, actionType) {
            var url = buildBizUrl(actionType, null, "sys/configeditor.aspx", { className: clname });
            return checkReturn(showModal(url, null, 800, 600));
        }
        function editPermission(menuId, menuName, isModule) {

            var type = parseBool(isModule) ? "<%=ObjectSecurityType.Module %>" : "<%=ObjectSecurityType.Page %>";
            var url = buildQueryUrl("sys/Acl/AclMgr.aspx", { secObjId: menuId, secObjName: encodeURI(menuName), ObjSecurityType: type });
            showModal(url, null, 980, 590);
        }
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
