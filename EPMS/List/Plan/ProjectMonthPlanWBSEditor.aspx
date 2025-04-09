<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectMonthPlanWBSEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Plan.ProjectMonthPlanWBSEditor"
    MasterPageFile="~/UI/Master/ObjectEditor.Master" Title="任务计划详细" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" width="100%">
        <tr>
            <td class="td-l">项目名称
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtProjectName" activestatus="(23.?)" readonly="readonly" class="kpms-textbox" />
            </td>
            <td class="td-l">项目编号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" activestatus="(23.?)" readonly="readonly" class="kpms-textbox" />
            </td>
        </tr>
        <tr style="height: auto" id="trWBS">
            <td class="td-m" style="width: 20%; vertical-align: top;">
                <asp:TreeView ID="tvWBSTree" runat="server" ShowLines="True" Height="100%" OnSelectedNodeChanged="tvWBSTree_SelectedNodeChanged">
                    <SelectedNodeStyle BackColor="#F7F7F7" />
                </asp:TreeView>
            </td>
            <td colspan="3" style="width: 80%; vertical-align: top;" class="td-m">
                <span id="divOperate" runat="server" displaystatus="(23.*)">
                    <a class="subtoolbarlink" flag="addRoll" speid='<%=SpecialtyID%>' deptid='<%=DeptID%>' editflag="edit"><span>
                        <img runat="server" id="img10" src="~/Themes/Images/btn_add.gif" alt="新建任务" width="16"
                            height="16" />新建任务</span></a>
                </span>
                <span>编号/名称 
                    <zhongsoft:LightTextBox ID="tbRollCode" runat="server" Width="70px"></zhongsoft:LightTextBox>
                    类别<asp:RadioButtonList runat="server" ID="rblType" RepeatDirection="Horizontal" RepeatLayout="Flow">
                        <asp:ListItem Value="" Selected="True">全部</asp:ListItem>
                        <asp:ListItem Value="任务">任务</asp:ListItem>
                        <asp:ListItem Value="内部专业间提资">互提资料</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:LinkButton runat="server" ID="lbtnSearch" OnClick="lbtnSearch_Click" EnableTheming="false"
                        ToolTip="查询">查询
                    </asp:LinkButton>
                    <asp:LinkButton runat="server" ID="lbtnReset" OnClick="lbtnReset_Click" EnableTheming="false"
                        ToolTip="重置">重置
                    </asp:LinkButton>
                </span>
                <asp:LinkButton runat="server" ID="lbtnBatchUpdate" CssClass="subtoolbarlink" OnClick="btnBatchUpdate_Click"
                    EnableTheming="false" ToolTip="批量更新时间" OnClientClick="return showUpdateInfo()" displaystatus="(23.*)">
                    <span>
                        <img runat="server" id="img1" src="~/Themes/Images/btn_editor.gif" alt="批量更新时间" width="16"
                            height="16" />批量更新时间</span>
                </asp:LinkButton>
                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="true"
                    PageSize="50" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                    DataKeyNames="WBSID" UseDefaultDataSource="true" OnRowDataBound="gvList_RowDataBound"
                    OnRowCommand="gvList_RowCommand" ShowPageSizeChange="true" HideFieldOnExport="操作">
                    <Columns>
                        <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px">
                        </zhongsoft:LightCheckField>
                        <zhongsoft:LightTemplateField ItemStyle-Width="40px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <asp:TemplateField HeaderText="操作" ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Center" Visible="false">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnFileBag" runat="server" EnableTheming="false"
                                    ToolTip="档案袋" OnClientClick="return false">
                                    <img alt="档案袋" src="<%=this.WebAppPath %>/Themes/Images/btn_dg_detail.gif" onclick="fileBagItem('<%# Eval("WBSID") %>','<%# Eval("WBSState") %>');" />
                                </asp:LinkButton>
                                <asp:LinkButton ID="lbtnEdit" runat="server" EnableTheming="false"
                                    ToolTip="编辑" OnClientClick="return false" editFlag="edit">
                                    <img alt="编辑" src="<%=this.WebAppPath %>/Themes/Images/btn_dg_edit.gif" ,
                                    onclick="wbsItem('3','<%# Eval("WBSID") %>','<%# Eval("ExecSpecialtyID") %>','<%# Eval("BelongDeptID") %>','<%# Eval("ParamWBSTypeID") %>');"/>
                                </asp:LinkButton>
                                <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" editFlag="edit"
                                    ToolTip="删除" CommandName="del" CommandArgument='<%# Eval("WBSID") %>' OnClientClick="if(!confirm('您确定删除吗？')) return false;">
                                <span><img src="<%=this.WebAppPath %>/Themes/Images/btn_dg_delete.gif" alt="删除" /></span>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="编号">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="名称">
                            <ItemTemplate>
                                <div style="word-break: break-all !important; white-space: normal !important; width: 150px">
                                    <asp:LinkButton runat="server" ID="lbViewChild" EnableTheming="false" Style="text-decoration: underline; color: Blue !important"
                                        OnClientClick='<%# String.Format("return viewItem(\"{0}\",\"{1}\",\"{2}\",\"{3}\")", Eval("WBSID"), Eval("ExecSpecialtyID"),Eval("BelongDeptID"),Eval("ParamWBSTypeID")) %>'>
                                 <span><%#Eval("WBSName")%></span></asp:LinkButton>
                                </div>
                                <input type="hidden" runat="server" id="hiWBSID" value='<%#Eval("WBSID") %>' />
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField DataField="BelongDeptName" HeaderText="所属部门">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="ExecSpecialtyName" HeaderText="专业名称">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="计划开始" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <zhongsoft:XHtmlInputText type="text" runat="server" EnableTheming="false" ID="txtPlanStartTime"
                                    activestatus="(23.*)" readonly="readonly" value='<%#string.Format("{0:yyyy-MM-dd}",Eval("PlanStartTime")) %>'
                                    class="kpms-textbox-comparedate" compare='<%#Eval("WBSID") %>' />
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="计划完成" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <zhongsoft:XHtmlInputText type="text" runat="server" EnableTheming="false" ID="txtPlanCompleteTime"
                                    activestatus="(23.*)" readonly="readonly" value='<%#string.Format("{0:yyyy-MM-dd}",Eval("PlanCompleteTime")) %>'
                                    class="kpms-textbox-comparedate" compare='<%#Eval("WBSID") %>' Onchange="CompareDate(this);"/>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="状态" ItemStyle-Width="40px">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lbState"></asp:Label>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiSpeId" />
    <input type="hidden" runat="server" id="hiDeptId" />
    <input type="hidden" runat="server" id="hiSpeCode" />
    <input type="hidden" runat="server" id="hiRollID" />
    <input type="hidden" runat="server" id="hiWbsType" />
    <input type="hidden" runat="server" id="hiParamWBSTypeID" />
    <input runat="server" id="hiZHSpeCode" type="hidden" value="A" />
    <input runat="server" id="hiZHSpeName" type="hidden" value="综合" />
    <asp:Button runat="server" ID="btnBindWbs" OnClick="btnBindWbs_Click" Style="display: none" />
    <!----批量更新时间或安排人员页面返回的信息----->
    <input type="hidden" runat="server" id="hiUpdateTimeXml" />

    <script type="text/javascript">   
        $gridCheckedClientIDRoll = "<%=this.gvList.CheckedClientID %>";
        function initCustomerPlugin() {
            //对需要刷新的按钮注册返回值
            $('[editFlag="edit"]').each(function () {
                $(this).bind('click', function () {
                    setReturnVal();
                });
            });
        }

        //新建册
        $('[flag="addRoll"]').each(function () {
            var speId = $(this).attr('speId');
            var deptId = $(this).attr('deptId');
            $(this).bind('click', function () {
                addRoll(speId, deptId);
            });
        });

        //统一提示信息
        function checkSpe(speId) {
            if (speId == '' || speId == undefined) {
                alert('请先从左侧树形结构选择专业！');
                return false;
            }
            return true;
        }

        //新建资料
        function addFile(speId, deptId, paramWbsTypeId) {
            if (!checkSpe(speId)) {
                return false;
            }
            var rollId = $('#<%=hiRollID.ClientID %>').val();
            var json = { actionType: 2, OrganizationID: '<%=OrganizationID %>', ExecSpecialtyID: speId, DeptID: deptId };
            json = $.extend(json, { ParamWBSTypeID: paramWbsTypeId, RollID: rollId });
            var url = buildQueryUrl('/EPMS/List/WBS/WBSEditor.aspx', json);
            showDivDialog(encodeURI(url), "", 1000, 600, bindWbs);
            return false;
        }

        //新建提出资料
        function addRoll(speId, deptId) {
            addFile(speId, deptId, 13)
        }

        //查看任务
        function viewItem(bizId, speId, deptId, paramWBSTypeID) {
            return wbsItem('1', bizId, speId, deptId, paramWBSTypeID);
        }

        //wbs任务详细
        function wbsItem(actionType, bizId, speId, deptId, paramWBSTypeID) {
            var json = { actionType: actionType, OrganizationID: '<%=OrganizationID %>', ExecSpecialtyID: speId, DeptID: deptId, bizId: bizId, ParamWBSTypeID: paramWBSTypeID };
            var url = buildQueryUrl('/EPMS/List/WBS/WBSEditor.aspx', json);
            var callBack = null;
            if (actionType == '3') {
                callBack = bindWbs;
            }
            showDivDialog(url, "", 1000, 600, callBack);
            return false;
        }

        //任务档案袋
        function fileBagItem(wbsid, wbsState) {
            var actionType = 1;
            //任务档案袋中任务状态为“尚未确定”“尚未开展”“正在进行”，对应的值应该为0,1,2，任务相关信息可以修改，如果不是这三个状态，任务的信息不可修改
            if (wbsState == 0 || wbsState == 1 || wbsState == 2) {
                actionType = 3;
            }
            var url = buildQueryUrl("/Custom/List/Dashboard.aspx", {
                ListId: '494CE4A3-A401-4B85-A97D-3247C6D2F439',
                ViewId: '3B413684-1588-4B7D-A3F7-D9307C23CE7B', secid: "3B413684-1588-4B7D-A3F7-D9307C23CE7B", WBSID: wbsid, IsDashboard: 1, ShowToolbar: 0, IsShowHeader: 2, ActionType: actionType
            });
            window.open(url);
            return false;
        }

        //绑定WBS列表
        function bindWbs() {
        <%=Page.ClientScript.GetPostBackEventReference(this.btnBindWbs,"")%>;
        }

        function setReturnVal() {
            parent.returnValue = "saved";
        }

        function showUpdateInfo() {
            var updateNum = getCheckNum();
            if (updateNum < 1) {
                alert("请勾选任务信息");
                return false;
            }
            var xml = $("#<%=hiUpdateTimeXml.ClientID %>").val();
            var organizationID = '<%=OrganizationID%>';
            var wbsTypeShowInfo = '';
            var json = { OrganizationID: organizationID, WBSTypeShowInfo: wbsTypeShowInfo, UpdateWBSNum: updateNum };
            if (typeof (getUpdateTimeJson) == "function") {
                json = getUpdateTimeJson(json);
            }
            var url = buildQueryUrl("EPMS/List/Plan/BatchUpdatePlanTime.aspx", json);
            if (wbsTypeShowInfo == "file")
                showDivDialog(encodeURI(url), xml, 350, 300, batchRefreshInfo);
            else
                showDivDialog(encodeURI(url), xml, 550, 500, batchRefreshInfo);
            return false;
        }

        //获取选中的任务数量
        function getCheckNum() {
            var checkedValue = $("#" + $gridCheckedClientIDRoll).val().length;
            var updateNum = 0;
            if (checkedValue > 1) {
                checkedValue = $("#" + $gridCheckedClientIDRoll).val().substring(1, checkedValue - 1);
                if (checkedValue != "")
                    updateNum = checkedValue.split(",").length;
            }
            return updateNum;
        }

        //更新
        function batchRefreshInfo(re) {
            $("#<%=hiUpdateTimeXml.ClientID %>").val(re);
            <%=this.Page.ClientScript.GetPostBackEventReference(this.lbtnBatchUpdate, "")%>;
        }

        //验证时间 计划结束时间不能超过阶段项目计划结束时间
        function CompareDate(planDate) {
            var thisDate = planDate.value;
            var PEDate = '<%=Convert.ToDateTime(ProjInfo.PlanCompleteDate).ToString("yyyy-MM-dd")%>';
            if (thisDate != "" && PEDate != "") {
                if (new Date(thisDate.replaceAll('-','/')) > new Date(PEDate.replaceAll('-','/'))) {
                    alert("任务或提资计划完成日期不能超过阶段计划完成日期" + PEDate + "，如需修改请联系设总修改项目计划");
                    planDate.value = "";
                }
            }
        }
    </script>
</asp:Content>

