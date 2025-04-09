<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AclMgr.aspx.cs" MasterPageFile="~/UI/Master/ObjectCfg.Master"
    Inherits="Zhongsoft.Portal.Sys.AclMgr" %>

<%@ Import Namespace="Zhongsoft.Portal.ACL" %>
<%@ Import Namespace="Zhongsoft.Framework" %>
<asp:Content ID="Content1" ContentPlaceHolderID="topBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="AclTabs">
        <ul>
            <li><a href="#Permission" id="aPermission">标准权限控制</a></li>
            <li><a href="#Action" id="aAction">扩展权限控制</a></li>
            <li><a href="#Filter" id="aFilter">过滤条件</a></li>
        </ul>
        <div id="Permission">
            <asp:UpdatePanel ID="PermissionPanel" runat="server">
                <ContentTemplate>
                    <table class="tz-table">
                        <tr>
                            <td class="td-l">访问者类型
                            </td>
                            <td class="td-r">
                                <zhongsoft:LightDropDownList ID="ddlOperatorType" runat="server" Width="200px" AutoPostBack="true"
                                    OnSelectedIndexChanged="ddlOperatorType_SelectedIndexChanged">
                                </zhongsoft:LightDropDownList>
                            </td>
                            <td class="td-l">访问级别
                            </td>
                            <td class="td-r">
                                <zhongsoft:LightDropDownList ID="ddlAccess" runat="server" Width="200px">
                                </zhongsoft:LightDropDownList>
                            </td>
                            <td class="td-l" nowrap="nowrap">
                                <zhongsoft:LightObjectSelector runat="server" ID="lbsOperator" Writeable="true" SourceMode="SelectorPage"
                                    PageUrl="~/Sys/OrgUsers/UserSelector.aspx" ResultAttr="name" IsMutiple="true"
                                    Text=" 添加访问者" ImageUrl="~/Themes/Images/btn_add.gif" OnlyShowButton="true" OnClick="lbsOperator_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5">
                                <zhongsoft:LightPowerGridView ID="aclList" runat="server" AutoGenerateColumns="false"
                                    BindGridViewMethod="BindObjectACL" UseDefaultDataSource="true" DataKeyNames="RuleId"
                                    EmptyDataText="没有权限信息" OnRowDeleting="aclList_RowDeleting" AllowPaging="true"
                                    PageSize="20" Width="100%">
                                    <Columns>
                                        <asp:BoundField DataField="OperatorName" HeaderText="访问者" />
                                        <asp:TemplateField HeaderText="访问者类型">
                                            <ItemTemplate>
                                                <%# ObjectEnum.GetDisplayName(typeof(OperatorType), Int16.Parse(Eval("OperatorType").ToString()))%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="访问级别">
                                            <ItemTemplate>
                                                <%# GetAccessLevel(Int16.Parse(Eval("AccessLevel").ToString()))%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <zhongsoft:LightButtonField CommandName="Delete" HeaderText="删除">
                                        </zhongsoft:LightButtonField>
                                    </Columns>
                                </zhongsoft:LightPowerGridView>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="Action">
            <iframe id="framEx" runat="server" src="" frameborder="0" width="100%" height="100%"
                scrolling="auto" allowtransparency="true"></iframe>
        </div>
        <div id="Filter">
            <asp:UpdatePanel ID="FilterPanel" runat="server">
                <ContentTemplate>
                    <table width="100%">
                        <tr>
                            <td>列过滤
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <zhongsoft:LightPowerGridView EmptyDataText="没有列过滤条件" ID="FieldFilterList" runat="server"
                                    OnAddClientClick="addFilters('4')" ShowAddData="true" OnAddData="btnAddField_Click"
                                    DataKeyNames="FilterId" UseDefaultDataSource="true" AutoGenerateColumns="false"
                                    OnRowCommand="FieldFilterList_RowCommand" OnRowDataBound="FieldFilterList_RowDataBound">
                                    <Columns>
                                        <asp:TemplateField HeaderText="类型" HeaderStyle-Width="5%">
                                            <ItemTemplate>
                                                <%# GetSecurityObjectTitle(Convert.ToInt16(Eval("SecurityObjectType")) )%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="参与人" HeaderStyle-Width="30%">
                                            <ItemTemplate>
                                                <div class="autoskip" style="width: 200px">
                                                    <asp:Label runat="server" ID="lblOperator"></asp:Label>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <zhongsoft:LightBoundField DataField="ExtendedAttribute" HeaderText="列" HeaderStyle-Width="200px" ShowToolTip="true" />
                                        <asp:BoundField DataField="Remark" HeaderText="说明" HeaderStyle-Width="20%" />
                                        <zhongsoft:LightButtonField HeaderText="编辑" CommandName="EditData" HeaderStyle-Width="5%"
                                            DataParamFields="SecurityObjectType,FilterId" EditItemClick="editFilter">
                                        </zhongsoft:LightButtonField>
                                        <zhongsoft:LightButtonField HeaderText="删除" CommandName="DeleteData" HeaderStyle-Width="5%">
                                        </zhongsoft:LightButtonField>
                                    </Columns>
                                </zhongsoft:LightPowerGridView>
                            </td>
                        </tr>
                        <tr>
                            <td>行过滤
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <zhongsoft:LightPowerGridView EmptyDataText="没有行过滤条件" ID="RowFilterList" runat="server"
                                    ShowAddData="true" OnAddClientClick="addFilters('3')" OnAddData="btnAddRow_Click"
                                    DataKeyNames="FilterId" UseDefaultDataSource="true" AutoGenerateColumns="false"
                                    OnRowDataBound="RowFilterList_RowDataBound" OnRowCommand="RowFilterList_RowCommand">
                                    <Columns>
                                        <asp:TemplateField HeaderText="类型" HeaderStyle-Width="5%">
                                            <ItemTemplate>
                                                <%# GetSecurityObjectTitle(Convert.ToInt16(Eval("SecurityObjectType")) )%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="参与人" HeaderStyle-Width="30%">
                                            <ItemTemplate>
                                                <div class="autoskip" style="width: 200px">
                                                    <asp:Label runat="server" ID="lblOperator"></asp:Label>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="表达式" HeaderStyle-Width="30%">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lblSql"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="优先级" HeaderStyle-Width="5%" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lblLevel"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Remark" HeaderText="说明" HeaderStyle-Width="20%" />
                                        <zhongsoft:LightButtonField HeaderText="编辑" CommandName="EditData" HeaderStyle-Width="5%"
                                            DataParamFields="SecurityObjectType,FilterId" EditItemClick="editFilter">
                                        </zhongsoft:LightButtonField>
                                        <zhongsoft:LightButtonField HeaderText="删除" CommandName="DeleteData" HeaderStyle-Width="5%">
                                        </zhongsoft:LightButtonField>
                                    </Columns>
                                </zhongsoft:LightPowerGridView>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <script language="javascript">
        function editFilter(type, id) {
            var json = { "SecurityObjectId": "<%=SecurityObjectId %>", "Type": type };
            var url = buildBizUrl(3, id, "/sys/Acl/AclFilterEditor.aspx", json);
            return checkReturn(showModal(url, null, 800, 500));

        }
        function addFilters(type) {
            var json = { "SecurityObjectId": "<%=SecurityObjectId %>", "Type": type };
            var url = buildBizUrl(2, "", "/sys/Acl/AclFilterEditor.aspx", json);
            return checkReturn(showModal(url, null, 800, 500));
        }
        function initCustomerPlugin() {
            var moduleId = "<%=SecurityObjectId %>";
            var moduleName = "<%=SecurityObjectName %>";
            var url = buildQueryUrl("Sys/Acl/ExAclMgr.aspx", { ModuleId: moduleId, ModuleName: escape(moduleName) });
            $("#<%=framEx.ClientID %>").attr("src", url);
            $("[objtype]").click(function () {

                var type = $(this).attr("objtype");
                addFilter(type);

            });
            $("#AclTabs").tabs();
            if ("<%=ObjSecurityType%>" == "<%=ObjectSecurityType.Module %>") $("#aFilter").hide();
            else if ("<%=ObjSecurityType%>" == "<%=ObjectSecurityType.Form %>") { $("#aFilter").hide(); $("#aAction").hide() }
            else if ("<%=ObjSecurityType%>" == "<%=ObjectSecurityType.WebPart %>") { $("#aFilter").hide(); $("#aAction").hide() }
            else { $("#aAction").hide() }
        }
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="bottomBar" runat="server">
</asp:Content>
