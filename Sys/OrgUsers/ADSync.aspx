<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectList.Master"
    Title="组织架构同步" CodeBehind="ADSync.aspx.cs" Inherits="Zhongsoft.Portal.ADSync" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <table>
        <tr>
            <td width="20%" valign="top" style="border: 1px #6699FF solid;">
                <asp:TreeView runat="server" ID="orgTree" ShowCheckBoxes="All">
                </asp:TreeView>
            </td>
            <td width="500px" valign="top">
                <table class="tz-table">
                    <tr>
                        <td colspan="2" class="tz-title">
                            LDAP路径
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">
                            路径
                        </td>
                        <td class="td-m">
                            <asp:TextBox runat="server" ID="tbPath" CssClass="kpms-textbox" Width="250px" Text="LDAP://"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">
                            用户名
                        </td>
                        <td class="td-m">
                            <asp:TextBox runat="server" ID="tbLoginName" CssClass="kpms-textbox" Width="250px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">
                            密码
                        </td>
                        <td class="td-m">
                            <asp:TextBox runat="server" ID="tbPassword" TextMode="Password" CssClass="kpms-textbox"
                                Width="250px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">
                        </td>
                        <td class="td-m">
                            <asp:LinkButton runat="server" ID="btndefine" CssClass="kpms-btn" CausesValidation="false"
                                OnClientClick="return CheckConfig()" OnClick="btnDefine_Click">
                    <span>获取AD信息</span>
                            </asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="tz-title">
                            基本同步配置
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">
                            创建根部门
                        </td>
                        <td class="td-m">
                            <asp:RadioButtonList runat="server" ID="rbtnCreateRoot" RepeatDirection="Horizontal"
                                req="1">
                                <asp:ListItem Value="1">是</asp:ListItem>
                                <asp:ListItem Value="0" Selected="True">否</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">
                            根部门名称
                        </td>
                        <td class="td-m">
                            <asp:TextBox runat="server" ID="tbName" CssClass="kpms-textbox" Width="250px" MaxLength="64"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">
                            生成部门编号
                        </td>
                        <td class="td-m">
                            <asp:RadioButtonList runat="server" ID="rbtnCreateCode" RepeatDirection="Horizontal"
                                req="1">
                                <asp:ListItem Value="1" Selected="True">是</asp:ListItem>
                                <asp:ListItem Value="0">否</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">
                            同步人员信息
                        </td>
                        <td class="td-m">
                            <asp:RadioButtonList runat="server" ID="rbtnSyncUser" RepeatDirection="Horizontal"
                                req="1">
                                <asp:ListItem Value="1" Selected="True">是</asp:ListItem>
                                <asp:ListItem Value="0">否</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">
                            删除不在AD中人员及部门
                        </td>
                        <td class="td-m">
                            <asp:RadioButtonList runat="server" ID="rbtnDelete" RepeatDirection="Horizontal">
                                <asp:ListItem Value="1">是</asp:ListItem>
                                <asp:ListItem Value="0" Selected="True">否</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                </table>
            </td>
            <td width="700px" valign="top">
                <table class="tz-table">
                    <tr>
                        <td colspan="2" class="tz-title">
                            对应关系配置
                        </td>
                    </tr>
                    <tr>
                        <td class="td-m" colspan="2">
                            <table>
                                <tr>
                                    <td style="width: 50px">
                                        OU属性
                                    </td>
                                    <td>
                                        <asp:DropDownList runat="server" ID="ddlOrgProperty" Width="100px">
                                            <asp:ListItem Value="">请选择</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td style="width: 50px">
                                        OU字段
                                    </td>
                                    <td>
                                        <asp:DropDownList runat="server" ID="ddlOrgColumns" Width="100px">
                                            <asp:ListItem Value="">请选择</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:LinkButton runat="server" ID="btnAddOrg" CssClass="kpms-btn" OnClientClick="return AddOrg();"
                                            OnClick="btnAddOrg_Click"><span>添加</span></asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="td-m" colspan="2">
                            <asp:ListBox runat="server" ID="boxOrg" SelectionMode="Multiple" Width="200px" Height="105px">
                            </asp:ListBox>
                            <asp:LinkButton runat="server" ID="btnDeleteOrg" CssClass="kpms-btn" OnClick="btnDeleteOrg_Click"><span>删除</span></asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td class="td-m" colspan="2">
                            <table>
                                <tr>
                                    <td style="width: 50px">
                                        User属性
                                    </td>
                                    <td>
                                        <asp:DropDownList runat="server" ID="ddlUserProperty" Width="100px">
                                            <asp:ListItem Value="">请选择</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td style="width: 50px">
                                        User字段
                                    </td>
                                    <td>
                                        <asp:DropDownList runat="server" ID="ddlUserColumns" Width="100px">
                                            <asp:ListItem Value="">请选择</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:LinkButton runat="server" ID="lbtnAddUser" CssClass="kpms-btn" OnClientClick="return AddUser();"
                                            OnClick="btnAddUser_Click"><span>添加</span></asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="td-m" colspan="2">
                            <asp:ListBox runat="server" ID="boxUser" SelectionMode="Multiple" Width="200px" Height="105px">
                            </asp:ListBox>
                            <asp:LinkButton runat="server" ID="lbtnDeleteUser" CssClass="kpms-btn" OnClick="btnDeleteUser_Click"><span>删除</span></asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td class="td-m" colspan="2" align="center">
                            <asp:LinkButton runat="server" ID="lbtnSave" CssClass="kpms-btn" OnClick="btnSave_Click"
                                OnClientClick="return Check()" Visible="false">
             <span>保存配置</span>
                            </asp:LinkButton>
                            <asp:LinkButton runat="server" ID="btnSync" CssClass="kpms-btn" OnClientClick="return Check()"
                                Visible="false" OnClick="btnSync_Click">
                 <span>确定同步</span>
                            </asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <script type="text/javascript">

        function Check() {
            return checkReqField();
        }

        function CheckConfig() {
            var msg = "";
            if ($("#<%=tbPath.ClientID %>").val() == "")
                msg += "请填写路径\n";
            if ($("#<%=tbLoginName.ClientID %>").val() == "")
                msg += "请填写用户名\n";
            if (msg != "") {
                alert(msg);
                return false;
            }
            else
                return true;
        }

        function AddOrg() {
            if ($("#<%=ddlOrgProperty.ClientID %>").val() == "" || $("#<%=ddlOrgColumns.ClientID %>").val() == "") {
                alert("请先选择OU属性及其对应的数据库字段再添加");
                return false;
            }
            return true;
        }

        function AddUser() {
            if ($("#<%=ddlUserProperty.ClientID %>").val() == "" || $("#<%=ddlUserColumns.ClientID %>").val() == "") {
                alert("请先选择User属性及其对应的数据库字段再添加");
                return false;
            }
            return true;
        }

        $("#<%=rbtnCreateRoot.ClientID %>").live('click', function () {
            var isCreate = $("input:radio[id*='<%=rbtnCreateRoot.ClientID %>']:checked").val() == "True";
            if (isCreate) {
                $("#<%=tbName.ClientID %>").attr("req", "1");
            }
            else {
                $("#<%=tbName.ClientID %>").removeAttr("req");
            }
        })

        $(function () {
            $(":checkbox").click(function () {
                SelectChildNode(this);
                //                SelectParentNode(this);
            });
            function SelectChildNode(Node) {
                var state = Node.checked;
                var parentTable = $(Node).parents("table")[0];
                var childDivs = $(parentTable).next("div");
                if (childDivs.length > 0) {
                    var childDiv = childDivs[0];
                    $(childDiv).contents().find(":checkbox").each(function () {
                        this.checked = state;
                    });
                }
            }
            function SelectParentNode(Node) {
                var parentDiv = $(Node).parents("div")[0];
                var parentTables = $(parentDiv).prev("table");
                var state = null;
                var state = Node.checked;
                var checks = $(parentDiv).find(":checkbox");
                for (var i = 0; i < checks.length; i++) {
                    if (checks[i].checked) {
                        state = true;
                        break;
                    }
                    else {
                        state = false;
                    }
                }
                if (state)
                    if (parentTables.length > 0) {
                        var parentTable = parentTables[0];
                        var parentCheckboxes = $(parentTable).find(":checkbox");
                        var parentCheckbox = parentCheckboxes[0];
                        parentCheckbox.checked = state;
                        SelectParentNode(parentCheckbox);
                    }
            }
        })
    </script>
</asp:Content>
