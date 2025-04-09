<%@ Control Language="C#" EnableViewState="true" AutoEventWireup="true" CodeBehind="ProjectMgrUser.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.OBS.ProjectMgrUser" %>
<tr runat="server" id="trTY">
    <td colspan="6" class="td-m" nowrap="noWrap" flag="isShow">
        <asp:LinkButton runat="server" ID="lbtnCopyProjUser" Text="复制套用历史工程项目组成员&nbsp;&nbsp;"
            activestatus="(3.填写任务书)(3.汇总意见)(23.编制计划)(23.提出人员需求)(3.编制项目策划、配置人员)(3.编制项目设总任命书)" OnClientClick="return copyProjectUser();"
            OnClick="btnCopyProjUser_Click" /><span class="req-star">&nbsp;&nbsp;注：可复制套用历史工程的项目组成员，包括项目管理人员、专业人员。</span>
    </td>
</tr>
<tr runat="server" id="trRoleConfig" visible="false">
    <td class="td-l">选择项目管理角色
    </td>
    <td colspan="5" class="td-m" nowrap="noWrap">
        <asp:Label runat="server" ID="lbTips" Text="请先保存表单再选择需配置项目角色" displaystatus="(2.?)"
            Style="color: Red;"></asp:Label>
        <asp:CheckBoxList runat="server" ID="cblRoles" RepeatDirection="Horizontal" RepeatColumns="10"
            activestatus="(3.填写任务书)(3.汇总意见)(23.编制计划)(23.编制任命书)(3.修改任命书)(3.启动项目)(3.配置辅助管理人员)(23.下达岗位任命书)(3.编制项目设总任命书)(3.接收任命书并打印)(3.会签调整)(3.汇总人员)(3.汇总审核结果)(3.修改计划)"
            displaystatus="(23.*)" AutoPostBack="true" OnSelectedIndexChanged="cblRoles_SelectedIndexChanged">
        </asp:CheckBoxList>
        <br />
        <%--<a id="aAddOtherPost" class="aStyle" activestatus="(23.*)(3.填写任务书)(3.汇总意见)(23.编制计划)(23.编制任命书)(3.修改任命书)(3.启动项目)(23.提出人员需求)(3.配置辅助管理人员)(23.下达岗位任命书)(3.编制项目设总任命书)(3.接收任命书并打印)(3.编制项目策划、配置人员)(3.会签调整)(3.汇总人员)(3.汇总审核结果)(3.修改计划)"
            displaystatus="(23.*)(3.填写任务书)(3.汇总意见)(3.编制计划)(3.编制任命书)(3.修改任命书)(23.提出人员需求)(3.配置辅助管理人员)(23.下达岗位任命书)(3.编制项目设总任命书)(3.接收任命书并打印)(3.编制项目策划、配置人员)(3.会签调整)(3.汇总人员)(3.汇总审核结果)(3.修改计划)"
            runat="server" onclick="showSetInfoOtherPost('divAddOtherPost')"><span>添加其他岗位</span></a>--%>
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
            <%#Eval("UnitPostName")%><asp:Label runat="server" ID="lblSpan" CssClass="req-star"></asp:Label>
            <input type="hidden" runat="server" id="hiUnitPostName" value='<%#Eval("UnitPostName")%>' />
            <input type="hidden" runat="server" id="hiOrganizationPostId" value='<%#Eval("OrganizationPostId")%>' />
        </td>
        <td class="td-m">
            <zhongsoft:LightObjectSelector runat="server" ID="txtUserName" IsMutiple="false"
                SelectPageMode="Dialog" activestatus="(3.填写任务书)(3.汇总意见)(23.编制计划)(23.编制任命书)(3.修改任命书)(3.启动项目)(3.配置辅助管理人员)(23.下达岗位任命书)(3.编制项目设总任命书)(3.接收任命书并打印)(3.会签调整)(3.汇总人员)(3.汇总审核结果)(3.修改计划)(3.技术处备案)"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" Writeable="True"
                ShowAttrs="name,LoginId" PageWidth="850" ResultForControls="{'hiUserId':'id','tbUserCode':'UserCode'}"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiUserId" />
        </td>
        <asp:Label ID="lbEnd" runat="server"></asp:Label>
    </ItemTemplate>
</asp:Repeater>
<%--主管总工 改为部门角色"主管总工" --副总工程师,总工程师--%>
<input type="hidden" runat="server" id="hiFilterByRank" value="<root><o roleName='勘测副总' rank='副总工程师' /></root>" />
<input type="hidden" runat="server" id="hiFilterByDept" value="<root><o roleName='主管领导' deptCode='200802290000019' /><o roleName='前期项目负责人' deptCode='01017019' /><o roleName='项目助理' deptCode='hostDept' /><o roleName='经营经理' deptCode='hostDept' /><o roleName='院主管领导' deptCode='101' deptRoleName='院主管领导'/><o roleName='项目助理/秘书' deptCode='hostDept' deptRoleName='项目助理/秘书'/><o roleName='经营联系人' deptCode='104' deptRoleName='经营联系人'/></root>" />
<!---数字化管理员【默认信息化业务部的数字化管理员】，质量工程师【默认技术质量部的质量工程师】，安全工程师【默认安全监察部的安全工程师】，计划工程师【默认项目组织部门的计划工程师】，财务部【默认财务部的费用工程师】--->
<input type="hidden" runat="server" id="hiFilterByDeptRole" value="<root><o roleName='数字化管理员' deptCode='01017018' deptRoleName='数字化管理员'/><o roleName='质量工程师' deptCode='01017022' deptRoleName='质量工程师'/><o roleName='安全工程师' deptCode='01017066' deptRoleName='安全工程师'/><o roleName='计划工程师' deptCode='hostDept' deptRoleName='计划工程师'/><o roleName='费用工程师' deptCode='01017033' deptRoleName='费用工程师'/></root>" />
<input type="hidden" runat="server" id="hiHostDeptCode" />
<input type="hidden" runat="server" id="hiMgrCount" />
<input type="hidden" runat="server" id="hiProjTypeBD" value="变电工程" />
<input type="hidden" runat="server" id="hiProjTypeSD" value="送电工程" />
<input type="hidden" runat="server" id="hiProjTypeXT" value="系统工程" />
<!--选择主管总工的时候，也可以选择其他角色类型的人员-->
<input type="hidden" runat="server" id="hiOrInRoleName" value="院副总,分院总工" />
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


    function copyProjectUser() {
        var orgID ="<%=ProjectId %>";
        if (orgID == "") {
            alert("请先选择项目");
            return false;
        }
        var json = { orgId: "<%=ProjectId %>", curActName: "<%=CurActName %>" };
        //modified by biye 20210301 复制套用历史工程项目组成员，弹出页面复制套用的人员默认选择专业人员
        if ("<%=CurActName %>" == "提出人员需求") {
            var temp = { copyProjUserType: "SpecialtyRole" };
            json = $.extend(json, temp);
        }
        var url = buildBizUrl(2, null, "EPMS/List/OBS/CopyProjectUser.aspx", json);
        showDivDialog(encodeURI(url), null, 700, 400, afterCopy);
        return false;
    }
    function afterCopy() {
        <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.lbtnCopyProjUser, "")%>;
    }

    //modified by biye 20210302 设置复制套用历史工程项目组成员行隐藏
    function setCopyProjUserHide() {
        $('[flag="isShow"]').hide();
    }
</script>
