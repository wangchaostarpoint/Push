<%@ Page Title="选择部门" Language="C#" MasterPageFile="~/UI/Master/ObjectSelector.Master"
    AutoEventWireup="true" CodeBehind="OrgTreeSelector.aspx.cs" Inherits="Zhongsoft.Portal.Sys.OrgUsers.OrgTreeSelector" %>

<%@ Register Assembly="Zhongsoft.Portal.UI.Controls" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <table class="tz-table">
        <tr>
            <td width="75%" valign="top" class="selector-tree" nowrap>
                <table>
                    <tr>
                        <td>
                            部门等级
                        </td>
                        <td>
                            <asp:CheckBoxList ID="cblDeptLevel" runat="server" RepeatDirection="Horizontal" AutoPostBack="True"
                                OnSelectedIndexChanged="cblDeptLevel_SelectedIndexChanged">
                                <asp:ListItem Value="2">二级</asp:ListItem>
                                <asp:ListItem Value="3">三级</asp:ListItem>
                                <asp:ListItem Value="4">四级</asp:ListItem>
                                <asp:ListItem Value="5">五级</asp:ListItem>
                            </asp:CheckBoxList>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td valign="top" class="selector-tree">
                <div style="overflow-x: auto; height: 275px !important">
                    <asp:TreeView runat="server" ID="orgTree" ShowLines="True" Height="100%" >
                        <SelectedNodeStyle BackColor="#F7F7F7" />
                    </asp:TreeView>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:LinkButton runat="server" ID="btnBind" OnClick="btnBind_Click" Style="display: none"></asp:LinkButton>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                
                <zhongsoft:LightPowerGridView BindJsonClick="true" ID="OrgsList" AllowPaging="true"
                    PageSize="10" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true"
                    OnJsonClick="addObject" JsonClickMode="onclick" Visible="false">
                    <Columns>
                        <asp:BoundField DataField="OrgUnitName" HeaderText="部门名称"></asp:BoundField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
                </div>
            </td>
        </tr>
    </table>
    <script>
        function initCustomerPlugin() {
            $('#divtoolBar').hide();
        }
        function postBackByObject()
        {
            var o = window.event.srcElement;
            if (o.tagName == "INPUT" && o.type == "checkbox") {
                //第一个参数写UpdatePanel的ID，否则就是整个页面刷了
                //__doPostBack("", "");                
                <%=this.ClientScript.GetPostBackEventReference(this.btnBind, "")%>;
            }
        }
    </script>
</asp:Content>
