<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BatchProjectMgrUserChange.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.OBS.BatchProjectMgrUserChange" %>
<%@ Import Namespace="DAL.EPMS" %>
<tr runat="server" id="trRoleConfig">
    <td class="td-l">
        需变更项目角色<span class="req-star">*</span>
    </td>
    <td colspan="5" class="td-m">
        <asp:Label runat="server" ID="lbTips" Text="请先保存表单再选择需变更项目角色" displaystatus="(2.*)"
            Style="color: Red;"></asp:Label>
        <asp:RadioButtonList runat="server" ID="rblRoles" RepeatDirection="Horizontal" RepeatColumns="7"
            req="1" activestatus="(23.提出成员变更)(3.修改成员变更)" displaystatus="(13.*)" AutoPostBack="true"
            OnSelectedIndexChanged="rblRoles_SelectedIndexChanged">
        </asp:RadioButtonList>
    </td>
</tr>
<asp:Repeater runat="server" ID="roleRepeater" OnItemDataBound="roleRepeater_ItemDataBound">
    <ItemTemplate>
        <asp:Label ID="lbBegin" runat="server"></asp:Label>
        <td class="td-l">
            拟变更<%#Eval("RoleName")%>
            <input type="hidden" runat="server" id="hiRoleId" value='<%#Eval("RoleId")%>' />
            <input type="hidden" runat="server" id="hiRoleName" value='<%#Eval("RoleName")%>' />
        </td>
        <td class="td-m" style="white-space: nowrap">
            <table>
                <tr>
                    <td>
                        <zhongsoft:LightObjectSelector runat="server" ID="txtUserName" IsMutiple="false"
                            Visible="false" ToolTip="选择变更人员" req="1" SelectPageMode="Dialog" activestatus="(23.*)"
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
<tr runat="server" id="trOperate">
    <td colspan="6" nowrap="nowrap">
        <div id="divCustomBar" style="float: left;" class="subtoolbarbg">
            <asp:LinkButton runat="server" ID="lbtnAddProj" CssClass="subtoolbarlink" EnableTheming="false"
                flag="addProj" ToolTip="选择变更项目" OnClick="btnAddProj_Click">
                <span>
                    <img runat="server" id="img2" src="~/Themes/Images/look-up.gif" alt="选择变更项目" width="16"
                        height="16" />选择变更项目</span>
            </asp:LinkButton>
            <input type="hidden" runat="server" id="hiProjIds" />
            <asp:LinkButton runat="server" ID="lbtnBatchDelProj" CssClass="subtoolbarlink" EnableTheming="false"
                flag="batchDelProj" ToolTip="取消变更项目" OnClick="lbtnBatchDelProj_Click">
                <span>
                    <img runat="server" id="img1" src="~/Themes/Images/btn_delete.gif" alt="取消变更项目" width="16"
                        height="16" />取消变更项目</span>
            </asp:LinkButton>
        </div>
    </td>
</tr>
<tr runat="server" displaystatus="(13.*)">
    <td colspan="6">
        <zhongsoft:LightPowerGridView runat="server" ID="gvProject" PageSize="500" Width="100%"
            UseDefaultDataSource="true" AutoGenerateColumns="false" AllowSorting="true" OnRowDataBound="gvProject_RowDataBound"
            DataKeyNames="OrganizationID" BindGridViewMethod="BindChangedProject">
            <Columns>
                <zhongsoft:LightCheckField HeaderText="是否取消" ItemStyle-Width="40px">
                </zhongsoft:LightCheckField>
                <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="2%" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <%#Container.DataItemIndex+1 %>
                    </ItemTemplate>
                </zhongsoft:LightTemplateField>
                <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="项目编号">
                </zhongsoft:LightBoundField>
                <zhongsoft:LightBoundField DataField="ProjectName" HeaderText="项目名称">
                </zhongsoft:LightBoundField>
                <zhongsoft:LightBoundField DataField="PhaseName" HeaderText="设计阶段">
                </zhongsoft:LightBoundField>
                <zhongsoft:LightBoundField DataField="ProjectScale" HeaderText="设计规模">
                </zhongsoft:LightBoundField>
                <zhongsoft:LightBoundField DataField="ManagerUserName" HeaderText="设总A">
                </zhongsoft:LightBoundField>
                <zhongsoft:LightTemplateField HeaderText="预留列1" ItemStyle-Wrap="false" Visible="false">
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td style="width: 36px">
                                    <asp:Label ID="lbOldUserName1" runat="server"></asp:Label>
                                    <input type="hidden" runat="server" id="hiOldUserId1" />
                                    <input type="hidden" runat="server" id="hiRoleId1" />
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </zhongsoft:LightTemplateField>
                <zhongsoft:LightTemplateField HeaderText="预留列2" ItemStyle-Wrap="false" Visible="false">
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td style="width: 36px">
                                    <asp:Label ID="lbOldUserName2" runat="server"></asp:Label>
                                    <input type="hidden" runat="server" id="hiOldUserId2" />
                                    <input type="hidden" runat="server" id="hiRoleId2" />
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </zhongsoft:LightTemplateField>
                <zhongsoft:LightTemplateField HeaderText="预留列3" ItemStyle-Wrap="false" Visible="false">
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td style="width: 36px">
                                    <asp:Label ID="lbOldUserName3" runat="server"></asp:Label>
                                    <input type="hidden" runat="server" id="hiOldUserId3" />
                                    <input type="hidden" runat="server" id="hiRoleId3" />
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </zhongsoft:LightTemplateField>
                <zhongsoft:LightTemplateField HeaderText="预留列4" ItemStyle-Wrap="false" Visible="false">
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td style="width: 36px">
                                    <asp:Label ID="lbOldUserName4" runat="server"></asp:Label>
                                    <input type="hidden" runat="server" id="hiOldUserId4" />
                                    <input type="hidden" runat="server" id="hiRoleId4" />
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </zhongsoft:LightTemplateField>
                <zhongsoft:LightTemplateField HeaderText="预留列5" ItemStyle-Wrap="false" Visible="false">
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td style="width: 36px">
                                    <asp:Label ID="lbOldUserName5" runat="server"></asp:Label>
                                    <input type="hidden" runat="server" id="hiOldUserId5" />
                                    <input type="hidden" runat="server" id="hiRoleId5" />
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </zhongsoft:LightTemplateField>
                <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-Wrap="false" Visible="false">
                </zhongsoft:LightTemplateField>
            </Columns>
        </zhongsoft:LightPowerGridView>
    </td>
