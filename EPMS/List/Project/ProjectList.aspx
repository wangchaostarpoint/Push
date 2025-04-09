<%@ Page Language="C#" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master" AutoEventWireup="true"
    CodeBehind="ProjectList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Project.ProjectList"
    Title="项目台账" %>

<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">项目名称/编号</span> <span>
        <asp:TextBox ID="tbProjectInfo" search="1" runat="server" MaxLength="64" CssClass="kpms-textboxsearch"
            EnableTheming="false"></asp:TextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">项目状态</span> <span>
        <%--<zhongsoft:LightDropDownList ID="ddlProjectComleteInfo" runat="server" class="kpms-ddlsearch"
            EnableTheming="false" Visible="false">
        </zhongsoft:LightDropDownList>--%>
        <asp:CheckBoxList ID="cblProjectComleteInfo" runat="server" RepeatDirection="Horizontal">
        </asp:CheckBoxList>
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
    <asp:LinkButton ID="lkbNewProject" runat="server" OnClientClick="return addNewProject()"
        EnableTheming="false" CssClass="btn-query" Visible="false"><span>新建子项</span></asp:LinkButton>
    <asp:LinkButton ID="lkbConfrimProject" runat="server" OnClientClick="return confrimProject()"
        EnableTheming="false" CssClass="btn-query" Visible="false"><span>待签收</span></asp:LinkButton>
    <asp:LinkButton ID="lkbDeptWork" runat="server" OnClientClick="return openDeptWork()"
        EnableTheming="false" CssClass="btn-query"><span>部门工作负荷</span></asp:LinkButton>
    <asp:LinkButton ID="lkbMyContent" runat="server" OnClientClick="return batchAddProj()"
        EnableTheming="false" CssClass="btn-query" Visible="false"><span>添加关注项目</span></asp:LinkButton>
    <asp:LinkButton ID="lkbEditPriject" runat="server" OnClientClick="return editProject()"
        EnableTheming="false" CssClass="btn-query"><span>项目进度填报</span></asp:LinkButton>
    <asp:LinkButton ID="lkbMyContentProject" runat="server" EnableTheming="false" CssClass="btn-query"
        OnClick="lkbMyContentProject_Click" Visible="false"><span>我关注项目</span></asp:LinkButton>
    <asp:LinkButton ID="lkbDesginControl" runat="server" EnableTheming="false" CssClass="btn-query" Visible="false"
        OnClientClick="return openDesginControl()"><span>设计过程控制</span></asp:LinkButton>
    <asp:LinkButton ID="lkbAddAlert" OnClientClick="return addPortalAlert()" runat="server" Visible="false"
        EnableTheming="false" CssClass="btn-query"><span>发送提醒</span></asp:LinkButton>
    <asp:LinkButton ID="lbtnSetWBSOwner" OnClientClick="return setWBSOwner()" runat="server"
        EnableTheming="false" CssClass="btn-query" Visible="false"><span>安排卷册负责人</span></asp:LinkButton>
    <asp:LinkButton ID="LinkButton1" OnClientClick="return batchSetWBSOwner()" runat="server"
        EnableTheming="false" CssClass="btn-query" Visible="false"><span>批量安排卷册负责人</span></asp:LinkButton>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
        PageSize="15" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
        DataKeyNames="OrganizationId" UseDefaultDataSource="true" BindGridViewMethod="BindDataGrid"
        OnRowDataBound="gvList_RowDataBound" EmptyDataText="没有要查找的数据" HideFieldOnExport="全选,项目网站,关注,通讯录"
        OnExport="gvList_Export" OnBeforeExporting="gvList_BeforeExporting">
        <PagerStyle HorizontalAlign="Right"></PagerStyle>
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderStyle-Width="25px" HeaderText="关注">
                <ItemTemplate>
                    <%# Eval("AttenTionUrl").ToString()%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="25px" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="项目网站" ItemStyle-HorizontalAlign="Center"
                ItemStyle-Width="60px" Visible="false">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false">
                        <img alt=""  src ="<%=WebAppPath%>/Themes/Images/fhome.png" onclick =" return ViewProjectPortal('<%#Eval("OrganizationId") %>');" />
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="通讯录" ItemStyle-HorizontalAlign="Center"
                ItemStyle-Width="60px">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnProjectUser" runat="server" EnableTheming="false">
                        <img alt=""  src ="<%=WebAppPath%>/Themes/Images/ico_part.png" onclick =" return openProjectUser('<%#Eval("OrganizationId") %>');" />
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="历史项目处理" ItemStyle-HorizontalAlign="Center"
                ItemStyle-Width="60px">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnHistoryObs" runat="server" EnableTheming="false" ToolTip="导入项目组成员" Visible="false">
                        <img alt=""  src ="<%=WebAppPath%>/Themes/Images/btn_dg_edit.gif" onclick =" return openProjectObs('<%#Eval("OrganizationId") %>');" />
                    </asp:LinkButton>
                    <asp:LinkButton ID="lbtnHistoryWbs" runat="server" EnableTheming="false" ToolTip="导入卷册" Visible="false">
                        <img alt=""  src ="<%=WebAppPath%>/Themes/Images/btn_dg_edit.gif" onclick =" return openProjectWbs('<%#Eval("OrganizationId") %>');" />
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <%-- <zhongsoft:LightTemplateField HeaderText="出版交付" ItemStyle-HorizontalAlign="Center"
                ItemStyle-Width="60px">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnPublish" runat="server" EnableTheming="false">
                        <img alt=""  src ="<%=WebAppPath%>/Themes/Images/btn_dg_detail.gif" onclick =" return openPublish('<%#Eval("OrganizationId") %>');" />
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>--%>
            <zhongsoft:LightBoundField DataField="OrganizationId" HeaderText="OrganizationId"
                Visible="False">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="项目编号" ItemStyle-Width="100px">
            </zhongsoft:LightBoundField>
            <%--<zhongsoft:LightTemplateField HeaderText="项目名称" ItemStyle-Width="200px">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbProjectName" Text='<%# Eval("ProjectName").ToString()%>'
                        EnableTheming="false" ForeColor="Blue">
                    </asp:LinkButton>
                    <input type="hidden" id="hiOrganizationId" runat="server" value='<%#Eval("OrganizationId") %>' />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>--%>
            <zhongsoft:LightTemplateField HeaderText="项目名称" ItemStyle-Width="200px">
                <ItemTemplate>
                    <a onclick="return ViewProjectPortal('<%#Eval("OrganizationId") %>');" title='<%# Eval("ProjectName")%>'
                        style="color: Blue">
                        <%#Eval("ProjectName").ToString().Length > 25 ? Eval("ProjectName").ToString().Substring(0, 24) + "..." : Eval("ProjectName")%>
                    </a>
                    <input type="hidden" id="hiOrganizationId" runat="server" value='<%#Eval("OrganizationId") %>' />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="阶段" DataField="PhaseName" ItemStyle-Width="200px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="项目进度" ItemStyle-Width="60px">
                <ItemTemplate>
                    <asp:LinkButton ID="lkbCompleteRate" runat="server" OnClientClick='<%# String.Format("return openProjectSchedule(\"{0}\")", Eval("OrganizationID")) %>'
                        EnableTheming="false" ForeColor="Blue"></asp:LinkButton>
                    <input type="hidden" id="hiCompleteRate" runat="server" value='<%#Eval("CompleteRate") %>' />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="设计（完成/总数）">
                <ItemTemplate>
                    <asp:LinkButton ID="lkbWbsInfo" runat="server" OnClientClick='<%# String.Format("return openRollList(\"{0}\")", Eval("OrganizationID")) %>'
                        EnableTheming="false" ForeColor="Blue"><span  RollCompleteInfo='<%#Eval("OrganizationId") %>'></span></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="设计完成率">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbRollCompleteRate"><span rollcompleterate='<%#Eval("OrganizationId") %>'></span></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="设计延期情况">
                <ItemTemplate>
                    <asp:LinkButton ID="lkbRollCompleteAlert" runat="server" OnClientClick='<%# String.Format("return openRollList(\"{0}\",1)", Eval("OrganizationID")) %>'
                        EnableTheming="false" ForeColor="Blue"><span  RollCompleteAlert='<%#Eval("OrganizationId") %>'></span></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="接口（完成/总数）">
                <ItemTemplate>
                    <asp:LinkButton ID="lkbFlieInfo" runat="server" OnClientClick='<%# String.Format("return openFileList(\"{0}\")", Eval("OrganizationID")) %>'
                        EnableTheming="false" ForeColor="Blue"><span FileCompleteInfo='<%#Eval("OrganizationId") %>'></span></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="接口完成率">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbFileCompleteRate"><span Filecompleterate='<%#Eval("OrganizationId") %>'></span></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="接口延期情况">
                <ItemTemplate>
                    <asp:LinkButton ID="lkbFileCompleteAlert" runat="server" OnClientClick='<%# String.Format("return openFileList(\"{0}\",1)", Eval("OrganizationID")) %>'
                        EnableTheming="false" ForeColor="Blue"><span FilecompleteAlert='<%#Eval("OrganizationId") %>'></span></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </zhongsoft:LightTemplateField>
            <%--  <zhongsoft:LightTemplateField HeaderText="定额完成情况">
                <ItemTemplate>
                    <asp:LinkButton ID="lkbWorkDayInfo" runat="server" OnClientClick='<%# String.Format("return openWorkDay(\"{0}\")", Eval("OrganizationID")) %>'
                        EnableTheming="false" ForeColor="Blue">
                    <span workdayinfo='<%#Eval("OrganizationId") %>'></span></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </zhongsoft:LightTemplateField>--%>
            <zhongsoft:LightTemplateField HeaderText="存在问题">
                <ItemTemplate>
                    <asp:LinkButton ID="lkbProblem" runat="server" OnClientClick='<%# String.Format("return openProjectSchedule(\"{0}\",\"{1}\")", Eval("OrganizationID"),"problem") %>'
                        EnableTheming="false" ForeColor="Blue"><span problems='<%#Eval("OrganizationId") %>'></span></asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="InnerCompleteDate" HeaderText="院计划进度" HtmlEncode="false">
                <ItemStyle Width="60px" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="OuterCompleteDate" HeaderText="业主要求进度" HtmlEncode="false">
                <ItemStyle Width="60px" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="FormDate" HeaderText="立项日期" HtmlEncode="false">
                <ItemStyle Width="60px" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectState" HeaderText="项目状态" HtmlEncode="false">
                <ItemStyle Width="60px" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ContractState" HeaderText="合同状态" HtmlEncode="false">
                <ItemStyle Width="60px" />
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <asp:Button ID="btnBindData" runat="server" Visible="false" OnClick="btnBindData_Click" />
    <!-- 选择关注项目xml-->
    <input type="hidden" runat="server" id="hiProjXML" />
    <!-- 添加关注项目后台调用-->
    <asp:Button runat="server" ID="btnAddProjs" OnClick="btnAddProjs_Click" Visible="false" />
    <input type="hidden" id="hiMyContentProject" runat="server" value="0" />
    <input type="hidden" runat="server" id="hiHistoryDeadLine" value="2019-06-01" />

    <script type="text/javascript">
        var title = "在任务距完成日期还有" + "<%=RollWaringDates %>" + "天时给出到期提醒，并标黄所在行的背景色。任务延期给出延期提醒，并标红所在行背景色";
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";
        function initPagePlugin() {
            initAttention();
            getWBSCompleteInfo();
            setProblems();
        }
        function addPortalAlert() {
            var ids = $("#" + $gridCheckedClientID).val();
            var organizationID = "";
            if (ids.length > 36 && ids.length < 72) {
                ids = ids.replace("[", "").replace("]", "").replace(/\"/g, "");
                organizationID = ids;
            }
            var url = buildQueryUrl("/EPMS/List/Sys/PortalAlertEditor.aspx", { actionType: 2, OrganizationID: organizationID });
            showDivDialog(url, null, 800, 500, null);
            return false;
        }

        //打开项目定额
        //        function openWorkDay(orgID) {
        //            var url = buildQueryUrl("/EPMS/List/Sys/WorkloadOfProjectList.aspx", { OrganizationID: orgID, secid: '95C9998E-AF2F-4508-867F-9C72064748C3'});
        //            showDivDialog(url, null, 1200, 600, editProjectCallBack);

        //            return false;
        //        }

        //异步添加存在问题
        function setProblems() {
            var $ids = "";
            $("#<%=gvList.ClientID %> span[problems]").each(function () {

                $ids += $(this).attr("problems") + "|";
            });
            $.post("DeptProjectSpecList.aspx",
                { asyfunc: "GetProblemsInfo", orgIdList: $ids },
                function (res) {
                    var $l = eval('(' + res + ')');
                    //存在问题
                    $("#<%=gvList.ClientID %> span[problems]").each(function () {
                        var $orgID = $(this).attr("problems");
                        for (var i = 0; i < $l.length; i++) {
                            var $id = $l[i][0];
                            var $problemsInfo = $l[i][1];
                            if ($orgID == $id) {
                                if ($problemsInfo == "") {
                                    $(this).html("更多");
                                }
                                else {
                                    var info = $problemsInfo;
                                    if (info.length >= 7) {
                                        info = info.substring(0, 6) + "...";
                                        $(this).html(info);
                                        $(this).attr('title', $problemsInfo);
                                    } else {
                                        $(this).html($problemsInfo);
                                    }
                                }
                            }
                        }
                    });

                }
            );
        }

        //打开项目进度填报
        function openProjectSchedule(projectID, pageType) {
            var url = buildQueryUrl("/EPMS/List/Project/ProjectScheduleList.aspx", { secid: '5580137F-4AE6-4C8E-A6D8-C486C661C538', OrganizationID: projectID, AllOrProblem: pageType });
            showDivDialog(url, null, 1000, 600, editProjectCallBack);
            return false;
        }

        //部门工作负荷
        function openDeptWork() {
            var url = buildQueryUrl("/EPMS/List/Sys/WorkloadOfDeptMonthList.aspx", { DeptID: "<%=DeptID %>", OrgUnitID: "<%=OrgUnitID %>", secid: '73462074-7233-4990-BC24-B79F505A7719' });

            showDivDialog(url, null, 800, 500, editProjectCallBack);
            return false;
        }

        //新建子项
        function addNewProject() {
            var ids = $("#" + $gridCheckedClientID).val();
            var organizationID = "";
            if (ids.length > 36 && ids.length < 72) {
                ids = ids.replace("[", "").replace("]", "").replace(/\"/g, "");
                organizationID = ids;
            }
            if (organizationID != null) {
                var url = buildQueryUrl("/EPMS/List/Project/ProjectEditor.aspx", { actionType: 2, newType: 'sub', ParentID: organizationID });
            } else {
                var url = buildQueryUrl("/EPMS/List/Project/ProjectEditor.aspx", { actionType: 2, newType: 'sub' });
            }
            showDivDialog(url, null, 1000, 600, editProjectCallBack);
            return false;
        }

        //待签收
        function confrimProject() {
            var url = buildQueryUrl("/EPMS/List/Project/ProjectTaskList.aspx", { RoleName: "<%=RoleName %>", secid: '7786A767-CEC1-4FCE-A05C-FA3CC6ADD166' });
            showDivDialog(url, null, 800, 500, editProjectCallBack);
            return false;
        }

        //异步加载卷册、资料完成情况和提心信息
        function getWBSCompleteInfo() {
            var $ids = "";
            $("#<%=gvList.ClientID %> span[RollCompleteInfo]").each(function () {
                $ids += $(this).attr("RollCompleteInfo") + "|";
            });
            $.post("ProjectList.aspx",
                { asyfunc: "GetRollCompleteInfo", orgIdList: $ids },
                function (res) {
                    var $l = eval('(' + res + ')');
                    //设计（完成/总数）
                    $("#<%=gvList.ClientID %> span[RollCompleteInfo]").each(function () {
                        var $orgID = $(this).attr("RollCompleteInfo");
                        for (var i = 0; i < $l.length; i++) {
                            var $id = $l[i][0];
                            var $rollCompleteInfo = $l[i][1];
                            if ($orgID == $id) {
                                if ($rollCompleteInfo == "")
                                    $(this).html("");
                                else {
                                    $(this).html($rollCompleteInfo);
                                }
                            }
                        }
                    });
                    //设计完成率
                    $("#<%=gvList.ClientID %> span[rollcompleterate]").each(function () {
                        var $orgID = $(this).attr("rollcompleterate");
                        for (var i = 0; i < $l.length; i++) {
                            var $id = $l[i][0];
                            var $rollcompleterate = $l[i][2];
                            if ($orgID == $id) {
                                if ($rollcompleterate == "")
                                    $(this).html("");
                                else {
                                    $(this).html($rollcompleterate);
                                }
                            }
                        }
                    });

                    //设计延期情况
                    $("#<%=gvList.ClientID %> span[RollCompleteAlert]").each(function () {
                        var $orgID = $(this).attr("RollCompleteAlert");
                        for (var i = 0; i < $l.length; i++) {
                            var $id = $l[i][0];
                            var $rollCompleteAlert = $l[i][3];
                            if ($orgID == $id) {
                                if ($rollCompleteAlert == "")
                                    $(this).html("");
                                else {
                                    $(this).html($rollCompleteAlert);
                                    if ($rollCompleteAlert.indexOf("延期") > 0) {
                                        $(this).attr("class", "wbsWarning");
                                    } else if ($rollCompleteAlert.indexOf("到期") > 0) {
                                        $(this).attr("class", "wbsRemind");
                                    }
                                    $(this).attr("title", title);
                                }
                            }
                        }
                    });

                    //接口（完成/总数）
                    $("#<%=gvList.ClientID %> span[FileCompleteInfo]").each(function () {
                        var $orgID = $(this).attr("FileCompleteInfo");
                        for (var i = 0; i < $l.length; i++) {
                            var $id = $l[i][0];
                            var $fileCompleteInfo = $l[i][4];
                            if ($orgID == $id) {
                                if ($fileCompleteInfo == "")
                                    $(this).html("");
                                else {
                                    $(this).html($fileCompleteInfo);
                                }
                            }
                        }
                    });
                    //接口完成率
                    $("#<%=gvList.ClientID %> span[Filecompleterate]").each(function () {
                        var $orgID = $(this).attr("Filecompleterate");
                        for (var i = 0; i < $l.length; i++) {
                            var $id = $l[i][0];
                            var $filecompleterate = $l[i][5];
                            if ($orgID == $id) {
                                if ($filecompleterate == "")
                                    $(this).html("");
                                else {
                                    $(this).html($filecompleterate);
                                }
                            }
                        }
                    });

                    //接口延期情况
                    $("#<%=gvList.ClientID %> span[FilecompleteAlert]").each(function () {
                        var $orgID = $(this).attr("FilecompleteAlert");
                        for (var i = 0; i < $l.length; i++) {
                            var $id = $l[i][0];
                            var $filecompleteAlert = $l[i][6];
                            if ($orgID == $id) {
                                if ($filecompleteAlert == "")
                                    $(this).html("");
                                else {
                                    $(this).html($filecompleteAlert);
                                    if ($filecompleteAlert.indexOf("延期") > 0) {
                                        $(this).attr("class", "wbsWarning");
                                    } else if ($filecompleteAlert.indexOf("到期") > 0) {
                                        $(this).attr("class", "wbsRemind");
                                    }
                                    $(this).attr("title", title);
                                }
                            }
                        }
                    });
                }
            );
        }

        //查看项目网站
        function ViewProjectPortal(OrganizationID) {
            var url = "<%=WebAppPath%>/CatalogTree/EPMSFileTree.aspx?organizationID=" + OrganizationID;
            window.open(url);
            return false;
        }

        function ViewItem(OrganizationID) {
            var url = "/EPMS/List/Project/ProjectEditorNew.aspx";
            var json = { actionType: 1, bizId: OrganizationID, IsMyProJect: 1 };
            url = buildQueryUrl(url, json);
            showDivDialog(url, "", 1050, 600);
            return false;
        }

        function editProject() {
            var url = buildQueryUrl("/EPMS/List/Project/ProjectStateEditor.aspx", { actionType: 2 });
            var proIDs = $("#" + $gridCheckedClientID).val();
            if (proIDs.length > 36 && proIDs.length < 72) {
                var projectID = proIDs.replace("[", '""').replace("]", '""');
                projectID = projectID.replace(/\"/g, "");
                url = buildQueryUrl("/EPMS/List/Project/ProjectStateEditor.aspx", { actionType: 2, OrganizationId: projectID, PageType: "Project" });
            }
            showDivDialog(url, null, 800, 600, editProjectCallBack);
            return false;
        }

        //打开卷册目录 项目ID、专业ID
        function openRollList(orgID, showWaringRow) {
            var url = buildQueryUrl("/EPMS/List/WBS/C_RollList.aspx", { OrganizationID: orgID, secid: '9dd62921-edc5-4767-b46a-817756ea5ca7', IsShowAllButn: 'false', ShowWaringRow: showWaringRow, IsShowRollEdit: 'true', IsShowWorkDay: 'true', IsShowBtnAdd: 'true' });
            showDivDialog(url, null, 1200, 600, editProjectCallBack);

            return false;
        }

        function openFileList(orgID, showWaringRow) {
            var roleName = "<%= RoleName%>";
            if (roleName == 'Szr') {
                roleName = "Bmfzr";
            }
            var url = buildQueryUrl("/EPMS/List/WBS/C_MutualFileList.aspx", { OrganizationID: orgID, secid: '58799f61-7761-43e8-961f-4ca93fa67039', RoleName: roleName, IsShowAllButn: 'false', ShowWaringRow: showWaringRow, IsShowBtnAdd: 'true' });
            showDivDialog(url, null, 1200, 600, editProjectCallBack);

            return false;
        }

        function editProjectCallBack(re) {
            <%=Page.ClientScript.GetPostBackEventReference(this.btnBindData,"") %>
            return true;
        }

        //批量添加关注项目
        function batchAddProj() {
            var param = new InputParamObject("m");
            getDivProjectNew('<%=hiProjXML.ClientID %>', param, null, addProjs);

            return false;
        }
        //将选择的项目添加到我的关注项目中
        function addProjs() {
            <%=Page.ClientScript.GetPostBackEventReference(this.btnAddProjs,"")%>;
        }

        //关注
        function initAttention() {
            $('[state="attetion"]').each(function () {
                $(this).bind("click", function () {
                    formAttention($(this).attr("projectID"), $(this).attr("projectCode"), $(this).attr("projectName"), $(this).attr("type"), $(this))
                });
            });
            $('[state="MyContent"]').each(function () {
                $(this).bind("click", function () {
                    var $type = $(this).attr("type");
                    if ("add" == $type) { //加载关注的      
                        $("#<%=hiMyContentProject.ClientID %>").val("1");
                    }
                    else {//加载所有             
                        $("#<%=hiMyContentProject.ClientID %>").val("0");
                    }
                    $("[id$='btnQuery']")[0].click();
                });
            });
        }



        function formAttention(projectID, projectCode, projectName, type, img) {
            var userId = '<%=KPMSUser.Id %>';
            $.ajax({
                type: "POST",
                url: buildQueryUrl("EPMS/List/Project/ProjectList.aspx", null),
                data: { asyfunc: "AddConditionProject", projectID: projectID, projectCode: projectCode, projectName: projectName, userId: userId, type: type },
                async: false,
                success: function (result) {
                    var $type;
                    if ("add" == type) {
                        $type = "cancel";
                        img.attr("title", "已关注,点击取消关注");
                        img.attr("src", "/Portal/Themes/Images/btn_attention.png");
                    }
                    else {
                        $type = "add";
                        img.attr("title", "未关注,点击加关注");
                        img.attr("src", "/Portal/Themes/Images/btn_notattention.png");
                    }
                    //为按钮添加文本、click事件
                    img.unbind("click");
                    img.bind("click", function () {
                        formAttention(projectID, projectCode, projectName, $type, img)
                    });
                }
            });
        }
        function openProjectUser(orgID) {

            var url = buildQueryUrl("/EPMS/List/OBS/ProjectTeamMemberList.aspx", { IsPortal: true, MenuId: '241155B8-33F5-4D56-8A94-B5D6C2337320', OrganizationID: orgID });
            showDivDialog(url, null, 1200, 600, null);
            return false;
        }
        //        function openPublish(orgID){
        //            var url = buildQueryUrl("/Custom/LIST/Dashboard.aspx", { IsPortal: true, ListId: 'CFBD3C99-DE11-4BD5-BD73-ACC1583CF30B', OrganizationID: orgID,RoleName:'Sz' });
        //            showDivDialog(url, null, 1200, 600, null);
        //            return false;
        //        }
        function openDesginControl() {
            var url = buildQueryUrl("/Custom/LIST/Dashboard.aspx", { ListId: '63d34c07-c157-498f-8ecc-5e2f5c5891c0', ViewId: 'c34caa34-6b79-403f-ad85-c8c392450d47', secid: 'E99D5B02-623F-4C39-8B01-BC1A9BD646BB', RoleName:'<%=RoleName %>', IsDashboard: 1, ShowToolbar: 0, IsShowHeader: 2 });
            window.open(url);
            return false;
        }

        //安排卷册负责人
        function setWBSOwner() {
            var json = { actionType: 3 };
            //如果只勾选一个，则带出项目信息
            var proIDs = $("#" + $gridCheckedClientID).val();
            if (proIDs.length > 36 && proIDs.length < 72) {
                var projectID = proIDs.replace("[", '""').replace("]", '""');
                projectID = projectID.replace(/\"/g, "");
                json = { actionType: 3, OrganizationID: projectID };
            }
            var url = buildQueryUrl("/EPMS/List/WBS/WBSOwnerSetting.aspx", json);
            showDivDialog(url, null, 800, 500, null);
            return false;
        }

        //批量安排卷册负责人
        function batchSetWBSOwner() {
            var json = { actionType: 3 };
            //如果只勾选一个，则带出项目信息
            var proIDs = $("#" + $gridCheckedClientID).val();
            if (proIDs.length > 36 && proIDs.length < 72) {
                var projectID = proIDs.replace("[", '""').replace("]", '""');
                projectID = projectID.replace(/\"/g, "");
                json = { actionType: 3, OrganizationID: projectID };
            }
            var url = buildQueryUrl("/EPMS/List/WBS/WBSOwnerBatchSetting.aspx", json);
            showDivDialog(url, null, 800, 500, null);
            return false;
        }

        function openProjectObs(orgID) {
            var url = buildQueryUrl("/EPMS/List/Project/ProjectEditor.aspx", { actionType: 3, OrganizationID: orgID });
            showDivDialog(url, null, 1000, 600, null);
            return false;
        }

        function openProjectWbs(orgID) {
            var url = buildQueryUrl("/EPMS/List/WBS/WBSSplitEditor.aspx", { actionType: 2, OrganizationID: orgID });
            showDivDialog(url, null, 1000, 600, editProjectCallBack);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
<asp:Content ID="Content6" runat="server" ContentPlaceHolderID="treeView">
</asp:Content>
