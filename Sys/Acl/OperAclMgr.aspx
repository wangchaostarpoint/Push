<%@ Page Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true"
    CodeBehind="OperAclMgr.aspx.cs" Inherits="Zhongsoft.Portal.Sys.OrgUsers.OperAclMgr" %>

<%@ Import Namespace="Zhongsoft.Portal.ACL" %>
<%@ Import Namespace="Zhongsoft.Framework" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="acl">
        <ul>
            <li><a href="#pageAcl">页面权限</a></li><li><a href="#formAcl">表单权限</a></li>
        </ul>
        <div id="pageAcl">
            <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
                <ContentTemplate>
                    <table class="tz-table">
                        <tr>
                            <td align="right">
                                权限级别<asp:DropDownList ID="ddlAcl" runat="server" Width="100px">
                                </asp:DropDownList>
                                模块名称<asp:DropDownList ID="ddlPageModule" runat="server" Width="100px">
                                </asp:DropDownList>
                                页面名称<zhongsoft:LightTextBox runat="server" ID="tbPageName" Width="100px" MaxLength="60"></zhongsoft:LightTextBox>
                                <asp:LinkButton runat="server" ID="btnQueryPage" OnClick="btnQueryPage_Click">
                                    <span>查找</span>
                                </asp:LinkButton>
                                <asp:LinkButton runat="server" ID="btnResetPage" OnClick="btnResetPage_Click">
                                    <span>重置</span>
                                </asp:LinkButton>
                                <asp:LinkButton runat="server" ID="lbtnInheritAcl" OnClientClick="showInheritAcl();return false;">
                                    <span>继承对象</span>
                                </asp:LinkButton>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <zhongsoft:LightPowerGridView ID="gvPageAcl" runat="server" AllowPaging="true" PageSize="8"
                                    BindGridViewMethod="BindPageAcl" AutoGenerateColumns="false" UseDefaultDataSource="true"
                                    DataKeyNames="PAGEID" OnRowDeleting="gvPageAcl_RowDeleting" OnRowDataBound="gvPageAcl_RowDataBound">
                                    <Columns>
                                        <asp:BoundField DataField="MODULENAME" HeaderText="模块名称" />
                                        <asp:BoundField DataField="PAGENAME" HeaderText="页面名称" />
                                        <asp:TemplateField HeaderText="权限级别">
                                            <ItemTemplate>
                                                <%# ObjectEnum.GetDisplayName(typeof(AccessLevel), Int16.Parse(Eval("AccessLevel").ToString()))%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <zhongsoft:LightButtonField CommandName="Delete" HeaderText="删除">
                                        </zhongsoft:LightButtonField>
                                    </Columns>
                                </zhongsoft:LightPowerGridView>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <table width="220">
                                    <tr>
                                        <td>
                                            权限级别<asp:DropDownList ID="ddlAccess" runat="server" Width="100px">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <zhongsoft:LightObjectSelector runat="server" ID="lbsPage" Writeable="true" SourceMode="SelectorPage"
                                                PageUrl="~/Sys/Menu/PageSelector.aspx" ResultAttr="name" IsMutiple="true" Text="添加"
                                                OnlyShowButton="true" OnClick="lbsPage_Click" Width="100%" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="formAcl">
            <asp:UpdatePanel runat="server" ID="roleUpdate" UpdateMode="Conditional">
                <ContentTemplate>
                    <table class="tz-table">
                        <tr>
                            <td align="right">
                                表单分类<asp:DropDownList ID="ddlFormModule" runat="server" Width="100px">
                                </asp:DropDownList>
                                表单名称<zhongsoft:LightTextBox runat="server" ID="tbFormName" Width="100px" MaxLength="60"></zhongsoft:LightTextBox>
                                <asp:LinkButton runat="server" ID="btnQueryForm" OnClick="btnQueryForm_Click">
                                    <span>查找</span>
                                </asp:LinkButton>
                                <asp:LinkButton runat="server" ID="btnResetForm" OnClick="btnResetForm_Click">
                                    <span>重置</span>
                                </asp:LinkButton>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <zhongsoft:LightPowerGridView ID="gvFormAcl" runat="server" AllowPaging="true" PageSize="8"
                                    AutoGenerateColumns="false" UseDefaultDataSource="true" DataKeyNames="OBJECTID"
                                    OnRowDeleting="gvFormAcl_RowDeleting" BindGridViewMethod="BindFormAcl" OnRowDataBound="gvFormAcl_RowDataBound">
                                    <Columns>
                                        <asp:BoundField DataField="FormType" HeaderText="表单分类" />
                                        <asp:BoundField DataField="FORMNAME" HeaderText="表单名称" />
                                        <asp:TemplateField HeaderText="权限级别">
                                            <ItemTemplate>
                                                <%# ObjectEnum.GetDisplayName(typeof(AccessLevel), Int16.Parse(Eval("AccessLevel").ToString()))%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <zhongsoft:LightButtonField CommandName="Delete" HeaderText="删除">
                                        </zhongsoft:LightButtonField>
                                    </Columns>
                                </zhongsoft:LightPowerGridView>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <zhongsoft:LightObjectSelector runat="server" ID="lbsForm" Writeable="true" SourceMode="SelectorPage"
                                    PageUrl="~/Sys/Workflow/WfFormSelector.aspx" ResultAttr="name" IsMutiple="true"
                                    Width="50px" Text="添加" OnlyShowButton="true" OnClick="lbsForm_Click" />
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <script>
        $(function () {
            $('#acl').tabs();
        });
        function showInheritAcl() {
            showModal(buildQueryUrl("Sys/Acl/InheritAclMgr.aspx", { UserId: "<%=OperatorId %>" }), "", 900, 500);
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