</tr>
<input type="hidden" runat="server" id="hiChangedRoleAndUsers" field="ChangedRoleAndUsers"
    tablename="EPMS_ProjectResource" />
<input type="hidden" runat="server" id="hiChangedProjIds" />
<input type="hidden" runat="server" id="hiProjNum" value="0" />
<input type="hidden" runat="server" id="hiFilterByRank" value="<root><o roleName='主管总工' rank='副总工程师' /><o roleName='勘测副总' rank='副总工程师' /></root>" />
<input type="hidden" runat="server" id="hiFilterByDept" value="<root><o roleName='主管院长' deptCode='01017048' /><o roleName='前期项目负责人' deptCode='01017019' /></root>" />
<!---数字化管理员【默认信息化业务部的数字化管理员】，质量工程师【默认技术质量部的质量工程师】，安全工程师【默认安全监察部的安全工程师】，计划工程师【默认项目组织部门的计划工程师】，财务部【默认财务部的费用工程师】--->
<input type="hidden" runat="server" id="hiFilterByDeptRole" value="<root><o roleName='数字化管理员' deptCode='01017018' deptRoleName='数字化管理员'/><o roleName='质量工程师' deptCode='01017022' deptRoleName='质量工程师'/><o roleName='安全工程师' deptCode='01017066' deptRoleName='安全工程师'/><o roleName='费用工程师' deptCode='01017033' deptRoleName='费用工程师'/></root>" />
<script>
    $gridCheckedClientID = "<%=this.gvProject.CheckedClientID %>";
    function initClickEvent() {
        //选择项目事件
        $('[flag="addProj"]').each(function () {
            $(this).bind('click', function () {
                return addProj();
            });
        });
        //批量删除项目事件
        $('[flag=batchDelProj]').each(function () {
            $(this).bind('click', function () {
                return batchDelProj();
            });
        });
    }

    //执行后台添加项目数据
    function refreshProj() {
          <%=Page.ClientScript.GetPostBackEventReference(this.lbtnAddProj,"")%>;
    }
    //添加变更项目事件
    function addProj() {
        var param = new InputParamObject("m");
        var json = {ProjectState:'<%=(int)ProjectState.已启动 %>'};
        getDivProjectNew('<%=hiChangedProjIds.ClientID %>', param, json, refreshProj);
        return false;
    }

    //批量删除项目信息
    function batchDelProj() {
        var delProjID = $("#" + $gridCheckedClientID).val();
        if (delProjID.length < 36) {
            alert("请勾选要删除的计划项目信息");
            return false;
        }
        else { if (!confirm("确定要删除吗？")) return false; }
    }

    //获取变更的项目数量
    function getChangeProj(){
        return  intParse($("#<%=hiProjNum.ClientID %>").val());
    }

    //判断是否存在选择的项目
    function checkDelProj(){
        var delProjID = $("#" + $gridCheckedClientID).val();
        if (delProjID.length >= 36) {
            alert("请先删除勾选项目，然后在发送流程！");
            return false;
        }
        return true;
    }

</script>
