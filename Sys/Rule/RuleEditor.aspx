<%@ Page Title="规则配置" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="RuleEditor.aspx.cs" Inherits="Zhongsoft.Portal.Sys.Rule.RuleEditor" %>

<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
    <div class="subtoolbarbg">
        <asp:LinkButton runat="server" ID="btnView" CssClass="subtoolbarlink" OnClientClick="return viewReference()"
            DisplayStatus="(3.*)" EnableTheming="false"><span>查看引用</span></asp:LinkButton></div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <asp:ScriptManager runat="server" ID="ScriptManager1">
    </asp:ScriptManager>
    <table class="tz-table">
        <tr>
            <td class="td-l">
                所属模块<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <zhongsoft:LightDropDownList runat="server" ID="ddlModule" req="1" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                规则类型<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <zhongsoft:LightDropDownList runat="server" ID="ddlRuleType" AutoPostBack="true"
                    req="1" OnSelectedIndexChanged="ddlRuleType_Change" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                规则编号<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <table width="85%">
                    <tr>
                        <td>
                            <zhongsoft:LightTextBox runat="server" ID="tbRuleCodePrefix" ReadOnly="true" req="1"
                                Width="99%"></zhongsoft:LightTextBox>
                        </td>
                        <td>
                            <zhongsoft:LightTextBox runat="server" ID="tbRuleCode" DataType="EnNumStr" req="1"
                                Width="99%" activestatus="(23.*)"></zhongsoft:LightTextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                规则名称<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox runat="server" ID="tbRulename" req="1" activestatus="(23.*)"> </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                说明
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox runat="server" ID="tbMemo" TextMode="MultiLine" EnableTheming="false"
                    CssClass="kpms-textarea" MaxLength="200" activestatus="(23.*)"> </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                插件
            </td>
            <td class="td-m">
                <input type="hidden" runat="server" id="hiPluginId" />
                <zhongsoft:LightObjectSelector runat="server" ID="lbsPlugin" PageUrl="~/Sys/Plugins/PluginSelector.aspx"
                    ResultAttr="name" ResultForControls="{'hiPluginId':'id'}" activestatus="(23.*)" />
            </td>
        </tr>
        <tr flag="TransitionEvent" style="display: none">
            <td>
                验证sql
            </td>
            <td>
                <zhongsoft:LightTextBox runat="server" ID="tbTransSql" EnableTheming="false" CssClass="kpms-textarea"
                    TextMode="MultiLine" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr flag="TransitionEvent" style="display: none">
            <td>
                迁移规则表达式
            </td>
            <td>
                <zhongsoft:LightTextBox runat="server" ID="tbExpression" EnableTheming="false" CssClass="kpms-textarea"
                    TextMode="MultiLine" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr flag="ParticipantEvent" style="display: none">
            <td>
                参与人sql
            </td>
            <td>
                <zhongsoft:LightTextBox runat="server" ID="tbPartSql" EnableTheming="false" CssClass="kpms-textarea"
                    TextMode="MultiLine" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr flag="ParticipantEvent" style="display: none">
            <td>
                参与人配置
            </td>
            <td>
                <table width="85%">
                    <tr>
                        <td>
                            <div id="templateTabs">
                                <ul>
                                    <li><a href='#user' id='auser'>特定用户</a></li>
                                    <li><a href='#dept' id='adept'>特定部门</a></li>
                                    <li><a href='#role' id='arole'>特定角色</a></li>
                                    <li><a href='#deptrole' id='adeptrole'>部门角色</a></li>
                                </ul>
                                <div id="user">
                                    <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <table class="tz-table">
                                                <tr>
                                                    <td class="td-m">
                                                        <input type="hidden" id="hiUsers" runat="server" />
                                                        <asp:ListBox runat="server" ID="listUsers" Rows="8" SelectionMode="Multiple" Width="300px"
                                                            activestatus="(23.*)"></asp:ListBox>
                                                        <asp:LinkButton runat="server" ID="lbtnSelUser" OnClientClick="return selUser();"
                                                            activestatus="(23.*)" EnableTheming="false" OnClick="lbtnSelUser_Click"><img src="/Portal/Themes/Images/look-up.gif"  /></asp:LinkButton>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                                <div id="dept">
                                    <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <table class="tz-table">
                                                <tr>
                                                    <td class="td-m">
                                                        <input type="hidden" id="hiDepts" runat="server" />
                                                        <asp:ListBox runat="server" ID="listDepts" Rows="8" SelectionMode="Multiple" Width="300px"
                                                            activestatus="(23.*)"></asp:ListBox>
                                                        <asp:LinkButton runat="server" ID="lbtnSelDept" OnClientClick="return selDept();"
                                                            EnableTheming="false" OnClick="lbtnSelDept_Click"><img src="/Portal/Themes/Images/look-up.gif"  activestatus="(23.*)" /></asp:LinkButton>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                                <div id="role">
                                    <asp:UpdatePanel runat="server" ID="UpdatePanel3" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <table class="tz-table">
                                                <tr>
                                                    <td class="td-m">
                                                        <input type="hidden" id="hiRoles" runat="server" />
                                                        <asp:ListBox runat="server" ID="listRoles" Rows="8" SelectionMode="Multiple" Width="300px"
                                                            activestatus="(23.*)"></asp:ListBox>
                                                        <asp:LinkButton runat="server" ID="lbtnSelRole" OnClientClick="return selRole();"
                                                            activestatus="(23.*)" EnableTheming="false" OnClick="lbtnSelRole_Click"><img src="/Portal/Themes/Images/look-up.gif"  /></asp:LinkButton>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                                <div id="deptrole">
                                    <asp:UpdatePanel runat="server" ID="UpdatePanel4" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <table class="tz-table">
                                                <tr>
                                                    <td class="td-m" style="width: 300px">
                                                        <input type="hidden" runat="server" id="hiDeptRole" />
                                                        <asp:ListBox runat="server" ID="listDeptRole" SelectionMode="Multiple" Rows="6" Width="300"
                                                            activestatus="(23.*)"></asp:ListBox>
                                                    </td>
                                                    <td class="td-m" align="left">
                                                        <asp:LinkButton runat="server" ID="btnAddDeptRole" CssClass="kpms-btn" OnClientClick="return selDeptRole();"
                                                            activestatus="(23.*)"><span>添加</span></asp:LinkButton>
                                                        <br />
                                                        <asp:LinkButton runat="server" ID="btnDelRole" CssClass="kpms-btn" OnClientClick="return delDeptRole();"
                                                            activestatus="(23.*)"><span>删除</span></asp:LinkButton>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <script>


        function viewReference() {
            var url = buildQueryUrl("/sys/Rule/RuleReference.aspx", { RuleId: "<%=BusinessObjectId%>", IsModalDialog: "1" });
            showDivDialog(url, null, 700, 450, null);
            return false;
        }

        function setDisplay() {

            var type = $("#<%=ddlRuleType.ClientID %>").val();
            if (type == "TransitionEvent") {
                $("tr[flag='TransitionEvent']").show();
                $("tr[flag='ParticipantEvent']").hide();
            }
            else if (type == "ParticipantEvent") {
                $("tr[flag='TransitionEvent']").hide();
                $("tr[flag='ParticipantEvent']").show();
            } else {
                $("tr[flag='TransitionEvent']").hide();
                $("tr[flag='ParticipantEvent']").hide();
            }
        }

        $("#<%=ddlRuleType.ClientID %>").live("change", function () { setDisplay(); })

        function initCustomerPlugin() {
            setDisplay();
            $("#templateTabs").tabs();
            loadDeptRole();
        }

        function selUser() {
            var param = new InputParamObject("m");
            var re = getUsers("<%=hiUsers.ClientID %>", param, "");
            if (re != null) {
                return true;
            }
            return false
        }

        function selDept() {
            var param = new InputParamObject("m");
            var re = getOrgs("<%=hiDepts.ClientID %>", param, "");
            if (re != null) {
                return true;
            }
            return false
        }


        function selRole() {
            var param = new InputParamObject("m");
            var re = getRoles("<%=hiRoles.ClientID %>", param, "");
            if (re != null) {
                return true;
            }
            return false
        }

        function selDeptRole() {
            var param = new InputParamObject("m");
            var hiXmlId = "<%=hiDeptRole.ClientID %>";
            var re = getDeptRoles(hiXmlId, param, "");

            if (re != null) {
                $("#" + hiXmlId).val(re.xml());
                bindListDeptRole(re);
            }
            return false;
        }

        function delDeptRole() {
            var hiDeptRole = $("#<%=hiDeptRole.ClientID %>");
            var roles = new KPMSXml();

            roles.loadXML(hiDeptRole.val());
            $("#<%=listDeptRole.ClientID %> option").each(function () {
                if ($(this)[0].selected) {
                    var id = $(this).val();
                    roles.removeChildNode(id, "o")
                    $(this).remove();
                }
            });

            hiDeptRole.val(roles.xmlDoc.xml);
            return false;
        }

        function bindListDeptRole(result) {

            var nodes = result.selectNodes("/root/o");
            var listDeptRole = $("#<%=listDeptRole.ClientID %>");
            listDeptRole.find("option").remove();
            for (var i = 0; i < nodes.length; i++) {
                var id = result.getAttrVal(i, "o", "id");
                var roleName = result.getAttrVal(i, "o", "name");
                var orgName = result.getAttrVal(i, "o", "OrgName");
                listDeptRole.append($("<option value=" + id + ">" + roleName + "-" + orgName + "</option>"))
            }
        }

        function loadDeptRole() {
            var hiDeptRole = $("#<%=hiDeptRole.ClientID %>");
            var roles = new KPMSXml();
            roles.loadXML(hiDeptRole.val());
            bindListDeptRole(roles);
        }
    </script>
</asp:Content>
