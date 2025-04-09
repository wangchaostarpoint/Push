<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProjectMgrUserChange.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.OBS.ProjectMgrUserChange" %>
<tr runat="server" id="trRoleConfig" visible="false">
    <td class="td-l">需变更项目角色
    </td>
    <td colspan="5" class="td-m">
        <asp:Label runat="server" ID="lbTips" Text="请先保存表单再选择需变更项目角色" displaystatus="(2.?)"
            Style="color: Red;"></asp:Label>
        <asp:CheckBoxList runat="server" ID="cblRoles" RepeatDirection="Horizontal" RepeatColumns="10"
            activestatus="(23.提出成员变更)(3.修改成员变更)(3.审核)" displaystatus="(123.*)" AutoPostBack="true"
            OnSelectedIndexChanged="cblRoles_SelectedIndexChanged">
        </asp:CheckBoxList>
        <br />
        <a id="aAddOtherPost" class="aStyle" activestatus="(23.提出成员变更)(3.修改成员变更)(3.审核)" runat="server"
            onclick="showSetInfoOtherPost('divAddOtherPost')"><span>添加其他岗位</span></a>
        <asp:LinkButton runat="server" ID="btnBind" OnClick="btnBind_Click" Style="display: none"></asp:LinkButton>
        <div id="divAddOtherPost" style="display: none" title="添加其他角色岗位">
            <table class="tz-table" width="100%">
                <tr>
                    <td class="td-l">角色名称
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightDropDownList runat="server" ID="ddlRoles">
                        </zhongsoft:LightDropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">岗位
                    </td>
                    <td class="td-r">
                        <asp:CheckBoxList ID="cblABSigns" runat="server" RepeatDirection="Horizontal">
                            <%--<asp:ListItem>A</asp:ListItem>--%>
                            <asp:ListItem>B</asp:ListItem>
                            <asp:ListItem>C</asp:ListItem>
                            <asp:ListItem>D</asp:ListItem>
                            <asp:ListItem>E</asp:ListItem>
                        </asp:CheckBoxList>
                        <input type="hidden" runat="server" id="hiABSigns" />
                    </td>
                </tr>
            </table>
        </div>
    </td>
</tr>
<asp:Repeater runat="server" ID="roleRepeater" OnItemDataBound="roleRepeater_ItemDataBound">
    <ItemTemplate>
        <asp:Label ID="lbBegin" runat="server"></asp:Label>
        <td class="td-l">
            <%#Eval("UnitPostName")%>
            <input type="hidden" runat="server" id="hiOrganizationPostId" value='<%#Eval("OrganizationPostId")%>' />
        </td>
        <td class="td-m" style="white-space: nowrap">
            <table>
                <tr>
                    <td>
                        <asp:Label ID="lbOldUserName" runat="server"></asp:Label>
                        <input type="hidden" runat="server" id="hiOldUserId" />
                    </td>
                    <td>
                        <asp:Label ID="lbTip" runat="server" Text="拟变更为" ForeColor="Red" Visible="false"></asp:Label>
                    </td>
                    <td>
                        <zhongsoft:LightObjectSelector runat="server" ID="txtUserName" IsMutiple="false"
                            Visible="false" ToolTip="选择变更人员" SelectPageMode="Dialog" activestatus="(23.*)"
                            SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                            ShowAttrs="name,UserCode" ResultForControls="{'hiUserId':'id','tbUserCode':'UserCode'}"
                            PageWidth="850"></zhongsoft:LightObjectSelector>
                        <input type="hidden" runat="server" id="hiUserId" />
                    </td>
                </tr>
            </table>
        </td>
        <asp:Label ID="lbEnd" runat="server"></asp:Label>
    </ItemTemplate>
</asp:Repeater>
<input type="hidden" runat="server" id="hiFilterByRank" value="<root><o roleName='主管总工' rank='主管总工,副总工程师,总工程师' /><o roleName='勘测副总' rank='副总工程师' /></root>" />
<input type="hidden" runat="server" id="hiFilterByDept" value="<root><o roleName='主管领导' deptCode='200802290000019' /><o roleName='前期项目负责人' deptCode='01017019' /><o roleName='项目助理' deptCode='hostDept' /><o roleName='经营经理' deptCode='hostDept' /><o roleName='院主管领导' deptCode='101' deptRoleName='院主管领导'/><o roleName='经营联系人' deptCode='104' deptRoleName='经营联系人'/><o roleName='项目助理/秘书' deptCode='hostDept' deptRoleName='项目助理/秘书'/></root>" />
<!---数字化管理员【默认信息化业务部的数字化管理员】，质量工程师【默认技术质量部的质量工程师】，安全工程师【默认安全监察部的安全工程师】，计划工程师【默认项目组织部门的计划工程师】，财务部【默认财务部的费用工程师】--->
<input type="hidden" runat="server" id="hiFilterByDeptRole" value="<root><o roleName='数字化管理员' deptCode='01017018' deptRoleName='数字化管理员'/><o roleName='质量工程师' deptCode='01017022' deptRoleName='质量工程师'/><o roleName='安全工程师' deptCode='01017066' deptRoleName='安全工程师'/><o roleName='计划工程师' deptCode='hostDept' deptRoleName='计划工程师'/><o roleName='费用工程师' deptCode='01017033' deptRoleName='费用工程师'/></root>" />
<input type="hidden" runat="server" id="hiHostDeptCode" />
 <input runat="server" id="hiProjectId" type="hidden"/>
<script type="text/javascript">
    $(function () {
        initEventOtherPost('divAddOtherPost', 'SaveOtherRolePost');
    });

    //加载div默认事件
    function initEventOtherPost(div, funcName) {
        $("#" + div + ":ui-dialog").dialog("destroy");
        $("#" + div).dialog({
            resizable: false,
            autoOpen: false,
            minHeight: 150,
            minWidth: 300,
            modal: true,
            buttons: {
                "确定": function () {
                    var r = updateConfig(div, funcName, true);
                    if (r == false) { return false; }
                    $(this).dialog("close");
                },
                "取消": function () {
                    $(this).dialog("close");
                }
            }
        });
    }

    //弹出对应层
    function showSetInfoOtherPost(div) {
        var orgID = $("#<%=hiProjectId.ClientID%>").val();
        if (orgID == "") {
            alert("请先选择项目");
            return false;
        }
        initEventOtherPost('divAddOtherPost', 'SaveOtherRolePost');
        $("#" + div).dialog('open');
        $("#" + div).parent().appendTo("#<%=this.Page.Form.ClientID%>");
        return false;
    }

    //更新
    function updateConfig(div, funcName, isLoad) {
        var roleId = $('#<%=ddlRoles.ClientID %>').val();
        if (roleId == "") {
            alert("请选择角色！");
            return false;
        }
        //        var len = $("#<%=cblABSigns.ClientID%>").find("input:checked").length;
        //        if (len == "0") {
        //            alert("请选择岗位！");
        //            return false;
        //        }
        <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.btnBind, "")%>;
    }

</script>
